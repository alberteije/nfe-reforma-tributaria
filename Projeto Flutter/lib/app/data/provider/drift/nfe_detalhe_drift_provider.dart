import 'package:nfe/app/data/provider/drift/database/database_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheDriftProvider extends ProviderBase {

	Future<List<NfeDetalheModel>?> getList({Filter? filter}) async {
		List<NfeDetalheGrouped> nfeDetalheDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				nfeDetalheDriftList = await Session.database.nfeDetalheDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				nfeDetalheDriftList = await Session.database.nfeDetalheDao.getGroupedList(); 
			}
			if (nfeDetalheDriftList.isNotEmpty) {
				return toListModel(nfeDetalheDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<NfeDetalheModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.nfeDetalheDao.getObjectGrouped(field: 'id', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeDetalheModel?>? insert(NfeDetalheModel nfeDetalheModel) async {
		try {
			final lastPk = await Session.database.nfeDetalheDao.insertObject(toDrift(nfeDetalheModel));
			nfeDetalheModel.id = lastPk;
			return nfeDetalheModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeDetalheModel?>? update(NfeDetalheModel nfeDetalheModel) async {
		try {
			await Session.database.nfeDetalheDao.updateObject(toDrift(nfeDetalheModel));
			return nfeDetalheModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.nfeDetalheDao.deleteObject(toDrift(NfeDetalheModel(id: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<NfeDetalheModel> toListModel(List<NfeDetalheGrouped> nfeDetalheDriftList) {
		List<NfeDetalheModel> listModel = [];
		for (var nfeDetalheDrift in nfeDetalheDriftList) {
			listModel.add(toModel(nfeDetalheDrift)!);
		}
		return listModel;
	}	

	NfeDetalheModel? toModel(NfeDetalheGrouped? nfeDetalheDrift) {
		if (nfeDetalheDrift != null) {
			return NfeDetalheModel(
				id: nfeDetalheDrift.nfeDetalhe?.id,
				idNfeCabecalho: nfeDetalheDrift.nfeDetalhe?.idNfeCabecalho,
				idProduto: nfeDetalheDrift.nfeDetalhe?.idProduto,
				numeroItem: nfeDetalheDrift.nfeDetalhe?.numeroItem,
				codigoProduto: nfeDetalheDrift.nfeDetalhe?.codigoProduto,
				gtin: nfeDetalheDrift.nfeDetalhe?.gtin,
				nomeProduto: nfeDetalheDrift.nfeDetalhe?.nomeProduto,
				ncm: nfeDetalheDrift.nfeDetalhe?.ncm,
				nve: nfeDetalheDrift.nfeDetalhe?.nve,
				cest: nfeDetalheDrift.nfeDetalhe?.cest,
				indicadorEscalaRelevante: NfeDetalheDomain.getIndicadorEscalaRelevante(nfeDetalheDrift.nfeDetalhe?.indicadorEscalaRelevante),
				cnpjFabricante: nfeDetalheDrift.nfeDetalhe?.cnpjFabricante,
				codigoBeneficioFiscal: nfeDetalheDrift.nfeDetalhe?.codigoBeneficioFiscal,
				exTipi: nfeDetalheDrift.nfeDetalhe?.exTipi,
				cfop: nfeDetalheDrift.nfeDetalhe?.cfop,
				unidadeComercial: nfeDetalheDrift.nfeDetalhe?.unidadeComercial,
				quantidadeComercial: nfeDetalheDrift.nfeDetalhe?.quantidadeComercial,
				numeroPedidoCompra: nfeDetalheDrift.nfeDetalhe?.numeroPedidoCompra,
				itemPedidoCompra: nfeDetalheDrift.nfeDetalhe?.itemPedidoCompra,
				numeroFci: nfeDetalheDrift.nfeDetalhe?.numeroFci,
				numeroRecopi: nfeDetalheDrift.nfeDetalhe?.numeroRecopi,
				valorUnitarioComercial: nfeDetalheDrift.nfeDetalhe?.valorUnitarioComercial,
				valorBrutoProduto: nfeDetalheDrift.nfeDetalhe?.valorBrutoProduto,
				gtinUnidadeTributavel: nfeDetalheDrift.nfeDetalhe?.gtinUnidadeTributavel,
				unidadeTributavel: nfeDetalheDrift.nfeDetalhe?.unidadeTributavel,
				quantidadeTributavel: nfeDetalheDrift.nfeDetalhe?.quantidadeTributavel,
				valorUnitarioTributavel: nfeDetalheDrift.nfeDetalhe?.valorUnitarioTributavel,
				valorFrete: nfeDetalheDrift.nfeDetalhe?.valorFrete,
				valorSeguro: nfeDetalheDrift.nfeDetalhe?.valorSeguro,
				valorDesconto: nfeDetalheDrift.nfeDetalhe?.valorDesconto,
				valorOutrasDespesas: nfeDetalheDrift.nfeDetalhe?.valorOutrasDespesas,
				entraTotal: NfeDetalheDomain.getEntraTotal(nfeDetalheDrift.nfeDetalhe?.entraTotal),
				valorTotalTributos: nfeDetalheDrift.nfeDetalhe?.valorTotalTributos,
				percentualDevolvido: nfeDetalheDrift.nfeDetalhe?.percentualDevolvido,
				valorIpiDevolvido: nfeDetalheDrift.nfeDetalhe?.valorIpiDevolvido,
				informacoesAdicionais: nfeDetalheDrift.nfeDetalhe?.informacoesAdicionais,
				valorSubtotal: nfeDetalheDrift.nfeDetalhe?.valorSubtotal,
				valorTotal: nfeDetalheDrift.nfeDetalhe?.valorTotal,
				indicadorBemMovelUsado: NfeDetalheDomain.getIndicadorBemMovelUsado(nfeDetalheDrift.nfeDetalhe?.indicadorBemMovelUsado),
				codigoBarraDifGtin: nfeDetalheDrift.nfeDetalhe?.codigoBarraDifGtin,
				codigoBarraTribDifGtin: nfeDetalheDrift.nfeDetalhe?.codigoBarraTribDifGtin,
				nfeDetEspecificoVeiculoModel: NfeDetEspecificoVeiculoModel(
					id: nfeDetalheDrift.nfeDetEspecificoVeiculo?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetEspecificoVeiculo?.idNfeDetalhe,
					tipoOperacao: NfeDetEspecificoVeiculoDomain.getTipoOperacao(nfeDetalheDrift.nfeDetEspecificoVeiculo?.tipoOperacao),
					chassi: nfeDetalheDrift.nfeDetEspecificoVeiculo?.chassi,
					cor: nfeDetalheDrift.nfeDetEspecificoVeiculo?.cor,
					descricaoCor: nfeDetalheDrift.nfeDetEspecificoVeiculo?.descricaoCor,
					potenciaMotor: nfeDetalheDrift.nfeDetEspecificoVeiculo?.potenciaMotor,
					cilindradas: nfeDetalheDrift.nfeDetEspecificoVeiculo?.cilindradas,
					pesoLiquido: nfeDetalheDrift.nfeDetEspecificoVeiculo?.pesoLiquido,
					pesoBruto: nfeDetalheDrift.nfeDetEspecificoVeiculo?.pesoBruto,
					numeroSerie: nfeDetalheDrift.nfeDetEspecificoVeiculo?.numeroSerie,
					tipoCombustivel: NfeDetEspecificoVeiculoDomain.getTipoCombustivel(nfeDetalheDrift.nfeDetEspecificoVeiculo?.tipoCombustivel),
					numeroMotor: nfeDetalheDrift.nfeDetEspecificoVeiculo?.numeroMotor,
					capacidadeMaximaTracao: nfeDetalheDrift.nfeDetEspecificoVeiculo?.capacidadeMaximaTracao,
					distanciaEixos: nfeDetalheDrift.nfeDetEspecificoVeiculo?.distanciaEixos,
					anoModelo: nfeDetalheDrift.nfeDetEspecificoVeiculo?.anoModelo,
					anoFabricacao: nfeDetalheDrift.nfeDetEspecificoVeiculo?.anoFabricacao,
					tipoPintura: nfeDetalheDrift.nfeDetEspecificoVeiculo?.tipoPintura,
					tipoVeiculo: NfeDetEspecificoVeiculoDomain.getTipoVeiculo(nfeDetalheDrift.nfeDetEspecificoVeiculo?.tipoVeiculo),
					especieVeiculo: NfeDetEspecificoVeiculoDomain.getEspecieVeiculo(nfeDetalheDrift.nfeDetEspecificoVeiculo?.especieVeiculo),
					condicaoVin: NfeDetEspecificoVeiculoDomain.getCondicaoVin(nfeDetalheDrift.nfeDetEspecificoVeiculo?.condicaoVin),
					condicaoVeiculo: NfeDetEspecificoVeiculoDomain.getCondicaoVeiculo(nfeDetalheDrift.nfeDetEspecificoVeiculo?.condicaoVeiculo),
					codigoMarcaModelo: nfeDetalheDrift.nfeDetEspecificoVeiculo?.codigoMarcaModelo,
					codigoCorDenatran: NfeDetEspecificoVeiculoDomain.getCodigoCorDenatran(nfeDetalheDrift.nfeDetEspecificoVeiculo?.codigoCorDenatran),
					lotacaoMaxima: nfeDetalheDrift.nfeDetEspecificoVeiculo?.lotacaoMaxima,
					restricao: NfeDetEspecificoVeiculoDomain.getRestricao(nfeDetalheDrift.nfeDetEspecificoVeiculo?.restricao),
				),
				nfeDetEspecificoMedicamentoModel: NfeDetEspecificoMedicamentoModel(
					id: nfeDetalheDrift.nfeDetEspecificoMedicamento?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetEspecificoMedicamento?.idNfeDetalhe,
					codigoAnvisa: nfeDetalheDrift.nfeDetEspecificoMedicamento?.codigoAnvisa,
					motivoIsencao: nfeDetalheDrift.nfeDetEspecificoMedicamento?.motivoIsencao,
					precoMaximoConsumidor: nfeDetalheDrift.nfeDetEspecificoMedicamento?.precoMaximoConsumidor,
				),
				nfeDetEspecificoCombustivelModel: NfeDetEspecificoCombustivelModel(
					id: nfeDetalheDrift.nfeDetEspecificoCombustivel?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetEspecificoCombustivel?.idNfeDetalhe,
					codigoAnp: nfeDetalheDrift.nfeDetEspecificoCombustivel?.codigoAnp,
					descricaoAnp: nfeDetalheDrift.nfeDetEspecificoCombustivel?.descricaoAnp,
					percentualGlp: nfeDetalheDrift.nfeDetEspecificoCombustivel?.percentualGlp,
					percentualGasNacional: nfeDetalheDrift.nfeDetEspecificoCombustivel?.percentualGasNacional,
					percentualGasImportado: nfeDetalheDrift.nfeDetEspecificoCombustivel?.percentualGasImportado,
					valorPartida: nfeDetalheDrift.nfeDetEspecificoCombustivel?.valorPartida,
					codif: nfeDetalheDrift.nfeDetEspecificoCombustivel?.codif,
					quantidadeTempAmbiente: nfeDetalheDrift.nfeDetEspecificoCombustivel?.quantidadeTempAmbiente,
					ufConsumo: NfeDetEspecificoCombustivelDomain.getUfConsumo(nfeDetalheDrift.nfeDetEspecificoCombustivel?.ufConsumo),
					cideBaseCalculo: nfeDetalheDrift.nfeDetEspecificoCombustivel?.cideBaseCalculo,
					cideAliquota: nfeDetalheDrift.nfeDetEspecificoCombustivel?.cideAliquota,
					cideValor: nfeDetalheDrift.nfeDetEspecificoCombustivel?.cideValor,
					encerranteBico: nfeDetalheDrift.nfeDetEspecificoCombustivel?.encerranteBico,
					encerranteBomba: nfeDetalheDrift.nfeDetEspecificoCombustivel?.encerranteBomba,
					encerranteTanque: nfeDetalheDrift.nfeDetEspecificoCombustivel?.encerranteTanque,
					encerranteValorInicio: nfeDetalheDrift.nfeDetEspecificoCombustivel?.encerranteValorInicio,
					encerranteValorFim: nfeDetalheDrift.nfeDetEspecificoCombustivel?.encerranteValorFim,
					percentualMisturaBiodiesel: nfeDetalheDrift.nfeDetEspecificoCombustivel?.percentualMisturaBiodiesel,
				),
				nfeDetalheImpostoIpiModel: NfeDetalheImpostoIpiModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIpi?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIpi?.idNfeDetalhe,
					cnpjProdutor: nfeDetalheDrift.nfeDetalheImpostoIpi?.cnpjProdutor,
					codigoSeloIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.codigoSeloIpi,
					quantidadeSeloIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.quantidadeSeloIpi,
					enquadramentoLegalIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.enquadramentoLegalIpi,
					cstIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.cstIpi,
					valorBaseCalculoIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.valorBaseCalculoIpi,
					quantidadeUnidadeTributavel: nfeDetalheDrift.nfeDetalheImpostoIpi?.quantidadeUnidadeTributavel,
					valorUnidadeTributavel: nfeDetalheDrift.nfeDetalheImpostoIpi?.valorUnidadeTributavel,
					aliquotaIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.aliquotaIpi,
					valorIpi: nfeDetalheDrift.nfeDetalheImpostoIpi?.valorIpi,
				),
				nfeDetalheImpostoIiModel: NfeDetalheImpostoIiModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIi?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIi?.idNfeDetalhe,
					valorBcIi: nfeDetalheDrift.nfeDetalheImpostoIi?.valorBcIi,
					valorDespesasAduaneiras: nfeDetalheDrift.nfeDetalheImpostoIi?.valorDespesasAduaneiras,
					valorImpostoImportacao: nfeDetalheDrift.nfeDetalheImpostoIi?.valorImpostoImportacao,
					valorIof: nfeDetalheDrift.nfeDetalheImpostoIi?.valorIof,
				),
				nfeDetalheImpostoPisModel: NfeDetalheImpostoPisModel(
					id: nfeDetalheDrift.nfeDetalheImpostoPis?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoPis?.idNfeDetalhe,
					cstPis: nfeDetalheDrift.nfeDetalheImpostoPis?.cstPis,
					valorBaseCalculoPis: nfeDetalheDrift.nfeDetalheImpostoPis?.valorBaseCalculoPis,
					aliquotaPisPercentual: nfeDetalheDrift.nfeDetalheImpostoPis?.aliquotaPisPercentual,
					valorPis: nfeDetalheDrift.nfeDetalheImpostoPis?.valorPis,
					quantidadeVendida: nfeDetalheDrift.nfeDetalheImpostoPis?.quantidadeVendida,
					aliquotaPisReais: nfeDetalheDrift.nfeDetalheImpostoPis?.aliquotaPisReais,
				),
				nfeDetalheImpostoPisStModel: NfeDetalheImpostoPisStModel(
					id: nfeDetalheDrift.nfeDetalheImpostoPisSt?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoPisSt?.idNfeDetalhe,
					valorBaseCalculoPisSt: nfeDetalheDrift.nfeDetalheImpostoPisSt?.valorBaseCalculoPisSt,
					aliquotaPisStPercentual: nfeDetalheDrift.nfeDetalheImpostoPisSt?.aliquotaPisStPercentual,
					quantidadeVendidaPisSt: nfeDetalheDrift.nfeDetalheImpostoPisSt?.quantidadeVendidaPisSt,
					aliquotaPisStReais: nfeDetalheDrift.nfeDetalheImpostoPisSt?.aliquotaPisStReais,
					valorPisSt: nfeDetalheDrift.nfeDetalheImpostoPisSt?.valorPisSt,
					pisStCompoeValorTotal: NfeDetalheImpostoPisStDomain.getPisStCompoeValorTotal(nfeDetalheDrift.nfeDetalheImpostoPisSt?.pisStCompoeValorTotal),
				),
				nfeDetalheImpostoCofinsModel: NfeDetalheImpostoCofinsModel(
					id: nfeDetalheDrift.nfeDetalheImpostoCofins?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoCofins?.idNfeDetalhe,
					cstCofins: nfeDetalheDrift.nfeDetalheImpostoCofins?.cstCofins,
					baseCalculoCofins: nfeDetalheDrift.nfeDetalheImpostoCofins?.baseCalculoCofins,
					aliquotaCofinsPercentual: nfeDetalheDrift.nfeDetalheImpostoCofins?.aliquotaCofinsPercentual,
					quantidadeVendida: nfeDetalheDrift.nfeDetalheImpostoCofins?.quantidadeVendida,
					aliquotaCofinsReais: nfeDetalheDrift.nfeDetalheImpostoCofins?.aliquotaCofinsReais,
					valorCofins: nfeDetalheDrift.nfeDetalheImpostoCofins?.valorCofins,
				),
				nfeDetalheImpostoCofinsStModel: NfeDetalheImpostoCofinsStModel(
					id: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.idNfeDetalhe,
					baseCalculoCofinsSt: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.baseCalculoCofinsSt,
					aliquotaCofinsStPercentual: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.aliquotaCofinsStPercentual,
					quantidadeVendidaCofinsSt: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.quantidadeVendidaCofinsSt,
					aliquotaCofinsStReais: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.aliquotaCofinsStReais,
					valorCofinsSt: nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.valorCofinsSt,
					cofinsStCompoeValorTotal: NfeDetalheImpostoCofinsStDomain.getCofinsStCompoeValorTotal(nfeDetalheDrift.nfeDetalheImpostoCofinsSt?.cofinsStCompoeValorTotal),
				),
				nfeDetalheImpostoIssqnModel: NfeDetalheImpostoIssqnModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIssqn?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIssqn?.idNfeDetalhe,
					baseCalculoIssqn: nfeDetalheDrift.nfeDetalheImpostoIssqn?.baseCalculoIssqn,
					aliquotaIssqn: nfeDetalheDrift.nfeDetalheImpostoIssqn?.aliquotaIssqn,
					valorIssqn: nfeDetalheDrift.nfeDetalheImpostoIssqn?.valorIssqn,
					municipioIssqn: nfeDetalheDrift.nfeDetalheImpostoIssqn?.municipioIssqn,
					itemListaServicos: nfeDetalheDrift.nfeDetalheImpostoIssqn?.itemListaServicos,
					valorDeducao: nfeDetalheDrift.nfeDetalheImpostoIssqn?.valorDeducao,
					valorOutrasRetencoes: nfeDetalheDrift.nfeDetalheImpostoIssqn?.valorOutrasRetencoes,
					valorDescontoIncondicionado: nfeDetalheDrift.nfeDetalheImpostoIssqn?.valorDescontoIncondicionado,
					valorDescontoCondicionado: nfeDetalheDrift.nfeDetalheImpostoIssqn?.valorDescontoCondicionado,
					valorRetencaoIss: nfeDetalheDrift.nfeDetalheImpostoIssqn?.valorRetencaoIss,
					indicadorExigibilidadeIss: NfeDetalheImpostoIssqnDomain.getIndicadorExigibilidadeIss(nfeDetalheDrift.nfeDetalheImpostoIssqn?.indicadorExigibilidadeIss),
					codigoServico: nfeDetalheDrift.nfeDetalheImpostoIssqn?.codigoServico,
					municipioIncidencia: nfeDetalheDrift.nfeDetalheImpostoIssqn?.municipioIncidencia,
					paisSevicoPrestado: nfeDetalheDrift.nfeDetalheImpostoIssqn?.paisSevicoPrestado,
					numeroProcesso: nfeDetalheDrift.nfeDetalheImpostoIssqn?.numeroProcesso,
					indicadorIncentivoFiscal: NfeDetalheImpostoIssqnDomain.getIndicadorIncentivoFiscal(nfeDetalheDrift.nfeDetalheImpostoIssqn?.indicadorIncentivoFiscal),
				),
				nfeDetalheImpostoIcmsUfdestModel: NfeDetalheImpostoIcmsUfdestModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.idNfeDetalhe,
					valorBcIcmsUfDestino: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.valorBcIcmsUfDestino,
					valorBcFcpUfDestino: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.valorBcFcpUfDestino,
					percentualFcpUfDestino: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.percentualFcpUfDestino,
					aliquotaInternaUfDestino: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.aliquotaInternaUfDestino,
					aliquotaInteresdatualUfEnvolvidas: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.aliquotaInteresdatualUfEnvolvidas,
					percentualProvisorioPartilhaIcms: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.percentualProvisorioPartilhaIcms,
					valorIcmsFcpUfDestino: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.valorIcmsFcpUfDestino,
					valorInterestadualUfDestino: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.valorInterestadualUfDestino,
					valorInterestadualUfRemetente: nfeDetalheDrift.nfeDetalheImpostoIcmsUfdest?.valorInterestadualUfRemetente,
				),
				nfeDetalheImpostoSeletivoModel: NfeDetalheImpostoSeletivoModel(
					id: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.idNfeDetalhe,
					cst: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.cst,
					codigoClassificacaoTributaria: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.codigoClassificacaoTributaria,
					valorBaseCalculo: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.valorBaseCalculo,
					aliquota: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.aliquota,
					aliquotaEspecifica: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.aliquotaEspecifica,
					unidadeTributavel: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.unidadeTributavel,
					quantidadeTributavel: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.quantidadeTributavel,
					valor: nfeDetalheDrift.nfeDetalheImpostoSeletivo?.valor,
				),
				nfeDetalheImpostoIbsUfModel: NfeDetalheImpostoIbsUfModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.idNfeDetalhe,
					cst: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.cst,
					codigoClassificacaoTributaria: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.codigoClassificacaoTributaria,
					valorBaseCalculo: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.valorBaseCalculo,
					aliquota: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.aliquota,
					percentualDiferimento: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.percentualDiferimento,
					valorDiferimento: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.valorDiferimento,
					valorTributoDevolvido: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.valorTributoDevolvido,
					percentualReducaoAliquota: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.percentualReducaoAliquota,
					aliquotaEfetiva: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.aliquotaEfetiva,
					valor: nfeDetalheDrift.nfeDetalheImpostoIbsUf?.valor,
				),
				nfeDetalheImpostoIbsMunModel: NfeDetalheImpostoIbsMunModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.idNfeDetalhe,
					cst: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.cst,
					codigoClassificacaoTributaria: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.codigoClassificacaoTributaria,
					valorBaseCalculo: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.valorBaseCalculo,
					aliquota: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.aliquota,
					percentualDiferimento: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.percentualDiferimento,
					valorDiferimento: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.valorDiferimento,
					valorTributoDevolvido: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.valorTributoDevolvido,
					percentualReducaoAliquota: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.percentualReducaoAliquota,
					aliquotaEfetiva: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.aliquotaEfetiva,
					valor: nfeDetalheDrift.nfeDetalheImpostoIbsMun?.valor,
				),
				nfeDetalheImpostoCbsModel: NfeDetalheImpostoCbsModel(
					id: nfeDetalheDrift.nfeDetalheImpostoCbs?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoCbs?.idNfeDetalhe,
					cst: nfeDetalheDrift.nfeDetalheImpostoCbs?.cst,
					codigoClassificacaoTributaria: nfeDetalheDrift.nfeDetalheImpostoCbs?.codigoClassificacaoTributaria,
					valorBaseCalculo: nfeDetalheDrift.nfeDetalheImpostoCbs?.valorBaseCalculo,
					aliquota: nfeDetalheDrift.nfeDetalheImpostoCbs?.aliquota,
					percentualDiferimento: nfeDetalheDrift.nfeDetalheImpostoCbs?.percentualDiferimento,
					valorDiferimento: nfeDetalheDrift.nfeDetalheImpostoCbs?.valorDiferimento,
					valorTributoDevolvido: nfeDetalheDrift.nfeDetalheImpostoCbs?.valorTributoDevolvido,
					percentualReducaoAliquota: nfeDetalheDrift.nfeDetalheImpostoCbs?.percentualReducaoAliquota,
					aliquotaEfetiva: nfeDetalheDrift.nfeDetalheImpostoCbs?.aliquotaEfetiva,
					valor: nfeDetalheDrift.nfeDetalheImpostoCbs?.valor,
				),
				nfeDetalheTributoRegularModel: NfeDetalheTributoRegularModel(
					id: nfeDetalheDrift.nfeDetalheTributoRegular?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheTributoRegular?.idNfeDetalhe,
					cst: nfeDetalheDrift.nfeDetalheTributoRegular?.cst,
					codigoClassificacaoTributaria: nfeDetalheDrift.nfeDetalheTributoRegular?.codigoClassificacaoTributaria,
					aliquotaIbsUf: nfeDetalheDrift.nfeDetalheTributoRegular?.aliquotaIbsUf,
					valorTributoIbsUf: nfeDetalheDrift.nfeDetalheTributoRegular?.valorTributoIbsUf,
					aliquotaIbsMun: nfeDetalheDrift.nfeDetalheTributoRegular?.aliquotaIbsMun,
					valorTributoIbsMun: nfeDetalheDrift.nfeDetalheTributoRegular?.valorTributoIbsMun,
					alquotaCbs: nfeDetalheDrift.nfeDetalheTributoRegular?.alquotaCbs,
					valorTributoCbs: nfeDetalheDrift.nfeDetalheTributoRegular?.valorTributoCbs,
				),
				nfeDetalheCreditoPresumidoIbsModel: NfeDetalheCreditoPresumidoIbsModel(
					id: nfeDetalheDrift.nfeDetalheCreditoPresumidoIbs?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheCreditoPresumidoIbs?.idNfeDetalhe,
					codigoClassificacao: NfeDetalheCreditoPresumidoIbsDomain.getCodigoClassificacao(nfeDetalheDrift.nfeDetalheCreditoPresumidoIbs?.codigoClassificacao),
					percentual: nfeDetalheDrift.nfeDetalheCreditoPresumidoIbs?.percentual,
					valor: nfeDetalheDrift.nfeDetalheCreditoPresumidoIbs?.valor,
					valorSuspensivo: nfeDetalheDrift.nfeDetalheCreditoPresumidoIbs?.valorSuspensivo,
				),
				nfeDetalheCreditoPresumidoCbsModel: NfeDetalheCreditoPresumidoCbsModel(
					id: nfeDetalheDrift.nfeDetalheCreditoPresumidoCbs?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheCreditoPresumidoCbs?.idNfeDetalhe,
					codigoClassificacao: NfeDetalheCreditoPresumidoCbsDomain.getCodigoClassificacao(nfeDetalheDrift.nfeDetalheCreditoPresumidoCbs?.codigoClassificacao),
					percentual: nfeDetalheDrift.nfeDetalheCreditoPresumidoCbs?.percentual,
					valor: nfeDetalheDrift.nfeDetalheCreditoPresumidoCbs?.valor,
					valorSuspensivo: nfeDetalheDrift.nfeDetalheCreditoPresumidoCbs?.valorSuspensivo,
				),
				nfeDetalheCompraGovernoModel: NfeDetalheCompraGovernoModel(
					id: nfeDetalheDrift.nfeDetalheCompraGoverno?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheCompraGoverno?.idNfeDetalhe,
					aliquotaIbsUf: nfeDetalheDrift.nfeDetalheCompraGoverno?.aliquotaIbsUf,
					valorIbsUf: nfeDetalheDrift.nfeDetalheCompraGoverno?.valorIbsUf,
					aliquotaIbsMun: nfeDetalheDrift.nfeDetalheCompraGoverno?.aliquotaIbsMun,
					valorIbsMun: nfeDetalheDrift.nfeDetalheCompraGoverno?.valorIbsMun,
					aliquotaCbs: nfeDetalheDrift.nfeDetalheCompraGoverno?.aliquotaCbs,
					valorCbs: nfeDetalheDrift.nfeDetalheCompraGoverno?.valorCbs,
				),
				nfeDetalheImpostoMonofasicoModel: NfeDetalheImpostoMonofasicoModel(
					id: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.idNfeDetalhe,
					quantidadeTributada: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.quantidadeTributada,
					aliquotaIbs: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.aliquotaIbs,
					aliquotaCbs: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.aliquotaCbs,
					valorIbs: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorIbs,
					valorCbs: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorCbs,
					quantidadeTributadaRetencao: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.quantidadeTributadaRetencao,
					aliquotaIbsRetencao: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.aliquotaIbsRetencao,
					valorIbsRetencao: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorIbsRetencao,
					aliquotaCbsRetencao: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.aliquotaCbsRetencao,
					valorCbsRetencao: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorCbsRetencao,
					quantidadeTributadaRetido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.quantidadeTributadaRetido,
					aliquotaIbsRetido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.aliquotaIbsRetido,
					valorIbsRetido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorIbsRetido,
					aliquotaCbsRetido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.aliquotaCbsRetido,
					valorCbsRetido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorCbsRetido,
					percentualIbsDiferido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.percentualIbsDiferido,
					valorIbsDiferido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorIbsDiferido,
					percentualCbsDiferido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.percentualCbsDiferido,
					valorCbsDiferido: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.valorCbsDiferido,
					totalIbs: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.totalIbs,
					totalCbs: nfeDetalheDrift.nfeDetalheImpostoMonofasico?.totalCbs,
				),
				nfeDetalheTransfCreditoModel: NfeDetalheTransfCreditoModel(
					id: nfeDetalheDrift.nfeDetalheTransfCredito?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheTransfCredito?.idNfeDetalhe,
					valorIbs: nfeDetalheDrift.nfeDetalheTransfCredito?.valorIbs,
					valorCbs: nfeDetalheDrift.nfeDetalheTransfCredito?.valorCbs,
				),
				nfeDetalheIbsZfmModel: NfeDetalheIbsZfmModel(
					id: nfeDetalheDrift.nfeDetalheIbsZfm?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheIbsZfm?.idNfeDetalhe,
					tipoCredito: NfeDetalheIbsZfmDomain.getTipoCredito(nfeDetalheDrift.nfeDetalheIbsZfm?.tipoCredito),
					valorCredito: nfeDetalheDrift.nfeDetalheIbsZfm?.valorCredito,
				),
				nfeDetalheImpostoIcmsModel: NfeDetalheImpostoIcmsModel(
					id: nfeDetalheDrift.nfeDetalheImpostoIcms?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheImpostoIcms?.idNfeDetalhe,
					origemMercadoria: NfeDetalheImpostoIcmsDomain.getOrigemMercadoria(nfeDetalheDrift.nfeDetalheImpostoIcms?.origemMercadoria),
					cstIcms: nfeDetalheDrift.nfeDetalheImpostoIcms?.cstIcms,
					csosn: nfeDetalheDrift.nfeDetalheImpostoIcms?.csosn,
					modalidadeBcIcms: NfeDetalheImpostoIcmsDomain.getModalidadeBcIcms(nfeDetalheDrift.nfeDetalheImpostoIcms?.modalidadeBcIcms),
					percentualReducaoBcIcms: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualReducaoBcIcms,
					valorBcIcms: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorBcIcms,
					aliquotaIcms: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaIcms,
					valorIcmsOperacao: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsOperacao,
					percentualDiferimento: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualDiferimento,
					valorIcmsDiferido: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsDiferido,
					valorIcms: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcms,
					baseCalculoFcp: nfeDetalheDrift.nfeDetalheImpostoIcms?.baseCalculoFcp,
					percentualFcp: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualFcp,
					valorFcp: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorFcp,
					modalidadeBcIcmsSt: NfeDetalheImpostoIcmsDomain.getModalidadeBcIcmsSt(nfeDetalheDrift.nfeDetalheImpostoIcms?.modalidadeBcIcmsSt),
					percentualMvaIcmsSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualMvaIcmsSt,
					percentualReducaoBcIcmsSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualReducaoBcIcmsSt,
					valorBaseCalculoIcmsSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorBaseCalculoIcmsSt,
					aliquotaIcmsSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaIcmsSt,
					valorIcmsSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsSt,
					baseCalculoFcpSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.baseCalculoFcpSt,
					percentualFcpSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualFcpSt,
					valorFcpSt: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorFcpSt,
					ufSt: NfeDetalheImpostoIcmsDomain.getUfSt(nfeDetalheDrift.nfeDetalheImpostoIcms?.ufSt),
					percentualBcOperacaoPropria: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualBcOperacaoPropria,
					valorBcIcmsStRetido: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorBcIcmsStRetido,
					aliquotaSuportadaConsumidor: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaSuportadaConsumidor,
					valorIcmsSubstituto: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsSubstituto,
					valorIcmsStRetido: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsStRetido,
					baseCalculoFcpStRetido: nfeDetalheDrift.nfeDetalheImpostoIcms?.baseCalculoFcpStRetido,
					percentualFcpStRetido: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualFcpStRetido,
					valorFcpStRetido: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorFcpStRetido,
					motivoDesoneracaoIcms: nfeDetalheDrift.nfeDetalheImpostoIcms?.motivoDesoneracaoIcms,
					valorIcmsDesonerado: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsDesonerado,
					aliquotaCreditoIcmsSn: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaCreditoIcmsSn,
					valorCreditoIcmsSn: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorCreditoIcmsSn,
					valorBcIcmsStDestino: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorBcIcmsStDestino,
					valorIcmsStDestino: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsStDestino,
					percentualReducaoBcEfetivo: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualReducaoBcEfetivo,
					valorBcEfetivo: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorBcEfetivo,
					aliquotaIcmsEfetivo: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaIcmsEfetivo,
					valorIcmsEfetivo: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsEfetivo,
					valorIcmsStDesonerado: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsStDesonerado,
					motivoDesoneracaoIcmsSt: NfeDetalheImpostoIcmsDomain.getMotivoDesoneracaoIcmsSt(nfeDetalheDrift.nfeDetalheImpostoIcms?.motivoDesoneracaoIcmsSt),
					taxaFcpDiferido: nfeDetalheDrift.nfeDetalheImpostoIcms?.taxaFcpDiferido,
					valorFcpDiferido: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorFcpDiferido,
					valorFcpEfetivo: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorFcpEfetivo,
					desoneradoDeduz: NfeDetalheImpostoIcmsDomain.getDesoneradoDeduz(nfeDetalheDrift.nfeDetalheImpostoIcms?.desoneradoDeduz),
					quantidadeTributada: nfeDetalheDrift.nfeDetalheImpostoIcms?.quantidadeTributada,
					aliquotaAdRem: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaAdRem,
					valorIcmsMono: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsMono,
					quantidadeSujeitaRetencao: nfeDetalheDrift.nfeDetalheImpostoIcms?.quantidadeSujeitaRetencao,
					aliquotaAdRemRetencao: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaAdRemRetencao,
					valorIcmsMonoRetencao: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsMonoRetencao,
					percentualReducaoAdRem: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualReducaoAdRem,
					motivoReducaoAdRem: NfeDetalheImpostoIcmsDomain.getMotivoReducaoAdRem(nfeDetalheDrift.nfeDetalheImpostoIcms?.motivoReducaoAdRem),
					valorIcmsMonoOperacao: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsMonoOperacao,
					percentualDiferimentoMono: nfeDetalheDrift.nfeDetalheImpostoIcms?.percentualDiferimentoMono,
					valorIcmsDiferidoMono: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsDiferidoMono,
					quantidadeTributadaRetida: nfeDetalheDrift.nfeDetalheImpostoIcms?.quantidadeTributadaRetida,
					aliquotaAdRemRetida: nfeDetalheDrift.nfeDetalheImpostoIcms?.aliquotaAdRemRetida,
					valorIcmsRetido: nfeDetalheDrift.nfeDetalheImpostoIcms?.valorIcmsRetido,
				),
				nfeDetalheDfeReferenciadoModel: NfeDetalheDfeReferenciadoModel(
					id: nfeDetalheDrift.nfeDetalheDfeReferenciado?.id,
					idNfeDetalhe: nfeDetalheDrift.nfeDetalheDfeReferenciado?.idNfeDetalhe,
					chaveAcesso: nfeDetalheDrift.nfeDetalheDfeReferenciado?.chaveAcesso,
					numeroItem: nfeDetalheDrift.nfeDetalheDfeReferenciado?.numeroItem,
				),
				nfeDetEspecificoArmamentoModelList: nfeDetEspecificoArmamentoDriftToModel(nfeDetalheDrift.nfeDetEspecificoArmamentoGroupedList),
				nfeDeclaracaoImportacaoModelList: nfeDeclaracaoImportacaoDriftToModel(nfeDetalheDrift.nfeDeclaracaoImportacaoGroupedList),
				nfeExportacaoModelList: nfeExportacaoDriftToModel(nfeDetalheDrift.nfeExportacaoGroupedList),
				nfeItemRastreadoModelList: nfeItemRastreadoDriftToModel(nfeDetalheDrift.nfeItemRastreadoGroupedList),
				produtoModel: ProdutoModel(
					id: nfeDetalheDrift.produto?.id,
					idProdutoSubgrupo: nfeDetalheDrift.produto?.idProdutoSubgrupo,
					idProdutoMarca: nfeDetalheDrift.produto?.idProdutoMarca,
					idProdutoUnidade: nfeDetalheDrift.produto?.idProdutoUnidade,
					idTributIcmsCustomCab: nfeDetalheDrift.produto?.idTributIcmsCustomCab,
					idTributGrupoTributario: nfeDetalheDrift.produto?.idTributGrupoTributario,
					nome: nfeDetalheDrift.produto?.nome,
					descricao: nfeDetalheDrift.produto?.descricao,
					gtin: nfeDetalheDrift.produto?.gtin,
					codigoInterno: nfeDetalheDrift.produto?.codigoInterno,
					valorCompra: nfeDetalheDrift.produto?.valorCompra,
					valorVenda: nfeDetalheDrift.produto?.valorVenda,
					codigoNcm: nfeDetalheDrift.produto?.codigoNcm,
					estoqueMinimo: nfeDetalheDrift.produto?.estoqueMinimo,
					estoqueMaximo: nfeDetalheDrift.produto?.estoqueMaximo,
					quantidadeEstoque: nfeDetalheDrift.produto?.quantidadeEstoque,
					dataCadastro: nfeDetalheDrift.produto?.dataCadastro,
				),				
			);
		} else {
			return null;
		}
	}

	List<NfeDetEspecificoArmamentoModel> nfeDetEspecificoArmamentoDriftToModel(List<NfeDetEspecificoArmamentoGrouped>? nfeDetEspecificoArmamentoDriftList) { 
		List<NfeDetEspecificoArmamentoModel> nfeDetEspecificoArmamentoModelList = [];
		if (nfeDetEspecificoArmamentoDriftList != null) {
			for (var nfeDetEspecificoArmamentoGrouped in nfeDetEspecificoArmamentoDriftList) {
				nfeDetEspecificoArmamentoModelList.add(
					NfeDetEspecificoArmamentoModel(
						id: nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.id,
						idNfeDetalhe: nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.idNfeDetalhe,
						tipoArma: NfeDetEspecificoArmamentoDomain.getTipoArma(nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.tipoArma),
						numeroSerieArma: nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.numeroSerieArma,
						numeroSerieCano: nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.numeroSerieCano,
						descricao: nfeDetEspecificoArmamentoGrouped.nfeDetEspecificoArmamento?.descricao,
					)
				);
			}
			return nfeDetEspecificoArmamentoModelList;
		}
		return [];
	}

	List<NfeDeclaracaoImportacaoModel> nfeDeclaracaoImportacaoDriftToModel(List<NfeDeclaracaoImportacaoGrouped>? nfeDeclaracaoImportacaoDriftList) { 
		List<NfeDeclaracaoImportacaoModel> nfeDeclaracaoImportacaoModelList = [];
		if (nfeDeclaracaoImportacaoDriftList != null) {
			for (var nfeDeclaracaoImportacaoGrouped in nfeDeclaracaoImportacaoDriftList) {
				nfeDeclaracaoImportacaoModelList.add(
					NfeDeclaracaoImportacaoModel(
						id: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.id,
						idNfeDetalhe: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.idNfeDetalhe,
						numeroDocumento: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.numeroDocumento,
						dataRegistro: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.dataRegistro,
						localDesembaraco: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.localDesembaraco,
						ufDesembaraco: NfeDeclaracaoImportacaoDomain.getUfDesembaraco(nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.ufDesembaraco),
						dataDesembaraco: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.dataDesembaraco,
						viaTransporte: NfeDeclaracaoImportacaoDomain.getViaTransporte(nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.viaTransporte),
						valorAfrmm: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.valorAfrmm,
						formaIntermediacao: NfeDeclaracaoImportacaoDomain.getFormaIntermediacao(nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.formaIntermediacao),
						cnpj: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.cnpj,
						ufTerceiro: NfeDeclaracaoImportacaoDomain.getUfTerceiro(nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.ufTerceiro),
						codigoExportador: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.codigoExportador,
						cpf: nfeDeclaracaoImportacaoGrouped.nfeDeclaracaoImportacao?.cpf,
					)
				);
			}
			return nfeDeclaracaoImportacaoModelList;
		}
		return [];
	}

	List<NfeExportacaoModel> nfeExportacaoDriftToModel(List<NfeExportacaoGrouped>? nfeExportacaoDriftList) { 
		List<NfeExportacaoModel> nfeExportacaoModelList = [];
		if (nfeExportacaoDriftList != null) {
			for (var nfeExportacaoGrouped in nfeExportacaoDriftList) {
				nfeExportacaoModelList.add(
					NfeExportacaoModel(
						id: nfeExportacaoGrouped.nfeExportacao?.id,
						idNfeDetalhe: nfeExportacaoGrouped.nfeExportacao?.idNfeDetalhe,
						drawback: nfeExportacaoGrouped.nfeExportacao?.drawback,
						numeroRegistro: nfeExportacaoGrouped.nfeExportacao?.numeroRegistro,
						chaveAcesso: nfeExportacaoGrouped.nfeExportacao?.chaveAcesso,
						quantidade: nfeExportacaoGrouped.nfeExportacao?.quantidade,
					)
				);
			}
			return nfeExportacaoModelList;
		}
		return [];
	}

	List<NfeItemRastreadoModel> nfeItemRastreadoDriftToModel(List<NfeItemRastreadoGrouped>? nfeItemRastreadoDriftList) { 
		List<NfeItemRastreadoModel> nfeItemRastreadoModelList = [];
		if (nfeItemRastreadoDriftList != null) {
			for (var nfeItemRastreadoGrouped in nfeItemRastreadoDriftList) {
				nfeItemRastreadoModelList.add(
					NfeItemRastreadoModel(
						id: nfeItemRastreadoGrouped.nfeItemRastreado?.id,
						idNfeDetalhe: nfeItemRastreadoGrouped.nfeItemRastreado?.idNfeDetalhe,
						numeroLote: nfeItemRastreadoGrouped.nfeItemRastreado?.numeroLote,
						quantidadeItens: nfeItemRastreadoGrouped.nfeItemRastreado?.quantidadeItens,
						dataFabricacao: nfeItemRastreadoGrouped.nfeItemRastreado?.dataFabricacao,
						dataValidade: nfeItemRastreadoGrouped.nfeItemRastreado?.dataValidade,
						codigoAgregacao: nfeItemRastreadoGrouped.nfeItemRastreado?.codigoAgregacao,
					)
				);
			}
			return nfeItemRastreadoModelList;
		}
		return [];
	}


	NfeDetalheGrouped toDrift(NfeDetalheModel nfeDetalheModel) {
		return NfeDetalheGrouped(
			nfeDetalhe: NfeDetalhe(
				id: nfeDetalheModel.id,
				idNfeCabecalho: nfeDetalheModel.idNfeCabecalho,
				idProduto: nfeDetalheModel.idProduto,
				numeroItem: nfeDetalheModel.numeroItem,
				codigoProduto: nfeDetalheModel.codigoProduto,
				gtin: nfeDetalheModel.gtin,
				nomeProduto: nfeDetalheModel.nomeProduto,
				ncm: nfeDetalheModel.ncm,
				nve: nfeDetalheModel.nve,
				cest: nfeDetalheModel.cest,
				indicadorEscalaRelevante: NfeDetalheDomain.setIndicadorEscalaRelevante(nfeDetalheModel.indicadorEscalaRelevante),
				cnpjFabricante: Util.removeMask(nfeDetalheModel.cnpjFabricante),
				codigoBeneficioFiscal: nfeDetalheModel.codigoBeneficioFiscal,
				exTipi: nfeDetalheModel.exTipi,
				cfop: nfeDetalheModel.cfop,
				unidadeComercial: nfeDetalheModel.unidadeComercial,
				quantidadeComercial: nfeDetalheModel.quantidadeComercial,
				numeroPedidoCompra: nfeDetalheModel.numeroPedidoCompra,
				itemPedidoCompra: nfeDetalheModel.itemPedidoCompra,
				numeroFci: nfeDetalheModel.numeroFci,
				numeroRecopi: nfeDetalheModel.numeroRecopi,
				valorUnitarioComercial: nfeDetalheModel.valorUnitarioComercial,
				valorBrutoProduto: nfeDetalheModel.valorBrutoProduto,
				gtinUnidadeTributavel: nfeDetalheModel.gtinUnidadeTributavel,
				unidadeTributavel: nfeDetalheModel.unidadeTributavel,
				quantidadeTributavel: nfeDetalheModel.quantidadeTributavel,
				valorUnitarioTributavel: nfeDetalheModel.valorUnitarioTributavel,
				valorFrete: nfeDetalheModel.valorFrete,
				valorSeguro: nfeDetalheModel.valorSeguro,
				valorDesconto: nfeDetalheModel.valorDesconto,
				valorOutrasDespesas: nfeDetalheModel.valorOutrasDespesas,
				entraTotal: NfeDetalheDomain.setEntraTotal(nfeDetalheModel.entraTotal),
				valorTotalTributos: nfeDetalheModel.valorTotalTributos,
				percentualDevolvido: nfeDetalheModel.percentualDevolvido,
				valorIpiDevolvido: nfeDetalheModel.valorIpiDevolvido,
				informacoesAdicionais: nfeDetalheModel.informacoesAdicionais,
				valorSubtotal: nfeDetalheModel.valorSubtotal,
				valorTotal: nfeDetalheModel.valorTotal,
				indicadorBemMovelUsado: NfeDetalheDomain.setIndicadorBemMovelUsado(nfeDetalheModel.indicadorBemMovelUsado),
				codigoBarraDifGtin: nfeDetalheModel.codigoBarraDifGtin,
				codigoBarraTribDifGtin: nfeDetalheModel.codigoBarraTribDifGtin,
			),
			nfeDetEspecificoVeiculo: NfeDetEspecificoVeiculo(
				id: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.idNfeDetalhe,
				tipoOperacao: NfeDetEspecificoVeiculoDomain.setTipoOperacao(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.tipoOperacao),
				chassi: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.chassi,
				cor: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.cor,
				descricaoCor: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.descricaoCor,
				potenciaMotor: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.potenciaMotor,
				cilindradas: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.cilindradas,
				pesoLiquido: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.pesoLiquido,
				pesoBruto: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.pesoBruto,
				numeroSerie: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.numeroSerie,
				tipoCombustivel: NfeDetEspecificoVeiculoDomain.setTipoCombustivel(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.tipoCombustivel),
				numeroMotor: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.numeroMotor,
				capacidadeMaximaTracao: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.capacidadeMaximaTracao,
				distanciaEixos: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.distanciaEixos,
				anoModelo: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.anoModelo,
				anoFabricacao: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.anoFabricacao,
				tipoPintura: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.tipoPintura,
				tipoVeiculo: NfeDetEspecificoVeiculoDomain.setTipoVeiculo(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.tipoVeiculo),
				especieVeiculo: NfeDetEspecificoVeiculoDomain.setEspecieVeiculo(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.especieVeiculo),
				condicaoVin: NfeDetEspecificoVeiculoDomain.setCondicaoVin(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.condicaoVin),
				condicaoVeiculo: NfeDetEspecificoVeiculoDomain.setCondicaoVeiculo(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.condicaoVeiculo),
				codigoMarcaModelo: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.codigoMarcaModelo,
				codigoCorDenatran: NfeDetEspecificoVeiculoDomain.setCodigoCorDenatran(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.codigoCorDenatran),
				lotacaoMaxima: nfeDetalheModel.nfeDetEspecificoVeiculoModel?.lotacaoMaxima,
				restricao: NfeDetEspecificoVeiculoDomain.setRestricao(nfeDetalheModel.nfeDetEspecificoVeiculoModel?.restricao),
			),
			nfeDetEspecificoMedicamento: NfeDetEspecificoMedicamento(
				id: nfeDetalheModel.nfeDetEspecificoMedicamentoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetEspecificoMedicamentoModel?.idNfeDetalhe,
				codigoAnvisa: nfeDetalheModel.nfeDetEspecificoMedicamentoModel?.codigoAnvisa,
				motivoIsencao: nfeDetalheModel.nfeDetEspecificoMedicamentoModel?.motivoIsencao,
				precoMaximoConsumidor: nfeDetalheModel.nfeDetEspecificoMedicamentoModel?.precoMaximoConsumidor,
			),
			nfeDetEspecificoCombustivel: NfeDetEspecificoCombustivel(
				id: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.idNfeDetalhe,
				codigoAnp: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.codigoAnp,
				descricaoAnp: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.descricaoAnp,
				percentualGlp: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.percentualGlp,
				percentualGasNacional: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.percentualGasNacional,
				percentualGasImportado: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.percentualGasImportado,
				valorPartida: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.valorPartida,
				codif: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.codif,
				quantidadeTempAmbiente: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.quantidadeTempAmbiente,
				ufConsumo: NfeDetEspecificoCombustivelDomain.setUfConsumo(nfeDetalheModel.nfeDetEspecificoCombustivelModel?.ufConsumo),
				cideBaseCalculo: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.cideBaseCalculo,
				cideAliquota: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.cideAliquota,
				cideValor: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.cideValor,
				encerranteBico: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.encerranteBico,
				encerranteBomba: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.encerranteBomba,
				encerranteTanque: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.encerranteTanque,
				encerranteValorInicio: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.encerranteValorInicio,
				encerranteValorFim: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.encerranteValorFim,
				percentualMisturaBiodiesel: nfeDetalheModel.nfeDetEspecificoCombustivelModel?.percentualMisturaBiodiesel,
			),
			nfeDetalheImpostoIpi: NfeDetalheImpostoIpi(
				id: nfeDetalheModel.nfeDetalheImpostoIpiModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIpiModel?.idNfeDetalhe,
				cnpjProdutor: Util.removeMask(nfeDetalheModel.nfeDetalheImpostoIpiModel?.cnpjProdutor),
				codigoSeloIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.codigoSeloIpi,
				quantidadeSeloIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.quantidadeSeloIpi,
				enquadramentoLegalIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.enquadramentoLegalIpi,
				cstIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.cstIpi,
				valorBaseCalculoIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.valorBaseCalculoIpi,
				quantidadeUnidadeTributavel: nfeDetalheModel.nfeDetalheImpostoIpiModel?.quantidadeUnidadeTributavel,
				valorUnidadeTributavel: nfeDetalheModel.nfeDetalheImpostoIpiModel?.valorUnidadeTributavel,
				aliquotaIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.aliquotaIpi,
				valorIpi: nfeDetalheModel.nfeDetalheImpostoIpiModel?.valorIpi,
			),
			nfeDetalheImpostoIi: NfeDetalheImpostoIi(
				id: nfeDetalheModel.nfeDetalheImpostoIiModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIiModel?.idNfeDetalhe,
				valorBcIi: nfeDetalheModel.nfeDetalheImpostoIiModel?.valorBcIi,
				valorDespesasAduaneiras: nfeDetalheModel.nfeDetalheImpostoIiModel?.valorDespesasAduaneiras,
				valorImpostoImportacao: nfeDetalheModel.nfeDetalheImpostoIiModel?.valorImpostoImportacao,
				valorIof: nfeDetalheModel.nfeDetalheImpostoIiModel?.valorIof,
			),
			nfeDetalheImpostoPis: NfeDetalheImpostoPis(
				id: nfeDetalheModel.nfeDetalheImpostoPisModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoPisModel?.idNfeDetalhe,
				cstPis: nfeDetalheModel.nfeDetalheImpostoPisModel?.cstPis,
				valorBaseCalculoPis: nfeDetalheModel.nfeDetalheImpostoPisModel?.valorBaseCalculoPis,
				aliquotaPisPercentual: nfeDetalheModel.nfeDetalheImpostoPisModel?.aliquotaPisPercentual,
				valorPis: nfeDetalheModel.nfeDetalheImpostoPisModel?.valorPis,
				quantidadeVendida: nfeDetalheModel.nfeDetalheImpostoPisModel?.quantidadeVendida,
				aliquotaPisReais: nfeDetalheModel.nfeDetalheImpostoPisModel?.aliquotaPisReais,
			),
			nfeDetalheImpostoPisSt: NfeDetalheImpostoPisSt(
				id: nfeDetalheModel.nfeDetalheImpostoPisStModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoPisStModel?.idNfeDetalhe,
				valorBaseCalculoPisSt: nfeDetalheModel.nfeDetalheImpostoPisStModel?.valorBaseCalculoPisSt,
				aliquotaPisStPercentual: nfeDetalheModel.nfeDetalheImpostoPisStModel?.aliquotaPisStPercentual,
				quantidadeVendidaPisSt: nfeDetalheModel.nfeDetalheImpostoPisStModel?.quantidadeVendidaPisSt,
				aliquotaPisStReais: nfeDetalheModel.nfeDetalheImpostoPisStModel?.aliquotaPisStReais,
				valorPisSt: nfeDetalheModel.nfeDetalheImpostoPisStModel?.valorPisSt,
				pisStCompoeValorTotal: NfeDetalheImpostoPisStDomain.setPisStCompoeValorTotal(nfeDetalheModel.nfeDetalheImpostoPisStModel?.pisStCompoeValorTotal),
			),
			nfeDetalheImpostoCofins: NfeDetalheImpostoCofins(
				id: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.idNfeDetalhe,
				cstCofins: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.cstCofins,
				baseCalculoCofins: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.baseCalculoCofins,
				aliquotaCofinsPercentual: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.aliquotaCofinsPercentual,
				quantidadeVendida: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.quantidadeVendida,
				aliquotaCofinsReais: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.aliquotaCofinsReais,
				valorCofins: nfeDetalheModel.nfeDetalheImpostoCofinsModel?.valorCofins,
			),
			nfeDetalheImpostoCofinsSt: NfeDetalheImpostoCofinsSt(
				id: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.idNfeDetalhe,
				baseCalculoCofinsSt: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.baseCalculoCofinsSt,
				aliquotaCofinsStPercentual: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.aliquotaCofinsStPercentual,
				quantidadeVendidaCofinsSt: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.quantidadeVendidaCofinsSt,
				aliquotaCofinsStReais: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.aliquotaCofinsStReais,
				valorCofinsSt: nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.valorCofinsSt,
				cofinsStCompoeValorTotal: NfeDetalheImpostoCofinsStDomain.setCofinsStCompoeValorTotal(nfeDetalheModel.nfeDetalheImpostoCofinsStModel?.cofinsStCompoeValorTotal),
			),
			nfeDetalheImpostoIssqn: NfeDetalheImpostoIssqn(
				id: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.idNfeDetalhe,
				baseCalculoIssqn: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.baseCalculoIssqn,
				aliquotaIssqn: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.aliquotaIssqn,
				valorIssqn: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.valorIssqn,
				municipioIssqn: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.municipioIssqn,
				itemListaServicos: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.itemListaServicos,
				valorDeducao: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.valorDeducao,
				valorOutrasRetencoes: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.valorOutrasRetencoes,
				valorDescontoIncondicionado: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.valorDescontoIncondicionado,
				valorDescontoCondicionado: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.valorDescontoCondicionado,
				valorRetencaoIss: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.valorRetencaoIss,
				indicadorExigibilidadeIss: NfeDetalheImpostoIssqnDomain.setIndicadorExigibilidadeIss(nfeDetalheModel.nfeDetalheImpostoIssqnModel?.indicadorExigibilidadeIss),
				codigoServico: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.codigoServico,
				municipioIncidencia: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.municipioIncidencia,
				paisSevicoPrestado: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.paisSevicoPrestado,
				numeroProcesso: nfeDetalheModel.nfeDetalheImpostoIssqnModel?.numeroProcesso,
				indicadorIncentivoFiscal: NfeDetalheImpostoIssqnDomain.setIndicadorIncentivoFiscal(nfeDetalheModel.nfeDetalheImpostoIssqnModel?.indicadorIncentivoFiscal),
			),
			nfeDetalheImpostoIcmsUfdest: NfeDetalheImpostoIcmsUfdest(
				id: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.idNfeDetalhe,
				valorBcIcmsUfDestino: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.valorBcIcmsUfDestino,
				valorBcFcpUfDestino: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.valorBcFcpUfDestino,
				percentualFcpUfDestino: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.percentualFcpUfDestino,
				aliquotaInternaUfDestino: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.aliquotaInternaUfDestino,
				aliquotaInteresdatualUfEnvolvidas: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.aliquotaInteresdatualUfEnvolvidas,
				percentualProvisorioPartilhaIcms: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.percentualProvisorioPartilhaIcms,
				valorIcmsFcpUfDestino: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.valorIcmsFcpUfDestino,
				valorInterestadualUfDestino: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.valorInterestadualUfDestino,
				valorInterestadualUfRemetente: nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel?.valorInterestadualUfRemetente,
			),
			nfeDetalheImpostoSeletivo: NfeDetalheImpostoSeletivo(
				id: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.idNfeDetalhe,
				cst: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.cst,
				codigoClassificacaoTributaria: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.codigoClassificacaoTributaria,
				valorBaseCalculo: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.valorBaseCalculo,
				aliquota: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.aliquota,
				aliquotaEspecifica: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.aliquotaEspecifica,
				unidadeTributavel: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.unidadeTributavel,
				quantidadeTributavel: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.quantidadeTributavel,
				valor: nfeDetalheModel.nfeDetalheImpostoSeletivoModel?.valor,
			),
			nfeDetalheImpostoIbsUf: NfeDetalheImpostoIbsUf(
				id: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.idNfeDetalhe,
				cst: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.cst,
				codigoClassificacaoTributaria: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.codigoClassificacaoTributaria,
				valorBaseCalculo: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.valorBaseCalculo,
				aliquota: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.aliquota,
				percentualDiferimento: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.percentualDiferimento,
				valorDiferimento: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.valorDiferimento,
				valorTributoDevolvido: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.valorTributoDevolvido,
				percentualReducaoAliquota: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.percentualReducaoAliquota,
				aliquotaEfetiva: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.aliquotaEfetiva,
				valor: nfeDetalheModel.nfeDetalheImpostoIbsUfModel?.valor,
			),
			nfeDetalheImpostoIbsMun: NfeDetalheImpostoIbsMun(
				id: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.idNfeDetalhe,
				cst: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.cst,
				codigoClassificacaoTributaria: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.codigoClassificacaoTributaria,
				valorBaseCalculo: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.valorBaseCalculo,
				aliquota: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.aliquota,
				percentualDiferimento: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.percentualDiferimento,
				valorDiferimento: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.valorDiferimento,
				valorTributoDevolvido: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.valorTributoDevolvido,
				percentualReducaoAliquota: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.percentualReducaoAliquota,
				aliquotaEfetiva: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.aliquotaEfetiva,
				valor: nfeDetalheModel.nfeDetalheImpostoIbsMunModel?.valor,
			),
			nfeDetalheImpostoCbs: NfeDetalheImpostoCbs(
				id: nfeDetalheModel.nfeDetalheImpostoCbsModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoCbsModel?.idNfeDetalhe,
				cst: nfeDetalheModel.nfeDetalheImpostoCbsModel?.cst,
				codigoClassificacaoTributaria: nfeDetalheModel.nfeDetalheImpostoCbsModel?.codigoClassificacaoTributaria,
				valorBaseCalculo: nfeDetalheModel.nfeDetalheImpostoCbsModel?.valorBaseCalculo,
				aliquota: nfeDetalheModel.nfeDetalheImpostoCbsModel?.aliquota,
				percentualDiferimento: nfeDetalheModel.nfeDetalheImpostoCbsModel?.percentualDiferimento,
				valorDiferimento: nfeDetalheModel.nfeDetalheImpostoCbsModel?.valorDiferimento,
				valorTributoDevolvido: nfeDetalheModel.nfeDetalheImpostoCbsModel?.valorTributoDevolvido,
				percentualReducaoAliquota: nfeDetalheModel.nfeDetalheImpostoCbsModel?.percentualReducaoAliquota,
				aliquotaEfetiva: nfeDetalheModel.nfeDetalheImpostoCbsModel?.aliquotaEfetiva,
				valor: nfeDetalheModel.nfeDetalheImpostoCbsModel?.valor,
			),
			nfeDetalheTributoRegular: NfeDetalheTributoRegular(
				id: nfeDetalheModel.nfeDetalheTributoRegularModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheTributoRegularModel?.idNfeDetalhe,
				cst: nfeDetalheModel.nfeDetalheTributoRegularModel?.cst,
				codigoClassificacaoTributaria: nfeDetalheModel.nfeDetalheTributoRegularModel?.codigoClassificacaoTributaria,
				aliquotaIbsUf: nfeDetalheModel.nfeDetalheTributoRegularModel?.aliquotaIbsUf,
				valorTributoIbsUf: nfeDetalheModel.nfeDetalheTributoRegularModel?.valorTributoIbsUf,
				aliquotaIbsMun: nfeDetalheModel.nfeDetalheTributoRegularModel?.aliquotaIbsMun,
				valorTributoIbsMun: nfeDetalheModel.nfeDetalheTributoRegularModel?.valorTributoIbsMun,
				alquotaCbs: nfeDetalheModel.nfeDetalheTributoRegularModel?.alquotaCbs,
				valorTributoCbs: nfeDetalheModel.nfeDetalheTributoRegularModel?.valorTributoCbs,
			),
			nfeDetalheCreditoPresumidoIbs: NfeDetalheCreditoPresumidoIbs(
				id: nfeDetalheModel.nfeDetalheCreditoPresumidoIbsModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheCreditoPresumidoIbsModel?.idNfeDetalhe,
				codigoClassificacao: NfeDetalheCreditoPresumidoIbsDomain.setCodigoClassificacao(nfeDetalheModel.nfeDetalheCreditoPresumidoIbsModel?.codigoClassificacao),
				percentual: nfeDetalheModel.nfeDetalheCreditoPresumidoIbsModel?.percentual,
				valor: nfeDetalheModel.nfeDetalheCreditoPresumidoIbsModel?.valor,
				valorSuspensivo: nfeDetalheModel.nfeDetalheCreditoPresumidoIbsModel?.valorSuspensivo,
			),
			nfeDetalheCreditoPresumidoCbs: NfeDetalheCreditoPresumidoCbs(
				id: nfeDetalheModel.nfeDetalheCreditoPresumidoCbsModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheCreditoPresumidoCbsModel?.idNfeDetalhe,
				codigoClassificacao: NfeDetalheCreditoPresumidoCbsDomain.setCodigoClassificacao(nfeDetalheModel.nfeDetalheCreditoPresumidoCbsModel?.codigoClassificacao),
				percentual: nfeDetalheModel.nfeDetalheCreditoPresumidoCbsModel?.percentual,
				valor: nfeDetalheModel.nfeDetalheCreditoPresumidoCbsModel?.valor,
				valorSuspensivo: nfeDetalheModel.nfeDetalheCreditoPresumidoCbsModel?.valorSuspensivo,
			),
			nfeDetalheCompraGoverno: NfeDetalheCompraGoverno(
				id: nfeDetalheModel.nfeDetalheCompraGovernoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheCompraGovernoModel?.idNfeDetalhe,
				aliquotaIbsUf: nfeDetalheModel.nfeDetalheCompraGovernoModel?.aliquotaIbsUf,
				valorIbsUf: nfeDetalheModel.nfeDetalheCompraGovernoModel?.valorIbsUf,
				aliquotaIbsMun: nfeDetalheModel.nfeDetalheCompraGovernoModel?.aliquotaIbsMun,
				valorIbsMun: nfeDetalheModel.nfeDetalheCompraGovernoModel?.valorIbsMun,
				aliquotaCbs: nfeDetalheModel.nfeDetalheCompraGovernoModel?.aliquotaCbs,
				valorCbs: nfeDetalheModel.nfeDetalheCompraGovernoModel?.valorCbs,
			),
			nfeDetalheImpostoMonofasico: NfeDetalheImpostoMonofasico(
				id: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.idNfeDetalhe,
				quantidadeTributada: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.quantidadeTributada,
				aliquotaIbs: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.aliquotaIbs,
				aliquotaCbs: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.aliquotaCbs,
				valorIbs: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorIbs,
				valorCbs: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorCbs,
				quantidadeTributadaRetencao: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.quantidadeTributadaRetencao,
				aliquotaIbsRetencao: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.aliquotaIbsRetencao,
				valorIbsRetencao: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorIbsRetencao,
				aliquotaCbsRetencao: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.aliquotaCbsRetencao,
				valorCbsRetencao: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorCbsRetencao,
				quantidadeTributadaRetido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.quantidadeTributadaRetido,
				aliquotaIbsRetido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.aliquotaIbsRetido,
				valorIbsRetido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorIbsRetido,
				aliquotaCbsRetido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.aliquotaCbsRetido,
				valorCbsRetido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorCbsRetido,
				percentualIbsDiferido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.percentualIbsDiferido,
				valorIbsDiferido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorIbsDiferido,
				percentualCbsDiferido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.percentualCbsDiferido,
				valorCbsDiferido: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.valorCbsDiferido,
				totalIbs: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.totalIbs,
				totalCbs: nfeDetalheModel.nfeDetalheImpostoMonofasicoModel?.totalCbs,
			),
			nfeDetalheTransfCredito: NfeDetalheTransfCredito(
				id: nfeDetalheModel.nfeDetalheTransfCreditoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheTransfCreditoModel?.idNfeDetalhe,
				valorIbs: nfeDetalheModel.nfeDetalheTransfCreditoModel?.valorIbs,
				valorCbs: nfeDetalheModel.nfeDetalheTransfCreditoModel?.valorCbs,
			),
			nfeDetalheIbsZfm: NfeDetalheIbsZfm(
				id: nfeDetalheModel.nfeDetalheIbsZfmModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheIbsZfmModel?.idNfeDetalhe,
				tipoCredito: NfeDetalheIbsZfmDomain.setTipoCredito(nfeDetalheModel.nfeDetalheIbsZfmModel?.tipoCredito),
				valorCredito: nfeDetalheModel.nfeDetalheIbsZfmModel?.valorCredito,
			),
			nfeDetalheImpostoIcms: NfeDetalheImpostoIcms(
				id: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.idNfeDetalhe,
				origemMercadoria: NfeDetalheImpostoIcmsDomain.setOrigemMercadoria(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.origemMercadoria),
				cstIcms: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.cstIcms,
				csosn: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.csosn,
				modalidadeBcIcms: NfeDetalheImpostoIcmsDomain.setModalidadeBcIcms(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.modalidadeBcIcms),
				percentualReducaoBcIcms: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualReducaoBcIcms,
				valorBcIcms: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorBcIcms,
				aliquotaIcms: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaIcms,
				valorIcmsOperacao: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsOperacao,
				percentualDiferimento: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualDiferimento,
				valorIcmsDiferido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsDiferido,
				valorIcms: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcms,
				baseCalculoFcp: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.baseCalculoFcp,
				percentualFcp: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualFcp,
				valorFcp: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorFcp,
				modalidadeBcIcmsSt: NfeDetalheImpostoIcmsDomain.setModalidadeBcIcmsSt(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.modalidadeBcIcmsSt),
				percentualMvaIcmsSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualMvaIcmsSt,
				percentualReducaoBcIcmsSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualReducaoBcIcmsSt,
				valorBaseCalculoIcmsSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorBaseCalculoIcmsSt,
				aliquotaIcmsSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaIcmsSt,
				valorIcmsSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsSt,
				baseCalculoFcpSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.baseCalculoFcpSt,
				percentualFcpSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualFcpSt,
				valorFcpSt: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorFcpSt,
				ufSt: NfeDetalheImpostoIcmsDomain.setUfSt(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.ufSt),
				percentualBcOperacaoPropria: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualBcOperacaoPropria,
				valorBcIcmsStRetido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorBcIcmsStRetido,
				aliquotaSuportadaConsumidor: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaSuportadaConsumidor,
				valorIcmsSubstituto: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsSubstituto,
				valorIcmsStRetido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsStRetido,
				baseCalculoFcpStRetido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.baseCalculoFcpStRetido,
				percentualFcpStRetido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualFcpStRetido,
				valorFcpStRetido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorFcpStRetido,
				motivoDesoneracaoIcms: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.motivoDesoneracaoIcms,
				valorIcmsDesonerado: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsDesonerado,
				aliquotaCreditoIcmsSn: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaCreditoIcmsSn,
				valorCreditoIcmsSn: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorCreditoIcmsSn,
				valorBcIcmsStDestino: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorBcIcmsStDestino,
				valorIcmsStDestino: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsStDestino,
				percentualReducaoBcEfetivo: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualReducaoBcEfetivo,
				valorBcEfetivo: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorBcEfetivo,
				aliquotaIcmsEfetivo: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaIcmsEfetivo,
				valorIcmsEfetivo: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsEfetivo,
				valorIcmsStDesonerado: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsStDesonerado,
				motivoDesoneracaoIcmsSt: NfeDetalheImpostoIcmsDomain.setMotivoDesoneracaoIcmsSt(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.motivoDesoneracaoIcmsSt),
				taxaFcpDiferido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.taxaFcpDiferido,
				valorFcpDiferido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorFcpDiferido,
				valorFcpEfetivo: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorFcpEfetivo,
				desoneradoDeduz: NfeDetalheImpostoIcmsDomain.setDesoneradoDeduz(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.desoneradoDeduz),
				quantidadeTributada: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.quantidadeTributada,
				aliquotaAdRem: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaAdRem,
				valorIcmsMono: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsMono,
				quantidadeSujeitaRetencao: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.quantidadeSujeitaRetencao,
				aliquotaAdRemRetencao: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaAdRemRetencao,
				valorIcmsMonoRetencao: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsMonoRetencao,
				percentualReducaoAdRem: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualReducaoAdRem,
				motivoReducaoAdRem: NfeDetalheImpostoIcmsDomain.setMotivoReducaoAdRem(nfeDetalheModel.nfeDetalheImpostoIcmsModel?.motivoReducaoAdRem),
				valorIcmsMonoOperacao: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsMonoOperacao,
				percentualDiferimentoMono: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.percentualDiferimentoMono,
				valorIcmsDiferidoMono: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsDiferidoMono,
				quantidadeTributadaRetida: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.quantidadeTributadaRetida,
				aliquotaAdRemRetida: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.aliquotaAdRemRetida,
				valorIcmsRetido: nfeDetalheModel.nfeDetalheImpostoIcmsModel?.valorIcmsRetido,
			),
			nfeDetalheDfeReferenciado: NfeDetalheDfeReferenciado(
				id: nfeDetalheModel.nfeDetalheDfeReferenciadoModel?.id,
				idNfeDetalhe: nfeDetalheModel.nfeDetalheDfeReferenciadoModel?.idNfeDetalhe,
				chaveAcesso: nfeDetalheModel.nfeDetalheDfeReferenciadoModel?.chaveAcesso,
				numeroItem: nfeDetalheModel.nfeDetalheDfeReferenciadoModel?.numeroItem,
			),
			nfeDetEspecificoArmamentoGroupedList: nfeDetEspecificoArmamentoModelToDrift(nfeDetalheModel.nfeDetEspecificoArmamentoModelList),
			nfeDeclaracaoImportacaoGroupedList: nfeDeclaracaoImportacaoModelToDrift(nfeDetalheModel.nfeDeclaracaoImportacaoModelList),
			nfeExportacaoGroupedList: nfeExportacaoModelToDrift(nfeDetalheModel.nfeExportacaoModelList),
			nfeItemRastreadoGroupedList: nfeItemRastreadoModelToDrift(nfeDetalheModel.nfeItemRastreadoModelList),
		);
	}

	List<NfeDetEspecificoArmamentoGrouped> nfeDetEspecificoArmamentoModelToDrift(List<NfeDetEspecificoArmamentoModel>? nfeDetEspecificoArmamentoModelList) { 
		List<NfeDetEspecificoArmamentoGrouped> nfeDetEspecificoArmamentoGroupedList = [];
		if (nfeDetEspecificoArmamentoModelList != null) {
			for (var nfeDetEspecificoArmamentoModel in nfeDetEspecificoArmamentoModelList) {
				nfeDetEspecificoArmamentoGroupedList.add(
					NfeDetEspecificoArmamentoGrouped(
						nfeDetEspecificoArmamento: NfeDetEspecificoArmamento(
							id: nfeDetEspecificoArmamentoModel.id,
							idNfeDetalhe: nfeDetEspecificoArmamentoModel.idNfeDetalhe,
							tipoArma: NfeDetEspecificoArmamentoDomain.setTipoArma(nfeDetEspecificoArmamentoModel.tipoArma),
							numeroSerieArma: nfeDetEspecificoArmamentoModel.numeroSerieArma,
							numeroSerieCano: nfeDetEspecificoArmamentoModel.numeroSerieCano,
							descricao: nfeDetEspecificoArmamentoModel.descricao,
						),
					),
				);
			}
			return nfeDetEspecificoArmamentoGroupedList;
		}
		return [];
	}

	List<NfeDeclaracaoImportacaoGrouped> nfeDeclaracaoImportacaoModelToDrift(List<NfeDeclaracaoImportacaoModel>? nfeDeclaracaoImportacaoModelList) { 
		List<NfeDeclaracaoImportacaoGrouped> nfeDeclaracaoImportacaoGroupedList = [];
		if (nfeDeclaracaoImportacaoModelList != null) {
			for (var nfeDeclaracaoImportacaoModel in nfeDeclaracaoImportacaoModelList) {
				nfeDeclaracaoImportacaoGroupedList.add(
					NfeDeclaracaoImportacaoGrouped(
						nfeDeclaracaoImportacao: NfeDeclaracaoImportacao(
							id: nfeDeclaracaoImportacaoModel.id,
							idNfeDetalhe: nfeDeclaracaoImportacaoModel.idNfeDetalhe,
							numeroDocumento: nfeDeclaracaoImportacaoModel.numeroDocumento,
							dataRegistro: nfeDeclaracaoImportacaoModel.dataRegistro,
							localDesembaraco: nfeDeclaracaoImportacaoModel.localDesembaraco,
							ufDesembaraco: NfeDeclaracaoImportacaoDomain.setUfDesembaraco(nfeDeclaracaoImportacaoModel.ufDesembaraco),
							dataDesembaraco: nfeDeclaracaoImportacaoModel.dataDesembaraco,
							viaTransporte: NfeDeclaracaoImportacaoDomain.setViaTransporte(nfeDeclaracaoImportacaoModel.viaTransporte),
							valorAfrmm: nfeDeclaracaoImportacaoModel.valorAfrmm,
							formaIntermediacao: NfeDeclaracaoImportacaoDomain.setFormaIntermediacao(nfeDeclaracaoImportacaoModel.formaIntermediacao),
							cnpj: Util.removeMask(nfeDeclaracaoImportacaoModel.cnpj),
							ufTerceiro: NfeDeclaracaoImportacaoDomain.setUfTerceiro(nfeDeclaracaoImportacaoModel.ufTerceiro),
							codigoExportador: nfeDeclaracaoImportacaoModel.codigoExportador,
							cpf: nfeDeclaracaoImportacaoModel.cpf,
						),
					),
				);
			}
			return nfeDeclaracaoImportacaoGroupedList;
		}
		return [];
	}

	List<NfeExportacaoGrouped> nfeExportacaoModelToDrift(List<NfeExportacaoModel>? nfeExportacaoModelList) { 
		List<NfeExportacaoGrouped> nfeExportacaoGroupedList = [];
		if (nfeExportacaoModelList != null) {
			for (var nfeExportacaoModel in nfeExportacaoModelList) {
				nfeExportacaoGroupedList.add(
					NfeExportacaoGrouped(
						nfeExportacao: NfeExportacao(
							id: nfeExportacaoModel.id,
							idNfeDetalhe: nfeExportacaoModel.idNfeDetalhe,
							drawback: nfeExportacaoModel.drawback,
							numeroRegistro: nfeExportacaoModel.numeroRegistro,
							chaveAcesso: nfeExportacaoModel.chaveAcesso,
							quantidade: nfeExportacaoModel.quantidade,
						),
					),
				);
			}
			return nfeExportacaoGroupedList;
		}
		return [];
	}

	List<NfeItemRastreadoGrouped> nfeItemRastreadoModelToDrift(List<NfeItemRastreadoModel>? nfeItemRastreadoModelList) { 
		List<NfeItemRastreadoGrouped> nfeItemRastreadoGroupedList = [];
		if (nfeItemRastreadoModelList != null) {
			for (var nfeItemRastreadoModel in nfeItemRastreadoModelList) {
				nfeItemRastreadoGroupedList.add(
					NfeItemRastreadoGrouped(
						nfeItemRastreado: NfeItemRastreado(
							id: nfeItemRastreadoModel.id,
							idNfeDetalhe: nfeItemRastreadoModel.idNfeDetalhe,
							numeroLote: nfeItemRastreadoModel.numeroLote,
							quantidadeItens: nfeItemRastreadoModel.quantidadeItens,
							dataFabricacao: nfeItemRastreadoModel.dataFabricacao,
							dataValidade: nfeItemRastreadoModel.dataValidade,
							codigoAgregacao: nfeItemRastreadoModel.codigoAgregacao,
						),
					),
				);
			}
			return nfeItemRastreadoGroupedList;
		}
		return [];
	}

		
}
