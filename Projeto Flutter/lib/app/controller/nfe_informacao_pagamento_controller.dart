import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeInformacaoPagamentoController extends ControllerBase<NfeInformacaoPagamentoModel, void> {

  NfeInformacaoPagamentoController() : super(repository: null) {
    dbColumns = NfeInformacaoPagamentoModel.dbColumns;
    aliasColumns = NfeInformacaoPagamentoModel.aliasColumns;
    gridColumns = nfeInformacaoPagamentoGridColumns();
    functionName = "nfe_informacao_pagamento";
    screenTitle = "Informação Pagamento";
  }

  final _nfeInformacaoPagamentoModel = NfeInformacaoPagamentoModel().obs;
  NfeInformacaoPagamentoModel get nfeInformacaoPagamentoModel => _nfeInformacaoPagamentoModel.value;
  set nfeInformacaoPagamentoModel(value) => _nfeInformacaoPagamentoModel.value = value ?? NfeInformacaoPagamentoModel();

  List<NfeInformacaoPagamentoModel> get nfeInformacaoPagamentoModelList => Get.find<NfeCabecalhoController>().currentModel.nfeInformacaoPagamentoModelList ?? [];

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

  final nfeInformacaoPagamentoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeInformacaoPagamentoFormKey = GlobalKey<FormState>();

  @override
  NfeInformacaoPagamentoModel createNewModel() => NfeInformacaoPagamentoModel();

  @override
  final standardFieldForFilter = NfeInformacaoPagamentoModel.aliasColumns[NfeInformacaoPagamentoModel.dbColumns.indexOf('indicador_pagamento')];

  final indicadorPagamentoController = CustomDropdownButtonController('0= Pagamento à Vista');
  final meioPagamentoController = CustomDropdownButtonController('01=Dinheiro');
  final descricaoQuandoOutrosController = TextEditingController();
  final valorController = MoneyMaskedTextController();
  final dataPagamentoController = DatePickerItemController(null);
  final cnpjTransacionalController = TextEditingController();
  final ufCnpjTransacionalController = TextEditingController();
  final tipoIntegracaoController = CustomDropdownButtonController('1=Pagamento integrado');
  final cnpjOperadoraCartaoController = MaskedTextController(mask: '00.000.000/0000-00',);
  final bandeiraController = CustomDropdownButtonController('01=Visa');
  final numeroAutorizacaoController = TextEditingController();
  final cnpjBeneficiarioController = TextEditingController();
  final idTerminalPagamentoController = TextEditingController();
  final trocoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['indicador_pagamento'],
    'secondaryColumns': ['meio_pagamento'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeInformacaoPagamento) => nfeInformacaoPagamento.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeInformacaoPagamentoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeInformacaoPagamentoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeInformacaoPagamentoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    indicadorPagamentoController.selected = '0= Pagamento à Vista';
    meioPagamentoController.selected = '01=Dinheiro';
    descricaoQuandoOutrosController.text = '';
    valorController.updateValue(0);
    dataPagamentoController.date = null;
    cnpjTransacionalController.text = '';
    ufCnpjTransacionalController.text = '';
    tipoIntegracaoController.selected = '1=Pagamento integrado';
    cnpjOperadoraCartaoController.text = '';
    bandeiraController.selected = '01=Visa';
    numeroAutorizacaoController.text = '';
    cnpjBeneficiarioController.text = '';
    idTerminalPagamentoController.text = '';
    trocoController.updateValue(0);
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
    final model = nfeInformacaoPagamentoModelList.firstWhere((m) => m.tempId == tempId);
    nfeInformacaoPagamentoModel = model.clone();
		nfeInformacaoPagamentoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeInformacaoPagamentoEditPage());
  }

  void updateControllersFromModel() {
    indicadorPagamentoController.selected = nfeInformacaoPagamentoModel.indicadorPagamento ?? '0= Pagamento à Vista';
    meioPagamentoController.selected = nfeInformacaoPagamentoModel.meioPagamento ?? '01=Dinheiro';
    descricaoQuandoOutrosController.text = nfeInformacaoPagamentoModel.descricaoQuandoOutros ?? '';
    valorController.updateValue(nfeInformacaoPagamentoModel.valor ?? 0);
    dataPagamentoController.date = nfeInformacaoPagamentoModel.dataPagamento;
    cnpjTransacionalController.text = nfeInformacaoPagamentoModel.cnpjTransacional ?? '';
    ufCnpjTransacionalController.text = nfeInformacaoPagamentoModel.ufCnpjTransacional ?? '';
    tipoIntegracaoController.selected = nfeInformacaoPagamentoModel.tipoIntegracao ?? '1=Pagamento integrado';
    cnpjOperadoraCartaoController.text = nfeInformacaoPagamentoModel.cnpjOperadoraCartao ?? '';
    bandeiraController.selected = nfeInformacaoPagamentoModel.bandeira ?? '01=Visa';
    numeroAutorizacaoController.text = nfeInformacaoPagamentoModel.numeroAutorizacao ?? '';
    cnpjBeneficiarioController.text = nfeInformacaoPagamentoModel.cnpjBeneficiario ?? '';
    idTerminalPagamentoController.text = nfeInformacaoPagamentoModel.idTerminalPagamento ?? '';
    trocoController.updateValue(nfeInformacaoPagamentoModel.troco ?? 0);
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeInformacaoPagamentoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeInformacaoPagamentoModelList.insert(0, nfeInformacaoPagamentoModel.clone());
      } else {
        final index = nfeInformacaoPagamentoModelList.indexWhere((m) => m.tempId == nfeInformacaoPagamentoModel.tempId);
        if (index >= 0) {
          nfeInformacaoPagamentoModelList[index] = nfeInformacaoPagamentoModel.clone();
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
      nfeInformacaoPagamentoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    indicadorPagamentoController.dispose();
    meioPagamentoController.dispose();
    descricaoQuandoOutrosController.dispose();
    valorController.dispose();
    dataPagamentoController.dispose();
    cnpjTransacionalController.dispose();
    ufCnpjTransacionalController.dispose();
    tipoIntegracaoController.dispose();
    cnpjOperadoraCartaoController.dispose();
    bandeiraController.dispose();
    numeroAutorizacaoController.dispose();
    cnpjBeneficiarioController.dispose();
    idTerminalPagamentoController.dispose();
    trocoController.dispose();
  }

}