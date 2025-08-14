import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeDetalheImpostoMonofasico")
class NfeDetalheImpostoMonofasicos extends Table {
	@override
	String get tableName => 'nfe_detalhe_imposto_monofasico';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDetalhe => integer().named('id_nfe_detalhe').nullable()();
	RealColumn get quantidadeTributada => real().named('quantidade_tributada').nullable()();
	RealColumn get aliquotaIbs => real().named('aliquota_ibs').nullable()();
	RealColumn get aliquotaCbs => real().named('aliquota_cbs').nullable()();
	RealColumn get valorIbs => real().named('valor_ibs').nullable()();
	RealColumn get valorCbs => real().named('valor_cbs').nullable()();
	RealColumn get quantidadeTributadaRetencao => real().named('quantidade_tributada_retencao').nullable()();
	RealColumn get aliquotaIbsRetencao => real().named('aliquota_ibs_retencao').nullable()();
	RealColumn get valorIbsRetencao => real().named('valor_ibs_retencao').nullable()();
	RealColumn get aliquotaCbsRetencao => real().named('aliquota_cbs_retencao').nullable()();
	RealColumn get valorCbsRetencao => real().named('valor_cbs_retencao').nullable()();
	RealColumn get quantidadeTributadaRetido => real().named('quantidade_tributada_retido').nullable()();
	RealColumn get aliquotaIbsRetido => real().named('aliquota_ibs_retido').nullable()();
	RealColumn get valorIbsRetido => real().named('valor_ibs_retido').nullable()();
	RealColumn get aliquotaCbsRetido => real().named('aliquota_cbs_retido').nullable()();
	RealColumn get valorCbsRetido => real().named('valor_cbs_retido').nullable()();
	RealColumn get percentualIbsDiferido => real().named('percentual_ibs_diferido').nullable()();
	RealColumn get valorIbsDiferido => real().named('valor_ibs_diferido').nullable()();
	RealColumn get percentualCbsDiferido => real().named('percentual_cbs_diferido').nullable()();
	RealColumn get valorCbsDiferido => real().named('valor_cbs_diferido').nullable()();
	RealColumn get totalIbs => real().named('total_ibs').nullable()();
	RealColumn get totalCbs => real().named('total_cbs').nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeDetalheImpostoMonofasicoGrouped {
	NfeDetalheImpostoMonofasico? nfeDetalheImpostoMonofasico; 

  NfeDetalheImpostoMonofasicoGrouped({
		this.nfeDetalheImpostoMonofasico, 

  });
}
