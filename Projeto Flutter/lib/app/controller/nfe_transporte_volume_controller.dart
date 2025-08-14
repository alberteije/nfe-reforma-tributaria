import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeTransporteVolumeController extends ControllerBase<NfeTransporteVolumeModel, void> {

  NfeTransporteVolumeController() : super(repository: null) {
    dbColumns = NfeTransporteVolumeModel.dbColumns;
    aliasColumns = NfeTransporteVolumeModel.aliasColumns;
    gridColumns = nfeTransporteVolumeGridColumns();
    functionName = "nfe_transporte_volume";
    screenTitle = "Transporte Volume";
  }

  final _nfeTransporteVolumeModel = NfeTransporteVolumeModel().obs;
  NfeTransporteVolumeModel get nfeTransporteVolumeModel => _nfeTransporteVolumeModel.value;
  set nfeTransporteVolumeModel(value) => _nfeTransporteVolumeModel.value = value ?? NfeTransporteVolumeModel();

  List<NfeTransporteVolumeModel> get nfeTransporteVolumeModelList => Get.find<NfeTransporteController>().nfeTransporteModel.nfeTransporteVolumeModelList ?? [];

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

  final nfeTransporteVolumeScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeTransporteVolumeFormKey = GlobalKey<FormState>();

  @override
  NfeTransporteVolumeModel createNewModel() => NfeTransporteVolumeModel();

  @override
  final standardFieldForFilter = NfeTransporteVolumeModel.aliasColumns[NfeTransporteVolumeModel.dbColumns.indexOf('quantidade')];

  final quantidadeController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final especieController = TextEditingController();
  final marcaController = TextEditingController();
  final numeracaoController = TextEditingController();
  final pesoLiquidoController = MoneyMaskedTextController();
  final pesoBrutoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['quantidade'],
    'secondaryColumns': ['especie'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeTransporteVolume) => nfeTransporteVolume.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeTransporteVolumeModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeTransporteVolumeModel = createNewModel();
    _resetForm();
    Get.to(() => NfeTransporteVolumeEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    quantidadeController.updateValue(0);
    especieController.text = '';
    marcaController.text = '';
    numeracaoController.text = '';
    pesoLiquidoController.updateValue(0);
    pesoBrutoController.updateValue(0);
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
    final model = nfeTransporteVolumeModelList.firstWhere((m) => m.tempId == tempId);
    nfeTransporteVolumeModel = model.clone();
		nfeTransporteVolumeModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeTransporteVolumeEditPage());
  }

  void updateControllersFromModel() {
    quantidadeController.updateValue((nfeTransporteVolumeModel.quantidade ?? 0).toDouble());
    especieController.text = nfeTransporteVolumeModel.especie ?? '';
    marcaController.text = nfeTransporteVolumeModel.marca ?? '';
    numeracaoController.text = nfeTransporteVolumeModel.numeracao ?? '';
    pesoLiquidoController.updateValue(nfeTransporteVolumeModel.pesoLiquido ?? 0);
    pesoBrutoController.updateValue(nfeTransporteVolumeModel.pesoBruto ?? 0);
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeTransporteVolumeFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeTransporteVolumeModelList.insert(0, nfeTransporteVolumeModel.clone());
      } else {
        final index = nfeTransporteVolumeModelList.indexWhere((m) => m.tempId == nfeTransporteVolumeModel.tempId);
        if (index >= 0) {
          nfeTransporteVolumeModelList[index] = nfeTransporteVolumeModel.clone();
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
      nfeTransporteVolumeModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
      plutoGridStateManager.removeCurrentRow();
      userMadeChanges = true;
    });
  }

  void callVolumeLacrePage() {
		Get.dialog(
      const AlertDialog(
        content: NfeTransporteVolumeLacreListPage(
        ),
      ),
    );
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
    quantidadeController.dispose();
    especieController.dispose();
    marcaController.dispose();
    numeracaoController.dispose();
    pesoLiquidoController.dispose();
    pesoBrutoController.dispose();
  }

}