import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoIcmsController extends ControllerBase<NfeDetalheImpostoIcmsModel, void> {

  NfeDetalheImpostoIcmsController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIcmsModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIcmsModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_icms";
    screenTitle = "ICMS";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIcmsModel = NfeDetalheImpostoIcmsModel().obs;
  NfeDetalheImpostoIcmsModel get nfeDetalheImpostoIcmsModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoIcmsModel ?? NfeDetalheImpostoIcmsModel();
  set nfeDetalheImpostoIcmsModel(value) => _nfeDetalheImpostoIcmsModel.value = value ?? NfeDetalheImpostoIcmsModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIcmsScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIcmsFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIcmsModel createNewModel() => NfeDetalheImpostoIcmsModel();

  @override
  final standardFieldForFilter = "";

  final cstIcmsController = TextEditingController();
  final csosnController = TextEditingController();
  final percentualReducaoBcIcmsController = MoneyMaskedTextController();
  final valorBcIcmsController = MoneyMaskedTextController();
  final aliquotaIcmsController = MoneyMaskedTextController();
  final valorIcmsOperacaoController = MoneyMaskedTextController();
  final percentualDiferimentoController = MoneyMaskedTextController();
  final valorIcmsDiferidoController = MoneyMaskedTextController();
  final valorIcmsController = MoneyMaskedTextController();
  final baseCalculoFcpController = MoneyMaskedTextController();
  final percentualFcpController = MoneyMaskedTextController();
  final valorFcpController = MoneyMaskedTextController();
  final taxaFcpDiferidoController = MoneyMaskedTextController();
  final valorFcpDiferidoController = MoneyMaskedTextController();
  final valorFcpEfetivoController = MoneyMaskedTextController();
  final percentualMvaIcmsStController = MoneyMaskedTextController();
  final percentualReducaoBcIcmsStController = MoneyMaskedTextController();
  final valorBaseCalculoIcmsStController = MoneyMaskedTextController();
  final aliquotaIcmsStController = MoneyMaskedTextController();
  final valorIcmsStController = MoneyMaskedTextController();
  final baseCalculoFcpStController = MoneyMaskedTextController();
  final percentualFcpStController = MoneyMaskedTextController();
  final valorFcpStController = MoneyMaskedTextController();
  final percentualBcOperacaoPropriaController = MoneyMaskedTextController();
  final valorBcIcmsStRetidoController = MoneyMaskedTextController();
  final aliquotaSuportadaConsumidorController = MoneyMaskedTextController();
  final valorIcmsSubstitutoController = MoneyMaskedTextController();
  final valorIcmsStRetidoController = MoneyMaskedTextController();
  final baseCalculoFcpStRetidoController = MoneyMaskedTextController();
  final percentualFcpStRetidoController = MoneyMaskedTextController();
  final valorFcpStRetidoController = MoneyMaskedTextController();
  final motivoDesoneracaoIcmsController = TextEditingController();
  final valorIcmsDesoneradoController = MoneyMaskedTextController();
  final aliquotaCreditoIcmsSnController = MoneyMaskedTextController();
  final valorCreditoIcmsSnController = MoneyMaskedTextController();
  final valorBcIcmsStDestinoController = MoneyMaskedTextController();
  final valorIcmsStDestinoController = MoneyMaskedTextController();
  final valorIcmsStDesoneradoController = MoneyMaskedTextController();
  final motivoDesoneracaoIcmsStController = CustomDropdownButtonController('03=Uso na agropecuária');
  final percentualReducaoBcEfetivoController = MoneyMaskedTextController();
  final valorBcEfetivoController = MoneyMaskedTextController();
  final aliquotaIcmsEfetivoController = MoneyMaskedTextController();
  final valorIcmsEfetivoController = MoneyMaskedTextController();
	final origemMercadoriaController = CustomDropdownButtonController('0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8');
	final modalidadeBcIcmsController = CustomDropdownButtonController('0=Margem Valor Agregado (%)');
	final modalidadeBcIcmsStController = CustomDropdownButtonController('0=Preço tabelado ou máximo sugerido');
	final ufStController = CustomDropdownButtonController('AC');
  final quantidadeTributadaController = MoneyMaskedTextController();
  final aliquotaAdRemController = MoneyMaskedTextController();
  final valorIcmsMonoController = MoneyMaskedTextController();
  final quantidadeSujeitaRetencaoController = MoneyMaskedTextController();
  final aliquotaAdRemRetencaoController = MoneyMaskedTextController();
  final valorIcmsMonoRetencaoController = MoneyMaskedTextController();
  final valorIcmsMonoOperacaoController = MoneyMaskedTextController();
  final percentualDiferimentoMonoController = MoneyMaskedTextController();
  final valorIcmsDiferidoMonoController = MoneyMaskedTextController();
  final quantidadeTributadaRetidaController = MoneyMaskedTextController();
  final aliquotaAdRemRetidaController = MoneyMaskedTextController();
  final valorIcmsRetidoController = MoneyMaskedTextController();
  final percentualReducaoAdRemController = MoneyMaskedTextController();
  final motivoReducaoAdRemController = CustomDropdownButtonController('1= Transporte coletivo de passageiros');
  final desoneradoDeduzController = CustomDropdownButtonController('0-Não');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoIcms) => nfeDetalheImpostoIcms.toJson).toList();
  }

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  Future<void> loadData() async {}

  @override
  void prepareForInsert() {}

  @override
  void selectRowForEditingById(int id) {}

  void _resetForm() {
    formWasChangedDetail = false;
    cstIcmsController.text = '';
    csosnController.text = '';
    percentualReducaoBcIcmsController.updateValue(0);
    valorBcIcmsController.updateValue(0);
    aliquotaIcmsController.updateValue(0);
    valorIcmsOperacaoController.updateValue(0);
    percentualDiferimentoController.updateValue(0);
    valorIcmsDiferidoController.updateValue(0);
    valorIcmsController.updateValue(0);
    baseCalculoFcpController.updateValue(0);
    percentualFcpController.updateValue(0);
    valorFcpController.updateValue(0);
    taxaFcpDiferidoController.updateValue(0);
    valorFcpDiferidoController.updateValue(0);
    valorFcpEfetivoController.updateValue(0);
    percentualMvaIcmsStController.updateValue(0);
    percentualReducaoBcIcmsStController.updateValue(0);
    valorBaseCalculoIcmsStController.updateValue(0);
    aliquotaIcmsStController.updateValue(0);
    valorIcmsStController.updateValue(0);
    baseCalculoFcpStController.updateValue(0);
    percentualFcpStController.updateValue(0);
    valorFcpStController.updateValue(0);
    percentualBcOperacaoPropriaController.updateValue(0);
    valorBcIcmsStRetidoController.updateValue(0);
    aliquotaSuportadaConsumidorController.updateValue(0);
    valorIcmsSubstitutoController.updateValue(0);
    valorIcmsStRetidoController.updateValue(0);
    baseCalculoFcpStRetidoController.updateValue(0);
    percentualFcpStRetidoController.updateValue(0);
    valorFcpStRetidoController.updateValue(0);
    motivoDesoneracaoIcmsController.text = '';
    valorIcmsDesoneradoController.updateValue(0);
    aliquotaCreditoIcmsSnController.updateValue(0);
    valorCreditoIcmsSnController.updateValue(0);
    valorBcIcmsStDestinoController.updateValue(0);
    valorIcmsStDestinoController.updateValue(0);
    valorIcmsStDesoneradoController.updateValue(0);
    motivoDesoneracaoIcmsStController.selected = '03=Uso na agropecuária';
    percentualReducaoBcEfetivoController.updateValue(0);
    valorBcEfetivoController.updateValue(0);
    aliquotaIcmsEfetivoController.updateValue(0);
    valorIcmsEfetivoController.updateValue(0);
    origemMercadoriaController.selected = '0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8';
    modalidadeBcIcmsController.selected = '0=Margem Valor Agregado (%)';
    modalidadeBcIcmsStController.selected = '0=Preço tabelado ou máximo sugerido';
    ufStController.selected = 'AC';
    quantidadeTributadaController.updateValue(0);
    aliquotaAdRemController.updateValue(0);
    valorIcmsMonoController.updateValue(0);
    quantidadeSujeitaRetencaoController.updateValue(0);
    aliquotaAdRemRetencaoController.updateValue(0);
    valorIcmsMonoRetencaoController.updateValue(0);
    valorIcmsMonoOperacaoController.updateValue(0);
    percentualDiferimentoMonoController.updateValue(0);
    valorIcmsDiferidoMonoController.updateValue(0);
    quantidadeTributadaRetidaController.updateValue(0);
    aliquotaAdRemRetidaController.updateValue(0);
    valorIcmsRetidoController.updateValue(0);
    percentualReducaoAdRemController.updateValue(0);
    motivoReducaoAdRemController.selected = '1= Transporte coletivo de passageiros';
    desoneradoDeduzController.selected = '0-Não';
  }

  void updateControllersFromModel() {
		_resetForm();
    cstIcmsController.text = nfeDetalheImpostoIcmsModel.cstIcms ?? '';
    csosnController.text = nfeDetalheImpostoIcmsModel.csosn ?? '';
    percentualReducaoBcIcmsController.updateValue(nfeDetalheImpostoIcmsModel.percentualReducaoBcIcms ?? 0);
    valorBcIcmsController.updateValue(nfeDetalheImpostoIcmsModel.valorBcIcms ?? 0);
    aliquotaIcmsController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaIcms ?? 0);
    valorIcmsOperacaoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsOperacao ?? 0);
    percentualDiferimentoController.updateValue(nfeDetalheImpostoIcmsModel.percentualDiferimento ?? 0);
    valorIcmsDiferidoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsDiferido ?? 0);
    valorIcmsController.updateValue(nfeDetalheImpostoIcmsModel.valorIcms ?? 0);
    baseCalculoFcpController.updateValue(nfeDetalheImpostoIcmsModel.baseCalculoFcp ?? 0);
    percentualFcpController.updateValue(nfeDetalheImpostoIcmsModel.percentualFcp ?? 0);
    valorFcpController.updateValue(nfeDetalheImpostoIcmsModel.valorFcp ?? 0);
    taxaFcpDiferidoController.updateValue(nfeDetalheImpostoIcmsModel.taxaFcpDiferido ?? 0);
    valorFcpDiferidoController.updateValue(nfeDetalheImpostoIcmsModel.valorFcpDiferido ?? 0);
    valorFcpEfetivoController.updateValue(nfeDetalheImpostoIcmsModel.valorFcpEfetivo ?? 0);
    percentualMvaIcmsStController.updateValue(nfeDetalheImpostoIcmsModel.percentualMvaIcmsSt ?? 0);
    percentualReducaoBcIcmsStController.updateValue(nfeDetalheImpostoIcmsModel.percentualReducaoBcIcmsSt ?? 0);
    valorBaseCalculoIcmsStController.updateValue(nfeDetalheImpostoIcmsModel.valorBaseCalculoIcmsSt ?? 0);
    aliquotaIcmsStController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaIcmsSt ?? 0);
    valorIcmsStController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsSt ?? 0);
    baseCalculoFcpStController.updateValue(nfeDetalheImpostoIcmsModel.baseCalculoFcpSt ?? 0);
    percentualFcpStController.updateValue(nfeDetalheImpostoIcmsModel.percentualFcpSt ?? 0);
    valorFcpStController.updateValue(nfeDetalheImpostoIcmsModel.valorFcpSt ?? 0);
    percentualBcOperacaoPropriaController.updateValue(nfeDetalheImpostoIcmsModel.percentualBcOperacaoPropria ?? 0);
    valorBcIcmsStRetidoController.updateValue(nfeDetalheImpostoIcmsModel.valorBcIcmsStRetido ?? 0);
    aliquotaSuportadaConsumidorController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaSuportadaConsumidor ?? 0);
    valorIcmsSubstitutoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsSubstituto ?? 0);
    valorIcmsStRetidoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsStRetido ?? 0);
    baseCalculoFcpStRetidoController.updateValue(nfeDetalheImpostoIcmsModel.baseCalculoFcpStRetido ?? 0);
    percentualFcpStRetidoController.updateValue(nfeDetalheImpostoIcmsModel.percentualFcpStRetido ?? 0);
    valorFcpStRetidoController.updateValue(nfeDetalheImpostoIcmsModel.valorFcpStRetido ?? 0);
    motivoDesoneracaoIcmsController.text = nfeDetalheImpostoIcmsModel.motivoDesoneracaoIcms ?? '';
    valorIcmsDesoneradoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsDesonerado ?? 0);
    aliquotaCreditoIcmsSnController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaCreditoIcmsSn ?? 0);
    valorCreditoIcmsSnController.updateValue(nfeDetalheImpostoIcmsModel.valorCreditoIcmsSn ?? 0);
    valorBcIcmsStDestinoController.updateValue(nfeDetalheImpostoIcmsModel.valorBcIcmsStDestino ?? 0);
    valorIcmsStDestinoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsStDestino ?? 0);
    valorIcmsStDesoneradoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsStDesonerado ?? 0);
    motivoDesoneracaoIcmsStController.selected = nfeDetalheImpostoIcmsModel.motivoDesoneracaoIcmsSt ?? '03=Uso na agropecuária';
    percentualReducaoBcEfetivoController.updateValue(nfeDetalheImpostoIcmsModel.percentualReducaoBcEfetivo ?? 0);
    valorBcEfetivoController.updateValue(nfeDetalheImpostoIcmsModel.valorBcEfetivo ?? 0);
    aliquotaIcmsEfetivoController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaIcmsEfetivo ?? 0);
    valorIcmsEfetivoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsEfetivo ?? 0);
    origemMercadoriaController.selected = currentModel.origemMercadoria ?? '0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8';
    modalidadeBcIcmsController.selected = currentModel.modalidadeBcIcms ?? '0=Margem Valor Agregado (%)';
    modalidadeBcIcmsStController.selected = currentModel.modalidadeBcIcmsSt ?? '0=Preço tabelado ou máximo sugerido';
    ufStController.selected = currentModel.ufSt ?? 'AC';
    quantidadeTributadaController.updateValue(nfeDetalheImpostoIcmsModel.quantidadeTributada ?? 0);
    aliquotaAdRemController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaAdRem ?? 0);
    valorIcmsMonoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsMono ?? 0);
    quantidadeSujeitaRetencaoController.updateValue(nfeDetalheImpostoIcmsModel.quantidadeSujeitaRetencao ?? 0);
    aliquotaAdRemRetencaoController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaAdRemRetencao ?? 0);
    valorIcmsMonoRetencaoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsMonoRetencao ?? 0);
    valorIcmsMonoOperacaoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsMonoOperacao ?? 0);
    percentualDiferimentoMonoController.updateValue(nfeDetalheImpostoIcmsModel.percentualDiferimentoMono ?? 0);
    valorIcmsDiferidoMonoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsDiferidoMono ?? 0);
    quantidadeTributadaRetidaController.updateValue(nfeDetalheImpostoIcmsModel.quantidadeTributadaRetida ?? 0);
    aliquotaAdRemRetidaController.updateValue(nfeDetalheImpostoIcmsModel.aliquotaAdRemRetida ?? 0);
    valorIcmsRetidoController.updateValue(nfeDetalheImpostoIcmsModel.valorIcmsRetido ?? 0);
    percentualReducaoAdRemController.updateValue(nfeDetalheImpostoIcmsModel.percentualReducaoAdRem ?? 0);
    motivoReducaoAdRemController.selected = nfeDetalheImpostoIcmsModel.motivoReducaoAdRem ?? '1= Transporte coletivo de passageiros';
    desoneradoDeduzController.selected = nfeDetalheImpostoIcmsModel.desoneradoDeduz ?? '0-Não';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    cstIcmsController.dispose();
    csosnController.dispose();
    percentualReducaoBcIcmsController.dispose();
    valorBcIcmsController.dispose();
    aliquotaIcmsController.dispose();
    valorIcmsOperacaoController.dispose();
    percentualDiferimentoController.dispose();
    valorIcmsDiferidoController.dispose();
    valorIcmsController.dispose();
    baseCalculoFcpController.dispose();
    percentualFcpController.dispose();
    valorFcpController.dispose();
    taxaFcpDiferidoController.dispose();
    valorFcpDiferidoController.dispose();
    valorFcpEfetivoController.dispose();
    percentualMvaIcmsStController.dispose();
    percentualReducaoBcIcmsStController.dispose();
    valorBaseCalculoIcmsStController.dispose();
    aliquotaIcmsStController.dispose();
    valorIcmsStController.dispose();
    baseCalculoFcpStController.dispose();
    percentualFcpStController.dispose();
    valorFcpStController.dispose();
    percentualBcOperacaoPropriaController.dispose();
    valorBcIcmsStRetidoController.dispose();
    aliquotaSuportadaConsumidorController.dispose();
    valorIcmsSubstitutoController.dispose();
    valorIcmsStRetidoController.dispose();
    baseCalculoFcpStRetidoController.dispose();
    percentualFcpStRetidoController.dispose();
    valorFcpStRetidoController.dispose();
    motivoDesoneracaoIcmsController.dispose();
    valorIcmsDesoneradoController.dispose();
    aliquotaCreditoIcmsSnController.dispose();
    valorCreditoIcmsSnController.dispose();
    valorBcIcmsStDestinoController.dispose();
    valorIcmsStDestinoController.dispose();
    valorIcmsStDesoneradoController.dispose();
    motivoDesoneracaoIcmsStController.dispose();
    percentualReducaoBcEfetivoController.dispose();
    valorBcEfetivoController.dispose();
    aliquotaIcmsEfetivoController.dispose();
    valorIcmsEfetivoController.dispose();
    origemMercadoriaController.dispose();
    modalidadeBcIcmsController.dispose();
    modalidadeBcIcmsStController.dispose();
    ufStController.dispose();
    quantidadeTributadaController.dispose();
    aliquotaAdRemController.dispose();
    valorIcmsMonoController.dispose();
    quantidadeSujeitaRetencaoController.dispose();
    aliquotaAdRemRetencaoController.dispose();
    valorIcmsMonoRetencaoController.dispose();
    valorIcmsMonoOperacaoController.dispose();
    percentualDiferimentoMonoController.dispose();
    valorIcmsDiferidoMonoController.dispose();
    quantidadeTributadaRetidaController.dispose();
    aliquotaAdRemRetidaController.dispose();
    valorIcmsRetidoController.dispose();
    percentualReducaoAdRemController.dispose();
    motivoReducaoAdRemController.dispose();
    desoneradoDeduzController.dispose();
  }

}