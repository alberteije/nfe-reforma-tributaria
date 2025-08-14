import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'database.g.dart';

@DriftDatabase(
	tables: [
		Produtos,
		NfeReferenciadas,
		NfeEmitentes,
		NfeDestinatarios,
		NfeLocalRetiradas,
		NfeLocalEntregas,
		NfeDetEspecificoVeiculos,
		NfeDetEspecificoMedicamentos,
		NfeDetEspecificoArmamentos,
		NfeDuplicatas,
		NfeDeclaracaoImportacaos,
		NfeCanaFornecimentoDiarios,
		NfeCanaDeducoesSafras,
		NfeCupomFiscalReferenciados,
		NfeProdRuralReferenciadas,
		NfeNfReferenciadas,
		NfeDetalheImpostoIcmss,
		NfeDetalheImpostoIpis,
		NfeDetalheImpostoIis,
		NfeDetalheImpostoPiss,
		NfeDetalheImpostoCofinss,
		NfeDetalheImpostoIssqns,
		NfeTransporteReboques,
		NfeTransporteVolumeLacres,
		NfeProcessoReferenciados,
		NfeCteReferenciados,
		NfeAcessoXmls,
		NfeExportacaos,
		NfeInformacaoPagamentos,
		NfeItemRastreados,
		NfeDetalheImpostoPisSts,
		NfeDetalheImpostoIcmsUfdests,
		NfeDetalheImpostoCofinsSts,
		NfeResponsavelTecnicos,
		NfeCompraGovernamentals,
		NfeAntecipacaoPagamentos,
		NfeDetalheImpostoSeletivos,
		NfeDetalheImpostoIbsUfs,
		NfeDetalheImpostoIbsMuns,
		NfeDetalheImpostoCbss,
		NfeDetalheTributoRegulars,
		NfeDetalheCreditoPresumidoIbss,
		NfeDetalheCreditoPresumidoCbss,
		NfeDetalheCompraGovernos,
		NfeDetalheImpostoMonofasicos,
		NfeDetalheTransfCreditos,
		NfeDetalheIbsZfms,
		NfeDetalheDfeReferenciados,
		NfeDetCombustivelOrigems,
		NfeInformacaoAgropecuarios,
		ProdutoGrupos,
		ProdutoSubgrupos,
		ProdutoMarcas,
		ProdutoUnidades,
		NfeCabecalhos,
		NfeDetalhes,
		NfeDetEspecificoCombustivels,
		NfeTransportes,
		NfeFaturas,
		NfeCanas,
		NfeTransporteVolumes,
		TributOperacaoFiscals,
		VendaCabecalhos,
		NfeImportacaoDetalhes,
		NfeNumeros,
		NfeConfiguracaos,
		NfeNumeroInutilizados,
		ViewControleAcessos,
		ViewPessoaUsuarios,
		ViewPessoaClientes,
		ViewPessoaFornecedors,
		ViewPessoaColaboradors,
		ViewPessoaVendedors,
		ViewPessoaTransportadoras,
 ], 
	daos: [
		ProdutoGrupoDao,
		ProdutoSubgrupoDao,
		ProdutoMarcaDao,
		ProdutoUnidadeDao,
		NfeCabecalhoDao,
		NfeDetalheDao,
		NfeDetEspecificoCombustivelDao,
		NfeTransporteDao,
		NfeFaturaDao,
		NfeCanaDao,
		NfeTransporteVolumeDao,
		TributOperacaoFiscalDao,
		VendaCabecalhoDao,
		NfeImportacaoDetalheDao,
		NfeNumeroDao,
		NfeConfiguracaoDao,
		NfeNumeroInutilizadoDao,
		ViewControleAcessoDao,
		ViewPessoaUsuarioDao,
		ViewPessoaClienteDao,
		ViewPessoaFornecedorDao,
		ViewPessoaColaboradorDao,
		ViewPessoaVendedorDao,
		ViewPessoaTransportadoraDao,
	],
)

class AppDatabase extends _$AppDatabase {
	AppDatabase(QueryExecutor executor) : super(executor);

	@override
	int get schemaVersion => 1;

	@override
	MigrationStrategy get migration => MigrationStrategy(
		onCreate: (Migrator m) async {
			await m.createAll();
			await _populateDatabase(this);
		},		
	);	
}

Future<void> _populateDatabase(db) async {
	await db.customStatement("CREATE TABLE HIDDEN_SETTINGS("
				"ID INTEGER PRIMARY KEY,"
				"APP_THEME TEXT"
			")");
	await db.customStatement("INSERT INTO HIDDEN_SETTINGS (ID, APP_THEME) VALUES (1, 'ThemeMode.light')");
  await db.customStatement("INSERT INTO VIEW_PESSOA_CLIENTE (ID, NOME) VALUES (1, 'CLIENTE TESTE')");
  await db.customStatement("INSERT INTO VIEW_PESSOA_COLABORADOR (ID, NOME) VALUES (1, 'COLABORADOR TESTE')");
  await db.customStatement("INSERT INTO VIEW_PESSOA_FORNECEDOR (ID, NOME) VALUES (1, 'FORNECEDOR TESTE')");
  await db.customStatement("INSERT INTO TRIBUT_OPERACAO_FISCAL (ID, DESCRICAO) VALUES (1, 'OPERACAO FISCAL TESTE')");
  await db.customStatement("INSERT INTO PRODUTO (ID, NOME) VALUES (1, 'PRODUTO TESTE')");
}
