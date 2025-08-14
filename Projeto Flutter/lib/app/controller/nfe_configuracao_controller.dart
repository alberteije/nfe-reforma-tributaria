import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/routes/app_routes.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/repository/nfe_configuracao_repository.dart';

class NfeConfiguracaoController extends ControllerBase<NfeConfiguracaoModel, NfeConfiguracaoRepository> {

  NfeConfiguracaoController({required super.repository}) {
    dbColumns = NfeConfiguracaoModel.dbColumns;
    aliasColumns = NfeConfiguracaoModel.aliasColumns;
    gridColumns = nfeConfiguracaoGridColumns();
    functionName = "nfe_configuracao";
    screenTitle = "Configurações da NF-e";
  }

  @override
  NfeConfiguracaoModel createNewModel() => NfeConfiguracaoModel();

  @override
  final standardFieldForFilter = NfeConfiguracaoModel.aliasColumns[NfeConfiguracaoModel.dbColumns.indexOf('certificado_digital_serie')];

  final certificadoDigitalSerieController = TextEditingController();
  final certificadoDigitalCaminhoController = TextEditingController();
  final certificadoDigitalSenhaController = TextEditingController();
  final tipoEmissaoController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final formatoImpressaoDanfeController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final processoEmissaoController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final versaoProcessoEmissaoController = TextEditingController();
  final caminhoLogomarcaController = TextEditingController();
  final caminhoSalvarXmlController = TextEditingController();
  final caminhoSchemasController = TextEditingController();
  final caminhoArquivoDanfeController = TextEditingController();
  final caminhoSalvarPdfController = TextEditingController();
  final webserviceAmbienteController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final webserviceProxyHostController = TextEditingController();
  final webserviceProxyPortaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final webserviceProxyUsuarioController = TextEditingController();
  final webserviceProxySenhaController = TextEditingController();
  final emailServidorSmtpController = TextEditingController();
  final emailPortaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final emailUsuarioController = TextEditingController();
  final emailSenhaController = TextEditingController();
  final emailAssuntoController = TextEditingController();
  final emailTextoController = TextEditingController();
	final salvarXmlController = CustomDropdownButtonController('Sim');
	final webserviceUfController = CustomDropdownButtonController('AC');
	final webserviceVisualizarController = CustomDropdownButtonController('Sim');
	final emailAutenticaSslController = CustomDropdownButtonController('Sim');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['certificado_digital_serie'],
    'secondaryColumns': ['certificado_digital_caminho'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeConfiguracao) => nfeConfiguracao.toJson).toList();
  }

  @override
  void prepareForInsert() {
    isNewRecord = true;
    currentModel = createNewModel();
    _resetForm();
    Get.toNamed(Routes.nfeConfiguracaoEditPage);
  }

  void _resetForm() {
    formWasChanged = false;
    certificadoDigitalSerieController.text = '';
    certificadoDigitalCaminhoController.text = '';
    certificadoDigitalSenhaController.text = '';
    tipoEmissaoController.updateValue(0);
    formatoImpressaoDanfeController.updateValue(0);
    processoEmissaoController.updateValue(0);
    versaoProcessoEmissaoController.text = '';
    caminhoLogomarcaController.text = '';
    caminhoSalvarXmlController.text = '';
    caminhoSchemasController.text = '';
    caminhoArquivoDanfeController.text = '';
    caminhoSalvarPdfController.text = '';
    webserviceAmbienteController.updateValue(0);
    webserviceProxyHostController.text = '';
    webserviceProxyPortaController.updateValue(0);
    webserviceProxyUsuarioController.text = '';
    webserviceProxySenhaController.text = '';
    emailServidorSmtpController.text = '';
    emailPortaController.updateValue(0);
    emailUsuarioController.text = '';
    emailSenhaController.text = '';
    emailAssuntoController.text = '';
    emailTextoController.text = '';
    salvarXmlController.selected = 'Sim';
    webserviceUfController.selected = 'AC';
    webserviceVisualizarController.selected = 'Sim';
    emailAutenticaSslController.selected = 'Sim';
  }

  @override
  void selectRowForEditingById(int id) {
    final model = modelList.firstWhere((m) => m.id == id);
    currentModel = model.clone();
    updateControllersFromModel();
    Get.toNamed(Routes.nfeConfiguracaoEditPage);
  }

  void updateControllersFromModel() {
    certificadoDigitalSerieController.text = currentModel.certificadoDigitalSerie ?? '';
    certificadoDigitalCaminhoController.text = currentModel.certificadoDigitalCaminho ?? '';
    certificadoDigitalSenhaController.text = currentModel.certificadoDigitalSenha ?? '';
    tipoEmissaoController.updateValue((currentModel.tipoEmissao ?? 0).toDouble());
    formatoImpressaoDanfeController.updateValue((currentModel.formatoImpressaoDanfe ?? 0).toDouble());
    processoEmissaoController.updateValue((currentModel.processoEmissao ?? 0).toDouble());
    versaoProcessoEmissaoController.text = currentModel.versaoProcessoEmissao ?? '';
    caminhoLogomarcaController.text = currentModel.caminhoLogomarca ?? '';
    caminhoSalvarXmlController.text = currentModel.caminhoSalvarXml ?? '';
    caminhoSchemasController.text = currentModel.caminhoSchemas ?? '';
    caminhoArquivoDanfeController.text = currentModel.caminhoArquivoDanfe ?? '';
    caminhoSalvarPdfController.text = currentModel.caminhoSalvarPdf ?? '';
    webserviceAmbienteController.updateValue((currentModel.webserviceAmbiente ?? 0).toDouble());
    webserviceProxyHostController.text = currentModel.webserviceProxyHost ?? '';
    webserviceProxyPortaController.updateValue((currentModel.webserviceProxyPorta ?? 0).toDouble());
    webserviceProxyUsuarioController.text = currentModel.webserviceProxyUsuario ?? '';
    webserviceProxySenhaController.text = currentModel.webserviceProxySenha ?? '';
    emailServidorSmtpController.text = currentModel.emailServidorSmtp ?? '';
    emailPortaController.updateValue((currentModel.emailPorta ?? 0).toDouble());
    emailUsuarioController.text = currentModel.emailUsuario ?? '';
    emailSenhaController.text = currentModel.emailSenha ?? '';
    emailAssuntoController.text = currentModel.emailAssunto ?? '';
    emailTextoController.text = currentModel.emailTexto ?? '';
    salvarXmlController.selected = currentModel.salvarXml ?? 'Sim';
    webserviceUfController.selected = currentModel.webserviceUf ?? 'AC';
    webserviceVisualizarController.selected = currentModel.webserviceVisualizar ?? 'Sim';
    emailAutenticaSslController.selected = currentModel.emailAutenticaSsl ?? 'Sim';
    formWasChanged = false;
  }

  @override
  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    final existingIndex = modelList.indexWhere((m) => m.id == currentModel.id);

    if (existingIndex >= 0) {
      modelList[existingIndex] = currentModel.clone();
    }

    final result = await repository.save(nfeConfiguracaoModel: currentModel);
    if (result == null) return;

    if (existingIndex >= 0) {
      modelList[existingIndex] = result;
    } else {
      modelList.insert(0, result);
    }

    if (!GetPlatform.isMobile) {
      updateGridRow(result);
    }

    Get.back(result: true);
  }


  @override
  void onClose() {
    certificadoDigitalSerieController.dispose();
    certificadoDigitalCaminhoController.dispose();
    certificadoDigitalSenhaController.dispose();
    tipoEmissaoController.dispose();
    formatoImpressaoDanfeController.dispose();
    processoEmissaoController.dispose();
    versaoProcessoEmissaoController.dispose();
    caminhoLogomarcaController.dispose();
    caminhoSalvarXmlController.dispose();
    caminhoSchemasController.dispose();
    caminhoArquivoDanfeController.dispose();
    caminhoSalvarPdfController.dispose();
    webserviceAmbienteController.dispose();
    webserviceProxyHostController.dispose();
    webserviceProxyPortaController.dispose();
    webserviceProxyUsuarioController.dispose();
    webserviceProxySenhaController.dispose();
    emailServidorSmtpController.dispose();
    emailPortaController.dispose();
    emailUsuarioController.dispose();
    emailSenhaController.dispose();
    emailAssuntoController.dispose();
    emailTextoController.dispose();
    salvarXmlController.dispose();
    webserviceUfController.dispose();
    webserviceVisualizarController.dispose();
    emailAutenticaSslController.dispose();
    super.onClose();
  }

}