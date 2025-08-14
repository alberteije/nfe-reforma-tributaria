import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeProdRuralReferenciada")
class NfeProdRuralReferenciadas extends Table {
	@override
	String get tableName => 'nfe_prod_rural_referenciada';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeCabecalho => integer().named('id_nfe_cabecalho').nullable()();
	IntColumn get codigoUf => integer().named('codigo_uf').nullable()();
	TextColumn get anoMes => text().named('ano_mes').withLength(min: 0, max: 4).nullable()();
	TextColumn get cnpj => text().named('cnpj').withLength(min: 0, max: 14).nullable()();
	TextColumn get cpf => text().named('cpf').withLength(min: 0, max: 11).nullable()();
	TextColumn get inscricaoEstadual => text().named('inscricao_estadual').withLength(min: 0, max: 14).nullable()();
	TextColumn get modelo => text().named('modelo').withLength(min: 0, max: 2).nullable()();
	TextColumn get serie => text().named('serie').withLength(min: 0, max: 3).nullable()();
	IntColumn get numeroNf => integer().named('numero_nf').nullable()();
	TextColumn get cte => text().named('cte').withLength(min: 0, max: 44).nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeProdRuralReferenciadaGrouped {
	NfeProdRuralReferenciada? nfeProdRuralReferenciada; 

  NfeProdRuralReferenciadaGrouped({
		this.nfeProdRuralReferenciada, 

  });
}
