import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeTransporteReboqueController extends ControllerBase<NfeTransporteReboqueModel, void> {

  NfeTransporteReboqueController() : super(repository: null) {
    dbColumns = NfeTransporteReboqueModel.dbColumns;
    aliasColumns = NfeTransporteReboqueModel.aliasColumns;
    gridColumns = nfeTransporteReboqueGridColumns();
    functionName = "nfe_transporte_reboque";
    screenTitle = "Reboque";
  }

  final _nfeTransporteReboqueModel = NfeTransporteReboqueModel().obs;
  NfeTransporteReboqueModel get nfeTransporteReboqueModel => _nfeTransporteReboqueModel.value;
  set nfeTransporteReboqueModel(value) => _nfeTransporteReboqueModel.value = value ?? NfeTransporteReboqueModel();

  List<NfeTransporteReboqueModel> get nfeTransporteReboqueModelList => Get.find<NfeTransporteController>().nfeTransporteModel.nfeTransporteReboqueModelList ?? [];

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

  final nfeTransporteReboqueScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeTransporteReboqueFormKey = GlobalKey<FormState>();

  @override
  NfeTransporteReboqueModel createNewModel() => NfeTransporteReboqueModel();

  @override
  final standardFieldForFilter = NfeTransporteReboqueModel.aliasColumns[NfeTransporteReboqueModel.dbColumns.indexOf('placa')];

  final placaController = TextEditingController();
  final rntcController = TextEditingController();
  final vagaoController = TextEditingController();
  final balsaController = TextEditingController();
  final ufController = CustomDropdownButtonController('AC');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['placa'],
    'secondaryColumns': ['uf'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeTransporteReboque) => nfeTransporteReboque.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeTransporteReboqueModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeTransporteReboqueModel = createNewModel();
    _resetForm();
    Get.to(() => NfeTransporteReboqueEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    placaController.text = '';
    rntcController.text = '';
    vagaoController.text = '';
    balsaController.text = '';
    ufController.selected = 'AC';
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
    final model = nfeTransporteReboqueModelList.firstWhere((m) => m.tempId == tempId);
    nfeTransporteReboqueModel = model.clone();
		nfeTransporteReboqueModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeTransporteReboqueEditPage());
  }

  void updateControllersFromModel() {
    placaController.text = nfeTransporteReboqueModel.placa ?? '';
    rntcController.text = nfeTransporteReboqueModel.rntc ?? '';
    vagaoController.text = nfeTransporteReboqueModel.vagao ?? '';
    balsaController.text = nfeTransporteReboqueModel.balsa ?? '';
    ufController.selected = currentModel.uf ?? 'AC';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeTransporteReboqueFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeTransporteReboqueModelList.insert(0, nfeTransporteReboqueModel.clone());
      } else {
        final index = nfeTransporteReboqueModelList.indexWhere((m) => m.tempId == nfeTransporteReboqueModel.tempId);
        if (index >= 0) {
          nfeTransporteReboqueModelList[index] = nfeTransporteReboqueModel.clone();
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
      nfeTransporteReboqueModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    placaController.dispose();
    rntcController.dispose();
    vagaoController.dispose();
    balsaController.dispose();
    ufController.dispose();
  }

}