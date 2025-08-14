import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'nfe_fatura_dao.g.dart';

@DriftAccessor(tables: [
	NfeFaturas,
	NfeDuplicatas,
])
class NfeFaturaDao extends DatabaseAccessor<AppDatabase> with _$NfeFaturaDaoMixin {
	final AppDatabase db;

	List<NfeFatura> nfeFaturaList = []; 
	List<NfeFaturaGrouped> nfeFaturaGroupedList = []; 

	NfeFaturaDao(this.db) : super(db);

	Future<List<NfeFatura>> getList() async {
		nfeFaturaList = await select(nfeFaturas).get();
		return nfeFaturaList;
	}

	Future<List<NfeFatura>> getListFilter(String field, String value) async {
		final query = " $field like '%$value%'";
		final expression = CustomExpression<bool>(query);
		nfeFaturaList = await (select(nfeFaturas)..where((t) => expression)).get();
		return nfeFaturaList;	 
	}

	Future<List<NfeFaturaGrouped>> getGroupedList({String? field, dynamic value}) async {
		final query = select(nfeFaturas)
			.join([]);

		if (field != null && field != '') { 
			final column = nfeFaturas.$columns.where(((column) => column.$name == field)).first;
			if (column is TextColumn) {
				query.where((column as TextColumn).like('%$value%'));
			} else if (column is IntColumn) {
				query.where(column.equals(int.tryParse(value) as Object));
			} else if (column is RealColumn) {
				query.where(column.equals(double.tryParse(value) as Object));
			}
		}

		nfeFaturaGroupedList = await query.map((row) {
			final nfeFatura = row.readTableOrNull(nfeFaturas); 

			return NfeFaturaGrouped(
				nfeFatura: nfeFatura, 

			);
		}).get();

		// fill internal lists
		dynamic expression;
		for (var nfeFaturaGrouped in nfeFaturaGroupedList) {
			nfeFaturaGrouped.nfeDuplicataGroupedList = [];
			final queryNfeDuplicata = ' id_nfe_fatura = ${nfeFaturaGrouped.nfeFatura!.id}';
			expression = CustomExpression<bool>(queryNfeDuplicata);
			final nfeDuplicataList = await (select(nfeDuplicatas)..where((t) => expression)).get();
			for (var nfeDuplicata in nfeDuplicataList) {
				NfeDuplicataGrouped nfeDuplicataGrouped = NfeDuplicataGrouped(
					nfeDuplicata: nfeDuplicata,
				);
				nfeFaturaGrouped.nfeDuplicataGroupedList!.add(nfeDuplicataGrouped);
			}

		}		

		return nfeFaturaGroupedList;	
	}

	Future<NfeFatura?> getObject(dynamic pk) async {
		return await (select(nfeFaturas)..where((t) => t.id.equals(pk))).getSingleOrNull();
	} 

	Future<NfeFatura?> getObjectFilter(String field, String value) async {
		final query = "SELECT * FROM nfe_fatura WHERE $field like '%$value%'";
		return (await customSelect(query).getSingleOrNull()) as NfeFatura;		 
	} 

	Future<NfeFaturaGrouped?> getObjectGrouped({String? field, dynamic value}) async {
		final result = await getGroupedList(field: field, value: value);

		if (result.length != 1) {
			return null;
		} else {
			return result[0];
		} 
	}

	Future<int> insertObject(NfeFaturaGrouped object) {
		return transaction(() async {
			final maxPk = await lastPk();
			object.nfeFatura = object.nfeFatura!.copyWith(id: Value(maxPk + 1));
			final pkInserted = await into(nfeFaturas).insert(object.nfeFatura!);
			object.nfeFatura = object.nfeFatura!.copyWith(id: Value(pkInserted));			 
			await insertChildren(object);
			return pkInserted;
		});		
	}	 

	Future<bool> updateObject(NfeFaturaGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			await insertChildren(object);
			return update(nfeFaturas).replace(object.nfeFatura!);
		});	 
	} 

	Future<int> deleteObject(NfeFaturaGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			return delete(nfeFaturas).delete(object.nfeFatura!);
		});		
	}

	Future<void> insertChildren(NfeFaturaGrouped object) async {
		for (var nfeDuplicataGrouped in object.nfeDuplicataGroupedList!) {
			nfeDuplicataGrouped.nfeDuplicata = nfeDuplicataGrouped.nfeDuplicata?.copyWith(
				id: const Value(null),
				idNfeFatura: Value(object.nfeFatura!.id),
			);
			await into(nfeDuplicatas).insert(nfeDuplicataGrouped.nfeDuplicata!);
		}
	}
	
	Future<void> deleteChildren(NfeFaturaGrouped object) async {
		await (delete(nfeDuplicatas)..where((t) => t.idNfeFatura.equals(object.nfeFatura!.id!))).go();
	}

	Future<int> lastPk() async {
		final result = await customSelect("select MAX(id) as LAST from nfe_fatura").getSingleOrNull();
		return result?.data["LAST"] ?? 0;
	} 
}