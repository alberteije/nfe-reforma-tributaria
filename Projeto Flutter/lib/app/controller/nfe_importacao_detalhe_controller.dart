import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/routes/app_routes.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeImportacaoDetalheController extends ControllerBase<NfeImportacaoDetalheModel, void> {

  NfeImportacaoDetalheController() : super(repository: null) {
    dbColumns = NfeImportacaoDetalheModel.dbColumns;
    aliasColumns = NfeImportacaoDetalheModel.aliasColumns;
    gridColumns = nfeImportacaoDetalheGridColumns();
    functionName = "nfe_importacao_detalhe";
    screenTitle = "Importação Detalhe";
  }

  @override
  NfeImportacaoDetalheModel createNewModel() => NfeImportacaoDetalheModel();

  @override
  final standardFieldForFilter = NfeImportacaoDetalheModel.aliasColumns[NfeImportacaoDetalheModel.dbColumns.indexOf('numero_adicao')];

  final nfeDeclaracaoImportacaoModelController = TextEditingController();
  final numeroAdicaoController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final numeroSequencialController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final codigoFabricanteEstrangeiroController = TextEditingController();
  final valorDescontoController = MoneyMaskedTextController();
  final drawbackController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero_adicao'],
    'secondaryColumns': ['numero_sequencial'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeImportacaoDetalhe) => nfeImportacaoDetalhe.toJson).toList();
  }

  @override
  void prepareForInsert() {
    isNewRecord = true;
    currentModel = createNewModel();
    _resetForm();
    Get.toNamed(Routes.nfeImportacaoDetalheEditPage);
  }

  void _resetForm() {
    formWasChanged = false;
    nfeDeclaracaoImportacaoModelController.text = '';
    numeroAdicaoController.updateValue(0);
    numeroSequencialController.updateValue(0);
    codigoFabricanteEstrangeiroController.text = '';
    valorDescontoController.updateValue(0);
    drawbackController.text = '';
  }

  @override
  void selectRowForEditingById(int id) {
    final model = modelList.firstWhere((m) => m.id == id);
    currentModel = model.clone();
    updateControllersFromModel();
    Get.toNamed(Routes.nfeImportacaoDetalheEditPage);
  }

  void updateControllersFromModel() {
    nfeDeclaracaoImportacaoModelController.text = currentModel.nfeDeclaracaoImportacaoModel?.numeroDocumento?.toString() ?? '';
    numeroAdicaoController.updateValue((currentModel.numeroAdicao ?? 0).toDouble());
    numeroSequencialController.updateValue((currentModel.numeroSequencial ?? 0).toDouble());
    codigoFabricanteEstrangeiroController.text = currentModel.codigoFabricanteEstrangeiro ?? '';
    valorDescontoController.updateValue(currentModel.valorDesconto ?? 0);
    drawbackController.text = currentModel.drawback ?? '';
    formWasChanged = false;
  }

  @override
  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    Get.back(result: true);
  }

  @override
  void onClose() {
    nfeDeclaracaoImportacaoModelController.dispose();
    numeroAdicaoController.dispose();
    numeroSequencialController.dispose();
    codigoFabricanteEstrangeiroController.dispose();
    valorDescontoController.dispose();
    drawbackController.dispose();
  }

}