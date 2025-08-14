import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'nfe_cabecalho_dao.g.dart';

@DriftAccessor(tables: [
	NfeCabecalhos,
	NfeEmitentes,
	NfeDestinatarios,
	NfeLocalRetiradas,
	NfeLocalEntregas,
	NfeResponsavelTecnicos,
	NfeCanas,
	NfeFaturas,
	NfeTransportes,
	NfeCompraGovernamentals,
	NfeReferenciadas,
	NfeProdRuralReferenciadas,
	NfeNfReferenciadas,
	NfeProcessoReferenciados,
	NfeAcessoXmls,
	NfeInformacaoPagamentos,
	TributOperacaoFiscals,
	VendaCabecalhos,
	ViewPessoaClientes,
	ViewPessoaColaboradors,
	ViewPessoaFornecedors,
	NfeCupomFiscalReferenciados,
	NfeCteReferenciados,
	NfeAntecipacaoPagamentos,
	NfeInformacaoAgropecuarios,
	NfeDetalhes,
	Produtos,
])
class NfeCabecalhoDao extends DatabaseAccessor<AppDatabase> with _$NfeCabecalhoDaoMixin {
	final AppDatabase db;

	List<NfeCabecalho> nfeCabecalhoList = []; 
	List<NfeCabecalhoGrouped> nfeCabecalhoGroupedList = []; 

	NfeCabecalhoDao(this.db) : super(db);

	Future<List<NfeCabecalho>> getList() async {
		nfeCabecalhoList = await select(nfeCabecalhos).get();
		return nfeCabecalhoList;
	}

	Future<List<NfeCabecalho>> getListFilter(String field, String value) async {
		final query = " $field like '%$value%'";
		final expression = CustomExpression<bool>(query);
		nfeCabecalhoList = await (select(nfeCabecalhos)..where((t) => expression)).get();
		return nfeCabecalhoList;	 
	}

