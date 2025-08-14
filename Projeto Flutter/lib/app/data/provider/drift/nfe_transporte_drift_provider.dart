import 'package:nfe/app/data/provider/drift/database/database_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeTransporteDriftProvider extends ProviderBase {

	Future<List<NfeTransporteModel>?> getList({Filter? filter}) async {
		List<NfeTransporteGrouped> nfeTransporteDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				nfeTransporteDriftList = await Session.database.nfeTransporteDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				nfeTransporteDriftList = await Session.database.nfeTransporteDao.getGroupedList(); 
			}
			if (nfeTransporteDriftList.isNotEmpty) {
				return toListModel(nfeTransporteDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<NfeTransporteModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.nfeTransporteDao.getObjectGrouped(field: 'id', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeTransporteModel?>? insert(NfeTransporteModel nfeTransporteModel) async {
		try {
			final lastPk = await Session.database.nfeTransporteDao.insertObject(toDrift(nfeTransporteModel));
			nfeTransporteModel.id = lastPk;
			return nfeTransporteModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeTransporteModel?>? update(NfeTransporteModel nfeTransporteModel) async {
		try {
			await Session.database.nfeTransporteDao.updateObject(toDrift(nfeTransporteModel));
			return nfeTransporteModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.nfeTransporteDao.deleteObject(toDrift(NfeTransporteModel(id: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<NfeTransporteModel> toListModel(List<NfeTransporteGrouped> nfeTransporteDriftList) {
		List<NfeTransporteModel> listModel = [];
		for (var nfeTransporteDrift in nfeTransporteDriftList) {
			listModel.add(toModel(nfeTransporteDrift)!);
		}
		return listModel;
	}	

	NfeTransporteModel? toModel(NfeTransporteGrouped? nfeTransporteDrift) {
		if (nfeTransporteDrift != null) {
			return NfeTransporteModel(
				id: nfeTransporteDrift.nfeTransporte?.id,
				idNfeCabecalho: nfeTransporteDrift.nfeTransporte?.idNfeCabecalho,
				idTransportadora: nfeTransporteDrift.nfeTransporte?.idTransportadora,
				modalidadeFrete: NfeTransporteDomain.getModalidadeFrete(nfeTransporteDrift.nfeTransporte?.modalidadeFrete),
				cnpj: nfeTransporteDrift.nfeTransporte?.cnpj,
				cpf: nfeTransporteDrift.nfeTransporte?.cpf,
				nome: nfeTransporteDrift.nfeTransporte?.nome,
				inscricaoEstadual: nfeTransporteDrift.nfeTransporte?.inscricaoEstadual,
				endereco: nfeTransporteDrift.nfeTransporte?.endereco,
				nomeMunicipio: nfeTransporteDrift.nfeTransporte?.nomeMunicipio,
				uf: NfeTransporteDomain.getUf(nfeTransporteDrift.nfeTransporte?.uf),
				valorServico: nfeTransporteDrift.nfeTransporte?.valorServico,
				valorBcRetencaoIcms: nfeTransporteDrift.nfeTransporte?.valorBcRetencaoIcms,
				aliquotaRetencaoIcms: nfeTransporteDrift.nfeTransporte?.aliquotaRetencaoIcms,
				valorIcmsRetido: nfeTransporteDrift.nfeTransporte?.valorIcmsRetido,
				cfop: nfeTransporteDrift.nfeTransporte?.cfop,
				municipio: nfeTransporteDrift.nfeTransporte?.municipio,
				placaVeiculo: nfeTransporteDrift.nfeTransporte?.placaVeiculo,
				ufVeiculo: NfeTransporteDomain.getUfVeiculo(nfeTransporteDrift.nfeTransporte?.ufVeiculo),
				rntcVeiculo: nfeTransporteDrift.nfeTransporte?.rntcVeiculo,
				nfeTransporteReboqueModelList: nfeTransporteReboqueDriftToModel(nfeTransporteDrift.nfeTransporteReboqueGroupedList),
			);
		} else {
			return null;
		}
	}

	List<NfeTransporteReboqueModel> nfeTransporteReboqueDriftToModel(List<NfeTransporteReboqueGrouped>? nfeTransporteReboqueDriftList) { 
		List<NfeTransporteReboqueModel> nfeTransporteReboqueModelList = [];
		if (nfeTransporteReboqueDriftList != null) {
			for (var nfeTransporteReboqueGrouped in nfeTransporteReboqueDriftList) {
				nfeTransporteReboqueModelList.add(
					NfeTransporteReboqueModel(
						id: nfeTransporteReboqueGrouped.nfeTransporteReboque?.id,
						idNfeTransporte: nfeTransporteReboqueGrouped.nfeTransporteReboque?.idNfeTransporte,
						placa: nfeTransporteReboqueGrouped.nfeTransporteReboque?.placa,
						uf: NfeTransporteReboqueDomain.getUf(nfeTransporteReboqueGrouped.nfeTransporteReboque?.uf),
						rntc: nfeTransporteReboqueGrouped.nfeTransporteReboque?.rntc,
						vagao: nfeTransporteReboqueGrouped.nfeTransporteReboque?.vagao,
						balsa: nfeTransporteReboqueGrouped.nfeTransporteReboque?.balsa,
					)
				);
			}
			return nfeTransporteReboqueModelList;
		}
		return [];
	}


	NfeTransporteGrouped toDrift(NfeTransporteModel nfeTransporteModel) {
		return NfeTransporteGrouped(
			nfeTransporte: NfeTransporte(
				id: nfeTransporteModel.id,
				idNfeCabecalho: nfeTransporteModel.idNfeCabecalho,
				idTransportadora: nfeTransporteModel.idTransportadora,
				modalidadeFrete: NfeTransporteDomain.setModalidadeFrete(nfeTransporteModel.modalidadeFrete),
				cnpj: Util.removeMask(nfeTransporteModel.cnpj),
				cpf: Util.removeMask(nfeTransporteModel.cpf),
				nome: nfeTransporteModel.nome,
				inscricaoEstadual: nfeTransporteModel.inscricaoEstadual,
				endereco: nfeTransporteModel.endereco,
				nomeMunicipio: nfeTransporteModel.nomeMunicipio,
				uf: NfeTransporteDomain.setUf(nfeTransporteModel.uf),
				valorServico: nfeTransporteModel.valorServico,
				valorBcRetencaoIcms: nfeTransporteModel.valorBcRetencaoIcms,
				aliquotaRetencaoIcms: nfeTransporteModel.aliquotaRetencaoIcms,
				valorIcmsRetido: nfeTransporteModel.valorIcmsRetido,
				cfop: nfeTransporteModel.cfop,
				municipio: nfeTransporteModel.municipio,
				placaVeiculo: nfeTransporteModel.placaVeiculo,
				ufVeiculo: NfeTransporteDomain.setUfVeiculo(nfeTransporteModel.ufVeiculo),
				rntcVeiculo: nfeTransporteModel.rntcVeiculo,
			),
			nfeTransporteReboqueGroupedList: nfeTransporteReboqueModelToDrift(nfeTransporteModel.nfeTransporteReboqueModelList),
		);
	}

	List<NfeTransporteReboqueGrouped> nfeTransporteReboqueModelToDrift(List<NfeTransporteReboqueModel>? nfeTransporteReboqueModelList) { 
		List<NfeTransporteReboqueGrouped> nfeTransporteReboqueGroupedList = [];
		if (nfeTransporteReboqueModelList != null) {
			for (var nfeTransporteReboqueModel in nfeTransporteReboqueModelList) {
				nfeTransporteReboqueGroupedList.add(
					NfeTransporteReboqueGrouped(
						nfeTransporteReboque: NfeTransporteReboque(
							id: nfeTransporteReboqueModel.id,
							idNfeTransporte: nfeTransporteReboqueModel.idNfeTransporte,
							placa: nfeTransporteReboqueModel.placa,
							uf: NfeTransporteReboqueDomain.setUf(nfeTransporteReboqueModel.uf),
							rntc: nfeTransporteReboqueModel.rntc,
							vagao: nfeTransporteReboqueModel.vagao,
							balsa: nfeTransporteReboqueModel.balsa,
						),
					),
				);
			}
			return nfeTransporteReboqueGroupedList;
		}
		return [];
	}

		
}
