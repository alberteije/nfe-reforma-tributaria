import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDuplicataController extends ControllerBase<NfeDuplicataModel, void> {

  NfeDuplicataController() : super(repository: null) {
    dbColumns = NfeDuplicataModel.dbColumns;
    aliasColumns = NfeDuplicataModel.aliasColumns;
    gridColumns = nfeDuplicataGridColumns();
    functionName = "nfe_duplicata";
    screenTitle = "Duplicata";
  }

  final _nfeDuplicataModel = NfeDuplicataModel().obs;
  NfeDuplicataModel get nfeDuplicataModel => _nfeDuplicataModel.value;
  set nfeDuplicataModel(value) => _nfeDuplicataModel.value = value ?? NfeDuplicataModel();

  List<NfeDuplicataModel> get nfeDuplicataModelList => Get.find<NfeFaturaController>().nfeFaturaModel.nfeDuplicataModelList ?? [];

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

  final nfeDuplicataScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDuplicataFormKey = GlobalKey<FormState>();

  @override
  NfeDuplicataModel createNewModel() => NfeDuplicataModel();

  @override
  final standardFieldForFilter = NfeDuplicataModel.aliasColumns[NfeDuplicataModel.dbColumns.indexOf('numero')];

  final numeroController = TextEditingController();
  final valorController = MoneyMaskedTextController();
  final dataVencimentoController = DatePickerItemController(null);

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero'],
    'secondaryColumns': ['data_vencimento'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDuplicata) => nfeDuplicata.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeDuplicataModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeDuplicataModel = createNewModel();
    _resetForm();
    Get.to(() => NfeDuplicataEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    numeroController.text = '';
    valorController.updateValue(0);
    dataVencimentoController.date = null;
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
    final model = nfeDuplicataModelList.firstWhere((m) => m.tempId == tempId);
    nfeDuplicataModel = model.clone();
		nfeDuplicataModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeDuplicataEditPage());
  }

  void updateControllersFromModel() {
    numeroController.text = nfeDuplicataModel.numero ?? '';
    valorController.updateValue(nfeDuplicataModel.valor ?? 0);
    dataVencimentoController.date = nfeDuplicataModel.dataVencimento;
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeDuplicataFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeDuplicataModelList.insert(0, nfeDuplicataModel.clone());
      } else {
        final index = nfeDuplicataModelList.indexWhere((m) => m.tempId == nfeDuplicataModel.tempId);
        if (index >= 0) {
          nfeDuplicataModelList[index] = nfeDuplicataModel.clone();
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
      nfeDuplicataModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    numeroController.dispose();
    valorController.dispose();
    dataVencimentoController.dispose();
  }

}