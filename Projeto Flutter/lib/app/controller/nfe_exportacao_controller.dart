import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeExportacaoController extends ControllerBase<NfeExportacaoModel, void> {

  NfeExportacaoController() : super(repository: null) {
    dbColumns = NfeExportacaoModel.dbColumns;
    aliasColumns = NfeExportacaoModel.aliasColumns;
    gridColumns = nfeExportacaoGridColumns();
    functionName = "nfe_exportacao";
    screenTitle = "Exportacao";
  }

  final _nfeExportacaoModel = NfeExportacaoModel().obs;
  NfeExportacaoModel get nfeExportacaoModel => _nfeExportacaoModel.value;
  set nfeExportacaoModel(value) => _nfeExportacaoModel.value = value ?? NfeExportacaoModel();

  List<NfeExportacaoModel> get nfeExportacaoModelList => Get.find<NfeDetalheController>().nfeDetalheModel.nfeExportacaoModelList ?? [];

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

  final nfeExportacaoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeExportacaoFormKey = GlobalKey<FormState>();

  @override
  NfeExportacaoModel createNewModel() => NfeExportacaoModel();

  @override
  final standardFieldForFilter = NfeExportacaoModel.aliasColumns[NfeExportacaoModel.dbColumns.indexOf('drawback')];

  final drawbackController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final numeroRegistroController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final chaveAcessoController = TextEditingController();
  final quantidadeController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['drawback'],
    'secondaryColumns': ['numero_registro'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeExportacao) => nfeExportacao.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeExportacaoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeExportacaoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeExportacaoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    drawbackController.updateValue(0);
    numeroRegistroController.updateValue(0);
    chaveAcessoController.text = '';
    quantidadeController.updateValue(0);
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
    final model = nfeExportacaoModelList.firstWhere((m) => m.tempId == tempId);
    nfeExportacaoModel = model.clone();
		nfeExportacaoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeExportacaoEditPage());
  }

  void updateControllersFromModel() {
    drawbackController.updateValue((nfeExportacaoModel.drawback ?? 0).toDouble());
    numeroRegistroController.updateValue((nfeExportacaoModel.numeroRegistro ?? 0).toDouble());
    chaveAcessoController.text = nfeExportacaoModel.chaveAcesso ?? '';
    quantidadeController.updateValue(nfeExportacaoModel.quantidade ?? 0);
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeExportacaoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeExportacaoModelList.insert(0, nfeExportacaoModel.clone());
      } else {
        final index = nfeExportacaoModelList.indexWhere((m) => m.tempId == nfeExportacaoModel.tempId);
        if (index >= 0) {
          nfeExportacaoModelList[index] = nfeExportacaoModel.clone();
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
      nfeExportacaoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    drawbackController.dispose();
    numeroRegistroController.dispose();
    chaveAcessoController.dispose();
    quantidadeController.dispose();
  }

}