import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'nfe_detalhe_dao.g.dart';

@DriftAccessor(tables: [
	NfeDetalhes,
	NfeDetEspecificoVeiculos,
	NfeDetEspecificoMedicamentos,
	NfeDetEspecificoCombustivels,
	NfeDetalheImpostoIpis,
	NfeDetalheImpostoIis,
	NfeDetalheImpostoPiss,
	NfeDetalheImpostoPisSts,
	NfeDetalheImpostoCofinss,
	NfeDetalheImpostoCofinsSts,
	NfeDetalheImpostoIssqns,
	NfeDetalheImpostoIcmsUfdests,
	NfeDetalheImpostoSeletivos,
	NfeDetalheImpostoIbsUfs,
	NfeDetalheImpostoIbsMuns,
	NfeDetalheImpostoCbss,
	NfeDetalheTributoRegulars,
	NfeDetalheCreditoPresumidoIbss,
	NfeDetalheCreditoPresumidoCbss,
	NfeDetalheCompraGovernos,
	NfeDetalheImpostoMonofasicos,
	NfeDetalheTransfCreditos,
	NfeDetalheIbsZfms,
	NfeDetalheImpostoIcmss,
	NfeDetalheDfeReferenciados,
	NfeDetEspecificoArmamentos,
	NfeDeclaracaoImportacaos,
	NfeExportacaos,
	NfeItemRastreados,
	Produtos,
	NfeCabecalhos,
])
class NfeDetalheDao extends DatabaseAccessor<AppDatabase> with _$NfeDetalheDaoMixin {
	final AppDatabase db;

	List<NfeDetalhe> nfeDetalheList = []; 
	List<NfeDetalheGrouped> nfeDetalheGroupedList = []; 

	NfeDetalheDao(this.db) : super(db);

	Future<List<NfeDetalhe>> getList() async {
		nfeDetalheList = await select(nfeDetalhes).get();
		return nfeDetalheList;
	}

	Future<List<NfeDetalhe>> getListFilter(String field, String value) async {
		final query = " $field like '%$value%'";
		final expression = CustomExpression<bool>(query);
		nfeDetalheList = await (select(nfeDetalhes)..where((t) => expression)).get();
		return nfeDetalheList;	 
	}

