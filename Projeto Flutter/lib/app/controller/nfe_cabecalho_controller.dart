import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_page/shared_page_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/routes/app_routes.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/repository/nfe_cabecalho_repository.dart';

class NfeCabecalhoController extends ControllerBase<NfeCabecalhoModel, NfeCabecalhoRepository> with GetSingleTickerProviderStateMixin {

  NfeCabecalhoController({required super.repository}) {
    dbColumns = NfeCabecalhoModel.dbColumns;
    aliasColumns = NfeCabecalhoModel.aliasColumns;
    gridColumns = nfeCabecalhoGridColumns();
    functionName = "nfe_cabecalho";
    screenTitle = "NF-e";
  }

  final nfeCabecalhoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCabecalhoTabPageScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCabecalhoFormKey = GlobalKey<FormState>();
  late TabController tabController;
  String? mandatoryMessage;  

  @override
  NfeCabecalhoModel createNewModel() => NfeCabecalhoModel();

  @override
  final standardFieldForFilter = NfeCabecalhoModel.aliasColumns[NfeCabecalhoModel.dbColumns.indexOf('uf_emitente')];

  final codigoNumericoController = TextEditingController();
  final ufEmitenteController = CustomDropdownButtonController('AC');
  final codigoModeloController = CustomDropdownButtonController('55');
  final tipoOperacaoController = CustomDropdownButtonController('0=Entrada');
  final localDestinoController = CustomDropdownButtonController('1=Operação interna');
  final formatoImpressaoDanfeController = CustomDropdownButtonController('0=Sem geração de DANFE');
  final tipoEmissaoController = CustomDropdownButtonController('1=Emissão normal');
	final ambienteController = CustomDropdownButtonController('1=Produção');
	final finalidadeEmissaoController = CustomDropdownButtonController('1=NF-e normal');
  final tipoNotaDebitoController = CustomDropdownButtonController('01=Transferência de créditos para Cooperativas');
  final tipoNotaCreditoController = CustomDropdownButtonController('01=Multa e juros');
	final consumidorOperacaoController = CustomDropdownButtonController('0=Normal');
	final consumidorPresencaController = CustomDropdownButtonController('0=Não se aplica');
	final indicadorIntermediarioController = CustomDropdownButtonController('0=Operação sem intermediador (em site ou plataforma própria)');
	final processoEmissaoController = CustomDropdownButtonController('0=Emissão de NF-e com aplicativo do contribuinte');
	final regimeEspecialTributacaoController = CustomDropdownButtonController('0=Emissão de NF-e com aplicativo do contribuinte');
	final comexUfEmbarqueController = CustomDropdownButtonController('AC');
	final statusNotaController = CustomDropdownButtonController('1-Salva');
  final dataHoraEmissaoController = DatePickerItemController(null);
  final dataHoraEntradaSaidaController = DatePickerItemController(null);
  final dataEntradaContingenciaController = DatePickerItemController(null);
  final dataPrestacaoServicoController = DatePickerItemController(null);
  final naturezaOperacaoController = TextEditingController();
  final serieController = TextEditingController();
  final numeroController = TextEditingController();
  final codigoMunicipioController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final codigoMunicipioFgIbsController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final chaveAcessoController = TextEditingController();
  final digitoChaveAcessoController = TextEditingController();
  final versaoProcessoEmissaoController = TextEditingController();
  final justificativaContingenciaController = TextEditingController();
  final baseCalculoIcmsController = MoneyMaskedTextController();
  final valorIcmsController = MoneyMaskedTextController();
  final valorIcmsDesoneradoController = MoneyMaskedTextController();
  final totalIcmsFcpUfDestinoController = MoneyMaskedTextController();
  final totalIcmsInterestadualUfDestinoController = MoneyMaskedTextController();
  final totalIcmsInterestadualUfRemetenteController = MoneyMaskedTextController();
  final valorTotalFcpController = MoneyMaskedTextController();
  final baseCalculoIcmsStController = MoneyMaskedTextController();
  final valorIcmsStController = MoneyMaskedTextController();
  final valorTotalFcpStController = MoneyMaskedTextController();
  final valorTotalFcpStRetidoController = MoneyMaskedTextController();
  final totalQtdeTributadaMonoController = MoneyMaskedTextController();
  final totalIcmsMonoController = MoneyMaskedTextController();
  final totalQuantidadeMonoRetencaoController = MoneyMaskedTextController();
  final totalIcmsMonoRetencaoController = MoneyMaskedTextController();
  final totalQuantidadeMonoRetidaController = MoneyMaskedTextController();
  final totalIcmsMonoRetidoController = MoneyMaskedTextController();
  final valorTotalProdutosController = MoneyMaskedTextController();
  final valorFreteController = MoneyMaskedTextController();
  final valorSeguroController = MoneyMaskedTextController();
  final valorDescontoController = MoneyMaskedTextController();
  final valorImpostoImportacaoController = MoneyMaskedTextController();
  final valorIpiController = MoneyMaskedTextController();
  final valorIpiDevolvidoController = MoneyMaskedTextController();
  final valorPisController = MoneyMaskedTextController();
  final valorCofinsController = MoneyMaskedTextController();
  final valorDespesasAcessoriasController = MoneyMaskedTextController();
  final valorTotalController = MoneyMaskedTextController();
  final valorTotalTributosController = MoneyMaskedTextController();
  final valorServicosController = MoneyMaskedTextController();
  final baseCalculoIssqnController = MoneyMaskedTextController();
  final valorIssqnController = MoneyMaskedTextController();
  final valorPisIssqnController = MoneyMaskedTextController();
  final valorCofinsIssqnController = MoneyMaskedTextController();
  final valorDeducaoIssqnController = MoneyMaskedTextController();
  final outrasRetencoesIssqnController = MoneyMaskedTextController();
  final descontoIncondicionadoIssqnController = MoneyMaskedTextController();
  final descontoCondicionadoIssqnController = MoneyMaskedTextController();
  final totalRetencaoIssqnController = MoneyMaskedTextController();
  final valorRetidoPisController = MoneyMaskedTextController();
  final valorRetidoCofinsController = MoneyMaskedTextController();
  final valorRetidoCsllController = MoneyMaskedTextController();
  final baseCalculoIrrfController = MoneyMaskedTextController();
  final valorRetidoIrrfController = MoneyMaskedTextController();
  final baseCalculoPrevidenciaController = MoneyMaskedTextController();
  final valorRetidoPrevidenciaController = MoneyMaskedTextController();
  final informacoesAddFiscoController = TextEditingController();
  final informacoesAddContribuinteController = TextEditingController();
  final comexLocalEmbarqueController = TextEditingController();
  final comexLocalDespachoController = TextEditingController();
  final compraNotaEmpenhoController = TextEditingController();
  final compraPedidoController = TextEditingController();
  final compraContratoController = TextEditingController();
  final qrcodeController = TextEditingController();
  final urlChaveController = TextEditingController();
  final intermediadorCnpjController = TextEditingController();
  final intermediadorIdCadastroController = TextEditingController();
  final totalImpostoSeletivoController = MoneyMaskedTextController();
  final totalBcIbsCbsController = MoneyMaskedTextController();
  final ibsUfTotalDiferimentoController = MoneyMaskedTextController();
  final ibsUfTotalDevTributosController = MoneyMaskedTextController();
  final ibsUfValorTotalController = MoneyMaskedTextController();
  final ibsMunTotalDiferimentoController = MoneyMaskedTextController();
  final ibsMunTotalDevTributosController = MoneyMaskedTextController();
  final ibsMunValorTotalController = MoneyMaskedTextController();
  final ibsValorTotalController = MoneyMaskedTextController();
  final totalCreditoPresumidoController = MoneyMaskedTextController();
  final totalCredPresSuspensivoController = MoneyMaskedTextController();
  final cbsTotalDiferimentoController = MoneyMaskedTextController();
  final cbsTotalDevTributosController = MoneyMaskedTextController();
  final cbsValorTotalController = MoneyMaskedTextController();
  final cbsTotalCreditoPresumidoController = MoneyMaskedTextController();
  final cbsTotCrePreSuspensivoController = MoneyMaskedTextController();
  final monoIbsTotalController = MoneyMaskedTextController();
  final monoCbsTotalController = MoneyMaskedTextController();
  final monoIbsTotalRetencaoController = MoneyMaskedTextController();
  final monoCbsTotalRetencaoController = MoneyMaskedTextController();
  final monoIbsRetidoController = MoneyMaskedTextController();
  final monoCbsRetidoController = MoneyMaskedTextController();
  final valorTotalNfeController = MoneyMaskedTextController();
  final vendaCabecalhoModelController = TextEditingController();
  final tributOperacaoFiscalModelController = TextEditingController();
  final viewPessoaClienteModelController = TextEditingController();
  final viewPessoaColaboradorModelController = TextEditingController();
  final viewPessoaFornecedorModelController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['uf_emitente'],
    'secondaryColumns': ['codigo_numerico'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeCabecalho) => nfeCabecalho.toJson).toList();
  }

  @override
  void prepareForInsert() {
    isNewRecord = true;
    currentModel = createNewModel();
    _resetForm();
    tabController.animateTo(0);
    updateControllersFromModel();
    Get.toNamed(Routes.nfeCabecalhoTabPage);
  }

  void _resetForm() {
    formWasChanged = false;
    codigoNumericoController.text = '';
    ufEmitenteController.selected = 'AC';
    codigoModeloController.selected = '55';
    tipoOperacaoController.selected = '0=Entrada';
    localDestinoController.selected = '1=Operação interna';
    formatoImpressaoDanfeController.selected = '0=Sem geração de DANFE';
    tipoEmissaoController.selected = '1=Emissão normal';
    ambienteController.selected = '1=Produção';
    finalidadeEmissaoController.selected = '1=NF-e normal';
    tipoNotaDebitoController.selected = '01=Transferência de créditos para Cooperativas';
    tipoNotaCreditoController.selected = '01=Multa e juros';
    consumidorOperacaoController.selected = '0=Normal';
    consumidorPresencaController.selected = '0=Não se aplica';
    indicadorIntermediarioController.selected = '0=Operação sem intermediador (em site ou plataforma própria)';
    processoEmissaoController.selected = '0=Emissão de NF-e com aplicativo do contribuinte';
    regimeEspecialTributacaoController.selected = '0=Emissão de NF-e com aplicativo do contribuinte';
    comexUfEmbarqueController.selected = 'AC';
    statusNotaController.selected = '1-Salva';
    dataHoraEmissaoController.date = null;
    dataHoraEntradaSaidaController.date = null;
    dataEntradaContingenciaController.date = null;
    dataPrestacaoServicoController.date = null;
    naturezaOperacaoController.text = '';
    serieController.text = '';
    numeroController.text = '';
    codigoMunicipioController.updateValue(0);
    codigoMunicipioFgIbsController.updateValue(0);
    chaveAcessoController.text = '';
    digitoChaveAcessoController.text = '';
    versaoProcessoEmissaoController.text = '';
    justificativaContingenciaController.text = '';
    baseCalculoIcmsController.updateValue(0);
    valorIcmsController.updateValue(0);
    valorIcmsDesoneradoController.updateValue(0);
    totalIcmsFcpUfDestinoController.updateValue(0);
    totalIcmsInterestadualUfDestinoController.updateValue(0);
    totalIcmsInterestadualUfRemetenteController.updateValue(0);
    valorTotalFcpController.updateValue(0);
    baseCalculoIcmsStController.updateValue(0);
    valorIcmsStController.updateValue(0);
    valorTotalFcpStController.updateValue(0);
    valorTotalFcpStRetidoController.updateValue(0);
    totalQtdeTributadaMonoController.updateValue(0);
    totalIcmsMonoController.updateValue(0);
    totalQuantidadeMonoRetencaoController.updateValue(0);
    totalIcmsMonoRetencaoController.updateValue(0);
    totalQuantidadeMonoRetidaController.updateValue(0);
    totalIcmsMonoRetidoController.updateValue(0);
    valorTotalProdutosController.updateValue(0);
    valorFreteController.updateValue(0);
    valorSeguroController.updateValue(0);
    valorDescontoController.updateValue(0);
    valorImpostoImportacaoController.updateValue(0);
    valorIpiController.updateValue(0);
    valorIpiDevolvidoController.updateValue(0);
    valorPisController.updateValue(0);
    valorCofinsController.updateValue(0);
    valorDespesasAcessoriasController.updateValue(0);
    valorTotalController.updateValue(0);
    valorTotalTributosController.updateValue(0);
    valorServicosController.updateValue(0);
    baseCalculoIssqnController.updateValue(0);
    valorIssqnController.updateValue(0);
    valorPisIssqnController.updateValue(0);
    valorCofinsIssqnController.updateValue(0);
    valorDeducaoIssqnController.updateValue(0);
    outrasRetencoesIssqnController.updateValue(0);
    descontoIncondicionadoIssqnController.updateValue(0);
    descontoCondicionadoIssqnController.updateValue(0);
    totalRetencaoIssqnController.updateValue(0);
    valorRetidoPisController.updateValue(0);
    valorRetidoCofinsController.updateValue(0);
    valorRetidoCsllController.updateValue(0);
    baseCalculoIrrfController.updateValue(0);
    valorRetidoIrrfController.updateValue(0);
    baseCalculoPrevidenciaController.updateValue(0);
    valorRetidoPrevidenciaController.updateValue(0);
    informacoesAddFiscoController.text = '';
    informacoesAddContribuinteController.text = '';
    comexLocalEmbarqueController.text = '';
    comexLocalDespachoController.text = '';
    compraNotaEmpenhoController.text = '';
    compraPedidoController.text = '';
    compraContratoController.text = '';
    qrcodeController.text = '';
    urlChaveController.text = '';
    intermediadorCnpjController.text = '';
    intermediadorIdCadastroController.text = '';
    totalImpostoSeletivoController.updateValue(0);
    totalBcIbsCbsController.updateValue(0);
    ibsUfTotalDiferimentoController.updateValue(0);
    ibsUfTotalDevTributosController.updateValue(0);
    ibsUfValorTotalController.updateValue(0);
    ibsMunTotalDiferimentoController.updateValue(0);
    ibsMunTotalDevTributosController.updateValue(0);
    ibsMunValorTotalController.updateValue(0);
    ibsValorTotalController.updateValue(0);
    totalCreditoPresumidoController.updateValue(0);
    totalCredPresSuspensivoController.updateValue(0);
    cbsTotalDiferimentoController.updateValue(0);
    cbsTotalDevTributosController.updateValue(0);
    cbsValorTotalController.updateValue(0);
    cbsTotalCreditoPresumidoController.updateValue(0);
    cbsTotCrePreSuspensivoController.updateValue(0);
    monoIbsTotalController.updateValue(0);
    monoCbsTotalController.updateValue(0);
    monoIbsTotalRetencaoController.updateValue(0);
    monoCbsTotalRetencaoController.updateValue(0);
    monoIbsRetidoController.updateValue(0);
    monoCbsRetidoController.updateValue(0);
    valorTotalNfeController.updateValue(0);
    vendaCabecalhoModelController.text = '';
    tributOperacaoFiscalModelController.text = '';
    viewPessoaClienteModelController.text = '';
    viewPessoaColaboradorModelController.text = '';
    viewPessoaFornecedorModelController.text = '';
  }

  @override
  void selectRowForEditingById(int id) {
    final model = modelList.firstWhere((m) => m.id == id);
    currentModel = model.clone();
    updateControllersFromModel();
    tabController.animateTo(0);
    Get.toNamed(Routes.nfeCabecalhoTabPage);
  }

  _configureChildrenControllers() {
    //Detalhes
		Get.put<NfeDetalheController>(NfeDetalheController()); 

    //Emitente
		Get.put<NfeEmitenteController>(NfeEmitenteController()); 

    //Compra Governamental
		Get.put<NfeCompraGovernamentalController>(NfeCompraGovernamentalController()); 

    //Destinatário
		Get.put<NfeDestinatarioController>(NfeDestinatarioController()); 

    //Local Retirada
		Get.put<NfeLocalRetiradaController>(NfeLocalRetiradaController()); 

    //Local Entrega
		Get.put<NfeLocalEntregaController>(NfeLocalEntregaController()); 

    //Transporte
		Get.put<NfeTransporteController>(NfeTransporteController()); 

    //nfe_transporte_reboque
		Get.put<NfeTransporteReboqueController>(NfeTransporteReboqueController()); 

    //Nfe Transporte Volume
		Get.put<NfeTransporteVolumeController>(NfeTransporteVolumeController()); 

    //Nfe Transporte Volume Lacre
		Get.put<NfeTransporteVolumeLacreController>(NfeTransporteVolumeLacreController()); 

    //Fatura
		Get.put<NfeFaturaController>(NfeFaturaController()); 

    //Duplicata
		Get.put<NfeDuplicataController>(NfeDuplicataController()); 

    //Cana
		Get.put<NfeCanaController>(NfeCanaController()); 

    //nfe_cana_fornecimento_diario
		Get.put<NfeCanaFornecimentoDiarioController>(NfeCanaFornecimentoDiarioController()); 

    //nfe_cana_deducoes_safra
		Get.put<NfeCanaDeducoesSafraController>(NfeCanaDeducoesSafraController()); 

    //Responsável Técnico
		Get.put<NfeResponsavelTecnicoController>(NfeResponsavelTecnicoController()); 

    //CTe Referenciado
		Get.put<NfeCteReferenciadoController>(NfeCteReferenciadoController()); 

    //NFe Referenciada
		Get.put<NfeReferenciadaController>(NfeReferenciadaController()); 

    //NFe Produtor Rural
		Get.put<NfeProdRuralReferenciadaController>(NfeProdRuralReferenciadaController()); 

    //NF Referenciada
		Get.put<NfeNfReferenciadaController>(NfeNfReferenciadaController()); 

    //Processo Referenciado
		Get.put<NfeProcessoReferenciadoController>(NfeProcessoReferenciadoController()); 

    //Acesso XML
		Get.put<NfeAcessoXmlController>(NfeAcessoXmlController()); 

    //Informação Pagamento
		Get.put<NfeInformacaoPagamentoController>(NfeInformacaoPagamentoController()); 

    //CF Referenciado
		Get.put<NfeCupomFiscalReferenciadoController>(NfeCupomFiscalReferenciadoController()); 

    //Antecipação Pagamento
		Get.put<NfeAntecipacaoPagamentoController>(NfeAntecipacaoPagamentoController()); 

    //Informação Agropecuário
		Get.put<NfeInformacaoAgropecuarioController>(NfeInformacaoAgropecuarioController()); 
  }

  _releaseChildrenControllers() {
    //Detalhes
		Get.delete<NfeDetalheController>(); 

    //Emitente
		Get.delete<NfeEmitenteController>(); 

    //Emitente
		Get.delete<NfeCompraGovernamentalController>(); 

    //Destinatário
		Get.delete<NfeDestinatarioController>(); 

    //Local Retirada
		Get.delete<NfeLocalRetiradaController>(); 

    //Local Entrega
		Get.delete<NfeLocalEntregaController>(); 

    //Transporte
		Get.delete<NfeTransporteController>(); 

    //nfe_transporte_reboque
		Get.delete<NfeTransporteReboqueController>(); 

    //Nfe Transporte Volume
		Get.delete<NfeTransporteVolumeController>(); 

    //Nfe Transporte Volume Lacre
		Get.delete<NfeTransporteVolumeLacreController>(); 

    //Fatura
		Get.delete<NfeFaturaController>(); 

    //Duplicata
		Get.delete<NfeDuplicataController>(); 

    //Cana
		Get.delete<NfeCanaController>(); 

    //nfe_cana_fornecimento_diario
		Get.delete<NfeCanaFornecimentoDiarioController>(); 

    //nfe_cana_deducoes_safra
		Get.delete<NfeCanaDeducoesSafraController>(); 

    //Responsável Técnico
		Get.delete<NfeResponsavelTecnicoController>(); 

    //CTe Referenciado
		Get.delete<NfeCteReferenciadoController>(); 

    //NFe Referenciada
		Get.delete<NfeReferenciadaController>(); 

    //NFe Produtor Rural
		Get.delete<NfeProdRuralReferenciadaController>(); 

    //NF Referenciada
		Get.delete<NfeNfReferenciadaController>(); 

    //Processo Referenciado
		Get.delete<NfeProcessoReferenciadoController>(); 

    //Acesso XML
		Get.delete<NfeAcessoXmlController>(); 

    //Informação Pagamento
		Get.delete<NfeInformacaoPagamentoController>(); 

    //CF Referenciado
		Get.delete<NfeCupomFiscalReferenciadoController>(); 

    //Antecipação Pagamento
		Get.delete<NfeAntecipacaoPagamentoController>(); 

    //Informação Agropecuário
		Get.delete<NfeInformacaoAgropecuarioController>(); 
  }

  void updateControllersFromModel() {
    codigoNumericoController.text = currentModel.codigoNumerico ?? '';
    ufEmitenteController.selected = currentModel.ufEmitente ?? 'AC';
    codigoModeloController.selected = currentModel.codigoModelo ?? '55';
    tipoOperacaoController.selected = currentModel.tipoOperacao ?? '0=Entrada';
    localDestinoController.selected = currentModel.localDestino ?? '1=Operação interna';
    formatoImpressaoDanfeController.selected = currentModel.formatoImpressaoDanfe ?? '0=Sem geração de DANFE';
    tipoEmissaoController.selected = currentModel.tipoEmissao ?? '1=Emissão normal';
    ambienteController.selected = currentModel.ambiente ?? '1=Produção';
    finalidadeEmissaoController.selected = currentModel.finalidadeEmissao ?? '1=NF-e normal';
    tipoNotaDebitoController.selected = currentModel.tipoNotaDebito ?? '01=Transferência de créditos para Cooperativas';
    tipoNotaCreditoController.selected = currentModel.tipoNotaCredito ?? '01=Multa e juros';
    consumidorOperacaoController.selected = currentModel.consumidorOperacao ?? '0=Normal';
    consumidorPresencaController.selected = currentModel.consumidorPresenca ?? '0=Não se aplica';
    indicadorIntermediarioController.selected = currentModel.indicadorIntermediario ?? '0=Operação sem intermediador (em site ou plataforma própria)';
    processoEmissaoController.selected = currentModel.processoEmissao ?? '0=Emissão de NF-e com aplicativo do contribuinte';
    regimeEspecialTributacaoController.selected = currentModel.regimeEspecialTributacao ?? '0=Emissão de NF-e com aplicativo do contribuinte';
    comexUfEmbarqueController.selected = currentModel.comexUfEmbarque ?? 'AC';
    statusNotaController.selected = currentModel.statusNota ?? '1-Salva';
    dataHoraEmissaoController.date = currentModel.dataHoraEmissao;
    dataHoraEntradaSaidaController.date = currentModel.dataHoraEntradaSaida;
    dataPrestacaoServicoController.date = currentModel.dataPrestacaoServico;
    dataEntradaContingenciaController.date = currentModel.dataEntradaContingencia;
    naturezaOperacaoController.text = currentModel.naturezaOperacao ?? '';
    serieController.text = currentModel.serie ?? '';
    numeroController.text = currentModel.numero ?? '';
    codigoMunicipioController.updateValue((currentModel.codigoMunicipio ?? 0).toDouble());
    codigoMunicipioFgIbsController.updateValue((currentModel.codigoMunicipioFgIbs ?? 0).toDouble());
    chaveAcessoController.text = currentModel.chaveAcesso ?? '';
    digitoChaveAcessoController.text = currentModel.digitoChaveAcesso ?? '';
    versaoProcessoEmissaoController.text = currentModel.versaoProcessoEmissao ?? '';
    justificativaContingenciaController.text = currentModel.justificativaContingencia ?? '';
    baseCalculoIcmsController.updateValue(currentModel.baseCalculoIcms ?? 0);
    valorIcmsController.updateValue(currentModel.valorIcms ?? 0);
    valorIcmsDesoneradoController.updateValue(currentModel.valorIcmsDesonerado ?? 0);
    totalIcmsFcpUfDestinoController.updateValue(currentModel.totalIcmsFcpUfDestino ?? 0);
    totalIcmsInterestadualUfDestinoController.updateValue(currentModel.totalIcmsInterestadualUfDestino ?? 0);
    totalIcmsInterestadualUfRemetenteController.updateValue(currentModel.totalIcmsInterestadualUfRemetente ?? 0);
    valorTotalFcpController.updateValue(currentModel.valorTotalFcp ?? 0);
    baseCalculoIcmsStController.updateValue(currentModel.baseCalculoIcmsSt ?? 0);
    valorIcmsStController.updateValue(currentModel.valorIcmsSt ?? 0);
    valorTotalFcpStController.updateValue(currentModel.valorTotalFcpSt ?? 0);
    valorTotalFcpStRetidoController.updateValue(currentModel.valorTotalFcpStRetido ?? 0);
    totalQtdeTributadaMonoController.updateValue(currentModel.totalQtdeTributadaMono ?? 0);
    totalIcmsMonoController.updateValue(currentModel.totalIcmsMono ?? 0);
    totalQuantidadeMonoRetencaoController.updateValue(currentModel.totalQuantidadeMonoRetencao ?? 0);
    totalIcmsMonoRetencaoController.updateValue(currentModel.totalIcmsMonoRetencao ?? 0);
    totalQuantidadeMonoRetidaController.updateValue(currentModel.totalQuantidadeMonoRetida ?? 0);
    totalIcmsMonoRetidoController.updateValue(currentModel.totalIcmsMonoRetido ?? 0);
    valorTotalProdutosController.updateValue(currentModel.valorTotalProdutos ?? 0);
    valorFreteController.updateValue(currentModel.valorFrete ?? 0);
    valorSeguroController.updateValue(currentModel.valorSeguro ?? 0);
    valorDescontoController.updateValue(currentModel.valorDesconto ?? 0);
    valorImpostoImportacaoController.updateValue(currentModel.valorImpostoImportacao ?? 0);
    valorIpiController.updateValue(currentModel.valorIpi ?? 0);
    valorIpiDevolvidoController.updateValue(currentModel.valorIpiDevolvido ?? 0);
    valorPisController.updateValue(currentModel.valorPis ?? 0);
    valorCofinsController.updateValue(currentModel.valorCofins ?? 0);
    valorDespesasAcessoriasController.updateValue(currentModel.valorDespesasAcessorias ?? 0);
    valorTotalController.updateValue(currentModel.valorTotal ?? 0);
    valorTotalTributosController.updateValue(currentModel.valorTotalTributos ?? 0);
    valorServicosController.updateValue(currentModel.valorServicos ?? 0);
    baseCalculoIssqnController.updateValue(currentModel.baseCalculoIssqn ?? 0);
    valorIssqnController.updateValue(currentModel.valorIssqn ?? 0);
    valorPisIssqnController.updateValue(currentModel.valorPisIssqn ?? 0);
    valorCofinsIssqnController.updateValue(currentModel.valorCofinsIssqn ?? 0);
    valorDeducaoIssqnController.updateValue(currentModel.valorDeducaoIssqn ?? 0);
    outrasRetencoesIssqnController.updateValue(currentModel.outrasRetencoesIssqn ?? 0);
    descontoIncondicionadoIssqnController.updateValue(currentModel.descontoIncondicionadoIssqn ?? 0);
    descontoCondicionadoIssqnController.updateValue(currentModel.descontoCondicionadoIssqn ?? 0);
    totalRetencaoIssqnController.updateValue(currentModel.totalRetencaoIssqn ?? 0);
    valorRetidoPisController.updateValue(currentModel.valorRetidoPis ?? 0);
    valorRetidoCofinsController.updateValue(currentModel.valorRetidoCofins ?? 0);
    valorRetidoCsllController.updateValue(currentModel.valorRetidoCsll ?? 0);
    baseCalculoIrrfController.updateValue(currentModel.baseCalculoIrrf ?? 0);
    valorRetidoIrrfController.updateValue(currentModel.valorRetidoIrrf ?? 0);
    baseCalculoPrevidenciaController.updateValue(currentModel.baseCalculoPrevidencia ?? 0);
    valorRetidoPrevidenciaController.updateValue(currentModel.valorRetidoPrevidencia ?? 0);
    informacoesAddFiscoController.text = currentModel.informacoesAddFisco ?? '';
    informacoesAddContribuinteController.text = currentModel.informacoesAddContribuinte ?? '';
    comexLocalEmbarqueController.text = currentModel.comexLocalEmbarque ?? '';
    comexLocalDespachoController.text = currentModel.comexLocalDespacho ?? '';
    compraNotaEmpenhoController.text = currentModel.compraNotaEmpenho ?? '';
    compraPedidoController.text = currentModel.compraPedido ?? '';
    compraContratoController.text = currentModel.compraContrato ?? '';
    qrcodeController.text = currentModel.qrcode ?? '';
    urlChaveController.text = currentModel.urlChave ?? '';
    intermediadorCnpjController.text = currentModel.intermediadorCnpj ?? '';
    intermediadorIdCadastroController.text = currentModel.intermediadorIdCadastro ?? '';
    totalImpostoSeletivoController.updateValue(currentModel.totalImpostoSeletivo ?? 0);
    totalBcIbsCbsController.updateValue(currentModel.totalBcIbsCbs ?? 0);
    ibsUfTotalDiferimentoController.updateValue(currentModel.ibsUfTotalDiferimento ?? 0);
    ibsUfTotalDevTributosController.updateValue(currentModel.ibsUfTotalDevTributos ?? 0);
    ibsUfValorTotalController.updateValue(currentModel.ibsUfValorTotal ?? 0);
    ibsMunTotalDiferimentoController.updateValue(currentModel.ibsMunTotalDiferimento ?? 0);
    ibsMunTotalDevTributosController.updateValue(currentModel.ibsMunTotalDevTributos ?? 0);
    ibsMunValorTotalController.updateValue(currentModel.ibsMunValorTotal ?? 0);
    ibsValorTotalController.updateValue(currentModel.ibsValorTotal ?? 0);
    totalCreditoPresumidoController.updateValue(currentModel.totalCreditoPresumido ?? 0);
    totalCredPresSuspensivoController.updateValue(currentModel.totalCredPresSuspensivo ?? 0);
    cbsTotalDiferimentoController.updateValue(currentModel.cbsTotalDiferimento ?? 0);
    cbsTotalDevTributosController.updateValue(currentModel.cbsTotalDevTributos ?? 0);
    cbsValorTotalController.updateValue(currentModel.cbsValorTotal ?? 0);
    cbsTotalCreditoPresumidoController.updateValue(currentModel.cbsTotalCreditoPresumido ?? 0);
    cbsTotCrePreSuspensivoController.updateValue(currentModel.cbsTotCrePreSuspensivo ?? 0);
    monoIbsTotalController.updateValue(currentModel.monoIbsTotal ?? 0);
    monoCbsTotalController.updateValue(currentModel.monoCbsTotal ?? 0);
    monoIbsTotalRetencaoController.updateValue(currentModel.monoIbsTotalRetencao ?? 0);
    monoCbsTotalRetencaoController.updateValue(currentModel.monoCbsTotalRetencao ?? 0);
    monoIbsRetidoController.updateValue(currentModel.monoIbsRetido ?? 0);
    monoCbsRetidoController.updateValue(currentModel.monoCbsRetido ?? 0);
    valorTotalNfeController.updateValue(currentModel.valorTotalNfe ?? 0);
    vendaCabecalhoModelController.text = currentModel.vendaCabecalhoModel?.id?.toString() ?? '';
    tributOperacaoFiscalModelController.text = currentModel.tributOperacaoFiscalModel?.descricao?.toString() ?? '';
    viewPessoaClienteModelController.text = currentModel.viewPessoaClienteModel?.nome?.toString() ?? '';
    viewPessoaColaboradorModelController.text = currentModel.viewPessoaColaboradorModel?.nome?.toString() ?? '';
    viewPessoaFornecedorModelController.text = currentModel.viewPessoaFornecedorModel?.nome?.toString() ?? '';
    formWasChanged = false;

    _updateChildrenControllersFromModel();
  }

  void _updateChildrenControllersFromModel() {
    //Detalhes
		final nfeDetalheController = Get.find<NfeDetalheController>(); 
    nfeDetalheController.updateControllersFromModel();

    //Emitente
		final nfeEmitenteController = Get.find<NfeEmitenteController>(); 
		nfeEmitenteController.updateControllersFromModel(); 

    //Compra Governamental
    final nfeCompraGovernamentalController = Get.find<NfeCompraGovernamentalController>();
		nfeCompraGovernamentalController.updateControllersFromModel();

    //Destinatário
		final nfeDestinatarioController = Get.find<NfeDestinatarioController>(); 
		nfeDestinatarioController.updateControllersFromModel(); 

    //Local Retirada
		final nfeLocalRetiradaController = Get.find<NfeLocalRetiradaController>(); 
		nfeLocalRetiradaController.updateControllersFromModel(); 

    //Local Entrega
		final nfeLocalEntregaController = Get.find<NfeLocalEntregaController>(); 
		nfeLocalEntregaController.updateControllersFromModel(); 

    //Transporte
		final nfeTransporteController = Get.find<NfeTransporteController>(); 
		nfeTransporteController.updateControllersFromModel(); 

    //nfe_transporte_reboque
		final nfeTransporteReboqueController = Get.find<NfeTransporteReboqueController>(); 
		nfeTransporteReboqueController.userMadeChanges = false; 

    //Nfe Transporte Volume
		final nfeTransporteVolumeController = Get.find<NfeTransporteVolumeController>(); 
		nfeTransporteVolumeController.userMadeChanges = false; 

    //Fatura
		final nfeFaturaController = Get.find<NfeFaturaController>(); 
		nfeFaturaController.updateControllersFromModel(); 

    //Duplicata
		final nfeDuplicataController = Get.find<NfeDuplicataController>(); 
		nfeDuplicataController.userMadeChanges = false; 

    //Cana
		final nfeCanaController = Get.find<NfeCanaController>(); 
		nfeCanaController.updateControllersFromModel(); 

    //nfe_cana_fornecimento_diario
		final nfeCanaFornecimentoDiarioController = Get.find<NfeCanaFornecimentoDiarioController>(); 
		nfeCanaFornecimentoDiarioController.userMadeChanges = false; 

    //nfe_cana_deducoes_safra
		final nfeCanaDeducoesSafraController = Get.find<NfeCanaDeducoesSafraController>(); 
		nfeCanaDeducoesSafraController.userMadeChanges = false; 

    //Responsável Técnico
		final nfeResponsavelTecnicoController = Get.find<NfeResponsavelTecnicoController>(); 
		nfeResponsavelTecnicoController.updateControllersFromModel(); 

    //CTe Referenciado
		final nfeCteReferenciadoController = Get.find<NfeCteReferenciadoController>(); 
		nfeCteReferenciadoController.updateControllersFromModel(); 

    //NFe Referenciada
		final nfeReferenciadaController = Get.find<NfeReferenciadaController>(); 
		nfeReferenciadaController.userMadeChanges = false; 

    //NFe Produtor Rural
		final nfeProdRuralReferenciadaController = Get.find<NfeProdRuralReferenciadaController>(); 
		nfeProdRuralReferenciadaController.userMadeChanges = false; 

    //NF Referenciada
		final nfeNfReferenciadaController = Get.find<NfeNfReferenciadaController>(); 
		nfeNfReferenciadaController.userMadeChanges = false; 

    //Processo Referenciado
		final nfeProcessoReferenciadoController = Get.find<NfeProcessoReferenciadoController>(); 
		nfeProcessoReferenciadoController.userMadeChanges = false; 

    //Acesso XML
		final nfeAcessoXmlController = Get.find<NfeAcessoXmlController>(); 
		nfeAcessoXmlController.userMadeChanges = false; 

    //Informação Pagamento
		final nfeInformacaoPagamentoController = Get.find<NfeInformacaoPagamentoController>(); 
		nfeInformacaoPagamentoController.userMadeChanges = false; 

    //CF Referenciado
		final nfeCupomFiscalReferenciadoController = Get.find<NfeCupomFiscalReferenciadoController>(); 
		nfeCupomFiscalReferenciadoController.userMadeChanges = false; 

    //Antecipação Pagamento
		final nfeAntecipacaoPagamentoController = Get.find<NfeAntecipacaoPagamentoController>(); 
		nfeAntecipacaoPagamentoController.userMadeChanges = false; 

    //Informação Agropecuário
		final nfeInformacaoAgropecuarioController = Get.find<NfeInformacaoAgropecuarioController>(); 
		nfeInformacaoAgropecuarioController.userMadeChanges = false; 
  }

  @override
  Future<void> save() async {
    if (!validateCurrentForm()) return;
    if (validateForms()) {
      if (userMadeChanges()) {
        final existingIndex = modelList.indexWhere((m) => m.id == currentModel.id);

        if (existingIndex >= 0) {
          modelList[existingIndex] = currentModel.clone();
        }

        final result = await repository.save(nfeCabecalhoModel: currentModel);
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
      } else {
        Get.back();
      }
    } 
  }

  Future callVendaCabecalhoLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Venda]'; 
		lookupController.route = '/venda-cabecalho/'; 
		lookupController.gridColumns = vendaCabecalhoGridColumns(isForLookup: true); 
		lookupController.aliasColumns = VendaCabecalhoModel.aliasColumns; 
		lookupController.dbColumns = VendaCabecalhoModel.dbColumns; 
		lookupController.standardColumn = VendaCabecalhoModel.aliasColumns[VendaCabecalhoModel.dbColumns.indexOf('id')]; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			currentModel.idVendaCabecalho = plutoRowResult.cells['id']!.value; 
			currentModel.vendaCabecalhoModel = VendaCabecalhoModel.fromPlutoRow(plutoRowResult); 
			vendaCabecalhoModelController.text = currentModel.vendaCabecalhoModel?.id?.toString() ?? ''; 
			formWasChanged = true; 
		}
	}

  Future callTributOperacaoFiscalLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Operação Fiscal]'; 
		lookupController.route = '/tribut-operacao-fiscal/'; 
		lookupController.gridColumns = tributOperacaoFiscalGridColumns(isForLookup: true); 
		lookupController.aliasColumns = TributOperacaoFiscalModel.aliasColumns; 
		lookupController.dbColumns = TributOperacaoFiscalModel.dbColumns; 
		lookupController.standardColumn = TributOperacaoFiscalModel.aliasColumns[TributOperacaoFiscalModel.dbColumns.indexOf('descricao')]; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			currentModel.idTributOperacaoFiscal = plutoRowResult.cells['id']!.value; 
			currentModel.tributOperacaoFiscalModel = TributOperacaoFiscalModel.fromPlutoRow(plutoRowResult); 
			tributOperacaoFiscalModelController.text = currentModel.tributOperacaoFiscalModel?.descricao ?? ''; 
			formWasChanged = true; 
		}
	}

  Future callViewPessoaClienteLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Cliente]'; 
		lookupController.route = '/view-pessoa-cliente/'; 
		lookupController.gridColumns = viewPessoaClienteGridColumns(isForLookup: true); 
		lookupController.aliasColumns = ViewPessoaClienteModel.aliasColumns; 
		lookupController.dbColumns = ViewPessoaClienteModel.dbColumns; 
		lookupController.standardColumn = ViewPessoaClienteModel.aliasColumns[ViewPessoaClienteModel.dbColumns.indexOf('nome')]; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			currentModel.idCliente = plutoRowResult.cells['id']!.value; 
			currentModel.viewPessoaClienteModel = ViewPessoaClienteModel.fromPlutoRow(plutoRowResult); 
			viewPessoaClienteModelController.text = currentModel.viewPessoaClienteModel?.nome ?? ''; 
			formWasChanged = true; 
		}
	}

  Future callViewPessoaColaboradorLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Colaborador]'; 
		lookupController.route = '/view-pessoa-colaborador/'; 
		lookupController.gridColumns = viewPessoaColaboradorGridColumns(isForLookup: true); 
		lookupController.aliasColumns = ViewPessoaColaboradorModel.aliasColumns; 
		lookupController.dbColumns = ViewPessoaColaboradorModel.dbColumns; 
		lookupController.standardColumn = ViewPessoaColaboradorModel.aliasColumns[ViewPessoaColaboradorModel.dbColumns.indexOf('nome')]; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			currentModel.idColaborador = plutoRowResult.cells['id']!.value; 
			currentModel.viewPessoaColaboradorModel = ViewPessoaColaboradorModel.fromPlutoRow(plutoRowResult); 
			viewPessoaColaboradorModelController.text = currentModel.viewPessoaColaboradorModel?.nome ?? ''; 
			formWasChanged = true; 
		}
	}

  Future callViewPessoaFornecedorLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Fornecedor]'; 
		lookupController.route = '/view-pessoa-fornecedor/'; 
		lookupController.gridColumns = viewPessoaFornecedorGridColumns(isForLookup: true); 
		lookupController.aliasColumns = ViewPessoaFornecedorModel.aliasColumns; 
		lookupController.dbColumns = ViewPessoaFornecedorModel.dbColumns; 
		lookupController.standardColumn = ViewPessoaFornecedorModel.aliasColumns[ViewPessoaFornecedorModel.dbColumns.indexOf('nome')]; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			currentModel.idFornecedor = plutoRowResult.cells['id']!.value; 
			currentModel.viewPessoaFornecedorModel = ViewPessoaFornecedorModel.fromPlutoRow(plutoRowResult); 
			viewPessoaFornecedorModelController.text = currentModel.viewPessoaFornecedorModel?.nome ?? ''; 
			formWasChanged = true; 
		}
	}


  List<Tab> tabItems = [
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'NF-e', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Emitente', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Destinatário', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Local Retirada', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Local Entrega', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Transporte', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Fatura', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Cana', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Responsável Técnico', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Compra Governamental', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'CTe Referenciado', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'NFe Referenciada', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'NFe Produtor Rural', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'NF Referenciada', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Processo Referenciado', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Acesso XML', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Informação Pagamento', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'CF Referenciado', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Antecipação Pagamento', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Informação Agropecuário', 
		),
  ];

  List<Widget> tabPages() {
    return [
      NfeCabecalhoEditPage(),
      NfeEmitenteEditPage(),
      NfeDestinatarioEditPage(),
      NfeLocalRetiradaEditPage(),
      NfeLocalEntregaEditPage(),
      NfeTransporteTabPage(),
      NfeFaturaTabPage(),
      NfeCanaTabPage(),
      NfeResponsavelTecnicoEditPage(),
      NfeCompraGovernamentalEditPage(),
      const NfeCteReferenciadoListPage(),
      const NfeReferenciadaListPage(),
      const NfeProdRuralReferenciadaListPage(),
      const NfeNfReferenciadaListPage(),
      const NfeProcessoReferenciadoListPage(),
      const NfeAcessoXmlListPage(),
      const NfeInformacaoPagamentoListPage(),
      const NfeCupomFiscalReferenciadoListPage(),
      const NfeAntecipacaoPagamentoListPage(),
      const NfeInformacaoAgropecuarioListPage(),
    ];
  }

  @override
  void preventDataLoss() {
    if (userMadeChanges()) {
      showQuestionDialog('message_data_loss'.tr, () { 
        Get.back(); 
      });
    } else {
      Get.back();
    }
  }  

  bool userMadeChanges() {
    return
    formWasChanged 
    || 
		Get.find<NfeEmitenteController>().formWasChangedDetail
    || 
    Get.find<NfeCompraGovernamentalController>().formWasChangedDetail
    ||
		Get.find<NfeDestinatarioController>().formWasChangedDetail
    || 
		Get.find<NfeLocalRetiradaController>().formWasChangedDetail
    || 
		Get.find<NfeLocalEntregaController>().formWasChangedDetail
    || 
		Get.find<NfeTransporteController>().userMadeChanges()
    || 
		Get.find<NfeDetalheController>().userMadeChanges()
    || 
		Get.find<NfeFaturaController>().userMadeChanges()
    || 
		Get.find<NfeCanaController>().userMadeChanges()
    || 
		Get.find<NfeResponsavelTecnicoController>().formWasChangedDetail
    || 
		Get.find<NfeCteReferenciadoController>().formWasChangedDetail
    || 
		Get.find<NfeReferenciadaController>().userMadeChanges
    || 
		Get.find<NfeProdRuralReferenciadaController>().userMadeChanges
    || 
		Get.find<NfeNfReferenciadaController>().userMadeChanges
    || 
		Get.find<NfeProcessoReferenciadoController>().userMadeChanges
    || 
		Get.find<NfeAcessoXmlController>().userMadeChanges
    || 
		Get.find<NfeInformacaoPagamentoController>().userMadeChanges
    || 
		Get.find<NfeCupomFiscalReferenciadoController>().userMadeChanges
    || 
		Get.find<NfeAntecipacaoPagamentoController>().userMadeChanges
    || 
		Get.find<NfeInformacaoAgropecuarioController>().userMadeChanges
    ;
  }

  void tabChange(int index) {
    validateCurrentForm();
  }

  bool validateCurrentForm() {
    mandatoryMessage = ValidateFormField.validateMandatory(currentModel.viewPessoaClienteModel?.nome); 
		if (mandatoryMessage != null) { 
			tabController.animateTo(0); 
			showErrorSnackBar(message: '$mandatoryMessage [Cliente]'); 
			return false; 
		}
    mandatoryMessage = ValidateFormField.validateMandatory(currentModel.viewPessoaColaboradorModel?.nome); 
		if (mandatoryMessage != null) { 
			tabController.animateTo(0); 
			showErrorSnackBar(message: '$mandatoryMessage [Colaborador]'); 
			return false; 
		}
    mandatoryMessage = ValidateFormField.validateMandatory(currentModel.viewPessoaFornecedorModel?.nome); 
		if (mandatoryMessage != null) { 
			tabController.animateTo(0); 
			showErrorSnackBar(message: '$mandatoryMessage [Fornecedor]'); 
			return false; 
		}
    return true;
  }

  bool validateForms() {
    final resultNfeEmitente = Get.find<NfeEmitenteController>().validateForm(); 
		if (!resultNfeEmitente) { 
			tabController.animateTo(1); 
			return false; 
		}
    final resultNfeDestinatario = Get.find<NfeDestinatarioController>().validateForm(); 
		if (!resultNfeDestinatario) { 
			tabController.animateTo(2); 
			return false; 
		}
    final resultNfeLocalRetirada = Get.find<NfeLocalRetiradaController>().validateForm(); 
		if (!resultNfeLocalRetirada) { 
			tabController.animateTo(3); 
			return false; 
		}
    final resultNfeLocalEntrega = Get.find<NfeLocalEntregaController>().validateForm(); 
		if (!resultNfeLocalEntrega) { 
			tabController.animateTo(4); 
			return false; 
		}
    final resultNfeTransporte = Get.find<NfeTransporteController>().validateForms(); 
		if (!resultNfeTransporte) { 
			tabController.animateTo(5); 
			return false; 
		}
    final resultNfeFatura = Get.find<NfeFaturaController>().validateForms(); 
		if (!resultNfeFatura) { 
			tabController.animateTo(6); 
			return false; 
		}
    final resultNfeCana = Get.find<NfeCanaController>().validateForms(); 
		if (!resultNfeCana) { 
			tabController.animateTo(7); 
			return false; 
		}
    final resultNfeResponsavelTecnico = Get.find<NfeResponsavelTecnicoController>().validateForm(); 
		if (!resultNfeResponsavelTecnico) { 
			tabController.animateTo(8); 
			return false; 
		}
    final resultNfeCompraGovernamental = Get.find<NfeCompraGovernamentalController>().validateForm(); 
		if (!resultNfeCompraGovernamental) { 
			tabController.animateTo(9); 
			return false; 
		}
    return true;
  }

  void callNfeDetalhePage() {
		Get.dialog(
      const AlertDialog(
        content: NfeDetalheListPage(
        ),
      ),
    );
  }

  Future<void> importXml() async {
    showQuestionDialog('Deseja importar o arquivo da nota fiscal (Formato XML)?', () async {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['xml'],
        );

        if (result != null) {
          String arquivoSelecionado;

          if (kIsWeb) {
            Uint8List fileBytes = result.files.single.bytes!;
            arquivoSelecionado = utf8.decode(fileBytes);
          } else {
            File file = File(result.files.single.path!);
            arquivoSelecionado = await file.readAsString();
          }

          currentModel = NfeUtil.parseNfe(arquivoSelecionado);
          updateControllersFromModel();
          showInfoSnackBar(message: "NF-e importada com sucesso!");
        } else {
          showInfoSnackBar(message: "Nenhum arquivo selecionado.");
        }
      } catch (e) {
        showErrorSnackBar(message: "Erro ao gerar NF-e: ${e.toString()}");
      }
    });
  }

  Future<void> gerarETransmitirNota() async {
    if (currentModel.id == null) {
      showErrorSnackBar(message: 'Primeiro salve a nota para então transmiti-la.');
      return;
    }
    if (currentModel.statusNota == '4-Autorizada') {
      showInfoSnackBar(message: 'Nota já transmitida. Utilize a opção para impressão do DANFE.');
      return;
    }

    showQuestionDialog('Deseja Gerar e Transmitir a NF-e?', () async {
      try {
        final result = await repository.transmitirNfe(nfeCabecalhoModel: currentModel);
        if (result == null) return;

        if (result is String) {
          showErrorDialog('Ocorreu um problema na geração da NF-e: \n$result');
        } else if (result is Uint8List) {
          _imprimirDanfe(result);
        }
      } catch (e) {
        showErrorSnackBar(message: "Erro ao importar NF-e: ${e.toString()}");
      }
    });
  }

  Future<void> imprimirDanfe() async {
    if (currentModel.id == null) {
      showErrorSnackBar(message: 'Primeiro salve a nota para então transmiti-la.');
      return;
    }
    if (currentModel.chaveAcesso == null) {
      showInfoSnackBar(message: 'Nota sem chave de acesso.');
      return;
    }

    showQuestionDialog('Deseja Imprimir o DANFE?', () async {
      try {
        final result = await repository.gerarPdfDanfe(chaveAcesso: currentModel.chaveAcesso!);
        if (result == null) return;

        if (result is String) {
          showErrorDialog('Ocorreu um problema na impressão do DANFE: \n$result');
        } else if (result is Uint8List) {
          _imprimirDanfe(result);
        }
      } catch (e) {
        showErrorSnackBar(message: "Erro ao imprimir DANFE: ${e.toString()}");
      }
    });
  }

  void _imprimirDanfe(Uint8List danfe) {
    Get.to(() => PdfPage(
      title: "DANFE",
      pdfFile: danfe,
    ));
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabItems.length);
    _configureChildrenControllers();
  }

  @override
  void onClose() {
    tabController.dispose();
    codigoNumericoController.dispose();
    ufEmitenteController.dispose();
    codigoModeloController.dispose();
    tipoOperacaoController.dispose();
    localDestinoController.dispose();
    formatoImpressaoDanfeController.dispose();
    tipoEmissaoController.dispose();
    ambienteController.dispose();
    finalidadeEmissaoController.dispose();
    tipoNotaDebitoController.dispose();
    tipoNotaCreditoController.dispose();
    consumidorOperacaoController.dispose();
    consumidorPresencaController.dispose();
    indicadorIntermediarioController.dispose();
    processoEmissaoController.dispose();
    regimeEspecialTributacaoController.dispose();
    comexUfEmbarqueController.dispose();
    statusNotaController.dispose();
    dataHoraEmissaoController.dispose();
    dataHoraEntradaSaidaController.dispose();
    dataEntradaContingenciaController.dispose();
    dataPrestacaoServicoController.dispose();
    naturezaOperacaoController.dispose();
    serieController.dispose();
    numeroController.dispose();
    codigoMunicipioController.dispose();
    codigoMunicipioFgIbsController.dispose();
    chaveAcessoController.dispose();
    digitoChaveAcessoController.dispose();
    versaoProcessoEmissaoController.dispose();
    justificativaContingenciaController.dispose();
    baseCalculoIcmsController.dispose();
    valorIcmsController.dispose();
    valorIcmsDesoneradoController.dispose();
    totalIcmsFcpUfDestinoController.dispose();
    totalIcmsInterestadualUfDestinoController.dispose();
    totalIcmsInterestadualUfRemetenteController.dispose();
    valorTotalFcpController.dispose();
    baseCalculoIcmsStController.dispose();
    valorIcmsStController.dispose();
    valorTotalFcpStController.dispose();
    valorTotalFcpStRetidoController.dispose();
    totalQtdeTributadaMonoController.dispose();
    totalIcmsMonoController.dispose();
    totalQuantidadeMonoRetencaoController.dispose();
    totalIcmsMonoRetencaoController.dispose();
    totalQuantidadeMonoRetidaController.dispose();
    totalIcmsMonoRetidoController.dispose();
    valorTotalProdutosController.dispose();
    valorFreteController.dispose();
    valorSeguroController.dispose();
    valorDescontoController.dispose();
    valorImpostoImportacaoController.dispose();
    valorIpiController.dispose();
    valorIpiDevolvidoController.dispose();
    valorPisController.dispose();
    valorCofinsController.dispose();
    valorDespesasAcessoriasController.dispose();
    valorTotalController.dispose();
    valorTotalTributosController.dispose();
    valorServicosController.dispose();
    baseCalculoIssqnController.dispose();
    valorIssqnController.dispose();
    valorPisIssqnController.dispose();
    valorCofinsIssqnController.dispose();
    valorDeducaoIssqnController.dispose();
    outrasRetencoesIssqnController.dispose();
    descontoIncondicionadoIssqnController.dispose();
    descontoCondicionadoIssqnController.dispose();
    totalRetencaoIssqnController.dispose();
    valorRetidoPisController.dispose();
    valorRetidoCofinsController.dispose();
    valorRetidoCsllController.dispose();
    baseCalculoIrrfController.dispose();
    valorRetidoIrrfController.dispose();
    baseCalculoPrevidenciaController.dispose();
    valorRetidoPrevidenciaController.dispose();
    informacoesAddFiscoController.dispose();
    informacoesAddContribuinteController.dispose();
    comexLocalEmbarqueController.dispose();
    comexLocalDespachoController.dispose();
    compraNotaEmpenhoController.dispose();
    compraPedidoController.dispose();
    compraContratoController.dispose();
    qrcodeController.dispose();
    urlChaveController.dispose();
    intermediadorCnpjController.dispose();
    intermediadorIdCadastroController.dispose();
    totalImpostoSeletivoController.dispose();
    totalBcIbsCbsController.dispose();
    ibsUfTotalDiferimentoController.dispose();
    ibsUfTotalDevTributosController.dispose();
    ibsUfValorTotalController.dispose();
    ibsMunTotalDiferimentoController.dispose();
    ibsMunTotalDevTributosController.dispose();
    ibsMunValorTotalController.dispose();
    ibsValorTotalController.dispose();
    totalCreditoPresumidoController.dispose();
    totalCredPresSuspensivoController.dispose();
    cbsTotalDiferimentoController.dispose();
    cbsTotalDevTributosController.dispose();
    cbsValorTotalController.dispose();
    cbsTotalCreditoPresumidoController.dispose();
    cbsTotCrePreSuspensivoController.dispose();
    monoIbsTotalController.dispose();
    monoCbsTotalController.dispose();
    monoIbsTotalRetencaoController.dispose();
    monoCbsTotalRetencaoController.dispose();
    monoIbsRetidoController.dispose();
    monoCbsRetidoController.dispose();
    valorTotalNfeController.dispose();
    vendaCabecalhoModelController.dispose();
    tributOperacaoFiscalModelController.dispose();
    viewPessoaClienteModelController.dispose();
    viewPessoaColaboradorModelController.dispose();
    viewPessoaFornecedorModelController.dispose();

    _releaseChildrenControllers();

    super.onClose();
  }
}