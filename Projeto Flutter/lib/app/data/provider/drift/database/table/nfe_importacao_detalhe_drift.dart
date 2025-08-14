import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeImportacaoDetalhe")
class NfeImportacaoDetalhes extends Table {
	@override
	String get tableName => 'nfe_importacao_detalhe';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeDeclaracaoImportacao => integer().named('id_nfe_declaracao_importacao').nullable()();
	IntColumn get numeroAdicao => integer().named('numero_adicao').nullable()();
	IntColumn get numeroSequencial => integer().named('numero_sequencial').nullable()();
	TextColumn get codigoFabricanteEstrangeiro => text().named('codigo_fabricante_estrangeiro').withLength(min: 0, max: 60).nullable()();
	RealColumn get valorDesconto => real().named('valor_desconto').nullable()();
	TextColumn get drawback => text().named('drawback').withLength(min: 0, max: 20).nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeImportacaoDetalheGrouped {
	NfeImportacaoDetalhe? nfeImportacaoDetalhe; 
	NfeDeclaracaoImportacao? nfeDeclaracaoImportacao; 

  NfeImportacaoDetalheGrouped({
		this.nfeImportacaoDetalhe, 
		this.nfeDeclaracaoImportacao, 

  });
}
