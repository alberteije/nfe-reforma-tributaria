import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

@DataClassName("NfeDetalhe")
class NfeDetalhes extends Table {
	@override
	String get tableName => 'nfe_detalhe';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeCabecalho => integer().named('id_nfe_cabecalho').nullable()();
	IntColumn get idProduto => integer().named('id_produto').nullable()();
	IntColumn get numeroItem => integer().named('numero_item').nullable()();
	TextColumn get codigoProduto => text().named('codigo_produto').withLength(min: 0, max: 60).nullable()();
	TextColumn get gtin => text().named('gtin').withLength(min: 0, max: 14).nullable()();
	TextColumn get nomeProduto => text().named('nome_produto').withLength(min: 0, max: 120).nullable()();
	TextColumn get ncm => text().named('ncm').withLength(min: 0, max: 8).nullable()();
	TextColumn get nve => text().named('nve').withLength(min: 0, max: 6).nullable()();
	TextColumn get cest => text().named('cest').withLength(min: 0, max: 7).nullable()();
	TextColumn get indicadorEscalaRelevante => text().named('indicador_escala_relevante').withLength(min: 0, max: 1).nullable()();
	TextColumn get cnpjFabricante => text().named('cnpj_fabricante').withLength(min: 0, max: 14).nullable()();
	TextColumn get codigoBeneficioFiscal => text().named('codigo_beneficio_fiscal').withLength(min: 0, max: 10).nullable()();
	IntColumn get exTipi => integer().named('ex_tipi').nullable()();
	IntColumn get cfop => integer().named('cfop').nullable()();
	TextColumn get unidadeComercial => text().named('unidade_comercial').withLength(min: 0, max: 6).nullable()();
	RealColumn get quantidadeComercial => real().named('quantidade_comercial').nullable()();
	TextColumn get numeroPedidoCompra => text().named('numero_pedido_compra').withLength(min: 0, max: 15).nullable()();
	IntColumn get itemPedidoCompra => integer().named('item_pedido_compra').nullable()();
	TextColumn get numeroFci => text().named('numero_fci').withLength(min: 0, max: 36).nullable()();
	TextColumn get numeroRecopi => text().named('numero_recopi').withLength(min: 0, max: 20).nullable()();
	RealColumn get valorUnitarioComercial => real().named('valor_unitario_comercial').nullable()();
	RealColumn get valorBrutoProduto => real().named('valor_bruto_produto').nullable()();
	TextColumn get gtinUnidadeTributavel => text().named('gtin_unidade_tributavel').withLength(min: 0, max: 14).nullable()();
	TextColumn get unidadeTributavel => text().named('unidade_tributavel').withLength(min: 0, max: 6).nullable()();
	RealColumn get quantidadeTributavel => real().named('quantidade_tributavel').nullable()();
	RealColumn get valorUnitarioTributavel => real().named('valor_unitario_tributavel').nullable()();
	RealColumn get valorFrete => real().named('valor_frete').nullable()();
	RealColumn get valorSeguro => real().named('valor_seguro').nullable()();
	RealColumn get valorDesconto => real().named('valor_desconto').nullable()();
	RealColumn get valorOutrasDespesas => real().named('valor_outras_despesas').nullable()();
	TextColumn get entraTotal => text().named('entra_total').withLength(min: 0, max: 1).nullable()();
	RealColumn get valorTotalTributos => real().named('valor_total_tributos').nullable()();
	RealColumn get percentualDevolvido => real().named('percentual_devolvido').nullable()();
	RealColumn get valorIpiDevolvido => real().named('valor_ipi_devolvido').nullable()();
	TextColumn get informacoesAdicionais => text().named('informacoes_adicionais').nullable()();
	RealColumn get valorSubtotal => real().named('valor_subtotal').nullable()();
	RealColumn get valorTotal => real().named('valor_total').nullable()();
	TextColumn get indicadorBemMovelUsado => text().named('indicador_bem_movel_usado').withLength(min: 0, max: 1).nullable()();
	TextColumn get codigoBarraDifGtin => text().named('codigo_barra_dif_gtin').withLength(min: 0, max: 30).nullable()();
	TextColumn get codigoBarraTribDifGtin => text().named('codigo_barra_trib_dif_gtin').withLength(min: 0, max: 30).nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheGrouped {
	NfeDetalhe? nfeDetalhe; 
	NfeDetEspecificoVeiculo? nfeDetEspecificoVeiculo; 
	NfeDetEspecificoMedicamento? nfeDetEspecificoMedicamento; 
	NfeDetEspecificoCombustivel? nfeDetEspecificoCombustivel; 
	NfeDetalheImpostoIpi? nfeDetalheImpostoIpi; 
	NfeDetalheImpostoIi? nfeDetalheImpostoIi; 
	NfeDetalheImpostoPis? nfeDetalheImpostoPis; 
	NfeDetalheImpostoPisSt? nfeDetalheImpostoPisSt; 
	NfeDetalheImpostoCofins? nfeDetalheImpostoCofins; 
	NfeDetalheImpostoCofinsSt? nfeDetalheImpostoCofinsSt; 
	NfeDetalheImpostoIssqn? nfeDetalheImpostoIssqn; 
	NfeDetalheImpostoIcmsUfdest? nfeDetalheImpostoIcmsUfdest; 
	NfeDetalheImpostoSeletivo? nfeDetalheImpostoSeletivo; 
	NfeDetalheImpostoIbsUf? nfeDetalheImpostoIbsUf; 
	NfeDetalheImpostoIbsMun? nfeDetalheImpostoIbsMun; 
	NfeDetalheImpostoCbs? nfeDetalheImpostoCbs; 
	NfeDetalheTributoRegular? nfeDetalheTributoRegular; 
	NfeDetalheCreditoPresumidoIbs? nfeDetalheCreditoPresumidoIbs; 
	NfeDetalheCreditoPresumidoCbs? nfeDetalheCreditoPresumidoCbs; 
	NfeDetalheCompraGoverno? nfeDetalheCompraGoverno; 
	NfeDetalheImpostoMonofasico? nfeDetalheImpostoMonofasico; 
	NfeDetalheTransfCredito? nfeDetalheTransfCredito; 
	NfeDetalheIbsZfm? nfeDetalheIbsZfm; 
	NfeDetalheImpostoIcms? nfeDetalheImpostoIcms; 
	NfeDetalheDfeReferenciado? nfeDetalheDfeReferenciado; 
	List<NfeDetEspecificoArmamentoGrouped>? nfeDetEspecificoArmamentoGroupedList; 
	List<NfeDeclaracaoImportacaoGrouped>? nfeDeclaracaoImportacaoGroupedList; 
	List<NfeExportacaoGrouped>? nfeExportacaoGroupedList; 
	List<NfeItemRastreadoGrouped>? nfeItemRastreadoGroupedList; 
	Produto? produto; 
	NfeCabecalho? nfeCabecalho; 

  NfeDetalheGrouped({
		this.nfeDetalhe, 
		this.nfeDetEspecificoVeiculo, 
		this.nfeDetEspecificoMedicamento, 
		this.nfeDetEspecificoCombustivel, 
		this.nfeDetalheImpostoIpi, 
		this.nfeDetalheImpostoIi, 
		this.nfeDetalheImpostoPis, 
		this.nfeDetalheImpostoPisSt, 
		this.nfeDetalheImpostoCofins, 
		this.nfeDetalheImpostoCofinsSt, 
		this.nfeDetalheImpostoIssqn, 
		this.nfeDetalheImpostoIcmsUfdest, 
		this.nfeDetalheImpostoSeletivo, 
		this.nfeDetalheImpostoIbsUf, 
		this.nfeDetalheImpostoIbsMun, 
		this.nfeDetalheImpostoCbs, 
		this.nfeDetalheTributoRegular, 
		this.nfeDetalheCreditoPresumidoIbs, 
		this.nfeDetalheCreditoPresumidoCbs, 
		this.nfeDetalheCompraGoverno, 
		this.nfeDetalheImpostoMonofasico, 
		this.nfeDetalheTransfCredito, 
		this.nfeDetalheIbsZfm, 
		this.nfeDetalheImpostoIcms, 
		this.nfeDetalheDfeReferenciado, 
		this.nfeDetEspecificoArmamentoGroupedList, 
		this.nfeDeclaracaoImportacaoGroupedList, 
		this.nfeExportacaoGroupedList, 
		this.nfeItemRastreadoGroupedList, 
		this.produto, 
		this.nfeCabecalho, 

  });
}
