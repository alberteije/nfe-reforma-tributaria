import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeProcessoReferenciadoController extends ControllerBase<NfeProcessoReferenciadoModel, void> {

  NfeProcessoReferenciadoController() : super(repository: null) {
    dbColumns = NfeProcessoReferenciadoModel.dbColumns;
    aliasColumns = NfeProcessoReferenciadoModel.aliasColumns;
    gridColumns = nfeProcessoReferenciadoGridColumns();
    functionName = "nfe_processo_referenciado";
    screenTitle = "Processo Referenciado";
  }

  final _nfeProcessoReferenciadoModel = NfeProcessoReferenciadoModel().obs;
  NfeProcessoReferenciadoModel get nfeProcessoReferenciadoModel => _nfeProcessoReferenciadoModel.value;
  set nfeProcessoReferenciadoModel(value) => _nfeProcessoReferenciadoModel.value = value ?? NfeProcessoReferenciadoModel();

  List<NfeProcessoReferenciadoModel> get nfeProcessoReferenciadoModelList => Get.find<NfeCabecalhoController>().currentModel.nfeProcessoReferenciadoModelList ?? [];

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

  final nfeProcessoReferenciadoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeProcessoReferenciadoFormKey = GlobalKey<FormState>();

  @override
  NfeProcessoReferenciadoModel createNewModel() => NfeProcessoReferenciadoModel();

  @override
  final standardFieldForFilter = NfeProcessoReferenciadoModel.aliasColumns[NfeProcessoReferenciadoModel.dbColumns.indexOf('identificador')];

  final identificadorController = TextEditingController();
  final origemController = CustomDropdownButtonController('0=SEFAZ');
  final tipoAtoConcessorioController = CustomDropdownButtonController('08=Termo de Acordo');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['identificador'],
    'secondaryColumns': ['origem'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeProcessoReferenciado) => nfeProcessoReferenciado.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeProcessoReferenciadoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeProcessoReferenciadoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeProcessoReferenciadoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    identificadorController.text = '';
    origemController.selected = '0=SEFAZ';
    tipoAtoConcessorioController.selected = '08=Termo de Acordo';
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
    final model = nfeProcessoReferenciadoModelList.firstWhere((m) => m.tempId == tempId);
    nfeProcessoReferenciadoModel = model.clone();
		nfeProcessoReferenciadoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeProcessoReferenciadoEditPage());
  }

  void updateControllersFromModel() {
    identificadorController.text = nfeProcessoReferenciadoModel.identificador ?? '';
    origemController.selected = nfeProcessoReferenciadoModel.origem ?? '0=SEFAZ';
    tipoAtoConcessorioController.selected = nfeProcessoReferenciadoModel.tipoAtoConcessorio ?? '08=Termo de Acordo';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeProcessoReferenciadoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeProcessoReferenciadoModelList.insert(0, nfeProcessoReferenciadoModel.clone());
      } else {
        final index = nfeProcessoReferenciadoModelList.indexWhere((m) => m.tempId == nfeProcessoReferenciadoModel.tempId);
        if (index >= 0) {
          nfeProcessoReferenciadoModelList[index] = nfeProcessoReferenciadoModel.clone();
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
      nfeProcessoReferenciadoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    identificadorController.dispose();
    origemController.dispose();
    tipoAtoConcessorioController.dispose();
  }

}