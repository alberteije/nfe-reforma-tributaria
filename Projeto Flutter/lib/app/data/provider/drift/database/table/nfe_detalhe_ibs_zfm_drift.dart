import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheIbsZfm")
class NfeDetalheIbsZfms extends Table {
	@override
	String get tableName => 'nfe_detalhe_ibs_zfm';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	TextColumn get tipoCredito => text().named('tipo_credito').withLength(min: 0, max: 1).nullable()();
	RealColumn get valorCredito => real().named('valor_credito').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheIbsZfmGrouped {
	NfeDetalheIbsZfm? nfeDetalheIbsZfm; 

  NfeDetalheIbsZfmGrouped({
		this.nfeDetalheIbsZfm, 

  });
}
