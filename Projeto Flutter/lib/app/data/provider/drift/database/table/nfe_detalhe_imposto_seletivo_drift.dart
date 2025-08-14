import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheImpostoSeletivo")
class NfeDetalheImpostoSeletivos extends Table {
	@override
	String get tableName => 'nfe_detalhe_imposto_seletivo';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	TextColumn get cst => text().named('cst').withLength(min: 0, max: 3).nullable()();
	TextColumn get codigoClassificacaoTributaria => text().named('codigo_classificacao_tributaria').withLength(min: 0, max: 6).nullable()();
	RealColumn get valorBaseCalculo => real().named('valor_base_calculo').nullable()();
	RealColumn get aliquota => real().named('aliquota').nullable()();
	RealColumn get aliquotaEspecifica => real().named('aliquota_especifica').nullable()();
	TextColumn get unidadeTributavel => text().named('unidade_tributavel').withLength(min: 0, max: 6).nullable()();
	RealColumn get quantidadeTributavel => real().named('quantidade_tributavel').nullable()();
	RealColumn get valor => real().named('valor').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheImpostoSeletivoGrouped {
	NfeDetalheImpostoSeletivo? nfeDetalheImpostoSeletivo; 

  NfeDetalheImpostoSeletivoGrouped({
		this.nfeDetalheImpostoSeletivo, 

  });
}
