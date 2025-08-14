import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'nfe_transporte_dao.g.dart';

@DriftAccessor(tables: [
	NfeTransportes,
	NfeTransporteReboques,
])
class NfeTransporteDao extends DatabaseAccessor<AppDatabase> with _$NfeTransporteDaoMixin {
	final AppDatabase db;

	List<NfeTransporte> nfeTransporteList = []; 
	List<NfeTransporteGrouped> nfeTransporteGroupedList = []; 

	NfeTransporteDao(this.db) : super(db);

	Future<List<NfeTransporte>> getList() async {
		nfeTransporteList = await select(nfeTransportes).get();
		return nfeTransporteList;
	}

	Future<List<NfeTransporte>> getListFilter(String field, String value) async {
		final query = " $field like '%$value%'";
		final expression = CustomExpression<bool>(query);
		nfeTransporteList = await (select(nfeTransportes)..where((t) => expression)).get();
		return nfeTransporteList;	 
	}

	Future<List<NfeTransporteGrouped>> getGroupedList({String? field, dynamic value}) async {
		final query = select(nfeTransportes)
			.join([]);

		if (field != null && field != '') { 
			final column = nfeTransportes.$columns.where(((column) => column.$name == field)).first;
			if (column is TextColumn) {
				query.where((column as TextColumn).like('%$value%'));
			} else if (column is IntColumn) {
				query.where(column.equals(int.tryParse(value) as Object));
			} else if (column is RealColumn) {
				query.where(column.equals(double.tryParse(value) as Object));
			}
		}

		nfeTransporteGroupedList = await query.map((row) {
			final nfeTransporte = row.readTableOrNull(nfeTransportes); 

			return NfeTransporteGrouped(
				nfeTransporte: nfeTransporte, 

			);
		}).get();

		// fill internal lists
		dynamic expression;
		for (var nfeTransporteGrouped in nfeTransporteGroupedList) {
			nfeTransporteGrouped.nfeTransporteReboqueGroupedList = [];
			final queryNfeTransporteReboque = ' id_nfe_transporte = ${nfeTransporteGrouped.nfeTransporte!.id}';
			expression = CustomExpression<bool>(queryNfeTransporteReboque);
			final nfeTransporteReboqueList = await (select(nfeTransporteReboques)..where((t) => expression)).get();
			for (var nfeTransporteReboque in nfeTransporteReboqueList) {
				NfeTransporteReboqueGrouped nfeTransporteReboqueGrouped = NfeTransporteReboqueGrouped(
					nfeTransporteReboque: nfeTransporteReboque,
				);
				nfeTransporteGrouped.nfeTransporteReboqueGroupedList!.add(nfeTransporteReboqueGrouped);
			}

		}		

		return nfeTransporteGroupedList;	
	}

	Future<NfeTransporte?> getObject(dynamic pk) async {
		return await (select(nfeTransportes)..where((t) => t.id.equals(pk))).getSingleOrNull();
	} 

	Future<NfeTransporte?> getObjectFilter(String field, String value) async {
		final query = "SELECT * FROM nfe_transporte WHERE $field like '%$value%'";
		return (await customSelect(query).getSingleOrNull()) as NfeTransporte;		 
	} 

	Future<NfeTransporteGrouped?> getObjectGrouped({String? field, dynamic value}) async {
		final result = await getGroupedList(field: field, value: value);

		if (result.length != 1) {
			return null;
		} else {
			return result[0];
		} 
	}

	Future<int> insertObject(NfeTransporteGrouped object) {
		return transaction(() async {
			final maxPk = await lastPk();
			object.nfeTransporte = object.nfeTransporte!.copyWith(id: Value(maxPk + 1));
			final pkInserted = await into(nfeTransportes).insert(object.nfeTransporte!);
			object.nfeTransporte = object.nfeTransporte!.copyWith(id: Value(pkInserted));			 
			await insertChildren(object);
			return pkInserted;
		});		
	}	 

	Future<bool> updateObject(NfeTransporteGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			await insertChildren(object);
			return update(nfeTransportes).replace(object.nfeTransporte!);
		});	 
	} 

	Future<int> deleteObject(NfeTransporteGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			return delete(nfeTransportes).delete(object.nfeTransporte!);
		});		
	}

	Future<void> insertChildren(NfeTransporteGrouped object) async {
		for (var nfeTransporteReboqueGrouped in object.nfeTransporteReboqueGroupedList!) {
			nfeTransporteReboqueGrouped.nfeTransporteReboque = nfeTransporteReboqueGrouped.nfeTransporteReboque?.copyWith(
				id: const Value(null),
				idNfeTransporte: Value(object.nfeTransporte!.id),
			);
			await into(nfeTransporteReboques).insert(nfeTransporteReboqueGrouped.nfeTransporteReboque!);
		}
	}
	
	Future<void> deleteChildren(NfeTransporteGrouped object) async {
		await (delete(nfeTransporteReboques)..where((t) => t.idNfeTransporte.equals(object.nfeTransporte!.id!))).go();
	}

	Future<int> lastPk() async {
		final result = await customSelect("select MAX(id) as LAST from nfe_transporte").getSingleOrNull();
		return result?.data["LAST"] ?? 0;
	} 
}