	Future<List<NfeCabecalhoGrouped>> getGroupedList({String? field, dynamic value}) async {
		final query = select(nfeCabecalhos)
			.join([ 
				leftOuterJoin(nfeEmitentes, nfeEmitentes.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeDestinatarios, nfeDestinatarios.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeLocalRetiradas, nfeLocalRetiradas.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeLocalEntregas, nfeLocalEntregas.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeResponsavelTecnicos, nfeResponsavelTecnicos.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeCanas, nfeCanas.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeFaturas, nfeFaturas.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeTransportes, nfeTransportes.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(nfeCompraGovernamentals, nfeCompraGovernamentals.idNfeCabecalho.equalsExp(nfeCabecalhos.id)), 
			]).join([ 
				leftOuterJoin(tributOperacaoFiscals, tributOperacaoFiscals.id.equalsExp(nfeCabecalhos.idTributOperacaoFiscal)), 
			]).join([ 
				leftOuterJoin(vendaCabecalhos, vendaCabecalhos.id.equalsExp(nfeCabecalhos.idVendaCabecalho)), 
			]).join([ 
				leftOuterJoin(viewPessoaClientes, viewPessoaClientes.id.equalsExp(nfeCabecalhos.idCliente)), 
			]).join([ 
				leftOuterJoin(viewPessoaColaboradors, viewPessoaColaboradors.id.equalsExp(nfeCabecalhos.idColaborador)), 
			]).join([ 
				leftOuterJoin(viewPessoaFornecedors, viewPessoaFornecedors.id.equalsExp(nfeCabecalhos.idFornecedor)), 
			]);

		if (field != null && field != '') { 
			final column = nfeCabecalhos.$columns.where(((column) => column.$name == field)).first;
			if (column is TextColumn) {
				query.where((column as TextColumn).like('%$value%'));
			} else if (column is IntColumn) {
				query.where(column.equals(int.tryParse(value) as Object));
			} else if (column is RealColumn) {
				query.where(column.equals(double.tryParse(value) as Object));
			}
		}

		nfeCabecalhoGroupedList = await query.map((row) {
			final nfeCabecalho = row.readTableOrNull(nfeCabecalhos); 
			final nfeEmitente = row.readTableOrNull(nfeEmitentes); 
			final nfeDestinatario = row.readTableOrNull(nfeDestinatarios); 
			final nfeLocalRetirada = row.readTableOrNull(nfeLocalRetiradas); 
			final nfeLocalEntrega = row.readTableOrNull(nfeLocalEntregas); 
			final nfeResponsavelTecnico = row.readTableOrNull(nfeResponsavelTecnicos); 
			final nfeCana = row.readTableOrNull(nfeCanas); 
			final nfeFatura = row.readTableOrNull(nfeFaturas); 
			final nfeTransporte = row.readTableOrNull(nfeTransportes); 
			final nfeCompraGovernamental = row.readTableOrNull(nfeCompraGovernamentals); 
			final tributOperacaoFiscal = row.readTableOrNull(tributOperacaoFiscals); 
			final vendaCabecalho = row.readTableOrNull(vendaCabecalhos); 
			final viewPessoaCliente = row.readTableOrNull(viewPessoaClientes); 
			final viewPessoaColaborador = row.readTableOrNull(viewPessoaColaboradors); 
			final viewPessoaFornecedor = row.readTableOrNull(viewPessoaFornecedors); 

			return NfeCabecalhoGrouped(
				nfeCabecalho: nfeCabecalho, 
				nfeEmitente: nfeEmitente, 
				nfeDestinatario: nfeDestinatario, 
				nfeLocalRetirada: nfeLocalRetirada, 
				nfeLocalEntrega: nfeLocalEntrega, 
				nfeResponsavelTecnico: nfeResponsavelTecnico, 
				nfeCana: nfeCana, 
				nfeFatura: nfeFatura, 
				nfeTransporte: nfeTransporte, 
				nfeCompraGovernamental: nfeCompraGovernamental, 
				tributOperacaoFiscal: tributOperacaoFiscal, 
				vendaCabecalho: vendaCabecalho, 
				viewPessoaCliente: viewPessoaCliente, 
				viewPessoaColaborador: viewPessoaColaborador, 
				viewPessoaFornecedor: viewPessoaFornecedor, 

			);
		}).get();

		// fill internal lists
		dynamic expression;
		for (var nfeCabecalhoGrouped in nfeCabecalhoGroupedList) {
			nfeCabecalhoGrouped.nfeReferenciadaGroupedList = [];
			final queryNfeReferenciada = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeReferenciada);
			final nfeReferenciadaList = await (select(nfeReferenciadas)..where((t) => expression)).get();
			for (var nfeReferenciada in nfeReferenciadaList) {
				NfeReferenciadaGrouped nfeReferenciadaGrouped = NfeReferenciadaGrouped(
					nfeReferenciada: nfeReferenciada,
				);
				nfeCabecalhoGrouped.nfeReferenciadaGroupedList!.add(nfeReferenciadaGrouped);
			}

			nfeCabecalhoGrouped.nfeProdRuralReferenciadaGroupedList = [];
			final queryNfeProdRuralReferenciada = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeProdRuralReferenciada);
			final nfeProdRuralReferenciadaList = await (select(nfeProdRuralReferenciadas)..where((t) => expression)).get();
			for (var nfeProdRuralReferenciada in nfeProdRuralReferenciadaList) {
				NfeProdRuralReferenciadaGrouped nfeProdRuralReferenciadaGrouped = NfeProdRuralReferenciadaGrouped(
					nfeProdRuralReferenciada: nfeProdRuralReferenciada,
				);
				nfeCabecalhoGrouped.nfeProdRuralReferenciadaGroupedList!.add(nfeProdRuralReferenciadaGrouped);
			}

			nfeCabecalhoGrouped.nfeNfReferenciadaGroupedList = [];
			final queryNfeNfReferenciada = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeNfReferenciada);
			final nfeNfReferenciadaList = await (select(nfeNfReferenciadas)..where((t) => expression)).get();
			for (var nfeNfReferenciada in nfeNfReferenciadaList) {
				NfeNfReferenciadaGrouped nfeNfReferenciadaGrouped = NfeNfReferenciadaGrouped(
					nfeNfReferenciada: nfeNfReferenciada,
				);
				nfeCabecalhoGrouped.nfeNfReferenciadaGroupedList!.add(nfeNfReferenciadaGrouped);
			}

