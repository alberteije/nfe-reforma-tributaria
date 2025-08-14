import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheCreditoPresumidoIbs")
class NfeDetalheCreditoPresumidoIbss extends Table {
	@override
	String get tableName => 'nfe_detalhe_credito_presumido_ibs';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	TextColumn get codigoClassificacao => text().named('codigo_classificacao').withLength(min: 0, max: 1).nullable()();
	RealColumn get percentual => real().named('percentual').nullable()();
	RealColumn get valor => real().named('valor').nullable()();
	RealColumn get valorSuspensivo => real().named('valor_suspensivo').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheCreditoPresumidoIbsGrouped {
	NfeDetalheCreditoPresumidoIbs? nfeDetalheCreditoPresumidoIbs; 

  NfeDetalheCreditoPresumidoIbsGrouped({
		this.nfeDetalheCreditoPresumidoIbs, 

  });
}
