import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';

@DataClassName("NfeInformacaoPagamento")
class NfeInformacaoPagamentos extends Table {
	@override
	String get tableName => 'nfe_informacao_pagamento';

	IntColumn get id => integer().named('id').nullable()();
	IntColumn get idNfeCabecalho => integer().named('id_nfe_cabecalho').nullable()();
	TextColumn get indicadorPagamento => text().named('indicador_pagamento').withLength(min: 0, max: 1).nullable()();
	TextColumn get meioPagamento => text().named('meio_pagamento').withLength(min: 0, max: 2).nullable()();
	RealColumn get valor => real().named('valor').nullable()();
	TextColumn get tipoIntegracao => text().named('tipo_integracao').withLength(min: 0, max: 1).nullable()();
	TextColumn get cnpjOperadoraCartao => text().named('cnpj_operadora_cartao').withLength(min: 0, max: 14).nullable()();
	TextColumn get bandeira => text().named('bandeira').withLength(min: 0, max: 2).nullable()();
	TextColumn get numeroAutorizacao => text().named('numero_autorizacao').withLength(min: 0, max: 128).nullable()();
	RealColumn get troco => real().named('troco').nullable()();
	TextColumn get descricaoQuandoOutros => text().named('descricao_quando_outros').withLength(min: 0, max: 60).nullable()();
	DateTimeColumn get dataPagamento => dateTime().named('data_pagamento').nullable()();
	TextColumn get cnpjTransacional => text().named('cnpj_transacional').withLength(min: 0, max: 14).nullable()();
	TextColumn get ufCnpjTransacional => text().named('uf_cnpj_transacional').withLength(min: 0, max: 2).nullable()();
	TextColumn get cnpjBeneficiario => text().named('cnpj_beneficiario').withLength(min: 0, max: 14).nullable()();
	TextColumn get idTerminalPagamento => text().named('id_terminal_pagamento').withLength(min: 0, max: 40).nullable()();

	@override
	Set<Column> get primaryKey => { id };	
	
}

class NfeInformacaoPagamentoGrouped {
	NfeInformacaoPagamento? nfeInformacaoPagamento; 

  NfeInformacaoPagamentoGrouped({
		this.nfeInformacaoPagamento, 

  });
}