			nfeCabecalhoGrouped.nfeProcessoReferenciadoGroupedList = [];
			final queryNfeProcessoReferenciado = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeProcessoReferenciado);
			final nfeProcessoReferenciadoList = await (select(nfeProcessoReferenciados)..where((t) => expression)).get();
			for (var nfeProcessoReferenciado in nfeProcessoReferenciadoList) {
				NfeProcessoReferenciadoGrouped nfeProcessoReferenciadoGrouped = NfeProcessoReferenciadoGrouped(
					nfeProcessoReferenciado: nfeProcessoReferenciado,
				);
				nfeCabecalhoGrouped.nfeProcessoReferenciadoGroupedList!.add(nfeProcessoReferenciadoGrouped);
			}

			nfeCabecalhoGrouped.nfeAcessoXmlGroupedList = [];
			final queryNfeAcessoXml = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeAcessoXml);
			final nfeAcessoXmlList = await (select(nfeAcessoXmls)..where((t) => expression)).get();
			for (var nfeAcessoXml in nfeAcessoXmlList) {
				NfeAcessoXmlGrouped nfeAcessoXmlGrouped = NfeAcessoXmlGrouped(
					nfeAcessoXml: nfeAcessoXml,
				);
				nfeCabecalhoGrouped.nfeAcessoXmlGroupedList!.add(nfeAcessoXmlGrouped);
			}

			nfeCabecalhoGrouped.nfeInformacaoPagamentoGroupedList = [];
			final queryNfeInformacaoPagamento = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeInformacaoPagamento);
			final nfeInformacaoPagamentoList = await (select(nfeInformacaoPagamentos)..where((t) => expression)).get();
			for (var nfeInformacaoPagamento in nfeInformacaoPagamentoList) {
				NfeInformacaoPagamentoGrouped nfeInformacaoPagamentoGrouped = NfeInformacaoPagamentoGrouped(
					nfeInformacaoPagamento: nfeInformacaoPagamento,
				);
				nfeCabecalhoGrouped.nfeInformacaoPagamentoGroupedList!.add(nfeInformacaoPagamentoGrouped);
			}

			nfeCabecalhoGrouped.nfeCupomFiscalReferenciadoGroupedList = [];
			final queryNfeCupomFiscalReferenciado = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeCupomFiscalReferenciado);
			final nfeCupomFiscalReferenciadoList = await (select(nfeCupomFiscalReferenciados)..where((t) => expression)).get();
			for (var nfeCupomFiscalReferenciado in nfeCupomFiscalReferenciadoList) {
				NfeCupomFiscalReferenciadoGrouped nfeCupomFiscalReferenciadoGrouped = NfeCupomFiscalReferenciadoGrouped(
					nfeCupomFiscalReferenciado: nfeCupomFiscalReferenciado,
				);
				nfeCabecalhoGrouped.nfeCupomFiscalReferenciadoGroupedList!.add(nfeCupomFiscalReferenciadoGrouped);
			}

			nfeCabecalhoGrouped.nfeCteReferenciadoGroupedList = [];
			final queryNfeCteReferenciado = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeCteReferenciado);
			final nfeCteReferenciadoList = await (select(nfeCteReferenciados)..where((t) => expression)).get();
			for (var nfeCteReferenciado in nfeCteReferenciadoList) {
				NfeCteReferenciadoGrouped nfeCteReferenciadoGrouped = NfeCteReferenciadoGrouped(
					nfeCteReferenciado: nfeCteReferenciado,
				);
				nfeCabecalhoGrouped.nfeCteReferenciadoGroupedList!.add(nfeCteReferenciadoGrouped);
			}

			nfeCabecalhoGrouped.nfeAntecipacaoPagamentoGroupedList = [];
			final queryNfeAntecipacaoPagamento = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeAntecipacaoPagamento);
			final nfeAntecipacaoPagamentoList = await (select(nfeAntecipacaoPagamentos)..where((t) => expression)).get();
			for (var nfeAntecipacaoPagamento in nfeAntecipacaoPagamentoList) {
				NfeAntecipacaoPagamentoGrouped nfeAntecipacaoPagamentoGrouped = NfeAntecipacaoPagamentoGrouped(
					nfeAntecipacaoPagamento: nfeAntecipacaoPagamento,
				);
				nfeCabecalhoGrouped.nfeAntecipacaoPagamentoGroupedList!.add(nfeAntecipacaoPagamentoGrouped);
			}

			nfeCabecalhoGrouped.nfeInformacaoAgropecuarioGroupedList = [];
			final queryNfeInformacaoAgropecuario = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeInformacaoAgropecuario);
			final nfeInformacaoAgropecuarioList = await (select(nfeInformacaoAgropecuarios)..where((t) => expression)).get();
			for (var nfeInformacaoAgropecuario in nfeInformacaoAgropecuarioList) {
				NfeInformacaoAgropecuarioGrouped nfeInformacaoAgropecuarioGrouped = NfeInformacaoAgropecuarioGrouped(
					nfeInformacaoAgropecuario: nfeInformacaoAgropecuario,
				);
				nfeCabecalhoGrouped.nfeInformacaoAgropecuarioGroupedList!.add(nfeInformacaoAgropecuarioGrouped);
			}

			nfeCabecalhoGrouped.nfeDetalheGroupedList = [];
			final queryNfeDetalhe = ' id_nfe_cabecalho = ${nfeCabecalhoGrouped.nfeCabecalho!.id}';
			expression = CustomExpression<bool>(queryNfeDetalhe);
			final nfeDetalheList = await (select(nfeDetalhes)..where((t) => expression)).get();
			for (var nfeDetalhe in nfeDetalheList) {
				NfeDetalheGrouped nfeDetalheGrouped = NfeDetalheGrouped(
					nfeDetalhe: nfeDetalhe,
					// produto: await (select(produtos)..where((t) => t.id.equals(nfeDetalhe.idProduto!))).getSingleOrNull(),
				);
				nfeCabecalhoGrouped.nfeDetalheGroupedList!.add(nfeDetalheGrouped);
			}

		}		

		return nfeCabecalhoGroupedList;	
	}

	Future<NfeCabecalho?> getObject(dynamic pk) async {
		return await (select(nfeCabecalhos)..where((t) => t.id.equals(pk))).getSingleOrNull();
	} 

	Future<NfeCabecalho?> getObjectFilter(String field, String value) async {
		final query = "SELECT * FROM nfe_cabecalho WHERE $field like '%$value%'";
		return (await customSelect(query).getSingleOrNull()) as NfeCabecalho;		 
	} 

	Future<NfeCabecalhoGrouped?> getObjectGrouped({String? field, dynamic value}) async {
		final result = await getGroupedList(field: field, value: value);

		if (result.length != 1) {
			return null;
		} else {
			return result[0];
		} 
	}

	Future<int> insertObject(NfeCabecalhoGrouped object) {
		return transaction(() async {
			final maxPk = await lastPk();
			object.nfeCabecalho = object.nfeCabecalho!.copyWith(id: Value(maxPk + 1));
			final pkInserted = await into(nfeCabecalhos).insert(object.nfeCabecalho!);
			object.nfeCabecalho = object.nfeCabecalho!.copyWith(id: Value(pkInserted));			 
			await insertChildren(object);
			return pkInserted;
		});		
	}	 

	Future<bool> updateObject(NfeCabecalhoGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			await insertChildren(object);
			return update(nfeCabecalhos).replace(object.nfeCabecalho!);
		});	 
	} 

	Future<int> deleteObject(NfeCabecalhoGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			return delete(nfeCabecalhos).delete(object.nfeCabecalho!);
		});		
	}

	Future<void> insertChildren(NfeCabecalhoGrouped object) async {
		object.nfeEmitente = object.nfeEmitente!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeEmitentes).insert(object.nfeEmitente!);
		object.nfeDestinatario = object.nfeDestinatario!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeDestinatarios).insert(object.nfeDestinatario!);
		object.nfeLocalRetirada = object.nfeLocalRetirada!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeLocalRetiradas).insert(object.nfeLocalRetirada!);
		object.nfeLocalEntrega = object.nfeLocalEntrega!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeLocalEntregas).insert(object.nfeLocalEntrega!);
		object.nfeResponsavelTecnico = object.nfeResponsavelTecnico!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeResponsavelTecnicos).insert(object.nfeResponsavelTecnico!);
		object.nfeCana = object.nfeCana!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeCanas).insert(object.nfeCana!);
		object.nfeFatura = object.nfeFatura!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeFaturas).insert(object.nfeFatura!);
		object.nfeTransporte = object.nfeTransporte!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeTransportes).insert(object.nfeTransporte!);
		object.nfeCompraGovernamental = object.nfeCompraGovernamental!.copyWith(idNfeCabecalho: Value(object.nfeCabecalho!.id));
		await into(nfeCompraGovernamentals).insert(object.nfeCompraGovernamental!);
		for (var nfeReferenciadaGrouped in object.nfeReferenciadaGroupedList!) {
			nfeReferenciadaGrouped.nfeReferenciada = nfeReferenciadaGrouped.nfeReferenciada?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeReferenciadas).insert(nfeReferenciadaGrouped.nfeReferenciada!);
		}
		for (var nfeProdRuralReferenciadaGrouped in object.nfeProdRuralReferenciadaGroupedList!) {
			nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada = nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeProdRuralReferenciadas).insert(nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada!);
		}
		for (var nfeNfReferenciadaGrouped in object.nfeNfReferenciadaGroupedList!) {
			nfeNfReferenciadaGrouped.nfeNfReferenciada = nfeNfReferenciadaGrouped.nfeNfReferenciada?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeNfReferenciadas).insert(nfeNfReferenciadaGrouped.nfeNfReferenciada!);
		}
		for (var nfeProcessoReferenciadoGrouped in object.nfeProcessoReferenciadoGroupedList!) {
			nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado = nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeProcessoReferenciados).insert(nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado!);
		}
		for (var nfeAcessoXmlGrouped in object.nfeAcessoXmlGroupedList!) {
			nfeAcessoXmlGrouped.nfeAcessoXml = nfeAcessoXmlGrouped.nfeAcessoXml?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeAcessoXmls).insert(nfeAcessoXmlGrouped.nfeAcessoXml!);
		}
		for (var nfeInformacaoPagamentoGrouped in object.nfeInformacaoPagamentoGroupedList!) {
			nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento = nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeInformacaoPagamentos).insert(nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento!);
		}
		for (var nfeCupomFiscalReferenciadoGrouped in object.nfeCupomFiscalReferenciadoGroupedList!) {
			nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado = nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeCupomFiscalReferenciados).insert(nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado!);
		}
		for (var nfeCteReferenciadoGrouped in object.nfeCteReferenciadoGroupedList!) {
			nfeCteReferenciadoGrouped.nfeCteReferenciado = nfeCteReferenciadoGrouped.nfeCteReferenciado?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeCteReferenciados).insert(nfeCteReferenciadoGrouped.nfeCteReferenciado!);
		}
		for (var nfeAntecipacaoPagamentoGrouped in object.nfeAntecipacaoPagamentoGroupedList!) {
			nfeAntecipacaoPagamentoGrouped.nfeAntecipacaoPagamento = nfeAntecipacaoPagamentoGrouped.nfeAntecipacaoPagamento?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeAntecipacaoPagamentos).insert(nfeAntecipacaoPagamentoGrouped.nfeAntecipacaoPagamento!);
		}
		for (var nfeInformacaoAgropecuarioGrouped in object.nfeInformacaoAgropecuarioGroupedList!) {
			nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario = nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeInformacaoAgropecuarios).insert(nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario!);
		}
		for (var nfeDetalheGrouped in object.nfeDetalheGroupedList!) {
			nfeDetalheGrouped.nfeDetalhe = nfeDetalheGrouped.nfeDetalhe?.copyWith(
				id: const Value(null),
				idNfeCabecalho: Value(object.nfeCabecalho!.id),
			);
			await into(nfeDetalhes).insert(nfeDetalheGrouped.nfeDetalhe!);
		}
	}
	
	Future<void> deleteChildren(NfeCabecalhoGrouped object) async {
		await (delete(nfeEmitentes)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeDestinatarios)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeLocalRetiradas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeLocalEntregas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeResponsavelTecnicos)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeCanas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeFaturas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeTransportes)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeCompraGovernamentals)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeReferenciadas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeProdRuralReferenciadas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeNfReferenciadas)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeProcessoReferenciados)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeAcessoXmls)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeInformacaoPagamentos)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeCupomFiscalReferenciados)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeCteReferenciados)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeAntecipacaoPagamentos)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeInformacaoAgropecuarios)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
		await (delete(nfeDetalhes)..where((t) => t.idNfeCabecalho.equals(object.nfeCabecalho!.id!))).go();
	}

	Future<int> lastPk() async {
		final result = await customSelect("select MAX(id) as LAST from nfe_cabecalho").getSingleOrNull();
		return result?.data["LAST"] ?? 0;
	} 
}