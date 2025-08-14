import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheCompraGoverno")
class NfeDetalheCompraGovernos extends Table {
	@override
	String get tableName => 'nfe_detalhe_compra_governo';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	RealColumn get aliquotaIbsUf => real().named('aliquota_ibs_uf').nullable()();
	RealColumn get valorIbsUf => real().named('valor_ibs_uf').nullable()();
	RealColumn get aliquotaIbsMun => real().named('aliquota_ibs_mun').nullable()();
	RealColumn get valorIbsMun => real().named('valor_ibs_mun').nullable()();
	RealColumn get aliquotaCbs => real().named('aliquota_cbs').nullable()();
	RealColumn get valorCbs => real().named('valor_cbs').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheCompraGovernoGrouped {
	NfeDetalheCompraGoverno? nfeDetalheCompraGoverno; 

  NfeDetalheCompraGovernoGrouped({
		this.nfeDetalheCompraGoverno, 

  });
}
