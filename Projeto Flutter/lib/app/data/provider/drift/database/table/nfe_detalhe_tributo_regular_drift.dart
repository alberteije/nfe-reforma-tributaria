import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheTributoRegular")
class NfeDetalheTributoRegulars extends Table {
	@override
	String get tableName => 'nfe_detalhe_tributo_regular';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	TextColumn get cst => text().named('cst').withLength(min: 0, max: 3).nullable()();
	TextColumn get codigoClassificacaoTributaria => text().named('codigo_classificacao_tributaria').withLength(min: 0, max: 6).nullable()();
	RealColumn get aliquotaIbsUf => real().named('aliquota_ibs_uf').nullable()();
	RealColumn get valorTributoIbsUf => real().named('valor_tributo_ibs_uf').nullable()();
	RealColumn get aliquotaIbsMun => real().named('aliquota_ibs_mun').nullable()();
	RealColumn get valorTributoIbsMun => real().named('valor_tributo_ibs_mun').nullable()();
	RealColumn get alquotaCbs => real().named('alquota_cbs').nullable()();
	RealColumn get valorTributoCbs => real().named('valor_tributo_cbs').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheTributoRegularGrouped {
	NfeDetalheTributoRegular? nfeDetalheTributoRegular; 

  NfeDetalheTributoRegularGrouped({
		this.nfeDetalheTributoRegular, 

  });
}
