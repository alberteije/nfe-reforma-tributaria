import 'package:nfe/app/data/provider/drift/database/database_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetEspecificoCombustivelDriftProvider extends ProviderBase {

	Future<List<NfeDetEspecificoCombustivelModel>?> getList({Filter? filter}) async {
		List<NfeDetEspecificoCombustivelGrouped> nfeDetEspecificoCombustivelDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				nfeDetEspecificoCombustivelDriftList = await Session.database.nfeDetEspecificoCombustivelDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				nfeDetEspecificoCombustivelDriftList = await Session.database.nfeDetEspecificoCombustivelDao.getGroupedList(); 
			}
			if (nfeDetEspecificoCombustivelDriftList.isNotEmpty) {
				return toListModel(nfeDetEspecificoCombustivelDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<NfeDetEspecificoCombustivelModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.nfeDetEspecificoCombustivelDao.getObjectGrouped(field: 'id', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeDetEspecificoCombustivelModel?>? insert(NfeDetEspecificoCombustivelModel nfeDetEspecificoCombustivelModel) async {
		try {
			final lastPk = await Session.database.nfeDetEspecificoCombustivelDao.insertObject(toDrift(nfeDetEspecificoCombustivelModel));
			nfeDetEspecificoCombustivelModel.id = lastPk;
			return nfeDetEspecificoCombustivelModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeDetEspecificoCombustivelModel?>? update(NfeDetEspecificoCombustivelModel nfeDetEspecificoCombustivelModel) async {
		try {
			await Session.database.nfeDetEspecificoCombustivelDao.updateObject(toDrift(nfeDetEspecificoCombustivelModel));
			return nfeDetEspecificoCombustivelModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.nfeDetEspecificoCombustivelDao.deleteObject(toDrift(NfeDetEspecificoCombustivelModel(id: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<NfeDetEspecificoCombustivelModel> toListModel(List<NfeDetEspecificoCombustivelGrouped> nfeDetEspecificoCombustivelDriftList) {
		List<NfeDetEspecificoCombustivelModel> listModel = [];
		for (var nfeDetEspecificoCombustivelDrift in nfeDetEspecificoCombustivelDriftList) {
			listModel.add(toModel(nfeDetEspecificoCombustivelDrift)!);
		}
		return listModel;
	}	

	NfeDetEspecificoCombustivelModel? toModel(NfeDetEspecificoCombustivelGrouped? nfeDetEspecificoCombustivelDrift) {
		if (nfeDetEspecificoCombustivelDrift != null) {
			return NfeDetEspecificoCombustivelModel(
				id: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.id,
				idNfeDetalhe: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.idNfeDetalhe,
				codigoAnp: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.codigoAnp,
				descricaoAnp: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.descricaoAnp,
				percentualGlp: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.percentualGlp,
				percentualGasNacional: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.percentualGasNacional,
				percentualGasImportado: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.percentualGasImportado,
				valorPartida: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.valorPartida,
				codif: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.codif,
				quantidadeTempAmbiente: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.quantidadeTempAmbiente,
				ufConsumo: NfeDetEspecificoCombustivelDomain.getUfConsumo(nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.ufConsumo),
				cideBaseCalculo: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.cideBaseCalculo,
				cideAliquota: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.cideAliquota,
				cideValor: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.cideValor,
				encerranteBico: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.encerranteBico,
				encerranteBomba: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.encerranteBomba,
				encerranteTanque: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.encerranteTanque,
				encerranteValorInicio: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.encerranteValorInicio,
				encerranteValorFim: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.encerranteValorFim,
				percentualMisturaBiodiesel: nfeDetEspecificoCombustivelDrift.nfeDetEspecificoCombustivel?.percentualMisturaBiodiesel,
				nfeDetCombustivelOrigemModelList: nfeDetCombustivelOrigemDriftToModel(nfeDetEspecificoCombustivelDrift.nfeDetCombustivelOrigemGroupedList),
			);
		} else {
			return null;
		}
	}

	List<NfeDetCombustivelOrigemModel> nfeDetCombustivelOrigemDriftToModel(List<NfeDetCombustivelOrigemGrouped>? nfeDetCombustivelOrigemDriftList) { 
		List<NfeDetCombustivelOrigemModel> nfeDetCombustivelOrigemModelList = [];
		if (nfeDetCombustivelOrigemDriftList != null) {
			for (var nfeDetCombustivelOrigemGrouped in nfeDetCombustivelOrigemDriftList) {
				nfeDetCombustivelOrigemModelList.add(
					NfeDetCombustivelOrigemModel(
						id: nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem?.id,
						idNfeDetEspecificoCombustivel: nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem?.idNfeDetEspecificoCombustivel,
						indicadorImportacao: NfeDetCombustivelOrigemDomain.getIndicadorImportacao(nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem?.indicadorImportacao),
						codigoUf: nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem?.codigoUf,
						percentualOriginario: nfeDetCombustivelOrigemGrouped.nfeDetCombustivelOrigem?.percentualOriginario,
					)
				);
			}
			return nfeDetCombustivelOrigemModelList;
		}
		return [];
	}


	NfeDetEspecificoCombustivelGrouped toDrift(NfeDetEspecificoCombustivelModel nfeDetEspecificoCombustivelModel) {
		return NfeDetEspecificoCombustivelGrouped(
			nfeDetEspecificoCombustivel: NfeDetEspecificoCombustivel(
				id: nfeDetEspecificoCombustivelModel.id,
				idNfeDetalhe: nfeDetEspecificoCombustivelModel.idNfeDetalhe,
				codigoAnp: nfeDetEspecificoCombustivelModel.codigoAnp,
				descricaoAnp: nfeDetEspecificoCombustivelModel.descricaoAnp,
				percentualGlp: nfeDetEspecificoCombustivelModel.percentualGlp,
				percentualGasNacional: nfeDetEspecificoCombustivelModel.percentualGasNacional,
				percentualGasImportado: nfeDetEspecificoCombustivelModel.percentualGasImportado,
				valorPartida: nfeDetEspecificoCombustivelModel.valorPartida,
				codif: nfeDetEspecificoCombustivelModel.codif,
				quantidadeTempAmbiente: nfeDetEspecificoCombustivelModel.quantidadeTempAmbiente,
				ufConsumo: NfeDetEspecificoCombustivelDomain.setUfConsumo(nfeDetEspecificoCombustivelModel.ufConsumo),
				cideBaseCalculo: nfeDetEspecificoCombustivelModel.cideBaseCalculo,
				cideAliquota: nfeDetEspecificoCombustivelModel.cideAliquota,
				cideValor: nfeDetEspecificoCombustivelModel.cideValor,
				encerranteBico: nfeDetEspecificoCombustivelModel.encerranteBico,
				encerranteBomba: nfeDetEspecificoCombustivelModel.encerranteBomba,
				encerranteTanque: nfeDetEspecificoCombustivelModel.encerranteTanque,
				encerranteValorInicio: nfeDetEspecificoCombustivelModel.encerranteValorInicio,
				encerranteValorFim: nfeDetEspecificoCombustivelModel.encerranteValorFim,
				percentualMisturaBiodiesel: nfeDetEspecificoCombustivelModel.percentualMisturaBiodiesel,
			),
			nfeDetCombustivelOrigemGroupedList: nfeDetCombustivelOrigemModelToDrift(nfeDetEspecificoCombustivelModel.nfeDetCombustivelOrigemModelList),
		);
	}

	List<NfeDetCombustivelOrigemGrouped> nfeDetCombustivelOrigemModelToDrift(List<NfeDetCombustivelOrigemModel>? nfeDetCombustivelOrigemModelList) { 
		List<NfeDetCombustivelOrigemGrouped> nfeDetCombustivelOrigemGroupedList = [];
		if (nfeDetCombustivelOrigemModelList != null) {
			for (var nfeDetCombustivelOrigemModel in nfeDetCombustivelOrigemModelList) {
				nfeDetCombustivelOrigemGroupedList.add(
					NfeDetCombustivelOrigemGrouped(
						nfeDetCombustivelOrigem: NfeDetCombustivelOrigem(
							id: nfeDetCombustivelOrigemModel.id,
							idNfeDetEspecificoCombustivel: nfeDetCombustivelOrigemModel.idNfeDetEspecificoCombustivel,
							indicadorImportacao: NfeDetCombustivelOrigemDomain.setIndicadorImportacao(nfeDetCombustivelOrigemModel.indicadorImportacao),
							codigoUf: nfeDetCombustivelOrigemModel.codigoUf,
							percentualOriginario: nfeDetCombustivelOrigemModel.percentualOriginario,
						),
					),
				);
			}
			return nfeDetCombustivelOrigemGroupedList;
		}
		return [];
	}

		
}
