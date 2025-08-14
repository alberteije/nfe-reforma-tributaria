import 'package:nfe/app/data/provider/drift/database/database_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeFaturaDriftProvider extends ProviderBase {

	Future<List<NfeFaturaModel>?> getList({Filter? filter}) async {
		List<NfeFaturaGrouped> nfeFaturaDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				nfeFaturaDriftList = await Session.database.nfeFaturaDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				nfeFaturaDriftList = await Session.database.nfeFaturaDao.getGroupedList(); 
			}
			if (nfeFaturaDriftList.isNotEmpty) {
				return toListModel(nfeFaturaDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<NfeFaturaModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.nfeFaturaDao.getObjectGrouped(field: 'id', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeFaturaModel?>? insert(NfeFaturaModel nfeFaturaModel) async {
		try {
			final lastPk = await Session.database.nfeFaturaDao.insertObject(toDrift(nfeFaturaModel));
			nfeFaturaModel.id = lastPk;
			return nfeFaturaModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeFaturaModel?>? update(NfeFaturaModel nfeFaturaModel) async {
		try {
			await Session.database.nfeFaturaDao.updateObject(toDrift(nfeFaturaModel));
			return nfeFaturaModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.nfeFaturaDao.deleteObject(toDrift(NfeFaturaModel(id: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<NfeFaturaModel> toListModel(List<NfeFaturaGrouped> nfeFaturaDriftList) {
		List<NfeFaturaModel> listModel = [];
		for (var nfeFaturaDrift in nfeFaturaDriftList) {
			listModel.add(toModel(nfeFaturaDrift)!);
		}
		return listModel;
	}	

	NfeFaturaModel? toModel(NfeFaturaGrouped? nfeFaturaDrift) {
		if (nfeFaturaDrift != null) {
			return NfeFaturaModel(
				id: nfeFaturaDrift.nfeFatura?.id,
				idNfeCabecalho: nfeFaturaDrift.nfeFatura?.idNfeCabecalho,
				numero: nfeFaturaDrift.nfeFatura?.numero,
				valorOriginal: nfeFaturaDrift.nfeFatura?.valorOriginal,
				valorDesconto: nfeFaturaDrift.nfeFatura?.valorDesconto,
				valorLiquido: nfeFaturaDrift.nfeFatura?.valorLiquido,
				nfeDuplicataModelList: nfeDuplicataDriftToModel(nfeFaturaDrift.nfeDuplicataGroupedList),
			);
		} else {
			return null;
		}
	}

	List<NfeDuplicataModel> nfeDuplicataDriftToModel(List<NfeDuplicataGrouped>? nfeDuplicataDriftList) { 
		List<NfeDuplicataModel> nfeDuplicataModelList = [];
		if (nfeDuplicataDriftList != null) {
			for (var nfeDuplicataGrouped in nfeDuplicataDriftList) {
				nfeDuplicataModelList.add(
					NfeDuplicataModel(
						id: nfeDuplicataGrouped.nfeDuplicata?.id,
						idNfeFatura: nfeDuplicataGrouped.nfeDuplicata?.idNfeFatura,
						numero: nfeDuplicataGrouped.nfeDuplicata?.numero,
						dataVencimento: nfeDuplicataGrouped.nfeDuplicata?.dataVencimento,
						valor: nfeDuplicataGrouped.nfeDuplicata?.valor,
					)
				);
			}
			return nfeDuplicataModelList;
		}
		return [];
	}


	NfeFaturaGrouped toDrift(NfeFaturaModel nfeFaturaModel) {
		return NfeFaturaGrouped(
			nfeFatura: NfeFatura(
				id: nfeFaturaModel.id,
				idNfeCabecalho: nfeFaturaModel.idNfeCabecalho,
				numero: nfeFaturaModel.numero,
				valorOriginal: nfeFaturaModel.valorOriginal,
				valorDesconto: nfeFaturaModel.valorDesconto,
				valorLiquido: nfeFaturaModel.valorLiquido,
			),
			nfeDuplicataGroupedList: nfeDuplicataModelToDrift(nfeFaturaModel.nfeDuplicataModelList),
		);
	}

	List<NfeDuplicataGrouped> nfeDuplicataModelToDrift(List<NfeDuplicataModel>? nfeDuplicataModelList) { 
		List<NfeDuplicataGrouped> nfeDuplicataGroupedList = [];
		if (nfeDuplicataModelList != null) {
			for (var nfeDuplicataModel in nfeDuplicataModelList) {
				nfeDuplicataGroupedList.add(
					NfeDuplicataGrouped(
						nfeDuplicata: NfeDuplicata(
							id: nfeDuplicataModel.id,
							idNfeFatura: nfeDuplicataModel.idNfeFatura,
							numero: nfeDuplicataModel.numero,
							dataVencimento: nfeDuplicataModel.dataVencimento,
							valor: nfeDuplicataModel.valor,
						),
					),
				);
			}
			return nfeDuplicataGroupedList;
		}
		return [];
	}

		
}
