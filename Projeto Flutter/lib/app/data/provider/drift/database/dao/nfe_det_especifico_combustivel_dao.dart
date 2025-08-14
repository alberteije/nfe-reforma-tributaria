import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'nfe_det_especifico_combustivel_dao.g.dart';

@DriftAccessor(tables: [
	NfeDetEspecificoCombustivels,
	NfeDetCombustivelOrigems,
])
class NfeDetEspecificoCombustivelDao extends DatabaseAccessor<AppDatabase> with _$NfeDetEspecificoCombustivelDaoMixin {
	final AppDatabase db;

	List<NfeDetEspecificoCombustivel> nfeDetEspecificoCombustivelList = []; 
	List<NfeDetEspecificoCombustivelGrouped> nfeDetEspecificoCombustivelGroupedList = []; 

	NfeDetEspecificoCombustivelDao(this.db) : super(db);

	Future<List<NfeDetEspecificoCombustivel>> getList() async {
		nfeDetEspecificoCombustivelList = await select(nfeDetEspecificoCombustivels).get();
		return nfeDetEspecificoCombustivelList;
	}

	Future<List<NfeDetEspecificoCombustivel>> getListFilter(String field, String value) async {
		final query = " $field like '%$value%'";
		final expression = CustomExpression<bool>(query);
		nfeDetEspecificoCombustivelList = await (select(nfeDetEspecificoCombustivels)..where((t) => expression)).get();
		return nfeDetEspecificoCombustivelList;	 
	}

	Future<List<NfeDetEspecificoCombustivelGrouped>> getGroupedList({String? field, dynamic value}) async {
		final query = select(nfeDetEspecificoCombustivels)
			.join([]);

		if (field != null && field != '') { 
			final column = nfeDetEspecificoCombustivels.$columns.where(((column) => column.$name == field)).first;
			if (column is TextColumn) {
				query.where((column as TextColumn).like('%$value%'));
			} else if (column is IntColumn) {
				query.where(column.equals(int.tryParse(value) as Object));
			} else if (column is RealColumn) {
				query.where(column.equals(double.tryParse(value) as Object));
			}
		}

		nfeDetEspecificoCombustivelGroupedList = await query.map((row) {
			final nfeDetEspecificoCombustivel = row.readTableOrNull(nfeDetEspecificoCombustivels); 

			return NfeDetEspecificoCombustivelGrouped(
				nfeDetEspecificoCombustivel: nfeDetEspecificoCombustivel, 

			);
		}).get();

		// fill internal lists
		dynamic expression;
		for (var nfeDetEspecificoCombustivelGrouped in nfeDetEspecificoCombustivelGroupedList) {
			nfeDetEspecificoCombustivelGrouped.nfeDetCombustivelOrigemGroupedList = [];
			final queryNfeDetCombustivelOrigem = ' id_nfe_det_especifico_combustivel = ${nfeDetEspecificoCombustivelGrouped.nfeDetEspecificoCombustivel!.id}';
			expression = CustomExpression<bool>(queryNfeDetCombustivelOrigem);
			final nfeDetCombustivelOrigemList = await (select(nfeDetCombustivelOrigems)..where((t) => expression)).get();
			for (var nfeDetCombustivelOrigem in nfeDetCombustivelOrigemList) {
				NfeDetCombustivelOrigemGrouped nfeDetCombustivelOrigemGrouped = NfeDetCombustivelOrigemGrouped(
					nfeDetCombustivelOrigem: nfeDetCombustivelOrigem,
				);
				nfeDetEspecificoCombustivelGrouped.nfeDetCombustivelOrigemGroupedList!.add(nfeDetCombustivelOrigemGrouped);
			}

		}		

		return nfeDetEspecificoCombustivelGroupedList;	
	}

	Future<NfeDetEspecificoCombustivel?> getObject(dynamic pk) async {
		return await (select(nfeDetEspecificoCombustivels)..where((t) => t.id.equals(pk))).getSingleOrNull();
	} 

	Future<NfeDetEspecificoCombustivel?> getObjectFilter(String field, String value) async {
		final query = "SELECT * FROM nfe_det_especifico_combustivel WHERE $field like '%$value%'";
		return (await customSelect(query).getSingleOrNull()) as NfeDetEspecificoCombustivel;		 
	} 

	Future<NfeDetEspecificoCombustivelGrouped?> getObjectGrouped({String? field, dynamic value}) async {
		final result = await getGroupedList(field: field, value: value);

		if (result.length != 1) {
			return null;
		} else {
			return result[0];
		} 
	}

	Future<int> insertObject(NfeDetEspecificoCombustivelGrouped object) {
		return transaction(() async {
			final maxPk = await lastPk();
			object.nfeDetEspecificoCombustivel = object.nfeDetEspecificoCombustivel!.copyWith(id: Value(maxPk + 1));
			final pkInserted = await into(nfeDetEspecificoCombustivels).insert(object.nfeDetEspecificoCombustivel!);
			object.nfeDetEspecificoCombustivel = object.nfeDetEspecificoCombustivel!.copyWith(id: Value(pkInserted));			 
			await insertChildren(object);
			return pkInserted;
		});		
	}	 

	Future<bool> updateObject(NfeDetEspecificoCombustivelGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			await insertChildren(object);
			return update(nfeDetEspecificoCombustivels).replace(object.nfeDetEspecificoCombustivel!);
		});	 
	} 

	Future<int> deleteObject(NfeDetEspecificoCombustivelGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			return delete(nfeDetEspecificoCombustivels).delete(object.nfeDetEspecificoCombustivel!);
		});		
	}

	Future<void> insertChildren(NfeDetEspecificoCombustivelGrouped object) async {
		for (var nfeDetCombustivelOrigemGrouped in object.nfeDetCombustivelOrigemGroupedList!) {
			nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem = nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem?.copyWith(
				id: const Value(null),
				idNfeDetEspecificoCombustivel: Value(object.nfeDetEspecificoCombustivel!.id),
			);
			await into(nfeDetCombustivelOrigems).insert(nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem!);
		}
	}
	
	Future<void> deleteChildren(NfeDetEspecificoCombustivelGrouped object) async {
		await (delete(nfeDetCombustivelOrigems)..where((t) => t.idNfeDetEspecificoCombustivel.equals(object.nfeDetEspecificoCombustivel!.id!))).go();
	}

	Future<int> lastPk() async {
		final result = await customSelect("select MAX(id) as LAST from nfe_det_especifico_combustivel").getSingleOrNull();
		return result?.data["LAST"] ?? 0;
	} 
}