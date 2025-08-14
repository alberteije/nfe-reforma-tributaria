import 'package:drift/drift.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/provider/drift/database/database_imports.dart';

part 'nfe_cana_dao.g.dart';

@DriftAccessor(tables: [
	NfeCanas,
	NfeCanaFornecimentoDiarios,
	NfeCanaDeducoesSafras,
])
class NfeCanaDao extends DatabaseAccessor<AppDatabase> with _$NfeCanaDaoMixin {
	final AppDatabase db;

	List<NfeCana> nfeCanaList = []; 
	List<NfeCanaGrouped> nfeCanaGroupedList = []; 

	NfeCanaDao(this.db) : super(db);

	Future<List<NfeCana>> getList() async {
		nfeCanaList = await select(nfeCanas).get();
		return nfeCanaList;
	}

	Future<List<NfeCana>> getListFilter(String field, String value) async {
		final query = " $field like '%$value%'";
		final expression = CustomExpression<bool>(query);
		nfeCanaList = await (select(nfeCanas)..where((t) => expression)).get();
		return nfeCanaList;	 
	}

	Future<List<NfeCanaGrouped>> getGroupedList({String? field, dynamic value}) async {
		final query = select(nfeCanas)
			.join([]);

		if (field != null && field != '') { 
			final column = nfeCanas.$columns.where(((column) => column.$name == field)).first;
			if (column is TextColumn) {
				query.where((column as TextColumn).like('%$value%'));
			} else if (column is IntColumn) {
				query.where(column.equals(int.tryParse(value) as Object));
			} else if (column is RealColumn) {
				query.where(column.equals(double.tryParse(value) as Object));
			}
		}

		nfeCanaGroupedList = await query.map((row) {
			final nfeCana = row.readTableOrNull(nfeCanas); 

			return NfeCanaGrouped(
				nfeCana: nfeCana, 

			);
		}).get();

		// fill internal lists
		dynamic expression;
		for (var nfeCanaGrouped in nfeCanaGroupedList) {
			nfeCanaGrouped.nfeCanaFornecimentoDiarioGroupedList = [];
			final queryNfeCanaFornecimentoDiario = ' id_nfe_cana = ${nfeCanaGrouped.nfeCana!.id}';
			expression = CustomExpression<bool>(queryNfeCanaFornecimentoDiario);
			final nfeCanaFornecimentoDiarioList = await (select(nfeCanaFornecimentoDiarios)..where((t) => expression)).get();
			for (var nfeCanaFornecimentoDiario in nfeCanaFornecimentoDiarioList) {
				NfeCanaFornecimentoDiarioGrouped nfeCanaFornecimentoDiarioGrouped = NfeCanaFornecimentoDiarioGrouped(
					nfeCanaFornecimentoDiario: nfeCanaFornecimentoDiario,
				);
				nfeCanaGrouped.nfeCanaFornecimentoDiarioGroupedList!.add(nfeCanaFornecimentoDiarioGrouped);
			}

			nfeCanaGrouped.nfeCanaDeducoesSafraGroupedList = [];
			final queryNfeCanaDeducoesSafra = ' id_nfe_cana = ${nfeCanaGrouped.nfeCana!.id}';
			expression = CustomExpression<bool>(queryNfeCanaDeducoesSafra);
			final nfeCanaDeducoesSafraList = await (select(nfeCanaDeducoesSafras)..where((t) => expression)).get();
			for (var nfeCanaDeducoesSafra in nfeCanaDeducoesSafraList) {
				NfeCanaDeducoesSafraGrouped nfeCanaDeducoesSafraGrouped = NfeCanaDeducoesSafraGrouped(
					nfeCanaDeducoesSafra: nfeCanaDeducoesSafra,
				);
				nfeCanaGrouped.nfeCanaDeducoesSafraGroupedList!.add(nfeCanaDeducoesSafraGrouped);
			}

		}		

		return nfeCanaGroupedList;	
	}

	Future<NfeCana?> getObject(dynamic pk) async {
		return await (select(nfeCanas)..where((t) => t.id.equals(pk))).getSingleOrNull();
	} 

	Future<NfeCana?> getObjectFilter(String field, String value) async {
		final query = "SELECT * FROM nfe_cana WHERE $field like '%$value%'";
		return (await customSelect(query).getSingleOrNull()) as NfeCana;		 
	} 

	Future<NfeCanaGrouped?> getObjectGrouped({String? field, dynamic value}) async {
		final result = await getGroupedList(field: field, value: value);

		if (result.length != 1) {
			return null;
		} else {
			return result[0];
		} 
	}

	Future<int> insertObject(NfeCanaGrouped object) {
		return transaction(() async {
			final maxPk = await lastPk();
			object.nfeCana = object.nfeCana!.copyWith(id: Value(maxPk + 1));
			final pkInserted = await into(nfeCanas).insert(object.nfeCana!);
			object.nfeCana = object.nfeCana!.copyWith(id: Value(pkInserted));			 
			await insertChildren(object);
			return pkInserted;
		});		
	}	 

	Future<bool> updateObject(NfeCanaGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			await insertChildren(object);
			return update(nfeCanas).replace(object.nfeCana!);
		});	 
	} 

	Future<int> deleteObject(NfeCanaGrouped object) {
		return transaction(() async {
			await deleteChildren(object);
			return delete(nfeCanas).delete(object.nfeCana!);
		});		
	}

	Future<void> insertChildren(NfeCanaGrouped object) async {
		for (var nfeCanaFornecimentoDiarioGrouped in object.nfeCanaFornecimentoDiarioGroupedList!) {
			nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario = nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.copyWith(
				id: const Value(null),
				idNfeCana: Value(object.nfeCana!.id),
			);
			await into(nfeCanaFornecimentoDiarios).insert(nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario!);
		}
		for (var nfeCanaDeducoesSafraGrouped in object.nfeCanaDeducoesSafraGroupedList!) {
			nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra = nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.copyWith(
				id: const Value(null),
				idNfeCana: Value(object.nfeCana!.id),
			);
			await into(nfeCanaDeducoesSafras).insert(nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra!);
		}
	}
	
	Future<void> deleteChildren(NfeCanaGrouped object) async {
		await (delete(nfeCanaFornecimentoDiarios)..where((t) => t.idNfeCana.equals(object.nfeCana!.id!))).go();
		await (delete(nfeCanaDeducoesSafras)..where((t) => t.idNfeCana.equals(object.nfeCana!.id!))).go();
	}

	Future<int> lastPk() async {
		final result = await customSelect("select MAX(id) as LAST from nfe_cana").getSingleOrNull();
		return result?.data["LAST"] ?? 0;
	} 
}