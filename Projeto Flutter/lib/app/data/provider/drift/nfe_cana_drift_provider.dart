import 'package:nfe/app/data/provider/drift/database/database_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeCanaDriftProvider extends ProviderBase {

	Future<List<NfeCanaModel>?> getList({Filter? filter}) async {
		List<NfeCanaGrouped> nfeCanaDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				nfeCanaDriftList = await Session.database.nfeCanaDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				nfeCanaDriftList = await Session.database.nfeCanaDao.getGroupedList(); 
			}
			if (nfeCanaDriftList.isNotEmpty) {
				return toListModel(nfeCanaDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<NfeCanaModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.nfeCanaDao.getObjectGrouped(field: 'id', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeCanaModel?>? insert(NfeCanaModel nfeCanaModel) async {
		try {
			final lastPk = await Session.database.nfeCanaDao.insertObject(toDrift(nfeCanaModel));
			nfeCanaModel.id = lastPk;
			return nfeCanaModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeCanaModel?>? update(NfeCanaModel nfeCanaModel) async {
		try {
			await Session.database.nfeCanaDao.updateObject(toDrift(nfeCanaModel));
			return nfeCanaModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.nfeCanaDao.deleteObject(toDrift(NfeCanaModel(id: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<NfeCanaModel> toListModel(List<NfeCanaGrouped> nfeCanaDriftList) {
		List<NfeCanaModel> listModel = [];
		for (var nfeCanaDrift in nfeCanaDriftList) {
			listModel.add(toModel(nfeCanaDrift)!);
		}
		return listModel;
	}	

	NfeCanaModel? toModel(NfeCanaGrouped? nfeCanaDrift) {
		if (nfeCanaDrift != null) {
			return NfeCanaModel(
				id: nfeCanaDrift.nfeCana?.id,
				idNfeCabecalho: nfeCanaDrift.nfeCana?.idNfeCabecalho,
				safra: nfeCanaDrift.nfeCana?.safra,
				mesAnoReferencia: nfeCanaDrift.nfeCana?.mesAnoReferencia,
				nfeCanaFornecimentoDiarioModelList: nfeCanaFornecimentoDiarioDriftToModel(nfeCanaDrift.nfeCanaFornecimentoDiarioGroupedList),
				nfeCanaDeducoesSafraModelList: nfeCanaDeducoesSafraDriftToModel(nfeCanaDrift.nfeCanaDeducoesSafraGroupedList),
			);
		} else {
			return null;
		}
	}

	List<NfeCanaFornecimentoDiarioModel> nfeCanaFornecimentoDiarioDriftToModel(List<NfeCanaFornecimentoDiarioGrouped>? nfeCanaFornecimentoDiarioDriftList) { 
		List<NfeCanaFornecimentoDiarioModel> nfeCanaFornecimentoDiarioModelList = [];
		if (nfeCanaFornecimentoDiarioDriftList != null) {
			for (var nfeCanaFornecimentoDiarioGrouped in nfeCanaFornecimentoDiarioDriftList) {
				nfeCanaFornecimentoDiarioModelList.add(
					NfeCanaFornecimentoDiarioModel(
						id: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.id,
						idNfeCana: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.idNfeCana,
						dia: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.dia,
						quantidade: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.quantidade,
						quantidadeTotalMes: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.quantidadeTotalMes,
						quantidadeTotalAnterior: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.quantidadeTotalAnterior,
						quantidadeTotalGeral: nfeCanaFornecimentoDiarioGrouped.nfeCanaFornecimentoDiario?.quantidadeTotalGeral,
					)
				);
			}
			return nfeCanaFornecimentoDiarioModelList;
		}
		return [];
	}

	List<NfeCanaDeducoesSafraModel> nfeCanaDeducoesSafraDriftToModel(List<NfeCanaDeducoesSafraGrouped>? nfeCanaDeducoesSafraDriftList) { 
		List<NfeCanaDeducoesSafraModel> nfeCanaDeducoesSafraModelList = [];
		if (nfeCanaDeducoesSafraDriftList != null) {
			for (var nfeCanaDeducoesSafraGrouped in nfeCanaDeducoesSafraDriftList) {
				nfeCanaDeducoesSafraModelList.add(
					NfeCanaDeducoesSafraModel(
						id: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.id,
						idNfeCana: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.idNfeCana,
						decricao: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.decricao,
						valorDeducao: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.valorDeducao,
						valorFornecimento: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.valorFornecimento,
						valorTotalDeducao: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.valorTotalDeducao,
						valorLiquidoFornecimento: nfeCanaDeducoesSafraGrouped.nfeCanaDeducoesSafra?.valorLiquidoFornecimento,
					)
				);
			}
			return nfeCanaDeducoesSafraModelList;
		}
		return [];
	}


	NfeCanaGrouped toDrift(NfeCanaModel nfeCanaModel) {
		return NfeCanaGrouped(
			nfeCana: NfeCana(
				id: nfeCanaModel.id,
				idNfeCabecalho: nfeCanaModel.idNfeCabecalho,
				safra: nfeCanaModel.safra,
				mesAnoReferencia: nfeCanaModel.mesAnoReferencia,
			),
			nfeCanaFornecimentoDiarioGroupedList: nfeCanaFornecimentoDiarioModelToDrift(nfeCanaModel.nfeCanaFornecimentoDiarioModelList),
			nfeCanaDeducoesSafraGroupedList: nfeCanaDeducoesSafraModelToDrift(nfeCanaModel.nfeCanaDeducoesSafraModelList),
		);
	}

	List<NfeCanaFornecimentoDiarioGrouped> nfeCanaFornecimentoDiarioModelToDrift(List<NfeCanaFornecimentoDiarioModel>? nfeCanaFornecimentoDiarioModelList) { 
		List<NfeCanaFornecimentoDiarioGrouped> nfeCanaFornecimentoDiarioGroupedList = [];
		if (nfeCanaFornecimentoDiarioModelList != null) {
			for (var nfeCanaFornecimentoDiarioModel in nfeCanaFornecimentoDiarioModelList) {
				nfeCanaFornecimentoDiarioGroupedList.add(
					NfeCanaFornecimentoDiarioGrouped(
						nfeCanaFornecimentoDiario: NfeCanaFornecimentoDiario(
							id: nfeCanaFornecimentoDiarioModel.id,
							idNfeCana: nfeCanaFornecimentoDiarioModel.idNfeCana,
							dia: nfeCanaFornecimentoDiarioModel.dia,
							quantidade: nfeCanaFornecimentoDiarioModel.quantidade,
							quantidadeTotalMes: nfeCanaFornecimentoDiarioModel.quantidadeTotalMes,
							quantidadeTotalAnterior: nfeCanaFornecimentoDiarioModel.quantidadeTotalAnterior,
							quantidadeTotalGeral: nfeCanaFornecimentoDiarioModel.quantidadeTotalGeral,
						),
					),
				);
			}
			return nfeCanaFornecimentoDiarioGroupedList;
		}
		return [];
	}

	List<NfeCanaDeducoesSafraGrouped> nfeCanaDeducoesSafraModelToDrift(List<NfeCanaDeducoesSafraModel>? nfeCanaDeducoesSafraModelList) { 
		List<NfeCanaDeducoesSafraGrouped> nfeCanaDeducoesSafraGroupedList = [];
		if (nfeCanaDeducoesSafraModelList != null) {
			for (var nfeCanaDeducoesSafraModel in nfeCanaDeducoesSafraModelList) {
				nfeCanaDeducoesSafraGroupedList.add(
					NfeCanaDeducoesSafraGrouped(
						nfeCanaDeducoesSafra: NfeCanaDeducoesSafra(
							id: nfeCanaDeducoesSafraModel.id,
							idNfeCana: nfeCanaDeducoesSafraModel.idNfeCana,
							decricao: nfeCanaDeducoesSafraModel.decricao,
							valorDeducao: nfeCanaDeducoesSafraModel.valorDeducao,
							valorFornecimento: nfeCanaDeducoesSafraModel.valorFornecimento,
							valorTotalDeducao: nfeCanaDeducoesSafraModel.valorTotalDeducao,
							valorLiquidoFornecimento: nfeCanaDeducoesSafraModel.valorLiquidoFornecimento,
						),
					),
				);
			}
			return nfeCanaDeducoesSafraGroupedList;
		}
		return [];
	}

		
}