	Future<List<NfeDetalheGrouped>> getGroupedList({String? field, dynamic value}) async {
		final query = select(nfeDetalhes)
			.join([ 
				leftOuterJoin(nfeDetEspecificoVeiculos, nfeDetEspecificoVeiculos.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetEspecificoMedicamentos, nfeDetEspecificoMedicamentos.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetEspecificoCombustivels, nfeDetEspecificoCombustivels.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIpis, nfeDetalheImpostoIpis.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIis, nfeDetalheImpostoIis.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoPiss, nfeDetalheImpostoPiss.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoPisSts, nfeDetalheImpostoPisSts.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoCofinss, nfeDetalheImpostoCofinss.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoCofinsSts, nfeDetalheImpostoCofinsSts.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIssqns, nfeDetalheImpostoIssqns.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIcmsUfdests, nfeDetalheImpostoIcmsUfdests.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoSeletivos, nfeDetalheImpostoSeletivos.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIbsUfs, nfeDetalheImpostoIbsUfs.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIbsMuns, nfeDetalheImpostoIbsMuns.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoCbss, nfeDetalheImpostoCbss.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheTributoRegulars, nfeDetalheTributoRegulars.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheCreditoPresumidoIbss, nfeDetalheCreditoPresumidoIbss.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheCreditoPresumidoCbss, nfeDetalheCreditoPresumidoCbss.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheCompraGovernos, nfeDetalheCompraGovernos.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoMonofasicos, nfeDetalheImpostoMonofasicos.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheTransfCreditos, nfeDetalheTransfCreditos.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheIbsZfms, nfeDetalheIbsZfms.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheImpostoIcmss, nfeDetalheImpostoIcmss.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(nfeDetalheDfeReferenciados, nfeDetalheDfeReferenciados.idNfeDetalhe.equalsExp(nfeDetalhes.id)), 
			]).join([ 
				leftOuterJoin(produtos, produtos.id.equalsExp(nfeDetalhes.idProduto)), 
			]).join([ 
				leftOuterJoin(nfeCabecalhos, nfeCabecalhos.id.equalsExp(nfeDetalhes.idNfeCabecalho)), 
			]);

		if (field != null && field != '') { 
			final column = nfeDetalhes.$columns.where(((column) => column.$name == field)).first;
			if (column is TextColumn) {
				query.where((column as TextColumn).like('%$value%'));
			} else if (column is IntColumn) {
				query.where(column.equals(int.tryParse(value) as Object));
			} else if (column is RealColumn) {
				query.where(column.equals(double.tryParse(value) as Object));
			}
		}

		nfeDetalheGroupedList = await query.map((row) {
			final nfeDetalhe = row.readTableOrNull(nfeDetalhes); 
			final nfeDetEspecificoVeiculo = row.readTableOrNull(nfeDetEspecificoVeiculos); 
			final nfeDetEspecificoMedicamento = row.readTableOrNull(nfeDetEspecificoMedicamentos); 
			final nfeDetEspecificoCombustivel = row.readTableOrNull(nfeDetEspecificoCombustivels); 
			final nfeDetalheImpostoIpi = row.readTableOrNull(nfeDetalheImpostoIpis); 
			final nfeDetalheImpostoIi = row.readTableOrNull(nfeDetalheImpostoIis); 
			final nfeDetalheImpostoPis = row.readTableOrNull(nfeDetalheImpostoPiss); 
			final nfeDetalheImpostoPisSt = row.readTableOrNull(nfeDetalheImpostoPisSts); 
			final nfeDetalheImpostoCofins = row.readTableOrNull(nfeDetalheImpostoCofinss); 
			final nfeDetalheImpostoCofinsSt = row.readTableOrNull(nfeDetalheImpostoCofinsSts); 
			final nfeDetalheImpostoIssqn = row.readTableOrNull(nfeDetalheImpostoIssqns); 
			final nfeDetalheImpostoIcmsUfdest = row.readTableOrNull(nfeDetalheImpostoIcmsUfdests); 
			final nfeDetalheImpostoSeletivo = row.readTableOrNull(nfeDetalheImpostoSeletivos); 
			final nfeDetalheImpostoIbsUf = row.readTableOrNull(nfeDetalheImpostoIbsUfs); 
			final nfeDetalheImpostoIbsMun = row.readTableOrNull(nfeDetalheImpostoIbsMuns); 
			final nfeDetalheImpostoCbs = row.readTableOrNull(nfeDetalheImpostoCbss); 
			final nfeDetalheTributoRegular = row.readTableOrNull(nfeDetalheTributoRegulars); 
			final nfeDetalheCreditoPresumidoIbs = row.readTableOrNull(nfeDetalheCreditoPresumidoIbss); 
			final nfeDetalheCreditoPresumidoCbs = row.readTableOrNull(nfeDetalheCreditoPresumidoCbss); 
			final nfeDetalheCompraGoverno = row.readTableOrNull(nfeDetalheCompraGovernos); 
			final nfeDetalheImpostoMonofasico = row.readTableOrNull(nfeDetalheImpostoMonofasicos); 
			final nfeDetalheTransfCredito = row.readTableOrNull(nfeDetalheTransfCreditos); 
			final nfeDetalheIbsZfm = row.readTableOrNull(nfeDetalheIbsZfms); 
			final nfeDetalheImpostoIcms = row.readTableOrNull(nfeDetalheImpostoIcmss); 
			final nfeDetalheDfeReferenciado = row.readTableOrNull(nfeDetalheDfeReferenciados); 
			final produto = row.readTableOrNull(produtos); 
			final nfeCabecalho = row.readTableOrNull(nfeCabecalhos); 

			return NfeDetalheGrouped(
				nfeDetalhe: nfeDetalhe, 
				nfeDetEspecificoVeiculo: nfeDetEspecificoVeiculo, 
				nfeDetEspecificoMedicamento: nfeDetEspecificoMedicamento, 
				nfeDetEspecificoCombustivel: nfeDetEspecificoCombustivel, 
				nfeDetalheImpostoIpi: nfeDetalheImpostoIpi, 
				nfeDetalheImpostoIi: nfeDetalheImpostoIi, 
				nfeDetalheImpostoPis: nfeDetalheImpostoPis, 
				nfeDetalheImpostoPisSt: nfeDetalheImpostoPisSt, 
				nfeDetalheImpostoCofins: nfeDetalheImpostoCofins, 
				nfeDetalheImpostoCofinsSt: nfeDetalheImpostoCofinsSt, 
				nfeDetalheImpostoIssqn: nfeDetalheImpostoIssqn, 
				nfeDetalheImpostoIcmsUfdest: nfeDetalheImpostoIcmsUfdest, 
				nfeDetalheImpostoSeletivo: nfeDetalheImpostoSeletivo, 
				nfeDetalheImpostoIbsUf: nfeDetalheImpostoIbsUf, 
				nfeDetalheImpostoIbsMun: nfeDetalheImpostoIbsMun, 
				nfeDetalheImpostoCbs: nfeDetalheImpostoCbs, 
				nfeDetalheTributoRegular: nfeDetalheTributoRegular, 
				nfeDetalheCreditoPresumidoIbs: nfeDetalheCreditoPresumidoIbs, 
				nfeDetalheCreditoPresumidoCbs: nfeDetalheCreditoPresumidoCbs, 
				nfeDetalheCompraGoverno: nfeDetalheCompraGoverno, 
				nfeDetalheImpostoMonofasico: nfeDetalheImpostoMonofasico, 
				nfeDetalheTransfCredito: nfeDetalheTransfCredito, 
				nfeDetalheIbsZfm: nfeDetalheIbsZfm, 
				nfeDetalheImpostoIcms: nfeDetalheImpostoIcms, 
				nfeDetalheDfeReferenciado: nfeDetalheDfeReferenciado, 
				produto: produto, 
				nfeCabecalho: nfeCabecalho, 

			);
		}).get();

		// fill internal lists
		dynamic expression;
		for (var nfeDetalheGrouped in nfeDetalheGroupedList) {
			nfeDetalheGrouped.nfeDetEspecificoArmamentoGroupedList = [];
			final queryNfeDetEspecificoArmamento = ' id_nfe_detalhe = ${nfeDetalheGrouped.nfeDetalhe!.id}';
			expression = CustomExpression<bool>(queryNfeDetEspecificoArmamento);
			final nfeDetEspecificoArmamentoList = await (select(nfeDetEspecificoArmamentos)..where((t) => expression)).get();
			for (var nfeDetEspecificoArmamento in nfeDetEspecificoArmamentoList) {
				NfeDetEspecificoArmamentoGrouped nfeDetEspecificoArmamentoGrouped = NfeDetEspecificoArmamentoGrouped(
					nfeDetEspecificoArmamento: nfeDetEspecificoArmamento,
				);
				nfeDetalheGrouped.nfeDetEspecificoArmamentoGroupedList!.add(nfeDetEspecificoArmamentoGrouped);
			}

			nfeDetalheGrouped.nfeDeclaracaoImportacaoGroupedList = [];
			final queryNfeDeclaracaoImportacao = ' id_nfe_detalhe = ${nfeDetalheGrouped.nfeDetalhe!.id}';
			expression = CustomExpression<bool>(queryNfeDeclaracaoImportacao);
			final nfeDeclaracaoImportacaoList = await (select(nfeDeclaracaoImportacaos)..where((t) => expression)).get();
			for (var nfeDeclaracaoImportacao in nfeDeclaracaoImportacaoList) {
				NfeDeclaracaoImportacaoGrouped nfeDeclaracaoImportacaoGrouped = NfeDeclaracaoImportacaoGrouped(
					nfeDeclaracaoImportacao: nfeDeclaracaoImportacao,
				);
				nfeDetalheGrouped.nfeDeclaracaoImportacaoGroupedList!.add(nfeDeclaracaoImportacaoGrouped);
			}

			nfeDetalheGrouped.nfeExportacaoGroupedList = [];
			final queryNfeExportacao = ' id_nfe_detalhe = ${nfeDetalheGrouped.nfeDetalhe!.id}';
			expression = CustomExpression<bool>(queryNfeExportacao);
			final nfeExportacaoList = await (select(nfeExportacaos)..where((t) => expression)).get();
			for (var nfeExportacao in nfeExportacaoList) {
				NfeExportacaoGrouped nfeExportacaoGrouped = NfeExportacaoGrouped(
					nfeExportacao: nfeExportacao,
				);
				nfeDetalheGrouped.nfeExportacaoGroupedList!.add(nfeExportacaoGrouped);
			}

			nfeDetalheGrouped.nfeItemRastreadoGroupedList = [];
			final queryNfeItemRastreado = ' id_nfe_detalhe = ${nfeDetalheGrouped.nfeDetalhe!.id}';
			expression = CustomExpression<bool>(queryNfeItemRastreado);
			final nfeItemRastreadoList = await (select(nfeItemRastreados)..where((t) => expression)).get();
			for (var nfeItemRastreado in nfeItemRastreadoList) {
				NfeItemRastreadoGrouped nfeItemRastreadoGrouped = NfeItemRastreadoGrouped(
					nfeItemRastreado: nfeItemRastreado,
				);
				nfeDetalheGrouped.nfeItemRastreadoGroupedList!.add(nfeItemRastreadoGrouped);
			}

		}		

		return nfeDetalheGroupedList;	
	}

	Future<NfeDetalhe?> getObject(dynamic pk) async {
		return await (select(nfeDetalhes)..where((t) => t.id.equals(pk))).getSingleOrNull();
	} 

	Future<NfeDetalhe?> getObjectFilter(String field, String value) async {
		final query = "SELECT * FROM nfe_detalhe WHERE $field like '%$value%'";
		return (await customSelect(query).getSingleOrNull()) as NfeDetalhe;		 
	} 

	Future<NfeDetalheGrouped?> getObjectGrouped({String? field, dynamic value}) async {
		final result = await getGroupedList(field: field, value: value);

		if (result.length != 1) {
			return null;
		} else {
			return result[0];
		} 
	}

	Future<int> insertObject(NfeDetalheGrouped object) {
		return transaction(() async {
			final maxPk = await lastPk();
			object.nfeDetalhe = object.nfeDetalhe!.copyWith(id: Value(maxPk + 1));
			final pkInserted = await into(nfeDetalhes).insert(object.nfeDetalhe!);
			object.nfeDetalhe = object.nfeDetalhe!.copyWith(id: Value(pkInserted));			 
			await insertChildren(object);
			return pkInserted;
		});		
	}	 

	Future<bool> updateObject(NfeDetalheGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			await insertChildren(object);
			return update(nfeDetalhes).replace(object.nfeDetalhe!);
		});	 
	} 

	Future<int> deleteObject(NfeDetalheGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			return delete(nfeDetalhes).delete(object.nfeDetalhe!);
		});		
	}

	Future<void> insertChildren(NfeDetalheGrouped object) async {
		object.nfeDetEspecificoVeiculo = object.nfeDetEspecificoVeiculo!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetEspecificoVeiculos).insert(object.nfeDetEspecificoVeiculo!);
		object.nfeDetEspecificoMedicamento = object.nfeDetEspecificoMedicamento!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetEspecificoMedicamentos).insert(object.nfeDetEspecificoMedicamento!);
		object.nfeDetEspecificoCombustivel = object.nfeDetEspecificoCombustivel!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetEspecificoCombustivels).insert(object.nfeDetEspecificoCombustivel!);
		object.nfeDetalheImpostoIpi = object.nfeDetalheImpostoIpi!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIpis).insert(object.nfeDetalheImpostoIpi!);
		object.nfeDetalheImpostoIi = object.nfeDetalheImpostoIi!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIis).insert(object.nfeDetalheImpostoIi!);
		object.nfeDetalheImpostoPis = object.nfeDetalheImpostoPis!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoPiss).insert(object.nfeDetalheImpostoPis!);
		object.nfeDetalheImpostoPisSt = object.nfeDetalheImpostoPisSt!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoPisSts).insert(object.nfeDetalheImpostoPisSt!);
		object.nfeDetalheImpostoCofins = object.nfeDetalheImpostoCofins!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoCofinss).insert(object.nfeDetalheImpostoCofins!);
		object.nfeDetalheImpostoCofinsSt = object.nfeDetalheImpostoCofinsSt!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoCofinsSts).insert(object.nfeDetalheImpostoCofinsSt!);
		object.nfeDetalheImpostoIssqn = object.nfeDetalheImpostoIssqn!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIssqns).insert(object.nfeDetalheImpostoIssqn!);
		object.nfeDetalheImpostoIcmsUfdest = object.nfeDetalheImpostoIcmsUfdest!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIcmsUfdests).insert(object.nfeDetalheImpostoIcmsUfdest!);
		object.nfeDetalheImpostoSeletivo = object.nfeDetalheImpostoSeletivo!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoSeletivos).insert(object.nfeDetalheImpostoSeletivo!);
		object.nfeDetalheImpostoIbsUf = object.nfeDetalheImpostoIbsUf!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIbsUfs).insert(object.nfeDetalheImpostoIbsUf!);
		object.nfeDetalheImpostoIbsMun = object.nfeDetalheImpostoIbsMun!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIbsMuns).insert(object.nfeDetalheImpostoIbsMun!);
		object.nfeDetalheImpostoCbs = object.nfeDetalheImpostoCbs!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoCbss).insert(object.nfeDetalheImpostoCbs!);
		object.nfeDetalheTributoRegular = object.nfeDetalheTributoRegular!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheTributoRegulars).insert(object.nfeDetalheTributoRegular!);
		object.nfeDetalheCreditoPresumidoIbs = object.nfeDetalheCreditoPresumidoIbs!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheCreditoPresumidoIbss).insert(object.nfeDetalheCreditoPresumidoIbs!);
		object.nfeDetalheCreditoPresumidoCbs = object.nfeDetalheCreditoPresumidoCbs!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheCreditoPresumidoCbss).insert(object.nfeDetalheCreditoPresumidoCbs!);
		object.nfeDetalheCompraGoverno = object.nfeDetalheCompraGoverno!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheCompraGovernos).insert(object.nfeDetalheCompraGoverno!);
		object.nfeDetalheImpostoMonofasico = object.nfeDetalheImpostoMonofasico!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoMonofasicos).insert(object.nfeDetalheImpostoMonofasico!);
		object.nfeDetalheTransfCredito = object.nfeDetalheTransfCredito!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheTransfCreditos).insert(object.nfeDetalheTransfCredito!);
		object.nfeDetalheIbsZfm = object.nfeDetalheIbsZfm!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheIbsZfms).insert(object.nfeDetalheIbsZfm!);
		object.nfeDetalheImpostoIcms = object.nfeDetalheImpostoIcms!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheImpostoIcmss).insert(object.nfeDetalheImpostoIcms!);
		object.nfeDetalheDfeReferenciado = object.nfeDetalheDfeReferenciado!.copyWith(idNfeDetalhe: Value(object.nfeDetalhe!.id));
		await into(nfeDetalheDfeReferenciados).insert(object.nfeDetalheDfeReferenciado!);
		for (var nfeDetEspecificoArmamentoGrouped in object.nfeDetEspecificoArmamentoGroupedList!) {
			nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento = nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.copyWith(
				id: const Value(null),
				idNfeDetalhe: Value(object.nfeDetalhe!.id),
			);
			await into(nfeDetEspecificoArmamentos).insert(nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento!);
		}
		for (var nfeDeclaracaoImportacaoGrouped in object.nfeDeclaracaoImportacaoGroupedList!) {
			nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao = nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.copyWith(
				id: const Value(null),
				idNfeDetalhe: Value(object.nfeDetalhe!.id),
			);
			await into(nfeDeclaracaoImportacaos).insert(nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao!);
		}
		for (var nfeExportacaoGrouped in object.nfeExportacaoGroupedList!) {
			nfeExportacaoGrouped.nfeExportacao = nfeExportacaoGrouped.nfeExportacao?.copyWith(
				id: const Value(null),
				idNfeDetalhe: Value(object.nfeDetalhe!.id),
			);
			await into(nfeExportacaos).insert(nfeExportacaoGrouped.nfeExportacao!);
		}
		for (var nfeItemRastreadoGrouped in object.nfeItemRastreadoGroupedList!) {
			nfeItemRastreadoGrouped.nfeItemRastreado = nfeItemRastreadoGrouped.nfeItemRastreado?.copyWith(
				id: const Value(null),
				idNfeDetalhe: Value(object.nfeDetalhe!.id),
			);
			await into(nfeItemRastreados).insert(nfeItemRastreadoGrouped.nfeItemRastreado!);
		}
	}
	
	Future<void> deleteChildren(NfeDetalheGrouped object) async {
		await (delete(nfeDetEspecificoVeiculos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetEspecificoMedicamentos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetEspecificoCombustivels)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIpis)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIis)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoPiss)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoPisSts)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoCofinss)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoCofinsSts)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIssqns)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIcmsUfdests)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoSeletivos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIbsUfs)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIbsMuns)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoCbss)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheTributoRegulars)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheCreditoPresumidoIbss)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheCreditoPresumidoCbss)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheCompraGovernos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoMonofasicos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheTransfCreditos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheIbsZfms)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheImpostoIcmss)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetalheDfeReferenciados)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDetEspecificoArmamentos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeDeclaracaoImportacaos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeExportacaos)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
		await (delete(nfeItemRastreados)..where((t) => t.idNfeDetalhe.equals(object.nfeDetalhe!.id!))).go();
	}

	Future<int> lastPk() async {
		final result = await customSelect("select MAX(id) as LAST from nfe_detalhe").getSingleOrNull();
		return result?.data["LAST"] ?? 0;
	} 
}