import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeInformacaoAgropecuario")
class NfeInformacaoAgropecuarios extends Table {
	@override
	String get tableName => 'nfe_informacao_agropecuario';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeCabecalho => integer().named('id_nfe_cabecalho').nullable()();
	TextColumn get numeroReceituario => text().named('numero_receituario').withLength(min: 0, max: 30).nullable()();
	TextColumn get cpfResponsavelTecnico => text().named('cpf_responsavel_tecnico').withLength(min: 0, max: 11).nullable()();
	TextColumn get guiaTipo => text().named('guia_tipo').withLength(min: 0, max: 1).nullable()();
	TextColumn get guiaUfEmissao => text().named('guia_uf_emissao').withLength(min: 0, max: 2).nullable()();
	TextColumn get guiaSerie => text().named('guia_serie').withLength(min: 0, max: 9).nullable()();
	TextColumn get guiaNumero => text().named('guia_numero').withLength(min: 0, max: 9).nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeInformacaoAgropecuarioGrouped {
	NfeInformacaoAgropecuario? nfeInformacaoAgropecuario; 

  NfeInformacaoAgropecuarioGrouped({
		this.nfeInformacaoAgropecuario, 

  });
}
