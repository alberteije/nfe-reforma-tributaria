import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeCteReferenciadoController extends ControllerBase<NfeCteReferenciadoModel, void> {

  NfeCteReferenciadoController() : super(repository: null) {
    dbColumns = NfeCteReferenciadoModel.dbColumns;
    aliasColumns = NfeCteReferenciadoModel.aliasColumns;
    gridColumns = nfeCteReferenciadoGridColumns();
    functionName = "nfe_cte_referenciado";
    screenTitle = "CTe Referenciado";
  }

  final _nfeCteReferenciadoModel = NfeCteReferenciadoModel().obs;
  NfeCteReferenciadoModel get nfeCteReferenciadoModel => _nfeCteReferenciadoModel.value;
  set nfeCteReferenciadoModel(value) => _nfeCteReferenciadoModel.value = value ?? NfeCteReferenciadoModel();

  List<NfeCteReferenciadoModel> get nfeCteReferenciadoModelList => Get.find<NfeCabecalhoController>().currentModel.nfeCteReferenciadoModelList ?? [];

  final _userMadeChanges = false.obs;
  get userMadeChanges => _userMadeChanges.value;
  set userMadeChanges(value) => _userMadeChanges.value = value;

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  late PlutoGridStateManager _plutoGridStateManager;
  @override
  PlutoGridStateManager get plutoGridStateManager => _plutoGridStateManager;
  @override
  set plutoGridStateManager(value) => _plutoGridStateManager = value;

  final nfeCteReferenciadoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCteReferenciadoFormKey = GlobalKey<FormState>();

  @override
  NfeCteReferenciadoModel createNewModel() => NfeCteReferenciadoModel();

  @override
  final standardFieldForFilter = NfeCteReferenciadoModel.aliasColumns[NfeCteReferenciadoModel.dbColumns.indexOf('chave_acesso')];

  final chaveAcessoController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['chave_acesso'],
    'secondaryColumns': [],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeCteReferenciado) => nfeCteReferenciado.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeCteReferenciadoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeCteReferenciadoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeCteReferenciadoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    chaveAcessoController.text = '';
  }

  @override
  void selectRowForEditing(PlutoRow? row) async {
    if (row == null) {
      showInfoSnackBar(message: 'message_select_one_to_edited'.tr);
      return;
    }

    selectRowForEditingByTempId(row.cells['tempId']?.value);
  }

  @override
  void selectRowForEditingById(int id) {}

  void selectRowForEditingByTempId(String tempId) {
		isNewRecord = false;
    final model = nfeCteReferenciadoModelList.firstWhere((m) => m.tempId == tempId);
    nfeCteReferenciadoModel = model.clone();
		nfeCteReferenciadoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeCteReferenciadoEditPage());
  }

  void updateControllersFromModel() {
    chaveAcessoController.text = nfeCteReferenciadoModel.chaveAcesso ?? '';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeCteReferenciadoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeCteReferenciadoModelList.insert(0, nfeCteReferenciadoModel.clone());
      } else {
        final index = nfeCteReferenciadoModelList.indexWhere((m) => m.tempId == nfeCteReferenciadoModel.tempId);
        if (index >= 0) {
          nfeCteReferenciadoModelList[index] = nfeCteReferenciadoModel.clone();
        }
      }

      userMadeChanges = true;
      loadData();
      Get.back(result: true);
    } else {
      Get.back();
    }
  }


  @override
  Future deleteSelected() async {
    final currentRow = plutoGridStateManager.currentRow;
    if (currentRow == null) {
      showInfoSnackBar(message: 'message_select_one_to_delete'.tr);
      return null;
    }
    showDeleteDialog(() async {
      final id = currentRow.cells['id']?.value;
      final tempId = currentRow.cells['tempId']?.value;
      nfeCteReferenciadoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
      plutoGridStateManager.removeCurrentRow();
      userMadeChanges = true;
    });
  }

  @override
  void preventDataLoss() {
    if (formWasChangedDetail) {
      showQuestionDialog('message_data_loss'.tr, () => Get.back());
    } else {
      formWasChangedDetail = false;
      Get.back();
    }
  }

  @override
  void onClose() {
    chaveAcessoController.dispose();
  }

}