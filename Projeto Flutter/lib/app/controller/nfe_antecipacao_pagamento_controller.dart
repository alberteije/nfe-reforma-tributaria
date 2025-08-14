import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeAntecipacaoPagamentoController extends ControllerBase<NfeAntecipacaoPagamentoModel, void> {

  NfeAntecipacaoPagamentoController() : super(repository: null) {
    dbColumns = NfeAntecipacaoPagamentoModel.dbColumns;
    aliasColumns = NfeAntecipacaoPagamentoModel.aliasColumns;
    gridColumns = nfeAntecipacaoPagamentoGridColumns();
    functionName = "nfe_antecipacao_pagamento";
    screenTitle = "Antecipação Pagamento";
  }

  final _nfeAntecipacaoPagamentoModel = NfeAntecipacaoPagamentoModel().obs;
  NfeAntecipacaoPagamentoModel get nfeAntecipacaoPagamentoModel => _nfeAntecipacaoPagamentoModel.value;
  set nfeAntecipacaoPagamentoModel(value) => _nfeAntecipacaoPagamentoModel.value = value ?? NfeAntecipacaoPagamentoModel();

  List<NfeAntecipacaoPagamentoModel> get nfeAntecipacaoPagamentoModelList => Get.find<NfeCabecalhoController>().currentModel.nfeAntecipacaoPagamentoModelList ?? [];

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

  final nfeAntecipacaoPagamentoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeAntecipacaoPagamentoFormKey = GlobalKey<FormState>();

  @override
  NfeAntecipacaoPagamentoModel createNewModel() => NfeAntecipacaoPagamentoModel();

  @override
  final standardFieldForFilter = NfeAntecipacaoPagamentoModel.aliasColumns[NfeAntecipacaoPagamentoModel.dbColumns.indexOf('chave_acesso')];

  final chaveAcessoController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['chave_acesso'],
    'secondaryColumns': [],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeAntecipacaoPagamento) => nfeAntecipacaoPagamento.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeAntecipacaoPagamentoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeAntecipacaoPagamentoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeAntecipacaoPagamentoEditPage());
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
    final model = nfeAntecipacaoPagamentoModelList.firstWhere((m) => m.tempId == tempId);
    nfeAntecipacaoPagamentoModel = model.clone();
		nfeAntecipacaoPagamentoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeAntecipacaoPagamentoEditPage());
  }

  void updateControllersFromModel() {
    chaveAcessoController.text = nfeAntecipacaoPagamentoModel.chaveAcesso ?? '';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeAntecipacaoPagamentoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeAntecipacaoPagamentoModelList.insert(0, nfeAntecipacaoPagamentoModel.clone());
      } else {
        final index = nfeAntecipacaoPagamentoModelList.indexWhere((m) => m.tempId == nfeAntecipacaoPagamentoModel.tempId);
        if (index >= 0) {
          nfeAntecipacaoPagamentoModelList[index] = nfeAntecipacaoPagamentoModel.clone();
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
      nfeAntecipacaoPagamentoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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