import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetCombustivelOrigem")
class NfeDetCombustivelOrigems extends Table {
	@override
	String get tableName => 'nfe_det_combustivel_origem';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetEspecificoCombustivel => integer().named('id_nfe_det_especifico_combustivel').nullable()();
	TextColumn get indicadorImportacao => text().named('indicador_importacao').withLength(min: 0, max: 1).nullable()();
	IntColumn get codigoUf => integer().named('codigo_uf').nullable()();
	RealColumn get percentualOriginario => real().named('percentual_originario').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetCombustivelOrigemGrouped {
	NfeDetCombustivelOrigem? nfeDetCombustivelOrigem; 

  NfeDetCombustivelOrigemGrouped({
		this.nfeDetCombustivelOrigem, 

  });
}
