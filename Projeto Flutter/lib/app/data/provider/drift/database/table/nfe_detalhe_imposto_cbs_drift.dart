import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheImpostoCbs")
class NfeDetalheImpostoCbss extends Table {
	@override
	String get tableName => 'nfe_detalhe_imposto_cbs';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	TextColumn get cst => text().named('cst').withLength(min: 0, max: 3).nullable()();
	TextColumn get codigoClassificacaoTributaria => text().named('codigo_classificacao_tributaria').withLength(min: 0, max: 6).nullable()();
	RealColumn get valorBaseCalculo => real().named('valor_base_calculo').nullable()();
	RealColumn get aliquota => real().named('aliquota').nullable()();
	RealColumn get percentualDiferimento => real().named('percentual_diferimento').nullable()();
	RealColumn get valorDiferimento => real().named('valor_diferimento').nullable()();
	RealColumn get valorTributoDevolvido => real().named('valor_tributo_devolvido').nullable()();
	RealColumn get percentualReducaoAliquota => real().named('percentual_reducao_aliquota').nullable()();
	RealColumn get aliquotaEfetiva => real().named('aliquota_efetiva').nullable()();
	RealColumn get valor => real().named('valor').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheImpostoCbsGrouped {
	NfeDetalheImpostoCbs? nfeDetalheImpostoCbs; 

  NfeDetalheImpostoCbsGrouped({
		this.nfeDetalheImpostoCbs, 

  });
}
