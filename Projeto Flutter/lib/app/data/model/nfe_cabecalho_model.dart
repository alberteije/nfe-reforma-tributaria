import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeCabecalhoModel extends ModelBase {
  int? id;
  int? idVendaCabecalho;
  int? idTributOperacaoFiscal;
  int? idCliente;
  int? idColaborador;
  int? idFornecedor;
  String? ufEmitente;
  String? codigoNumerico;
  String? naturezaOperacao;
  String? codigoModelo;
  String? serie;
  String? numero;
  DateTime? dataHoraEmissao;
  DateTime? dataHoraEntradaSaida;
  String? tipoOperacao;
  String? localDestino;
  int? codigoMunicipio;
  int? codigoMunicipioFgIbs;
  String? formatoImpressaoDanfe;
  String? tipoEmissao;
  String? chaveAcesso;
  String? digitoChaveAcesso;
  String? ambiente;
  String? finalidadeEmissao;
  String? tipoNotaDebito;
  String? tipoNotaCredito;
  String? consumidorOperacao;
  String? consumidorPresenca;
  String? indicadorIntermediario;
  String? processoEmissao;
  String? versaoProcessoEmissao;
  DateTime? dataEntradaContingencia;
  String? justificativaContingencia;
  double? baseCalculoIcms;
  double? valorIcms;
  double? valorIcmsDesonerado;
  double? totalIcmsFcpUfDestino;
  double? totalIcmsInterestadualUfDestino;
  double? totalIcmsInterestadualUfRemetente;
  double? valorTotalFcp;
  double? baseCalculoIcmsSt;
  double? valorIcmsSt;
  double? valorTotalFcpSt;
  double? valorTotalFcpStRetido;
  double? totalQtdeTributadaMono;
  double? totalIcmsMono;
  double? totalQuantidadeMonoRetencao;
  double? totalIcmsMonoRetencao;
  double? totalQuantidadeMonoRetida;
  double? totalIcmsMonoRetido;
  double? valorTotalProdutos;
  double? valorFrete;
  double? valorSeguro;
  double? valorDesconto;
  double? valorImpostoImportacao;
  double? valorIpi;
  double? valorIpiDevolvido;
  double? valorPis;
  double? valorCofins;
  double? valorDespesasAcessorias;
  double? valorTotal;
  double? valorTotalTributos;
  double? valorServicos;
  double? baseCalculoIssqn;
  double? valorIssqn;
  double? valorPisIssqn;
  double? valorCofinsIssqn;
  DateTime? dataPrestacaoServico;
  double? valorDeducaoIssqn;
  double? outrasRetencoesIssqn;
  double? descontoIncondicionadoIssqn;
  double? descontoCondicionadoIssqn;
  double? totalRetencaoIssqn;
  String? regimeEspecialTributacao;
  double? valorRetidoPis;
  double? valorRetidoCofins;
  double? valorRetidoCsll;
  double? baseCalculoIrrf;
  double? valorRetidoIrrf;
  double? baseCalculoPrevidencia;
  double? valorRetidoPrevidencia;
  String? informacoesAddFisco;
  String? informacoesAddContribuinte;
  String? comexUfEmbarque;
  String? comexLocalEmbarque;
  String? comexLocalDespacho;
  String? compraNotaEmpenho;
  String? compraPedido;
  String? compraContrato;
  String? qrcode;
  String? urlChave;
  String? statusNota;
  String? intermediadorCnpj;
  String? intermediadorIdCadastro;
	double? totalImpostoSeletivo;
  double? totalBcIbsCbs;
  double? ibsUfTotalDiferimento;
  double? ibsUfTotalDevTributos;
  double? ibsUfValorTotal;
  double? ibsMunTotalDiferimento;
  double? ibsMunTotalDevTributos;
  double? ibsMunValorTotal;
  double? ibsValorTotal;
  double? totalCreditoPresumido;
  double? totalCredPresSuspensivo;
  double? cbsTotalDiferimento;
  double? cbsTotalDevTributos;
  double? cbsValorTotal;
  double? cbsTotalCreditoPresumido;
  double? cbsTotCrePreSuspensivo;
  double? monoIbsTotal;
  double? monoCbsTotal;
  double? monoIbsTotalRetencao;
  double? monoCbsTotalRetencao;
  double? monoIbsRetido;
  double? monoCbsRetido;
  double? valorTotalNfe;

  VendaCabecalhoModel? vendaCabecalhoModel;
  ViewPessoaClienteModel? viewPessoaClienteModel;
  ViewPessoaColaboradorModel? viewPessoaColaboradorModel;
  ViewPessoaFornecedorModel? viewPessoaFornecedorModel;
  TributOperacaoFiscalModel? tributOperacaoFiscalModel;
  NfeEmitenteModel? nfeEmitenteModel;
  NfeDestinatarioModel? nfeDestinatarioModel;
  NfeLocalRetiradaModel? nfeLocalRetiradaModel;
  NfeLocalEntregaModel? nfeLocalEntregaModel;
  NfeTransporteModel? nfeTransporteModel;
  NfeFaturaModel? nfeFaturaModel;
  NfeCanaModel? nfeCanaModel;
  NfeResponsavelTecnicoModel? nfeResponsavelTecnicoModel;
  NfeCompraGovernamentalModel? nfeCompraGovernamentalModel;

  List<NfeReferenciadaModel>? nfeReferenciadaModelList;
  List<NfeProdRuralReferenciadaModel>? nfeProdRuralReferenciadaModelList;
  List<NfeNfReferenciadaModel>? nfeNfReferenciadaModelList;
  List<NfeProcessoReferenciadoModel>? nfeProcessoReferenciadoModelList;
  List<NfeAcessoXmlModel>? nfeAcessoXmlModelList;
  List<NfeInformacaoPagamentoModel>? nfeInformacaoPagamentoModelList;
  List<NfeCupomFiscalReferenciadoModel>? nfeCupomFiscalReferenciadoModelList;
  List<NfeCteReferenciadoModel>? nfeCteReferenciadoModelList;
  List<NfeDetalheModel>? nfeDetalheModelList;
  List<NfeAntecipacaoPagamentoModel>? nfeAntecipacaoPagamentoModelList;
  List<NfeInformacaoAgropecuarioModel>? nfeInformacaoAgropecuarioModelList;

  NfeCabecalhoModel({
    this.id,
    this.idVendaCabecalho,
    this.idTributOperacaoFiscal,
    this.idCliente,
    this.idColaborador,
    this.idFornecedor,
    this.ufEmitente = 'AC',
    this.codigoNumerico,
    this.naturezaOperacao,
    this.codigoModelo = '55',
    this.serie,
    this.numero,
    this.dataHoraEmissao,
    this.dataHoraEntradaSaida,
    this.tipoOperacao = '0=Entrada',
    this.localDestino = '1=Operação interna',
    this.codigoMunicipio,
    this.codigoMunicipioFgIbs,
    this.formatoImpressaoDanfe = '0=Sem geração de DANFE',
    this.tipoEmissao = '1=Emissão normal',
    this.chaveAcesso,
    this.digitoChaveAcesso,
    this.ambiente = '1=Produção',
    this.finalidadeEmissao = '1=NF-e normal',
    this.tipoNotaDebito = '01=Transferência de créditos para Cooperativas',
    this.tipoNotaCredito = '01=Multa e juros',
    this.consumidorOperacao = '0=Normal',
    this.consumidorPresenca = '0=Não se aplica',
    this.indicadorIntermediario = '0=Operação sem intermediador (em site ou plataforma própria)',
    this.processoEmissao = '0=Emissão de NF-e com aplicativo do contribuinte',
    this.versaoProcessoEmissao,
    this.dataEntradaContingencia,
    this.justificativaContingencia,
    this.baseCalculoIcms,
    this.valorIcms,
    this.valorIcmsDesonerado,
    this.totalIcmsFcpUfDestino,
    this.totalIcmsInterestadualUfDestino,
    this.totalIcmsInterestadualUfRemetente,
    this.valorTotalFcp,
    this.baseCalculoIcmsSt,
    this.valorIcmsSt,
    this.valorTotalFcpSt,
    this.valorTotalFcpStRetido,
    this.totalQtdeTributadaMono,
    this.totalIcmsMono,
    this.totalQuantidadeMonoRetencao,
    this.totalIcmsMonoRetencao,
    this.totalQuantidadeMonoRetida,
    this.totalIcmsMonoRetido,
    this.valorTotalProdutos,
    this.valorFrete,
    this.valorSeguro,
    this.valorDesconto,
    this.valorImpostoImportacao,
    this.valorIpi,
    this.valorIpiDevolvido,
    this.valorPis,
    this.valorCofins,
    this.valorDespesasAcessorias,
    this.valorTotal,
    this.valorTotalTributos,
    this.valorServicos,
    this.baseCalculoIssqn,
    this.valorIssqn,
    this.valorPisIssqn,
    this.valorCofinsIssqn,
    this.dataPrestacaoServico,
    this.valorDeducaoIssqn,
    this.outrasRetencoesIssqn,
    this.descontoIncondicionadoIssqn,
    this.descontoCondicionadoIssqn,
    this.totalRetencaoIssqn,
    this.regimeEspecialTributacao = '0=Emissão de NF-e com aplicativo do contribuinte',
    this.valorRetidoPis,
    this.valorRetidoCofins,
    this.valorRetidoCsll,
    this.baseCalculoIrrf,
    this.valorRetidoIrrf,
    this.baseCalculoPrevidencia,
    this.valorRetidoPrevidencia,
    this.informacoesAddFisco,
    this.informacoesAddContribuinte,
    this.comexUfEmbarque = 'AC',
    this.comexLocalEmbarque,
    this.comexLocalDespacho,
    this.compraNotaEmpenho,
    this.compraPedido,
    this.compraContrato,
    this.qrcode,
    this.urlChave,
    this.statusNota = '1-Salva',
    this.intermediadorCnpj,
    this.intermediadorIdCadastro,
    this.totalImpostoSeletivo,
    this.totalBcIbsCbs,
    this.ibsUfTotalDiferimento,
    this.ibsUfTotalDevTributos,
    this.ibsUfValorTotal,
    this.ibsMunTotalDiferimento,
    this.ibsMunTotalDevTributos,
    this.ibsMunValorTotal,
    this.ibsValorTotal,
    this.totalCreditoPresumido,
    this.totalCredPresSuspensivo,
    this.cbsTotalDiferimento,
    this.cbsTotalDevTributos,
    this.cbsValorTotal,
    this.cbsTotalCreditoPresumido,
    this.cbsTotCrePreSuspensivo,
    this.monoIbsTotal,
    this.monoCbsTotal,
    this.monoIbsTotalRetencao,
    this.monoCbsTotalRetencao,
    this.monoIbsRetido,
    this.monoCbsRetido,
    this.valorTotalNfe,

    TributOperacaoFiscalModel? tributOperacaoFiscalModel,
    VendaCabecalhoModel? vendaCabecalhoModel,
    ViewPessoaClienteModel? viewPessoaClienteModel,
    ViewPessoaColaboradorModel? viewPessoaColaboradorModel,
    ViewPessoaFornecedorModel? viewPessoaFornecedorModel,
    NfeEmitenteModel? nfeEmitenteModel,
    NfeDestinatarioModel? nfeDestinatarioModel,
    NfeLocalRetiradaModel? nfeLocalRetiradaModel,
    NfeLocalEntregaModel? nfeLocalEntregaModel,
    NfeTransporteModel? nfeTransporteModel,
    NfeFaturaModel? nfeFaturaModel,
    NfeCanaModel? nfeCanaModel,
    NfeResponsavelTecnicoModel? nfeResponsavelTecnicoModel,
    NfeCompraGovernamentalModel? nfeCompraGovernamentalModel,
    List<NfeReferenciadaModel>? nfeReferenciadaModelList,
    List<NfeProdRuralReferenciadaModel>? nfeProdRuralReferenciadaModelList,
    List<NfeNfReferenciadaModel>? nfeNfReferenciadaModelList,
    List<NfeProcessoReferenciadoModel>? nfeProcessoReferenciadoModelList,
    List<NfeAcessoXmlModel>? nfeAcessoXmlModelList,
    List<NfeInformacaoPagamentoModel>? nfeInformacaoPagamentoModelList,
    List<NfeCupomFiscalReferenciadoModel>? nfeCupomFiscalReferenciadoModelList,
    List<NfeCteReferenciadoModel>? nfeCteReferenciadoModelList,
    List<NfeDetalheModel>? nfeDetalheModelList,
    List<NfeAntecipacaoPagamentoModel>? nfeAntecipacaoPagamentoModelList,
    List<NfeInformacaoAgropecuarioModel>? nfeInformacaoAgropecuarioModelList,
  }) {
    this.nfeEmitenteModel = nfeEmitenteModel ?? NfeEmitenteModel();
    this.nfeDestinatarioModel = nfeDestinatarioModel ?? NfeDestinatarioModel();
    this.nfeLocalRetiradaModel = nfeLocalRetiradaModel ?? NfeLocalRetiradaModel();
    this.nfeLocalEntregaModel = nfeLocalEntregaModel ?? NfeLocalEntregaModel();
    this.nfeTransporteModel = nfeTransporteModel ?? NfeTransporteModel();
    this.nfeFaturaModel = nfeFaturaModel ?? NfeFaturaModel();
    this.nfeCanaModel = nfeCanaModel ?? NfeCanaModel();
    this.nfeResponsavelTecnicoModel = nfeResponsavelTecnicoModel ?? NfeResponsavelTecnicoModel();
    this.nfeCompraGovernamentalModel = nfeCompraGovernamentalModel ?? NfeCompraGovernamentalModel();
    this.nfeReferenciadaModelList = nfeReferenciadaModelList?.toList(growable: true) ?? [];
    this.nfeProdRuralReferenciadaModelList = nfeProdRuralReferenciadaModelList?.toList(growable: true) ?? [];
    this.nfeNfReferenciadaModelList = nfeNfReferenciadaModelList?.toList(growable: true) ?? [];
    this.nfeProcessoReferenciadoModelList = nfeProcessoReferenciadoModelList?.toList(growable: true) ?? [];
    this.nfeAcessoXmlModelList = nfeAcessoXmlModelList?.toList(growable: true) ?? [];
    this.nfeInformacaoPagamentoModelList = nfeInformacaoPagamentoModelList?.toList(growable: true) ?? [];
    this.tributOperacaoFiscalModel = tributOperacaoFiscalModel ?? TributOperacaoFiscalModel();
    this.vendaCabecalhoModel = vendaCabecalhoModel ?? VendaCabecalhoModel();
    this.viewPessoaClienteModel = viewPessoaClienteModel ?? ViewPessoaClienteModel();
    this.viewPessoaColaboradorModel = viewPessoaColaboradorModel ?? ViewPessoaColaboradorModel();
    this.viewPessoaFornecedorModel = viewPessoaFornecedorModel ?? ViewPessoaFornecedorModel();
    this.nfeCupomFiscalReferenciadoModelList = nfeCupomFiscalReferenciadoModelList?.toList(growable: true) ?? [];
    this.nfeCteReferenciadoModelList = nfeCteReferenciadoModelList?.toList(growable: true) ?? [];
    this.nfeDetalheModelList = nfeDetalheModelList?.toList(growable: true) ?? [];
    this.nfeAntecipacaoPagamentoModelList = nfeAntecipacaoPagamentoModelList?.toList(growable: true) ?? [];
    this.nfeInformacaoAgropecuarioModelList = nfeInformacaoAgropecuarioModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'uf_emitente',
    'codigo_numerico',
    'natureza_operacao',
    'codigo_modelo',
    'serie',
    'numero',
    'data_hora_emissao',
    'data_hora_entrada_saida',
    'tipo_operacao',
    'local_destino',
    'codigo_municipio',
    'formato_impressao_danfe',
    'tipo_emissao',
    'chave_acesso',
    'digito_chave_acesso',
    'ambiente',
    'finalidade_emissao',
    'consumidor_operacao',
    'consumidor_presenca',
    'indicador_intermediario',
    'processo_emissao',
    'versao_processo_emissao',
    'data_entrada_contingencia',
    'justificativa_contingencia',
    'base_calculo_icms',
    'valor_icms',
    'valor_icms_desonerado',
    'total_icms_fcp_uf_destino',
    'total_icms_interestadual_uf_destino',
    'total_icms_interestadual_uf_remetente',
    'valor_total_fcp',
    'base_calculo_icms_st',
    'valor_icms_st',
    'valor_total_fcp_st',
    'valor_total_fcp_st_retido',
    'valor_total_produtos',
    'valor_frete',
    'valor_seguro',
    'valor_desconto',
    'valor_imposto_importacao',
    'valor_ipi',
    'valor_ipi_devolvido',
    'valor_pis',
    'valor_cofins',
    'valor_despesas_acessorias',
    'valor_total',
    'valor_total_tributos',
    'valor_servicos',
    'base_calculo_issqn',
    'valor_issqn',
    'valor_pis_issqn',
    'valor_cofins_issqn',
    'data_prestacao_servico',
    'valor_deducao_issqn',
    'outras_retencoes_issqn',
    'desconto_incondicionado_issqn',
    'desconto_condicionado_issqn',
    'total_retencao_issqn',
    'regime_especial_nfe',
    'valor_retido_pis',
    'valor_retido_cofins',
    'valor_retido_csll',
    'base_calculo_irrf',
    'valor_retido_irrf',
    'base_calculo_previdencia',
    'valor_retido_previdencia',
    'informacoes_add_fisco',
    'informacoes_add_contribuinte',
    'comex_uf_embarque',
    'comex_local_embarque',
    'comex_local_despacho',
    'compra_nota_empenho',
    'compra_pedido',
    'compra_contrato',
    'qrcode',
    'url_chave',
    'status_nota',
    'intermediador_cnpj',
    'intermediador_id_cadastro',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Uf Emitente',
    'Codigo Numerico',
    'Natureza Operacao',
    'Codigo Modelo',
    'Serie',
    'Numero',
    'Data Hora Emissao',
    'Data Hora Entrada Saida',
    'Tipo Operacao',
    'Local Destino',
    'Codigo Municipio',
    'Formato Impressao Danfe',
    'Tipo Emissao',
    'Chave Acesso',
    'Digito Chave Acesso',
    'Ambiente',
    'Finalidade Emissao',
    'Consumidor Operacao',
    'Consumidor Presenca',
    'Indicador Intermediario',
    'Processo Emissao',
    'Versao Processo Emissao',
    'Data Entrada Contingencia',
    'Justificativa Contingencia',
    'Base Calculo Icms',
    'Valor Icms',
    'Valor Icms Desonerado',
    'Total Icms Fcp Uf Destino',
    'Total Icms Interestadual Uf Destino',
    'Total Icms Interestadual Uf Remetente',
    'Valor Total Fcp',
    'Base Calculo Icms St',
    'Valor Icms St',
    'Valor Total Fcp St',
    'Valor Total Fcp St Retido',
    'Valor Total Produtos',
    'Valor Frete',
    'Valor Seguro',
    'Valor Desconto',
    'Valor Imposto Importacao',
    'Valor Ipi',
    'Valor Ipi Devolvido',
    'Valor Pis',
    'Valor Cofins',
    'Valor Despesas Acessorias',
    'Valor Total',
    'Valor Total Tributos',
    'Valor Servicos',
    'Base Calculo Issqn',
    'Valor Issqn',
    'Valor Pis Issqn',
    'Valor Cofins Issqn',
    'Data Prestacao Servico',
    'Valor Deducao Issqn',
    'Outras Retencoes Issqn',
    'Desconto Incondicionado Issqn',
    'Desconto Condicionado Issqn',
    'Total Retencao Issqn',
    'Regime Especial Tributacao',
    'Valor Retido Pis',
    'Valor Retido Cofins',
    'Valor Retido Csll',
    'Base Calculo Irrf',
    'Valor Retido Irrf',
    'Base Calculo Previdencia',
    'Valor Retido Previdencia',
    'Informacoes Add Fisco',
    'Informacoes Add Contribuinte',
    'Comex Uf Embarque',
    'Comex Local Embarque',
    'Comex Local Despacho',
    'Compra Nota Empenho',
    'Compra Pedido',
    'Compra Contrato',
    'Qrcode',
    'Url Chave',
    'Status Nota',
    'Intermediador Cnpj',
    'Intermediador Id Cadastro',
  ];

  NfeCabecalhoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idVendaCabecalho = jsonData['idVendaCabecalho'];
    idTributOperacaoFiscal = jsonData['idTributOperacaoFiscal'];
    idCliente = jsonData['idCliente'];
    idColaborador = jsonData['idColaborador'];
    idFornecedor = jsonData['idFornecedor'];
    ufEmitente = NfeCabecalhoDomain.getUfEmitente(jsonData['ufEmitente']);
    codigoNumerico = jsonData['codigoNumerico'];
    naturezaOperacao = jsonData['naturezaOperacao'];
    codigoModelo = NfeCabecalhoDomain.getCodigoModelo(jsonData['codigoModelo']);
    serie = jsonData['serie'];
    numero = jsonData['numero'];
    dataHoraEmissao = jsonData['dataHoraEmissao'] != null ? DateTime.tryParse(jsonData['dataHoraEmissao']) : null;
    dataHoraEntradaSaida = jsonData['dataHoraEntradaSaida'] != null ? DateTime.tryParse(jsonData['dataHoraEntradaSaida']) : null;
    tipoOperacao = NfeCabecalhoDomain.getTipoOperacao(jsonData['tipoOperacao']);
    localDestino = NfeCabecalhoDomain.getLocalDestino(jsonData['localDestino']);
    codigoMunicipio = jsonData['codigoMunicipio'];
    codigoMunicipioFgIbs = jsonData['codigoMunicipioFgIbs'];
    formatoImpressaoDanfe = NfeCabecalhoDomain.getFormatoImpressaoDanfe(jsonData['formatoImpressaoDanfe']);
    tipoEmissao = NfeCabecalhoDomain.getTipoEmissao(jsonData['tipoEmissao']);
    chaveAcesso = jsonData['chaveAcesso'];
    digitoChaveAcesso = jsonData['digitoChaveAcesso'];
    ambiente = NfeCabecalhoDomain.getAmbiente(jsonData['ambiente']);
    finalidadeEmissao = NfeCabecalhoDomain.getFinalidadeEmissao(jsonData['finalidadeEmissao']);
    tipoNotaDebito = NfeCabecalhoDomain.getTipoNotaDebito(jsonData['tipoNotaDebito']);
    tipoNotaCredito = NfeCabecalhoDomain.getTipoNotaCredito(jsonData['tipoNotaCredito']);
    consumidorOperacao = NfeCabecalhoDomain.getConsumidorOperacao(jsonData['consumidorOperacao']);
    consumidorPresenca = NfeCabecalhoDomain.getConsumidorPresenca(jsonData['consumidorPresenca']);
    indicadorIntermediario = NfeCabecalhoDomain.getIndicadorIntermediario(jsonData['indicadorIntermediario']);
    processoEmissao = NfeCabecalhoDomain.getProcessoEmissao(jsonData['processoEmissao']);
    versaoProcessoEmissao = jsonData['versaoProcessoEmissao'];
    dataEntradaContingencia = jsonData['dataEntradaContingencia'] != null ? DateTime.tryParse(jsonData['dataEntradaContingencia']) : null;
    justificativaContingencia = jsonData['justificativaContingencia'];
    baseCalculoIcms = jsonData['baseCalculoIcms']?.toDouble();
    valorIcms = jsonData['valorIcms']?.toDouble();
    valorIcmsDesonerado = jsonData['valorIcmsDesonerado']?.toDouble();
    totalIcmsFcpUfDestino = jsonData['totalIcmsFcpUfDestino']?.toDouble();
    totalIcmsInterestadualUfDestino = jsonData['totalIcmsInterestadualUfDestino']?.toDouble();
    totalIcmsInterestadualUfRemetente = jsonData['totalIcmsInterestadualUfRemetente']?.toDouble();
    valorTotalFcp = jsonData['valorTotalFcp']?.toDouble();
    baseCalculoIcmsSt = jsonData['baseCalculoIcmsSt']?.toDouble();
    valorIcmsSt = jsonData['valorIcmsSt']?.toDouble();
    valorTotalFcpSt = jsonData['valorTotalFcpSt']?.toDouble();
    valorTotalFcpStRetido = jsonData['valorTotalFcpStRetido']?.toDouble();
    totalQtdeTributadaMono = jsonData['totalQtdeTributadaMono']?.toDouble();
    totalIcmsMono = jsonData['totalIcmsMono']?.toDouble();
    totalQuantidadeMonoRetencao = jsonData['totalQuantidadeMonoRetencao']?.toDouble();
    totalIcmsMonoRetencao = jsonData['totalIcmsMonoRetencao']?.toDouble();
    totalQuantidadeMonoRetida = jsonData['totalQuantidadeMonoRetida']?.toDouble();
    totalIcmsMonoRetido = jsonData['totalIcmsMonoRetido']?.toDouble();
    valorTotalProdutos = jsonData['valorTotalProdutos']?.toDouble();
    valorFrete = jsonData['valorFrete']?.toDouble();
    valorSeguro = jsonData['valorSeguro']?.toDouble();
    valorDesconto = jsonData['valorDesconto']?.toDouble();
    valorImpostoImportacao = jsonData['valorImpostoImportacao']?.toDouble();
    valorIpi = jsonData['valorIpi']?.toDouble();
    valorIpiDevolvido = jsonData['valorIpiDevolvido']?.toDouble();
    valorPis = jsonData['valorPis']?.toDouble();
    valorCofins = jsonData['valorCofins']?.toDouble();
    valorDespesasAcessorias = jsonData['valorDespesasAcessorias']?.toDouble();
    valorTotal = jsonData['valorTotal']?.toDouble();
    valorTotalTributos = jsonData['valorTotalTributos']?.toDouble();
    valorServicos = jsonData['valorServicos']?.toDouble();
    baseCalculoIssqn = jsonData['baseCalculoIssqn']?.toDouble();
    valorIssqn = jsonData['valorIssqn']?.toDouble();
    valorPisIssqn = jsonData['valorPisIssqn']?.toDouble();
    valorCofinsIssqn = jsonData['valorCofinsIssqn']?.toDouble();
    dataPrestacaoServico = jsonData['dataPrestacaoServico'] != null ? DateTime.tryParse(jsonData['dataPrestacaoServico']) : null;
    valorDeducaoIssqn = jsonData['valorDeducaoIssqn']?.toDouble();
    outrasRetencoesIssqn = jsonData['outrasRetencoesIssqn']?.toDouble();
    descontoIncondicionadoIssqn = jsonData['descontoIncondicionadoIssqn']?.toDouble();
    descontoCondicionadoIssqn = jsonData['descontoCondicionadoIssqn']?.toDouble();
    totalRetencaoIssqn = jsonData['totalRetencaoIssqn']?.toDouble();
    regimeEspecialTributacao = NfeCabecalhoDomain.getRegimeEspecialTributacao(jsonData['regimeEspecialTributacao']);
    valorRetidoPis = jsonData['valorRetidoPis']?.toDouble();
    valorRetidoCofins = jsonData['valorRetidoCofins']?.toDouble();
    valorRetidoCsll = jsonData['valorRetidoCsll']?.toDouble();
    baseCalculoIrrf = jsonData['baseCalculoIrrf']?.toDouble();
    valorRetidoIrrf = jsonData['valorRetidoIrrf']?.toDouble();
    baseCalculoPrevidencia = jsonData['baseCalculoPrevidencia']?.toDouble();
    valorRetidoPrevidencia = jsonData['valorRetidoPrevidencia']?.toDouble();
    informacoesAddFisco = jsonData['informacoesAddFisco'];
    informacoesAddContribuinte = jsonData['informacoesAddContribuinte'];
    comexUfEmbarque = NfeCabecalhoDomain.getComexUfEmbarque(jsonData['comexUfEmbarque']);
    comexLocalEmbarque = jsonData['comexLocalEmbarque'];
    comexLocalDespacho = jsonData['comexLocalDespacho'];
    compraNotaEmpenho = jsonData['compraNotaEmpenho'];
    compraPedido = jsonData['compraPedido'];
    compraContrato = jsonData['compraContrato'];
    qrcode = jsonData['qrcode'];
    urlChave = jsonData['urlChave'];
    statusNota = NfeCabecalhoDomain.getStatusNota(jsonData['statusNota']);
    intermediadorCnpj = jsonData['intermediadorCnpj'];
    intermediadorIdCadastro = jsonData['intermediadorIdCadastro'];
    totalImpostoSeletivo = jsonData['totalImpostoSeletivo']?.toDouble();
    totalBcIbsCbs = jsonData['totalBcIbsCbs']?.toDouble();
    ibsUfTotalDiferimento = jsonData['ibsUfTotalDiferimento']?.toDouble();
    ibsUfTotalDevTributos = jsonData['ibsUfTotalDevTributos']?.toDouble();
    ibsUfValorTotal = jsonData['ibsUfValorTotal']?.toDouble();
    ibsMunTotalDiferimento = jsonData['ibsMunTotalDiferimento']?.toDouble();
    ibsMunTotalDevTributos = jsonData['ibsMunTotalDevTributos']?.toDouble();
    ibsMunValorTotal = jsonData['ibsMunValorTotal']?.toDouble();
    ibsValorTotal = jsonData['ibsValorTotal']?.toDouble();
    totalCreditoPresumido = jsonData['totalCreditoPresumido']?.toDouble();
    totalCredPresSuspensivo = jsonData['totalCredPresSuspensivo']?.toDouble();
    cbsTotalDiferimento = jsonData['cbsTotalDiferimento']?.toDouble();
    cbsTotalDevTributos = jsonData['cbsTotalDevTributos']?.toDouble();
    cbsValorTotal = jsonData['cbsValorTotal']?.toDouble();
    cbsTotalCreditoPresumido = jsonData['cbsTotalCreditoPresumido']?.toDouble();
    cbsTotCrePreSuspensivo = jsonData['cbsTotCrePreSuspensivo']?.toDouble();
    monoIbsTotal = jsonData['monoIbsTotal']?.toDouble();
    monoCbsTotal = jsonData['monoCbsTotal']?.toDouble();
    monoIbsTotalRetencao = jsonData['monoIbsTotalRetencao']?.toDouble();
    monoCbsTotalRetencao = jsonData['monoCbsTotalRetencao']?.toDouble();
    monoIbsRetido = jsonData['monoIbsRetido']?.toDouble();
    monoCbsRetido = jsonData['monoCbsRetido']?.toDouble();
    valorTotalNfe = jsonData['valorTotalNfe']?.toDouble();
    nfeEmitenteModel = jsonData['nfeEmitenteModel'] == null ? NfeEmitenteModel() : NfeEmitenteModel.fromJson(jsonData['nfeEmitenteModel']);
    nfeDestinatarioModel = jsonData['nfeDestinatarioModel'] == null ? NfeDestinatarioModel() : NfeDestinatarioModel.fromJson(jsonData['nfeDestinatarioModel']);
    nfeLocalRetiradaModel = jsonData['nfeLocalRetiradaModel'] == null ? NfeLocalRetiradaModel() : NfeLocalRetiradaModel.fromJson(jsonData['nfeLocalRetiradaModel']);
    nfeLocalEntregaModel = jsonData['nfeLocalEntregaModel'] == null ? NfeLocalEntregaModel() : NfeLocalEntregaModel.fromJson(jsonData['nfeLocalEntregaModel']);
    nfeTransporteModel = jsonData['nfeTransporteModel'] == null ? NfeTransporteModel() : NfeTransporteModel.fromJson(jsonData['nfeTransporteModel']);
    nfeFaturaModel = jsonData['nfeFaturaModel'] == null ? NfeFaturaModel() : NfeFaturaModel.fromJson(jsonData['nfeFaturaModel']);
    nfeCanaModel = jsonData['nfeCanaModel'] == null ? NfeCanaModel() : NfeCanaModel.fromJson(jsonData['nfeCanaModel']);
    nfeResponsavelTecnicoModel = jsonData['nfeResponsavelTecnicoModel'] == null ? NfeResponsavelTecnicoModel() : NfeResponsavelTecnicoModel.fromJson(jsonData['nfeResponsavelTecnicoModel']);
    nfeCompraGovernamentalModel = jsonData['nfeCompraGovernamentalModel'] == null ? NfeCompraGovernamentalModel() : NfeCompraGovernamentalModel.fromJson(jsonData['nfeCompraGovernamentalModel']);
    nfeReferenciadaModelList = (jsonData['nfeReferenciadaModelList'] as Iterable?)?.map((m) => NfeReferenciadaModel.fromJson(m)).toList() ?? [];
    nfeProdRuralReferenciadaModelList = (jsonData['nfeProdRuralReferenciadaModelList'] as Iterable?)?.map((m) => NfeProdRuralReferenciadaModel.fromJson(m)).toList() ?? [];
    nfeNfReferenciadaModelList = (jsonData['nfeNfReferenciadaModelList'] as Iterable?)?.map((m) => NfeNfReferenciadaModel.fromJson(m)).toList() ?? [];
    nfeProcessoReferenciadoModelList = (jsonData['nfeProcessoReferenciadoModelList'] as Iterable?)?.map((m) => NfeProcessoReferenciadoModel.fromJson(m)).toList() ?? [];
    nfeAcessoXmlModelList = (jsonData['nfeAcessoXmlModelList'] as Iterable?)?.map((m) => NfeAcessoXmlModel.fromJson(m)).toList() ?? [];
    nfeInformacaoPagamentoModelList = (jsonData['nfeInformacaoPagamentoModelList'] as Iterable?)?.map((m) => NfeInformacaoPagamentoModel.fromJson(m)).toList() ?? [];
    tributOperacaoFiscalModel = jsonData['tributOperacaoFiscalModel'] == null ? TributOperacaoFiscalModel() : TributOperacaoFiscalModel.fromJson(jsonData['tributOperacaoFiscalModel']);
    vendaCabecalhoModel = jsonData['vendaCabecalhoModel'] == null ? VendaCabecalhoModel() : VendaCabecalhoModel.fromJson(jsonData['vendaCabecalhoModel']);
    viewPessoaClienteModel = jsonData['viewPessoaClienteModel'] == null ? ViewPessoaClienteModel() : ViewPessoaClienteModel.fromJson(jsonData['viewPessoaClienteModel']);
    viewPessoaColaboradorModel = jsonData['viewPessoaColaboradorModel'] == null ? ViewPessoaColaboradorModel() : ViewPessoaColaboradorModel.fromJson(jsonData['viewPessoaColaboradorModel']);
    viewPessoaFornecedorModel = jsonData['viewPessoaFornecedorModel'] == null ? ViewPessoaFornecedorModel() : ViewPessoaFornecedorModel.fromJson(jsonData['viewPessoaFornecedorModel']);
    nfeCupomFiscalReferenciadoModelList = (jsonData['nfeCupomFiscalReferenciadoModelList'] as Iterable?)?.map((m) => NfeCupomFiscalReferenciadoModel.fromJson(m)).toList() ?? [];
    nfeCteReferenciadoModelList = (jsonData['nfeCteReferenciadoModelList'] as Iterable?)?.map((m) => NfeCteReferenciadoModel.fromJson(m)).toList() ?? [];
    nfeDetalheModelList = (jsonData['nfeDetalheModelList'] as Iterable?)?.map((m) => NfeDetalheModel.fromJson(m)).toList() ?? [];
    nfeAntecipacaoPagamentoModelList = (jsonData['nfeAntecipacaoPagamentoModelList'] as Iterable?)?.map((m) => NfeAntecipacaoPagamentoModel.fromJson(m)).toList() ?? [];
    nfeInformacaoAgropecuarioModelList = (jsonData['nfeInformacaoAgropecuarioModelList'] as Iterable?)?.map((m) => NfeInformacaoAgropecuarioModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idVendaCabecalho'] = idVendaCabecalho != 0 ? idVendaCabecalho : null;
    jsonData['idTributOperacaoFiscal'] = idTributOperacaoFiscal != 0 ? idTributOperacaoFiscal : null;
    jsonData['idCliente'] = idCliente != 0 ? idCliente : null;
    jsonData['idColaborador'] = idColaborador != 0 ? idColaborador : null;
    jsonData['idFornecedor'] = idFornecedor != 0 ? idFornecedor : null;
    jsonData['ufEmitente'] = NfeCabecalhoDomain.setUfEmitente(ufEmitente);
    jsonData['codigoNumerico'] = codigoNumerico;
    jsonData['naturezaOperacao'] = naturezaOperacao;
    jsonData['codigoModelo'] = NfeCabecalhoDomain.setCodigoModelo(codigoModelo);
    jsonData['serie'] = serie;
    jsonData['numero'] = numero;
    jsonData['dataHoraEmissao'] = dataHoraEmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataHoraEmissao!) : null;
    jsonData['dataHoraEntradaSaida'] = dataHoraEntradaSaida != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataHoraEntradaSaida!) : null;
    jsonData['tipoOperacao'] = NfeCabecalhoDomain.setTipoOperacao(tipoOperacao);
    jsonData['localDestino'] = NfeCabecalhoDomain.setLocalDestino(localDestino);
    jsonData['codigoMunicipio'] = codigoMunicipio;
    jsonData['codigoMunicipioFgIbs'] = codigoMunicipioFgIbs;
    jsonData['formatoImpressaoDanfe'] = NfeCabecalhoDomain.setFormatoImpressaoDanfe(formatoImpressaoDanfe);
    jsonData['tipoEmissao'] = NfeCabecalhoDomain.setTipoEmissao(tipoEmissao);
    jsonData['chaveAcesso'] = chaveAcesso;
    jsonData['digitoChaveAcesso'] = digitoChaveAcesso;
    jsonData['ambiente'] = NfeCabecalhoDomain.setAmbiente(ambiente);
    jsonData['finalidadeEmissao'] = NfeCabecalhoDomain.setFinalidadeEmissao(finalidadeEmissao);
    jsonData['tipoNotaDebito'] = NfeCabecalhoDomain.setTipoNotaDebito(tipoNotaDebito);
    jsonData['tipoNotaCredito'] = NfeCabecalhoDomain.setTipoNotaCredito(tipoNotaCredito);
    jsonData['consumidorOperacao'] = NfeCabecalhoDomain.setConsumidorOperacao(consumidorOperacao);
    jsonData['consumidorPresenca'] = NfeCabecalhoDomain.setConsumidorPresenca(consumidorPresenca);
    jsonData['indicadorIntermediario'] = NfeCabecalhoDomain.setIndicadorIntermediario(indicadorIntermediario);
    jsonData['processoEmissao'] = NfeCabecalhoDomain.setProcessoEmissao(processoEmissao);
    jsonData['versaoProcessoEmissao'] = versaoProcessoEmissao;
    jsonData['dataEntradaContingencia'] = dataEntradaContingencia != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEntradaContingencia!) : null;
    jsonData['justificativaContingencia'] = justificativaContingencia;
    jsonData['baseCalculoIcms'] = baseCalculoIcms;
    jsonData['valorIcms'] = valorIcms;
    jsonData['valorIcmsDesonerado'] = valorIcmsDesonerado;
    jsonData['totalIcmsFcpUfDestino'] = totalIcmsFcpUfDestino;
    jsonData['totalIcmsInterestadualUfDestino'] = totalIcmsInterestadualUfDestino;
    jsonData['totalIcmsInterestadualUfRemetente'] = totalIcmsInterestadualUfRemetente;
    jsonData['valorTotalFcp'] = valorTotalFcp;
    jsonData['baseCalculoIcmsSt'] = baseCalculoIcmsSt;
    jsonData['valorIcmsSt'] = valorIcmsSt;
    jsonData['valorTotalFcpSt'] = valorTotalFcpSt;
    jsonData['valorTotalFcpStRetido'] = valorTotalFcpStRetido;
    jsonData['totalQtdeTributadaMono'] = totalQtdeTributadaMono;
    jsonData['totalIcmsMono'] = totalIcmsMono;
    jsonData['totalQuantidadeMonoRetencao'] = totalQuantidadeMonoRetencao;
    jsonData['totalIcmsMonoRetencao'] = totalIcmsMonoRetencao;
    jsonData['totalQuantidadeMonoRetida'] = totalQuantidadeMonoRetida;
    jsonData['totalIcmsMonoRetido'] = totalIcmsMonoRetido;
    jsonData['valorTotalProdutos'] = valorTotalProdutos;
    jsonData['valorFrete'] = valorFrete;
    jsonData['valorSeguro'] = valorSeguro;
    jsonData['valorDesconto'] = valorDesconto;
    jsonData['valorImpostoImportacao'] = valorImpostoImportacao;
    jsonData['valorIpi'] = valorIpi;
    jsonData['valorIpiDevolvido'] = valorIpiDevolvido;
    jsonData['valorPis'] = valorPis;
    jsonData['valorCofins'] = valorCofins;
    jsonData['valorDespesasAcessorias'] = valorDespesasAcessorias;
    jsonData['valorTotal'] = valorTotal;
    jsonData['valorTotalTributos'] = valorTotalTributos;
    jsonData['valorServicos'] = valorServicos;
    jsonData['baseCalculoIssqn'] = baseCalculoIssqn;
    jsonData['valorIssqn'] = valorIssqn;
    jsonData['valorPisIssqn'] = valorPisIssqn;
    jsonData['valorCofinsIssqn'] = valorCofinsIssqn;
    jsonData['dataPrestacaoServico'] = dataPrestacaoServico != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPrestacaoServico!) : null;
    jsonData['valorDeducaoIssqn'] = valorDeducaoIssqn;
    jsonData['outrasRetencoesIssqn'] = outrasRetencoesIssqn;
    jsonData['descontoIncondicionadoIssqn'] = descontoIncondicionadoIssqn;
    jsonData['descontoCondicionadoIssqn'] = descontoCondicionadoIssqn;
    jsonData['totalRetencaoIssqn'] = totalRetencaoIssqn;
    jsonData['regimeEspecialTributacao'] = NfeCabecalhoDomain.setRegimeEspecialTributacao(regimeEspecialTributacao);
    jsonData['valorRetidoPis'] = valorRetidoPis;
    jsonData['valorRetidoCofins'] = valorRetidoCofins;
    jsonData['valorRetidoCsll'] = valorRetidoCsll;
    jsonData['baseCalculoIrrf'] = baseCalculoIrrf;
    jsonData['valorRetidoIrrf'] = valorRetidoIrrf;
    jsonData['baseCalculoPrevidencia'] = baseCalculoPrevidencia;
    jsonData['valorRetidoPrevidencia'] = valorRetidoPrevidencia;
    jsonData['informacoesAddFisco'] = informacoesAddFisco;
    jsonData['informacoesAddContribuinte'] = informacoesAddContribuinte;
    jsonData['comexUfEmbarque'] = NfeCabecalhoDomain.setComexUfEmbarque(comexUfEmbarque);
    jsonData['comexLocalEmbarque'] = comexLocalEmbarque;
    jsonData['comexLocalDespacho'] = comexLocalDespacho;
    jsonData['compraNotaEmpenho'] = compraNotaEmpenho;
    jsonData['compraPedido'] = compraPedido;
    jsonData['compraContrato'] = compraContrato;
    jsonData['qrcode'] = qrcode;
    jsonData['urlChave'] = urlChave;
    jsonData['statusNota'] = NfeCabecalhoDomain.setStatusNota(statusNota);
    jsonData['intermediadorCnpj'] = intermediadorCnpj;
    jsonData['intermediadorIdCadastro'] = intermediadorIdCadastro;
    jsonData['totalImpostoSeletivo'] = totalImpostoSeletivo;
    jsonData['totalBcIbsCbs'] = totalBcIbsCbs;
    jsonData['ibsUfTotalDiferimento'] = ibsUfTotalDiferimento;
    jsonData['ibsUfTotalDevTributos'] = ibsUfTotalDevTributos;
    jsonData['ibsUfValorTotal'] = ibsUfValorTotal;
    jsonData['ibsMunTotalDiferimento'] = ibsMunTotalDiferimento;
    jsonData['ibsMunTotalDevTributos'] = ibsMunTotalDevTributos;
    jsonData['ibsMunValorTotal'] = ibsMunValorTotal;
    jsonData['ibsValorTotal'] = ibsValorTotal;
    jsonData['totalCreditoPresumido'] = totalCreditoPresumido;
    jsonData['totalCredPresSuspensivo'] = totalCredPresSuspensivo;
    jsonData['cbsTotalDiferimento'] = cbsTotalDiferimento;
    jsonData['cbsTotalDevTributos'] = cbsTotalDevTributos;
    jsonData['cbsValorTotal'] = cbsValorTotal;
    jsonData['cbsTotalCreditoPresumido'] = cbsTotalCreditoPresumido;
    jsonData['cbsTotCrePreSuspensivo'] = cbsTotCrePreSuspensivo;
    jsonData['monoIbsTotal'] = monoIbsTotal;
    jsonData['monoCbsTotal'] = monoCbsTotal;
    jsonData['monoIbsTotalRetencao'] = monoIbsTotalRetencao;
    jsonData['monoCbsTotalRetencao'] = monoCbsTotalRetencao;
    jsonData['monoIbsRetido'] = monoIbsRetido;
    jsonData['monoCbsRetido'] = monoCbsRetido;
    jsonData['valorTotalNfe'] = valorTotalNfe;
    jsonData['nfeEmitenteModel'] = nfeEmitenteModel?.toJson;
    jsonData['nfeDestinatarioModel'] = nfeDestinatarioModel?.toJson;
    jsonData['nfeLocalRetiradaModel'] = nfeLocalRetiradaModel?.toJson;
    jsonData['nfeLocalEntregaModel'] = nfeLocalEntregaModel?.toJson;
    jsonData['nfeTransporteModel'] = nfeTransporteModel?.toJson;
    jsonData['nfeFaturaModel'] = nfeFaturaModel?.toJson;
    jsonData['nfeCanaModel'] = nfeCanaModel?.toJson;
    jsonData['nfeResponsavelTecnicoModel'] = nfeResponsavelTecnicoModel?.toJson;
    jsonData['tributOperacaoFiscalModel'] = tributOperacaoFiscalModel?.toJson;
    jsonData['tributOperacaoFiscal'] = tributOperacaoFiscalModel?.descricao ?? '';
    jsonData['vendaCabecalhoModel'] = vendaCabecalhoModel?.toJson;
    jsonData['vendaCabecalho'] = vendaCabecalhoModel?.id ?? '';
    jsonData['viewPessoaClienteModel'] = viewPessoaClienteModel?.toJson;
    jsonData['viewPessoaCliente'] = viewPessoaClienteModel?.nome ?? '';
    jsonData['viewPessoaColaboradorModel'] = viewPessoaColaboradorModel?.toJson;
    jsonData['viewPessoaColaborador'] = viewPessoaColaboradorModel?.nome ?? '';
    jsonData['viewPessoaFornecedorModel'] = viewPessoaFornecedorModel?.toJson;
    jsonData['viewPessoaFornecedor'] = viewPessoaFornecedorModel?.nome ?? '';
    jsonData['nfeCompraGovernamentalModel'] = nfeCompraGovernamentalModel?.toJson;

		var nfeReferenciadaModelLocalList = []; 
		for (NfeReferenciadaModel object in nfeReferenciadaModelList ?? []) { 
			nfeReferenciadaModelLocalList.add(object.toJson); 
		}
		jsonData['nfeReferenciadaModelList'] = nfeReferenciadaModelLocalList;
    
		var nfeProdRuralReferenciadaModelLocalList = []; 
		for (NfeProdRuralReferenciadaModel object in nfeProdRuralReferenciadaModelList ?? []) { 
			nfeProdRuralReferenciadaModelLocalList.add(object.toJson); 
		}
		jsonData['nfeProdRuralReferenciadaModelList'] = nfeProdRuralReferenciadaModelLocalList;
    
		var nfeNfReferenciadaModelLocalList = []; 
		for (NfeNfReferenciadaModel object in nfeNfReferenciadaModelList ?? []) { 
			nfeNfReferenciadaModelLocalList.add(object.toJson); 
		}
		jsonData['nfeNfReferenciadaModelList'] = nfeNfReferenciadaModelLocalList;
    
		var nfeProcessoReferenciadoModelLocalList = []; 
		for (NfeProcessoReferenciadoModel object in nfeProcessoReferenciadoModelList ?? []) { 
			nfeProcessoReferenciadoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeProcessoReferenciadoModelList'] = nfeProcessoReferenciadoModelLocalList;
    
		var nfeAcessoXmlModelLocalList = []; 
		for (NfeAcessoXmlModel object in nfeAcessoXmlModelList ?? []) { 
			nfeAcessoXmlModelLocalList.add(object.toJson); 
		}
		jsonData['nfeAcessoXmlModelList'] = nfeAcessoXmlModelLocalList;
    
		var nfeInformacaoPagamentoModelLocalList = []; 
		for (NfeInformacaoPagamentoModel object in nfeInformacaoPagamentoModelList ?? []) { 
			nfeInformacaoPagamentoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeInformacaoPagamentoModelList'] = nfeInformacaoPagamentoModelLocalList;

		var nfeCupomFiscalReferenciadoModelLocalList = []; 
		for (NfeCupomFiscalReferenciadoModel object in nfeCupomFiscalReferenciadoModelList ?? []) { 
			nfeCupomFiscalReferenciadoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeCupomFiscalReferenciadoModelList'] = nfeCupomFiscalReferenciadoModelLocalList;

		var nfeCteReferenciadoModelLocalList = []; 
		for (NfeCteReferenciadoModel object in nfeCteReferenciadoModelList ?? []) { 
			nfeCteReferenciadoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeCteReferenciadoModelList'] = nfeCteReferenciadoModelLocalList;

		var nfeDetalheModelLocalList = []; 
		for (NfeDetalheModel object in nfeDetalheModelList ?? []) { 
			nfeDetalheModelLocalList.add(object.toJson); 
		}
		jsonData['nfeDetalheModelList'] = nfeDetalheModelLocalList;

		var nfeAntecipacaoPagamentoModelLocalList = []; 
		for (NfeAntecipacaoPagamentoModel object in nfeAntecipacaoPagamentoModelList ?? []) { 
			nfeAntecipacaoPagamentoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeAntecipacaoPagamentoModelList'] = nfeAntecipacaoPagamentoModelLocalList;
    
		var nfeInformacaoAgropecuarioModelLocalList = []; 
		for (NfeInformacaoAgropecuarioModel object in nfeInformacaoAgropecuarioModelList ?? []) { 
			nfeInformacaoAgropecuarioModelLocalList.add(object.toJson); 
		}
		jsonData['nfeInformacaoAgropecuarioModelList'] = nfeInformacaoAgropecuarioModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCabecalhoModel fromPlutoRow(PlutoRow row) {
    return NfeCabecalhoModel(
      id: row.cells['id']?.value,
      idVendaCabecalho: row.cells['idVendaCabecalho']?.value,
      idTributOperacaoFiscal: row.cells['idTributOperacaoFiscal']?.value,
      idCliente: row.cells['idCliente']?.value,
      idColaborador: row.cells['idColaborador']?.value,
      idFornecedor: row.cells['idFornecedor']?.value,
      ufEmitente: row.cells['ufEmitente']?.value,
      codigoNumerico: row.cells['codigoNumerico']?.value,
      naturezaOperacao: row.cells['naturezaOperacao']?.value,
      codigoModelo: row.cells['codigoModelo']?.value,
      serie: row.cells['serie']?.value,
      numero: row.cells['numero']?.value,
      dataHoraEmissao: Util.stringToDate(row.cells['dataHoraEmissao']?.value),
      dataHoraEntradaSaida: Util.stringToDate(row.cells['dataHoraEntradaSaida']?.value),
      tipoOperacao: row.cells['tipoOperacao']?.value,
      localDestino: row.cells['localDestino']?.value,
      codigoMunicipio: row.cells['codigoMunicipio']?.value,
      codigoMunicipioFgIbs: row.cells['codigoMunicipioFgIbs']?.value,
      formatoImpressaoDanfe: row.cells['formatoImpressaoDanfe']?.value,
      tipoEmissao: row.cells['tipoEmissao']?.value,
      chaveAcesso: row.cells['chaveAcesso']?.value,
      digitoChaveAcesso: row.cells['digitoChaveAcesso']?.value,
      ambiente: row.cells['ambiente']?.value,
      finalidadeEmissao: row.cells['finalidadeEmissao']?.value,
      tipoNotaDebito: row.cells['tipoNotaDebito']?.value,
      tipoNotaCredito: row.cells['tipoNotaCredito']?.value,
      consumidorOperacao: row.cells['consumidorOperacao']?.value,
      consumidorPresenca: row.cells['consumidorPresenca']?.value,
      indicadorIntermediario: row.cells['indicadorIntermediario']?.value,
      processoEmissao: row.cells['processoEmissao']?.value,
      versaoProcessoEmissao: row.cells['versaoProcessoEmissao']?.value,
      dataEntradaContingencia: Util.stringToDate(row.cells['dataEntradaContingencia']?.value),
      justificativaContingencia: row.cells['justificativaContingencia']?.value,
      baseCalculoIcms: row.cells['baseCalculoIcms']?.value,
      valorIcms: row.cells['valorIcms']?.value,
      valorIcmsDesonerado: row.cells['valorIcmsDesonerado']?.value,
      totalIcmsFcpUfDestino: row.cells['totalIcmsFcpUfDestino']?.value,
      totalIcmsInterestadualUfDestino: row.cells['totalIcmsInterestadualUfDestino']?.value,
      totalIcmsInterestadualUfRemetente: row.cells['totalIcmsInterestadualUfRemetente']?.value,
      valorTotalFcp: row.cells['valorTotalFcp']?.value,
      baseCalculoIcmsSt: row.cells['baseCalculoIcmsSt']?.value,
      valorIcmsSt: row.cells['valorIcmsSt']?.value,
      valorTotalFcpSt: row.cells['valorTotalFcpSt']?.value,
      valorTotalFcpStRetido: row.cells['valorTotalFcpStRetido']?.value,
      totalQtdeTributadaMono: row.cells['totalQtdeTributadaMono']?.value,
      totalIcmsMono: row.cells['totalIcmsMono']?.value,
      totalQuantidadeMonoRetencao: row.cells['totalQuantidadeMonoRetencao']?.value,
      totalIcmsMonoRetencao: row.cells['totalIcmsMonoRetencao']?.value,
      totalQuantidadeMonoRetida: row.cells['totalQuantidadeMonoRetida']?.value,
      totalIcmsMonoRetido: row.cells['totalIcmsMonoRetido']?.value,
      valorTotalProdutos: row.cells['valorTotalProdutos']?.value,
      valorFrete: row.cells['valorFrete']?.value,
      valorSeguro: row.cells['valorSeguro']?.value,
      valorDesconto: row.cells['valorDesconto']?.value,
      valorImpostoImportacao: row.cells['valorImpostoImportacao']?.value,
      valorIpi: row.cells['valorIpi']?.value,
      valorIpiDevolvido: row.cells['valorIpiDevolvido']?.value,
      valorPis: row.cells['valorPis']?.value,
      valorCofins: row.cells['valorCofins']?.value,
      valorDespesasAcessorias: row.cells['valorDespesasAcessorias']?.value,
      valorTotal: row.cells['valorTotal']?.value,
      valorTotalTributos: row.cells['valorTotalTributos']?.value,
      valorServicos: row.cells['valorServicos']?.value,
      baseCalculoIssqn: row.cells['baseCalculoIssqn']?.value,
      valorIssqn: row.cells['valorIssqn']?.value,
      valorPisIssqn: row.cells['valorPisIssqn']?.value,
      valorCofinsIssqn: row.cells['valorCofinsIssqn']?.value,
      dataPrestacaoServico: Util.stringToDate(row.cells['dataPrestacaoServico']?.value),
      valorDeducaoIssqn: row.cells['valorDeducaoIssqn']?.value,
      outrasRetencoesIssqn: row.cells['outrasRetencoesIssqn']?.value,
      descontoIncondicionadoIssqn: row.cells['descontoIncondicionadoIssqn']?.value,
      descontoCondicionadoIssqn: row.cells['descontoCondicionadoIssqn']?.value,
      totalRetencaoIssqn: row.cells['totalRetencaoIssqn']?.value,
      regimeEspecialTributacao: row.cells['regimeEspecialTributacao']?.value,
      valorRetidoPis: row.cells['valorRetidoPis']?.value,
      valorRetidoCofins: row.cells['valorRetidoCofins']?.value,
      valorRetidoCsll: row.cells['valorRetidoCsll']?.value,
      baseCalculoIrrf: row.cells['baseCalculoIrrf']?.value,
      valorRetidoIrrf: row.cells['valorRetidoIrrf']?.value,
      baseCalculoPrevidencia: row.cells['baseCalculoPrevidencia']?.value,
      valorRetidoPrevidencia: row.cells['valorRetidoPrevidencia']?.value,
      informacoesAddFisco: row.cells['informacoesAddFisco']?.value,
      informacoesAddContribuinte: row.cells['informacoesAddContribuinte']?.value,
      comexUfEmbarque: row.cells['comexUfEmbarque']?.value,
      comexLocalEmbarque: row.cells['comexLocalEmbarque']?.value,
      comexLocalDespacho: row.cells['comexLocalDespacho']?.value,
      compraNotaEmpenho: row.cells['compraNotaEmpenho']?.value,
      compraPedido: row.cells['compraPedido']?.value,
      compraContrato: row.cells['compraContrato']?.value,
      qrcode: row.cells['qrcode']?.value,
      urlChave: row.cells['urlChave']?.value,
      statusNota: row.cells['statusNota']?.value,
      intermediadorCnpj: row.cells['intermediadorCnpj']?.value,
      intermediadorIdCadastro: row.cells['intermediadorIdCadastro']?.value,
      totalImpostoSeletivo: row.cells['totalImpostoSeletivo']?.value,
      totalBcIbsCbs: row.cells['totalBcIbsCbs']?.value,
      ibsUfTotalDiferimento: row.cells['ibsUfTotalDiferimento']?.value,
      ibsUfTotalDevTributos: row.cells['ibsUfTotalDevTributos']?.value,
      ibsUfValorTotal: row.cells['ibsUfValorTotal']?.value,
      ibsMunTotalDiferimento: row.cells['ibsMunTotalDiferimento']?.value,
      ibsMunTotalDevTributos: row.cells['ibsMunTotalDevTributos']?.value,
      ibsMunValorTotal: row.cells['ibsMunValorTotal']?.value,
      ibsValorTotal: row.cells['ibsValorTotal']?.value,
      totalCreditoPresumido: row.cells['totalCreditoPresumido']?.value,
      totalCredPresSuspensivo: row.cells['totalCredPresSuspensivo']?.value,
      cbsTotalDiferimento: row.cells['cbsTotalDiferimento']?.value,
      cbsTotalDevTributos: row.cells['cbsTotalDevTributos']?.value,
      cbsValorTotal: row.cells['cbsValorTotal']?.value,
      cbsTotalCreditoPresumido: row.cells['cbsTotalCreditoPresumido']?.value,
      cbsTotCrePreSuspensivo: row.cells['cbsTotCrePreSuspensivo']?.value,
      monoIbsTotal: row.cells['monoIbsTotal']?.value,
      monoCbsTotal: row.cells['monoCbsTotal']?.value,
      monoIbsTotalRetencao: row.cells['monoIbsTotalRetencao']?.value,
      monoCbsTotalRetencao: row.cells['monoCbsTotalRetencao']?.value,
      monoIbsRetido: row.cells['monoIbsRetido']?.value,
      monoCbsRetido: row.cells['monoCbsRetido']?.value,
      valorTotalNfe: row.cells['valorTotalNfe']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idVendaCabecalho': PlutoCell(value: idVendaCabecalho ?? 0),
        'idTributOperacaoFiscal': PlutoCell(value: idTributOperacaoFiscal ?? 0),
        'idCliente': PlutoCell(value: idCliente ?? 0),
        'idColaborador': PlutoCell(value: idColaborador ?? 0),
        'idFornecedor': PlutoCell(value: idFornecedor ?? 0),
        'ufEmitente': PlutoCell(value: ufEmitente ?? ''),
        'codigoNumerico': PlutoCell(value: codigoNumerico ?? ''),
        'naturezaOperacao': PlutoCell(value: naturezaOperacao ?? ''),
        'codigoModelo': PlutoCell(value: codigoModelo ?? ''),
        'serie': PlutoCell(value: serie ?? ''),
        'numero': PlutoCell(value: numero ?? ''),
        'dataHoraEmissao': PlutoCell(value: dataHoraEmissao),
        'dataHoraEntradaSaida': PlutoCell(value: dataHoraEntradaSaida),
        'tipoOperacao': PlutoCell(value: tipoOperacao ?? ''),
        'localDestino': PlutoCell(value: localDestino ?? ''),
        'codigoMunicipio': PlutoCell(value: codigoMunicipio ?? 0),
        'codigoMunicipioFgIbs': PlutoCell(value: codigoMunicipioFgIbs ?? 0),
        'formatoImpressaoDanfe': PlutoCell(value: formatoImpressaoDanfe ?? ''),
        'tipoEmissao': PlutoCell(value: tipoEmissao ?? ''),
        'chaveAcesso': PlutoCell(value: chaveAcesso ?? ''),
        'digitoChaveAcesso': PlutoCell(value: digitoChaveAcesso ?? ''),
        'ambiente': PlutoCell(value: ambiente ?? ''),
        'finalidadeEmissao': PlutoCell(value: finalidadeEmissao ?? ''),
        'tipoNotaDebito': PlutoCell(value: tipoNotaDebito ?? ''),
        'tipoNotaCredito': PlutoCell(value: tipoNotaCredito ?? ''),
        'consumidorOperacao': PlutoCell(value: consumidorOperacao ?? ''),
        'consumidorPresenca': PlutoCell(value: consumidorPresenca ?? ''),
        'indicadorIntermediario': PlutoCell(value: indicadorIntermediario ?? ''),
        'processoEmissao': PlutoCell(value: processoEmissao ?? ''),
        'versaoProcessoEmissao': PlutoCell(value: versaoProcessoEmissao ?? ''),
        'dataEntradaContingencia': PlutoCell(value: dataEntradaContingencia),
        'justificativaContingencia': PlutoCell(value: justificativaContingencia ?? ''),
        'baseCalculoIcms': PlutoCell(value: baseCalculoIcms ?? 0.0),
        'valorIcms': PlutoCell(value: valorIcms ?? 0.0),
        'valorIcmsDesonerado': PlutoCell(value: valorIcmsDesonerado ?? 0.0),
        'totalIcmsFcpUfDestino': PlutoCell(value: totalIcmsFcpUfDestino ?? 0.0),
        'totalIcmsInterestadualUfDestino': PlutoCell(value: totalIcmsInterestadualUfDestino ?? 0.0),
        'totalIcmsInterestadualUfRemetente': PlutoCell(value: totalIcmsInterestadualUfRemetente ?? 0.0),
        'valorTotalFcp': PlutoCell(value: valorTotalFcp ?? 0.0),
        'baseCalculoIcmsSt': PlutoCell(value: baseCalculoIcmsSt ?? 0.0),
        'valorIcmsSt': PlutoCell(value: valorIcmsSt ?? 0.0),
        'valorTotalFcpSt': PlutoCell(value: valorTotalFcpSt ?? 0.0),
        'valorTotalFcpStRetido': PlutoCell(value: valorTotalFcpStRetido ?? 0.0),
        'totalQtdeTributadaMono': PlutoCell(value: totalQtdeTributadaMono ?? 0.0),
        'totalIcmsMono': PlutoCell(value: totalIcmsMono ?? 0.0),
        'totalQuantidadeMonoRetencao': PlutoCell(value: totalQuantidadeMonoRetencao ?? 0.0),
        'totalIcmsMonoRetencao': PlutoCell(value: totalIcmsMonoRetencao ?? 0.0),
        'totalQuantidadeMonoRetida': PlutoCell(value: totalQuantidadeMonoRetida ?? 0.0),
        'totalIcmsMonoRetido': PlutoCell(value: totalIcmsMonoRetido ?? 0.0),
        'valorTotalProdutos': PlutoCell(value: valorTotalProdutos ?? 0.0),
        'valorFrete': PlutoCell(value: valorFrete ?? 0.0),
        'valorSeguro': PlutoCell(value: valorSeguro ?? 0.0),
        'valorDesconto': PlutoCell(value: valorDesconto ?? 0.0),
        'valorImpostoImportacao': PlutoCell(value: valorImpostoImportacao ?? 0.0),
        'valorIpi': PlutoCell(value: valorIpi ?? 0.0),
        'valorIpiDevolvido': PlutoCell(value: valorIpiDevolvido ?? 0.0),
        'valorPis': PlutoCell(value: valorPis ?? 0.0),
        'valorCofins': PlutoCell(value: valorCofins ?? 0.0),
        'valorDespesasAcessorias': PlutoCell(value: valorDespesasAcessorias ?? 0.0),
        'valorTotal': PlutoCell(value: valorTotal ?? 0.0),
        'valorTotalTributos': PlutoCell(value: valorTotalTributos ?? 0.0),
        'valorServicos': PlutoCell(value: valorServicos ?? 0.0),
        'baseCalculoIssqn': PlutoCell(value: baseCalculoIssqn ?? 0.0),
        'valorIssqn': PlutoCell(value: valorIssqn ?? 0.0),
        'valorPisIssqn': PlutoCell(value: valorPisIssqn ?? 0.0),
        'valorCofinsIssqn': PlutoCell(value: valorCofinsIssqn ?? 0.0),
        'dataPrestacaoServico': PlutoCell(value: dataPrestacaoServico),
        'valorDeducaoIssqn': PlutoCell(value: valorDeducaoIssqn ?? 0.0),
        'outrasRetencoesIssqn': PlutoCell(value: outrasRetencoesIssqn ?? 0.0),
        'descontoIncondicionadoIssqn': PlutoCell(value: descontoIncondicionadoIssqn ?? 0.0),
        'descontoCondicionadoIssqn': PlutoCell(value: descontoCondicionadoIssqn ?? 0.0),
        'totalRetencaoIssqn': PlutoCell(value: totalRetencaoIssqn ?? 0.0),
        'regimeEspecialTributacao': PlutoCell(value: regimeEspecialTributacao ?? ''),
        'valorRetidoPis': PlutoCell(value: valorRetidoPis ?? 0.0),
        'valorRetidoCofins': PlutoCell(value: valorRetidoCofins ?? 0.0),
        'valorRetidoCsll': PlutoCell(value: valorRetidoCsll ?? 0.0),
        'baseCalculoIrrf': PlutoCell(value: baseCalculoIrrf ?? 0.0),
        'valorRetidoIrrf': PlutoCell(value: valorRetidoIrrf ?? 0.0),
        'baseCalculoPrevidencia': PlutoCell(value: baseCalculoPrevidencia ?? 0.0),
        'valorRetidoPrevidencia': PlutoCell(value: valorRetidoPrevidencia ?? 0.0),
        'informacoesAddFisco': PlutoCell(value: informacoesAddFisco ?? ''),
        'informacoesAddContribuinte': PlutoCell(value: informacoesAddContribuinte ?? ''),
        'comexUfEmbarque': PlutoCell(value: comexUfEmbarque ?? ''),
        'comexLocalEmbarque': PlutoCell(value: comexLocalEmbarque ?? ''),
        'comexLocalDespacho': PlutoCell(value: comexLocalDespacho ?? ''),
        'compraNotaEmpenho': PlutoCell(value: compraNotaEmpenho ?? ''),
        'compraPedido': PlutoCell(value: compraPedido ?? ''),
        'compraContrato': PlutoCell(value: compraContrato ?? ''),
        'qrcode': PlutoCell(value: qrcode ?? ''),
        'urlChave': PlutoCell(value: urlChave ?? ''),
        'statusNota': PlutoCell(value: statusNota ?? ''),
        'intermediadorCnpj': PlutoCell(value: intermediadorCnpj ?? ''),
        'intermediadorIdCadastro': PlutoCell(value: intermediadorIdCadastro ?? ''),
        'totalImpostoSeletivo': PlutoCell(value: totalImpostoSeletivo ?? 0.0),
        'totalBcIbsCbs': PlutoCell(value: totalBcIbsCbs ?? 0.0),
        'ibsUfTotalDiferimento': PlutoCell(value: ibsUfTotalDiferimento ?? 0.0),
        'ibsUfTotalDevTributos': PlutoCell(value: ibsUfTotalDevTributos ?? 0.0),
        'ibsUfValorTotal': PlutoCell(value: ibsUfValorTotal ?? 0.0),
        'ibsMunTotalDiferimento': PlutoCell(value: ibsMunTotalDiferimento ?? 0.0),
        'ibsMunTotalDevTributos': PlutoCell(value: ibsMunTotalDevTributos ?? 0.0),
        'ibsMunValorTotal': PlutoCell(value: ibsMunValorTotal ?? 0.0),
        'ibsValorTotal': PlutoCell(value: ibsValorTotal ?? 0.0),
        'totalCreditoPresumido': PlutoCell(value: totalCreditoPresumido ?? 0.0),
        'totalCredPresSuspensivo': PlutoCell(value: totalCredPresSuspensivo ?? 0.0),
        'cbsTotalDiferimento': PlutoCell(value: cbsTotalDiferimento ?? 0.0),
        'cbsTotalDevTributos': PlutoCell(value: cbsTotalDevTributos ?? 0.0),
        'cbsValorTotal': PlutoCell(value: cbsValorTotal ?? 0.0),
        'cbsTotalCreditoPresumido': PlutoCell(value: cbsTotalCreditoPresumido ?? 0.0),
        'cbsTotCrePreSuspensivo': PlutoCell(value: cbsTotCrePreSuspensivo ?? 0.0),
        'monoIbsTotal': PlutoCell(value: monoIbsTotal ?? 0.0),
        'monoCbsTotal': PlutoCell(value: monoCbsTotal ?? 0.0),
        'monoIbsTotalRetencao': PlutoCell(value: monoIbsTotalRetencao ?? 0.0),
        'monoCbsTotalRetencao': PlutoCell(value: monoCbsTotalRetencao ?? 0.0),
        'monoIbsRetido': PlutoCell(value: monoIbsRetido ?? 0.0),
        'monoCbsRetido': PlutoCell(value: monoCbsRetido ?? 0.0),
        'valorTotalNfe': PlutoCell(value: valorTotalNfe ?? 0.0),
        'tributOperacaoFiscal': PlutoCell(value: tributOperacaoFiscalModel?.descricao ?? ''),
        'vendaCabecalho': PlutoCell(value: vendaCabecalhoModel?.id ?? ''),
        'viewPessoaCliente': PlutoCell(value: viewPessoaClienteModel?.nome ?? ''),
        'viewPessoaColaborador': PlutoCell(value: viewPessoaColaboradorModel?.nome ?? ''),
        'viewPessoaFornecedor': PlutoCell(value: viewPessoaFornecedorModel?.nome ?? ''),
      },
    );
  }

  NfeCabecalhoModel clone() {
    return NfeCabecalhoModel(
      id: id,
      idVendaCabecalho: idVendaCabecalho,
      idTributOperacaoFiscal: idTributOperacaoFiscal,
      idCliente: idCliente,
      idColaborador: idColaborador,
      idFornecedor: idFornecedor,
      ufEmitente: ufEmitente,
      codigoNumerico: codigoNumerico,
      naturezaOperacao: naturezaOperacao,
      codigoModelo: codigoModelo,
      serie: serie,
      numero: numero,
      dataHoraEmissao: dataHoraEmissao,
      dataHoraEntradaSaida: dataHoraEntradaSaida,
      tipoOperacao: tipoOperacao,
      localDestino: localDestino,
      codigoMunicipio: codigoMunicipio,
      codigoMunicipioFgIbs: codigoMunicipioFgIbs,
      formatoImpressaoDanfe: formatoImpressaoDanfe,
      tipoEmissao: tipoEmissao,
      chaveAcesso: chaveAcesso,
      digitoChaveAcesso: digitoChaveAcesso,
      ambiente: ambiente,
      finalidadeEmissao: finalidadeEmissao,
      tipoNotaDebito: tipoNotaDebito,
      tipoNotaCredito: tipoNotaCredito,
      consumidorOperacao: consumidorOperacao,
      consumidorPresenca: consumidorPresenca,
      indicadorIntermediario: indicadorIntermediario,
      processoEmissao: processoEmissao,
      versaoProcessoEmissao: versaoProcessoEmissao,
      dataEntradaContingencia: dataEntradaContingencia,
      justificativaContingencia: justificativaContingencia,
      baseCalculoIcms: baseCalculoIcms,
      valorIcms: valorIcms,
      valorIcmsDesonerado: valorIcmsDesonerado,
      totalIcmsFcpUfDestino: totalIcmsFcpUfDestino,
      totalIcmsInterestadualUfDestino: totalIcmsInterestadualUfDestino,
      totalIcmsInterestadualUfRemetente: totalIcmsInterestadualUfRemetente,
      valorTotalFcp: valorTotalFcp,
      baseCalculoIcmsSt: baseCalculoIcmsSt,
      valorIcmsSt: valorIcmsSt,
      valorTotalFcpSt: valorTotalFcpSt,
      valorTotalFcpStRetido: valorTotalFcpStRetido,
      totalQtdeTributadaMono: totalQtdeTributadaMono,
      totalIcmsMono: totalIcmsMono,
      totalQuantidadeMonoRetencao: totalQuantidadeMonoRetencao,
      totalIcmsMonoRetencao: totalIcmsMonoRetencao,
      totalQuantidadeMonoRetida: totalQuantidadeMonoRetida,
      totalIcmsMonoRetido: totalIcmsMonoRetido,
      valorTotalProdutos: valorTotalProdutos,
      valorFrete: valorFrete,
      valorSeguro: valorSeguro,
      valorDesconto: valorDesconto,
      valorImpostoImportacao: valorImpostoImportacao,
      valorIpi: valorIpi,
      valorIpiDevolvido: valorIpiDevolvido,
      valorPis: valorPis,
      valorCofins: valorCofins,
      valorDespesasAcessorias: valorDespesasAcessorias,
      valorTotal: valorTotal,
      valorTotalTributos: valorTotalTributos,
      valorServicos: valorServicos,
      baseCalculoIssqn: baseCalculoIssqn,
      valorIssqn: valorIssqn,
      valorPisIssqn: valorPisIssqn,
      valorCofinsIssqn: valorCofinsIssqn,
      dataPrestacaoServico: dataPrestacaoServico,
      valorDeducaoIssqn: valorDeducaoIssqn,
      outrasRetencoesIssqn: outrasRetencoesIssqn,
      descontoIncondicionadoIssqn: descontoIncondicionadoIssqn,
      descontoCondicionadoIssqn: descontoCondicionadoIssqn,
      totalRetencaoIssqn: totalRetencaoIssqn,
      regimeEspecialTributacao: regimeEspecialTributacao,
      valorRetidoPis: valorRetidoPis,
      valorRetidoCofins: valorRetidoCofins,
      valorRetidoCsll: valorRetidoCsll,
      baseCalculoIrrf: baseCalculoIrrf,
      valorRetidoIrrf: valorRetidoIrrf,
      baseCalculoPrevidencia: baseCalculoPrevidencia,
      valorRetidoPrevidencia: valorRetidoPrevidencia,
      informacoesAddFisco: informacoesAddFisco,
      informacoesAddContribuinte: informacoesAddContribuinte,
      comexUfEmbarque: comexUfEmbarque,
      comexLocalEmbarque: comexLocalEmbarque,
      comexLocalDespacho: comexLocalDespacho,
      compraNotaEmpenho: compraNotaEmpenho,
      compraPedido: compraPedido,
      compraContrato: compraContrato,
      qrcode: qrcode,
      urlChave: urlChave,
      statusNota: statusNota,
      intermediadorCnpj: intermediadorCnpj,
      intermediadorIdCadastro: intermediadorIdCadastro,
      totalImpostoSeletivo: totalImpostoSeletivo,
      totalBcIbsCbs: totalBcIbsCbs,
      ibsUfTotalDiferimento: ibsUfTotalDiferimento,
      ibsUfTotalDevTributos: ibsUfTotalDevTributos,
      ibsUfValorTotal: ibsUfValorTotal,
      ibsMunTotalDiferimento: ibsMunTotalDiferimento,
      ibsMunTotalDevTributos: ibsMunTotalDevTributos,
      ibsMunValorTotal: ibsMunValorTotal,
      ibsValorTotal: ibsValorTotal,
      totalCreditoPresumido: totalCreditoPresumido,
      totalCredPresSuspensivo: totalCredPresSuspensivo,
      cbsTotalDiferimento: cbsTotalDiferimento,
      cbsTotalDevTributos: cbsTotalDevTributos,
      cbsValorTotal: cbsValorTotal,
      cbsTotalCreditoPresumido: cbsTotalCreditoPresumido,
      cbsTotCrePreSuspensivo: cbsTotCrePreSuspensivo,
      monoIbsTotal: monoIbsTotal,
      monoCbsTotal: monoCbsTotal,
      monoIbsTotalRetencao: monoIbsTotalRetencao,
      monoCbsTotalRetencao: monoCbsTotalRetencao,
      monoIbsRetido: monoIbsRetido,
      monoCbsRetido: monoCbsRetido,
      valorTotalNfe: valorTotalNfe,
      nfeEmitenteModel:nfeEmitenteModel?.clone(),
      nfeDestinatarioModel: nfeDestinatarioModel?.clone(),
      nfeLocalRetiradaModel: nfeLocalRetiradaModel?.clone(),
      nfeLocalEntregaModel: nfeLocalEntregaModel?.clone(),
      nfeTransporteModel: nfeTransporteModel?.clone(),
      nfeFaturaModel: nfeFaturaModel?.clone(),
      nfeCanaModel: nfeCanaModel?.clone(),
      nfeResponsavelTecnicoModel: nfeResponsavelTecnicoModel?.clone(),
      nfeReferenciadaModelList: nfeReferenciadaModelListClone(nfeReferenciadaModelList!),
      nfeProdRuralReferenciadaModelList: nfeProdRuralReferenciadaModelListClone(nfeProdRuralReferenciadaModelList!),
      nfeNfReferenciadaModelList: nfeNfReferenciadaModelListClone(nfeNfReferenciadaModelList!),
      nfeProcessoReferenciadoModelList: nfeProcessoReferenciadoModelListClone(nfeProcessoReferenciadoModelList!),
      nfeAcessoXmlModelList: nfeAcessoXmlModelListClone(nfeAcessoXmlModelList!),
      nfeInformacaoPagamentoModelList: nfeInformacaoPagamentoModelListClone(nfeInformacaoPagamentoModelList!),
      tributOperacaoFiscalModel: tributOperacaoFiscalModel?.clone(),
      vendaCabecalhoModel: vendaCabecalhoModel?.clone(),
      viewPessoaClienteModel: viewPessoaClienteModel?.clone(),
      viewPessoaColaboradorModel: viewPessoaColaboradorModel?.clone(),
      viewPessoaFornecedorModel: viewPessoaFornecedorModel?.clone(),
      nfeCupomFiscalReferenciadoModelList: nfeCupomFiscalReferenciadoModelListClone(nfeCupomFiscalReferenciadoModelList!),
      nfeCteReferenciadoModelList: nfeCteReferenciadoModelListClone(nfeCteReferenciadoModelList!),
      nfeDetalheModelList: nfeDetalheModelListClone(nfeDetalheModelList!),
      nfeCompraGovernamentalModel: nfeCompraGovernamentalModel?.clone(),
      nfeAntecipacaoPagamentoModelList: nfeAntecipacaoPagamentoModelListClone(nfeAntecipacaoPagamentoModelList!),
      nfeInformacaoAgropecuarioModelList: nfeInformacaoAgropecuarioModelListClone(nfeInformacaoAgropecuarioModelList!),
    );
  }

  nfeReferenciadaModelListClone(List<NfeReferenciadaModel> nfeReferenciadaModelList) { 
		List<NfeReferenciadaModel> resultList = [];
		for (var nfeReferenciadaModel in nfeReferenciadaModelList) {
			resultList.add(nfeReferenciadaModel.clone());
		}
		return resultList;
	}

  nfeProdRuralReferenciadaModelListClone(List<NfeProdRuralReferenciadaModel> nfeProdRuralReferenciadaModelList) { 
		List<NfeProdRuralReferenciadaModel> resultList = [];
		for (var nfeProdRuralReferenciadaModel in nfeProdRuralReferenciadaModelList) {
			resultList.add(nfeProdRuralReferenciadaModel.clone());
		}
		return resultList;
	}

  nfeNfReferenciadaModelListClone(List<NfeNfReferenciadaModel> nfeNfReferenciadaModelList) { 
		List<NfeNfReferenciadaModel> resultList = [];
		for (var nfeNfReferenciadaModel in nfeNfReferenciadaModelList) {
			resultList.add(nfeNfReferenciadaModel.clone());
		}
		return resultList;
	}

  nfeProcessoReferenciadoModelListClone(List<NfeProcessoReferenciadoModel> nfeProcessoReferenciadoModelList) { 
		List<NfeProcessoReferenciadoModel> resultList = [];
		for (var nfeProcessoReferenciadoModel in nfeProcessoReferenciadoModelList) {
			resultList.add(nfeProcessoReferenciadoModel.clone());
		}
		return resultList;
	}

  nfeAcessoXmlModelListClone(List<NfeAcessoXmlModel> nfeAcessoXmlModelList) { 
		List<NfeAcessoXmlModel> resultList = [];
		for (var nfeAcessoXmlModel in nfeAcessoXmlModelList) {
			resultList.add(nfeAcessoXmlModel.clone());
		}
		return resultList;
	}

  nfeInformacaoPagamentoModelListClone(List<NfeInformacaoPagamentoModel> nfeInformacaoPagamentoModelList) { 
		List<NfeInformacaoPagamentoModel> resultList = [];
		for (var nfeInformacaoPagamentoModel in nfeInformacaoPagamentoModelList) {
			resultList.add(nfeInformacaoPagamentoModel.clone());
		}
		return resultList;
	}

  nfeCupomFiscalReferenciadoModelListClone(List<NfeCupomFiscalReferenciadoModel> nfeCupomFiscalReferenciadoModelList) { 
		List<NfeCupomFiscalReferenciadoModel> resultList = [];
		for (var nfeCupomFiscalReferenciadoModel in nfeCupomFiscalReferenciadoModelList) {
			resultList.add(nfeCupomFiscalReferenciadoModel.clone());
		}
		return resultList;
	}

  nfeCteReferenciadoModelListClone(List<NfeCteReferenciadoModel> nfeCteReferenciadoModelList) { 
		List<NfeCteReferenciadoModel> resultList = [];
		for (var nfeCteReferenciadoModel in nfeCteReferenciadoModelList) {
			resultList.add(nfeCteReferenciadoModel.clone());
		}
		return resultList;
	}

  nfeDetalheModelListClone(List<NfeDetalheModel> nfeDetalheModelList) { 
		List<NfeDetalheModel> resultList = [];
		for (var nfeDetalheModel in nfeDetalheModelList) {
			resultList.add(nfeDetalheModel.clone());
		}
		return resultList;
	}

  nfeAntecipacaoPagamentoModelListClone(List<NfeAntecipacaoPagamentoModel> nfeAntecipacaoPagamentoModelList) { 
		List<NfeAntecipacaoPagamentoModel> resultList = [];
		for (var nfeAntecipacaoPagamentoModel in nfeAntecipacaoPagamentoModelList) {
			resultList.add(nfeAntecipacaoPagamentoModel.clone());
		}
		return resultList;
	}

  nfeInformacaoAgropecuarioModelListClone(List<NfeInformacaoAgropecuarioModel> nfeInformacaoAgropecuarioModelList) { 
		List<NfeInformacaoAgropecuarioModel> resultList = [];
		for (var nfeInformacaoAgropecuarioModel in nfeInformacaoAgropecuarioModelList) {
			resultList.add(nfeInformacaoAgropecuarioModel.clone());
		}
		return resultList;
	}

}