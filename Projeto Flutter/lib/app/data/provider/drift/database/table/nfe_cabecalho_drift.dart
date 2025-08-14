import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

@DataClassName("NfeCabecalho")
class NfeCabecalhos extends Table {
	@override
	String get tableName => 'nfe_cabecalho';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idVendaCabecalho => integer().named('id_venda_cabecalho').nullable()();
	IntColumn get idTributOperacaoFiscal => integer().named('id_tribut_operacao_fiscal').nullable()();
	IntColumn get idCliente => integer().named('id_cliente').nullable()();
	IntColumn get idColaborador => integer().named('id_colaborador').nullable()();
	IntColumn get idFornecedor => integer().named('id_fornecedor').nullable()();
	TextColumn get ufEmitente => text().named('uf_emitente').withLength(min: 0, max: 2).nullable()();
	TextColumn get codigoNumerico => text().named('codigo_numerico').withLength(min: 0, max: 8).nullable()();
	TextColumn get naturezaOperacao => text().named('natureza_operacao').withLength(min: 0, max: 60).nullable()();
	TextColumn get codigoModelo => text().named('codigo_modelo').withLength(min: 0, max: 2).nullable()();
	TextColumn get serie => text().named('serie').withLength(min: 0, max: 3).nullable()();
	TextColumn get numero => text().named('numero').withLength(min: 0, max: 9).nullable()();
	DateTimeColumn get dataHoraEmissao => dateTime().named('data_hora_emissao').nullable()();
	DateTimeColumn get dataHoraEntradaSaida => dateTime().named('data_hora_entrada_saida').nullable()();
	TextColumn get tipoOperacao => text().named('tipo_operacao').withLength(min: 0, max: 1).nullable()();
	TextColumn get localDestino => text().named('local_destino').withLength(min: 0, max: 1).nullable()();
	IntColumn get codigoMunicipio => integer().named('codigo_municipio').nullable()();
	TextColumn get formatoImpressaoDanfe => text().named('formato_impressao_danfe').withLength(min: 0, max: 1).nullable()();
	TextColumn get tipoEmissao => text().named('tipo_emissao').withLength(min: 0, max: 1).nullable()();
	TextColumn get chaveAcesso => text().named('chave_acesso').withLength(min: 0, max: 44).nullable()();
	TextColumn get digitoChaveAcesso => text().named('digito_chave_acesso').withLength(min: 0, max: 1).nullable()();
	TextColumn get ambiente => text().named('ambiente').withLength(min: 0, max: 1).nullable()();
	TextColumn get finalidadeEmissao => text().named('finalidade_emissao').withLength(min: 0, max: 1).nullable()();
	TextColumn get consumidorOperacao => text().named('consumidor_operacao').withLength(min: 0, max: 1).nullable()();
	TextColumn get consumidorPresenca => text().named('consumidor_presenca').withLength(min: 0, max: 1).nullable()();
	TextColumn get processoEmissao => text().named('processo_emissao').withLength(min: 0, max: 1).nullable()();
	TextColumn get versaoProcessoEmissao => text().named('versao_processo_emissao').withLength(min: 0, max: 20).nullable()();
	DateTimeColumn get dataEntradaContingencia => dateTime().named('data_entrada_contingencia').nullable()();
	TextColumn get justificativaContingencia => text().named('justificativa_contingencia').withLength(min: 0, max: 255).nullable()();
	RealColumn get baseCalculoIcms => real().named('base_calculo_icms').nullable()();
	RealColumn get valorIcms => real().named('valor_icms').nullable()();
	RealColumn get valorIcmsDesonerado => real().named('valor_icms_desonerado').nullable()();
	RealColumn get totalIcmsFcpUfDestino => real().named('total_icms_fcp_uf_destino').nullable()();
	RealColumn get totalIcmsInterestadualUfDestino => real().named('total_icms_interestadual_uf_destino').nullable()();
	RealColumn get totalIcmsInterestadualUfRemetente => real().named('total_icms_interestadual_uf_remetente').nullable()();
	RealColumn get valorTotalFcp => real().named('valor_total_fcp').nullable()();
	RealColumn get baseCalculoIcmsSt => real().named('base_calculo_icms_st').nullable()();
	RealColumn get valorIcmsSt => real().named('valor_icms_st').nullable()();
	RealColumn get valorTotalFcpSt => real().named('valor_total_fcp_st').nullable()();
	RealColumn get valorTotalFcpStRetido => real().named('valor_total_fcp_st_retido').nullable()();
	RealColumn get valorTotalProdutos => real().named('valor_total_produtos').nullable()();
	RealColumn get valorFrete => real().named('valor_frete').nullable()();
	RealColumn get valorSeguro => real().named('valor_seguro').nullable()();
	RealColumn get valorDesconto => real().named('valor_desconto').nullable()();
	RealColumn get valorImpostoImportacao => real().named('valor_imposto_importacao').nullable()();
	RealColumn get valorIpi => real().named('valor_ipi').nullable()();
	RealColumn get valorIpiDevolvido => real().named('valor_ipi_devolvido').nullable()();
	RealColumn get valorPis => real().named('valor_pis').nullable()();
	RealColumn get valorCofins => real().named('valor_cofins').nullable()();
	RealColumn get valorDespesasAcessorias => real().named('valor_despesas_acessorias').nullable()();
	RealColumn get valorTotal => real().named('valor_total').nullable()();
	RealColumn get valorTotalTributos => real().named('valor_total_tributos').nullable()();
	RealColumn get valorServicos => real().named('valor_servicos').nullable()();
	RealColumn get baseCalculoIssqn => real().named('base_calculo_issqn').nullable()();
	RealColumn get valorIssqn => real().named('valor_issqn').nullable()();
	RealColumn get valorPisIssqn => real().named('valor_pis_issqn').nullable()();
	RealColumn get valorCofinsIssqn => real().named('valor_cofins_issqn').nullable()();
	DateTimeColumn get dataPrestacaoServico => dateTime().named('data_prestacao_servico').nullable()();
	RealColumn get valorDeducaoIssqn => real().named('valor_deducao_issqn').nullable()();
	RealColumn get outrasRetencoesIssqn => real().named('outras_retencoes_issqn').nullable()();
	RealColumn get descontoIncondicionadoIssqn => real().named('desconto_incondicionado_issqn').nullable()();
	RealColumn get descontoCondicionadoIssqn => real().named('desconto_condicionado_issqn').nullable()();
	RealColumn get totalRetencaoIssqn => real().named('total_retencao_issqn').nullable()();
	TextColumn get regimeEspecialTributacao => text().named('regime_especial_tributacao').withLength(min: 0, max: 1).nullable()();
	RealColumn get valorRetidoPis => real().named('valor_retido_pis').nullable()();
	RealColumn get valorRetidoCofins => real().named('valor_retido_cofins').nullable()();
	RealColumn get valorRetidoCsll => real().named('valor_retido_csll').nullable()();
	RealColumn get baseCalculoIrrf => real().named('base_calculo_irrf').nullable()();
	RealColumn get valorRetidoIrrf => real().named('valor_retido_irrf').nullable()();
	RealColumn get baseCalculoPrevidencia => real().named('base_calculo_previdencia').nullable()();
	RealColumn get valorRetidoPrevidencia => real().named('valor_retido_previdencia').nullable()();
	TextColumn get informacoesAddFisco => text().named('informacoes_add_fisco').nullable()();
	TextColumn get informacoesAddContribuinte => text().named('informacoes_add_contribuinte').nullable()();
	TextColumn get comexUfEmbarque => text().named('comex_uf_embarque').withLength(min: 0, max: 2).nullable()();
	TextColumn get comexLocalEmbarque => text().named('comex_local_embarque').withLength(min: 0, max: 60).nullable()();
	TextColumn get comexLocalDespacho => text().named('comex_local_despacho').withLength(min: 0, max: 60).nullable()();
	TextColumn get compraNotaEmpenho => text().named('compra_nota_empenho').withLength(min: 0, max: 22).nullable()();
	TextColumn get compraPedido => text().named('compra_pedido').withLength(min: 0, max: 60).nullable()();
	TextColumn get compraContrato => text().named('compra_contrato').withLength(min: 0, max: 60).nullable()();
	TextColumn get qrcode => text().named('qrcode').nullable()();
	TextColumn get urlChave => text().named('url_chave').withLength(min: 0, max: 85).nullable()();
	TextColumn get statusNota => text().named('status_nota').withLength(min: 0, max: 1).nullable()();
	TextColumn get indicadorIntermediario => text().named('indicador_intermediario').withLength(min: 0, max: 1).nullable()();
	TextColumn get intermediadorCnpj => text().named('intermediador_cnpj').withLength(min: 0, max: 14).nullable()();
	TextColumn get intermediadorIdCadastro => text().named('intermediador_id_cadastro').withLength(min: 0, max: 60).nullable()();
	IntColumn get codigoMunicipioFgIbs => integer().named('codigo_municipio_fg_ibs').nullable()();
	TextColumn get tipoNotaDebito => text().named('tipo_nota_debito').withLength(min: 0, max: 1).nullable()();
	TextColumn get tipoNotaCredito => text().named('tipo_nota_credito').withLength(min: 0, max: 1).nullable()();
	RealColumn get totalImpostoSeletivo => real().named('total_imposto_seletivo').nullable()();
	RealColumn get totalBcIbsCbs => real().named('total_bc_ibs_cbs').nullable()();
	RealColumn get ibsUfTotalDiferimento => real().named('ibs_uf_total_diferimento').nullable()();
	RealColumn get ibsUfTotalDevTributos => real().named('ibs_uf_total_dev_tributos').nullable()();
	RealColumn get ibsUfValorTotal => real().named('ibs_uf_valor_total').nullable()();
	RealColumn get ibsMunTotalDiferimento => real().named('ibs_mun_total_diferimento').nullable()();
	RealColumn get ibsMunTotalDevTributos => real().named('ibs_mun_total_dev_tributos').nullable()();
	RealColumn get ibsMunValorTotal => real().named('ibs_mun_valor_total').nullable()();
	RealColumn get cbsTotalDiferimento => real().named('cbs_total_diferimento').nullable()();
	RealColumn get cbsTotalDevTributos => real().named('cbs_total_dev_tributos').nullable()();
	RealColumn get cbsValorTotal => real().named('cbs_valor_total').nullable()();
	RealColumn get cbsTotalCreditoPresumido => real().named('cbs_total_credito_presumido').nullable()();
	RealColumn get cbsTotCrePreSuspensivo => real().named('cbs_tot_cre_pre_suspensivo').nullable()();
	RealColumn get monoIbsTotal => real().named('mono_ibs_total').nullable()();
	RealColumn get monoCbsTotal => real().named('mono_cbs_total').nullable()();
	RealColumn get monoIbsTotalRetencao => real().named('mono_ibs_total_retencao').nullable()();
	RealColumn get monoCbsTotalRetencao => real().named('mono_cbs_total_retencao').nullable()();
	RealColumn get monoIbsRetido => real().named('mono_ibs_retido').nullable()();
	RealColumn get monoCbsRetido => real().named('mono_cbs_retido').nullable()();
	RealColumn get valorTotalNfe => real().named('valor_total_nfe').nullable()();
	RealColumn get totalQtdeTributadaMono => real().named('total_qtde_tributada_mono').nullable()();
	RealColumn get totalIcmsMono => real().named('total_icms_mono').nullable()();
	RealColumn get totalQuantidadeMonoRetencao => real().named('total_quantidade_mono_retencao').nullable()();
	RealColumn get totalIcmsMonoRetencao => real().named('total_icms_mono_retencao').nullable()();
	RealColumn get totalQuantidadeMonoRetida => real().named('total_quantidade_mono_retida').nullable()();
	RealColumn get totalIcmsMonoRetido => real().named('total_icms_mono_retido').nullable()();
	RealColumn get ibsValorTotal => real().named('ibs_valor_total').nullable()();
	RealColumn get totalCreditoPresumido => real().named('total_credito_presumido').nullable()();
	RealColumn get totalCredPresSuspensivo => real().named('total_cred_pres_suspensivo').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeCabecalhoGrouped {
	NfeCabecalho? nfeCabecalho; 
	NfeEmitente? nfeEmitente; 
	NfeDestinatario? nfeDestinatario; 
	NfeLocalRetirada? nfeLocalRetirada; 
	NfeLocalEntrega? nfeLocalEntrega; 
	NfeResponsavelTecnico? nfeResponsavelTecnico; 
	NfeCana? nfeCana; 
	NfeFatura? nfeFatura; 
	NfeTransporte? nfeTransporte; 
	NfeCompraGovernamental? nfeCompraGovernamental; 
	TributOperacaoFiscal? tributOperacaoFiscal; 
	VendaCabecalho? vendaCabecalho; 
	ViewPessoaCliente? viewPessoaCliente; 
	ViewPessoaColaborador? viewPessoaColaborador; 
	ViewPessoaFornecedor? viewPessoaFornecedor; 
	List<NfeCupomFiscalReferenciadoGrouped>? nfeCupomFiscalReferenciadoGroupedList; 
	List<NfeCteReferenciadoGrouped>? nfeCteReferenciadoGroupedList; 
	List<NfeAntecipacaoPagamentoGrouped>? nfeAntecipacaoPagamentoGroupedList; 
	List<NfeInformacaoAgropecuarioGrouped>? nfeInformacaoAgropecuarioGroupedList; 
	List<NfeReferenciadaGrouped>? nfeReferenciadaGroupedList; 
	List<NfeProdRuralReferenciadaGrouped>? nfeProdRuralReferenciadaGroupedList; 
	List<NfeNfReferenciadaGrouped>? nfeNfReferenciadaGroupedList; 
	List<NfeProcessoReferenciadoGrouped>? nfeProcessoReferenciadoGroupedList; 
	List<NfeAcessoXmlGrouped>? nfeAcessoXmlGroupedList; 
	List<NfeInformacaoPagamentoGrouped>? nfeInformacaoPagamentoGroupedList; 
	List<NfeDetalheGrouped>? nfeDetalheGroupedList; 

  NfeCabecalhoGrouped({
		this.nfeCabecalho, 
		this.nfeEmitente, 
		this.nfeDestinatario, 
		this.nfeLocalRetirada, 
		this.nfeLocalEntrega, 
		this.nfeResponsavelTecnico, 
		this.nfeCana, 
		this.nfeFatura, 
		this.nfeTransporte, 
		this.nfeCompraGovernamental, 
		this.nfeReferenciadaGroupedList, 
		this.nfeProdRuralReferenciadaGroupedList, 
		this.nfeNfReferenciadaGroupedList, 
		this.nfeProcessoReferenciadoGroupedList, 
		this.nfeAcessoXmlGroupedList, 
		this.nfeInformacaoPagamentoGroupedList, 
		this.tributOperacaoFiscal, 
		this.vendaCabecalho, 
		this.viewPessoaCliente, 
		this.viewPessoaColaborador, 
		this.viewPessoaFornecedor, 
		this.nfeCupomFiscalReferenciadoGroupedList, 
		this.nfeCteReferenciadoGroupedList, 
		this.nfeAntecipacaoPagamentoGroupedList, 
		this.nfeInformacaoAgropecuarioGroupedList, 
		this.nfeDetalheGroupedList, 

  });
}
