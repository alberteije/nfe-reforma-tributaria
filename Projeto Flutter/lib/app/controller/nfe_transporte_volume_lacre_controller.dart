import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeTransporteVolumeLacreController extends ControllerBase<NfeTransporteVolumeLacreModel, void> {

  NfeTransporteVolumeLacreController() : super(repository: null) {
    dbColumns = NfeTransporteVolumeLacreModel.dbColumns;
    aliasColumns = NfeTransporteVolumeLacreModel.aliasColumns;
    gridColumns = nfeTransporteVolumeLacreGridColumns();
    functionName = "nfe_transporte_volume_lacre";
    screenTitle = "Lacres";
  }

  final _nfeTransporteVolumeLacreModel = NfeTransporteVolumeLacreModel().obs;
  NfeTransporteVolumeLacreModel get nfeTransporteVolumeLacreModel => _nfeTransporteVolumeLacreModel.value;
  set nfeTransporteVolumeLacreModel(value) => _nfeTransporteVolumeLacreModel.value = value ?? NfeTransporteVolumeLacreModel();

  List<NfeTransporteVolumeLacreModel> get nfeTransporteVolumeLacreModelList => Get.find<NfeTransporteVolumeController>().nfeTransporteVolumeModel.nfeTransporteVolumeLacreModelList ?? [];

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

  final nfeTransporteVolumeLacreScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeTransporteVolumeLacreFormKey = GlobalKey<FormState>();

  @override
  NfeTransporteVolumeLacreModel createNewModel() => NfeTransporteVolumeLacreModel();

  @override
  final standardFieldForFilter = NfeTransporteVolumeLacreModel.aliasColumns[NfeTransporteVolumeLacreModel.dbColumns.indexOf('numero')];

  final numeroController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero'],
    'secondaryColumns': [],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeTransporteVolumeLacre) => nfeTransporteVolumeLacre.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeTransporteVolumeLacreModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeTransporteVolumeLacreModel = createNewModel();
    _resetForm();
    Get.to(() => NfeTransporteVolumeLacreEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    numeroController.text = '';
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
    final model = nfeTransporteVolumeLacreModelList.firstWhere((m) => m.tempId == tempId);
    nfeTransporteVolumeLacreModel = model.clone();
		nfeTransporteVolumeLacreModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeTransporteVolumeLacreEditPage());
  }

  void updateControllersFromModel() {
    numeroController.text = nfeTransporteVolumeLacreModel.numero ?? '';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeTransporteVolumeLacreFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeTransporteVolumeLacreModelList.insert(0, nfeTransporteVolumeLacreModel.clone());
      } else {
        final index = nfeTransporteVolumeLacreModelList.indexWhere((m) => m.tempId == nfeTransporteVolumeLacreModel.tempId);
        if (index >= 0) {
          nfeTransporteVolumeLacreModelList[index] = nfeTransporteVolumeLacreModel.clone();
        }
      }

      updateParent();

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
      nfeTransporteVolumeLacreModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
      plutoGridStateManager.removeCurrentRow();
      userMadeChanges = true;
      updateParent();
    });
  }

  void updateParent() {
    // update parent - no caso de um relacionamento bisneto
    // volume lacre (bisneto) -> volume (neto) -> transporte (filho) -> nfe cabecalho (pai)
    final indexParent = Get.find<NfeTransporteVolumeController>().nfeTransporteVolumeModelList.indexWhere((m) => m.tempId == Get.find<NfeTransporteVolumeController>().nfeTransporteVolumeModel.tempId);
    if (indexParent >= 0) {
      Get.find<NfeTransporteVolumeController>().nfeTransporteVolumeModelList[indexParent] = Get.find<NfeTransporteVolumeController>().nfeTransporteVolumeModel.clone();
    }
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
  }

}