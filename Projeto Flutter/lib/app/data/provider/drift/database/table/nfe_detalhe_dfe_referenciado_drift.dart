import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheDfeReferenciado")
class NfeDetalheDfeReferenciados extends Table {
	@override
	String get tableName => 'nfe_detalhe_dfe_referenciado';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	TextColumn get chaveAcesso => text().named('chave_acesso').withLength(min: 0, max: 44).nullable()();
	IntColumn get numeroItem => integer().named('numero_item').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheDfeReferenciadoGrouped {
	NfeDetalheDfeReferenciado? nfeDetalheDfeReferenciado; 

  NfeDetalheDfeReferenciadoGrouped({
		this.nfeDetalheDfeReferenciado, 

  });
}
