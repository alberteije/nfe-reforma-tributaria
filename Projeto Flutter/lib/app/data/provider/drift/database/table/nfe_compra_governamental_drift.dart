import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeCompraGovernamental")
class NfeCompraGovernamentals extends Table {
	@override
	String get tableName => 'nfe_compra_governamental';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeCabecalho => integer().named('id_nfe_cabecalho').nullable()();
	TextColumn get tipoEnte => text().named('tipo_ente').withLength(min: 0, max: 1).nullable()();
	RealColumn get percentualReducao => real().named('percentual_reducao').nullable()();
	TextColumn get tipoOperacao => text().named('tipo_operacao').withLength(min: 0, max: 1).nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeCompraGovernamentalGrouped {
	NfeCompraGovernamental? nfeCompraGovernamental; 

  NfeCompraGovernamentalGrouped({
		this.nfeCompraGovernamental, 

  });
}
