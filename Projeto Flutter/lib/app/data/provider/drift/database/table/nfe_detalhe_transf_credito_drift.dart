import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheTransfCredito")
class NfeDetalheTransfCreditos extends Table {
	@override
	String get tableName => 'nfe_detalhe_transf_credito';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	RealColumn get valorIbs => real().named('valor_ibs').nullable()();
	RealColumn get valorCbs => real().named('valor_cbs').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheTransfCreditoGrouped {
	NfeDetalheTransfCredito? nfeDetalheTransfCredito; 

  NfeDetalheTransfCreditoGrouped({
		this.nfeDetalheTransfCredito, 

  });
}
