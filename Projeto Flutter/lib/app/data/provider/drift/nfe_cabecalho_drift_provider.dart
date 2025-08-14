import 'package:nfe/app/data/provider/drift/database/database_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeCabecalhoDriftProvider extends ProviderBase {

	Future<List<NfeCabecalhoModel>?> getList({Filter? filter}) async {
		List<NfeCabecalhoGrouped> nfeCabecalhoDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				nfeCabecalhoDriftList = await Session.database.nfeCabecalhoDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				nfeCabecalhoDriftList = await Session.database.nfeCabecalhoDao.getGroupedList(); 
			}
			if (nfeCabecalhoDriftList.isNotEmpty) {
				return toListModel(nfeCabecalhoDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<NfeCabecalhoModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.nfeCabecalhoDao.getObjectGrouped(field: 'id', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeCabecalhoModel?>? insert(NfeCabecalhoModel nfeCabecalhoModel) async {
		try {
			final lastPk = await Session.database.nfeCabecalhoDao.insertObject(toDrift(nfeCabecalhoModel));
			nfeCabecalhoModel.id = lastPk;
			return nfeCabecalhoModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<NfeCabecalhoModel?>? update(NfeCabecalhoModel nfeCabecalhoModel) async {
		try {
			await Session.database.nfeCabecalhoDao.updateObject(toDrift(nfeCabecalhoModel));
			return nfeCabecalhoModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.nfeCabecalhoDao.deleteObject(toDrift(NfeCabecalhoModel(id: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<NfeCabecalhoModel> toListModel(List<NfeCabecalhoGrouped> nfeCabecalhoDriftList) {
		List<NfeCabecalhoModel> listModel = [];
		for (var nfeCabecalhoDrift in nfeCabecalhoDriftList) {
			listModel.add(toModel(nfeCabecalhoDrift)!);
		}
		return listModel;
	}	

	NfeCabecalhoModel? toModel(NfeCabecalhoGrouped? nfeCabecalhoDrift) {
		if (nfeCabecalhoDrift != null) {
			return NfeCabecalhoModel(
				id: nfeCabecalhoDrift.nfeCabecalho?.id,
				idVendaCabecalho: nfeCabecalhoDrift.nfeCabecalho?.idVendaCabecalho,
				idTributOperacaoFiscal: nfeCabecalhoDrift.nfeCabecalho?.idTributOperacaoFiscal,
				idCliente: nfeCabecalhoDrift.nfeCabecalho?.idCliente,
				idColaborador: nfeCabecalhoDrift.nfeCabecalho?.idColaborador,
				idFornecedor: nfeCabecalhoDrift.nfeCabecalho?.idFornecedor,
				ufEmitente: NfeCabecalhoDomain.getUfEmitente(nfeCabecalhoDrift.nfeCabecalho?.ufEmitente),
				codigoNumerico: nfeCabecalhoDrift.nfeCabecalho?.codigoNumerico,
				naturezaOperacao: nfeCabecalhoDrift.nfeCabecalho?.naturezaOperacao,
				codigoModelo: NfeCabecalhoDomain.getCodigoModelo(nfeCabecalhoDrift.nfeCabecalho?.codigoModelo),
				serie: nfeCabecalhoDrift.nfeCabecalho?.serie,
				numero: nfeCabecalhoDrift.nfeCabecalho?.numero,
				dataHoraEmissao: nfeCabecalhoDrift.nfeCabecalho?.dataHoraEmissao,
				dataHoraEntradaSaida: nfeCabecalhoDrift.nfeCabecalho?.dataHoraEntradaSaida,
				tipoOperacao: NfeCabecalhoDomain.getTipoOperacao(nfeCabecalhoDrift.nfeCabecalho?.tipoOperacao),
				localDestino: NfeCabecalhoDomain.getLocalDestino(nfeCabecalhoDrift.nfeCabecalho?.localDestino),
				codigoMunicipio: nfeCabecalhoDrift.nfeCabecalho?.codigoMunicipio,
				formatoImpressaoDanfe: NfeCabecalhoDomain.getFormatoImpressaoDanfe(nfeCabecalhoDrift.nfeCabecalho?.formatoImpressaoDanfe),
				tipoEmissao: NfeCabecalhoDomain.getTipoEmissao(nfeCabecalhoDrift.nfeCabecalho?.tipoEmissao),
				chaveAcesso: nfeCabecalhoDrift.nfeCabecalho?.chaveAcesso,
				digitoChaveAcesso: nfeCabecalhoDrift.nfeCabecalho?.digitoChaveAcesso,
				ambiente: NfeCabecalhoDomain.getAmbiente(nfeCabecalhoDrift.nfeCabecalho?.ambiente),
				finalidadeEmissao: NfeCabecalhoDomain.getFinalidadeEmissao(nfeCabecalhoDrift.nfeCabecalho?.finalidadeEmissao),
				consumidorOperacao: NfeCabecalhoDomain.getConsumidorOperacao(nfeCabecalhoDrift.nfeCabecalho?.consumidorOperacao),
				consumidorPresenca: NfeCabecalhoDomain.getConsumidorPresenca(nfeCabecalhoDrift.nfeCabecalho?.consumidorPresenca),
				processoEmissao: NfeCabecalhoDomain.getProcessoEmissao(nfeCabecalhoDrift.nfeCabecalho?.processoEmissao),
				versaoProcessoEmissao: nfeCabecalhoDrift.nfeCabecalho?.versaoProcessoEmissao,
				dataEntradaContingencia: nfeCabecalhoDrift.nfeCabecalho?.dataEntradaContingencia,
				justificativaContingencia: nfeCabecalhoDrift.nfeCabecalho?.justificativaContingencia,
				baseCalculoIcms: nfeCabecalhoDrift.nfeCabecalho?.baseCalculoIcms,
				valorIcms: nfeCabecalhoDrift.nfeCabecalho?.valorIcms,
				valorIcmsDesonerado: nfeCabecalhoDrift.nfeCabecalho?.valorIcmsDesonerado,
				totalIcmsFcpUfDestino: nfeCabecalhoDrift.nfeCabecalho?.totalIcmsFcpUfDestino,
				totalIcmsInterestadualUfDestino: nfeCabecalhoDrift.nfeCabecalho?.totalIcmsInterestadualUfDestino,
				totalIcmsInterestadualUfRemetente: nfeCabecalhoDrift.nfeCabecalho?.totalIcmsInterestadualUfRemetente,
				valorTotalFcp: nfeCabecalhoDrift.nfeCabecalho?.valorTotalFcp,
				baseCalculoIcmsSt: nfeCabecalhoDrift.nfeCabecalho?.baseCalculoIcmsSt,
				valorIcmsSt: nfeCabecalhoDrift.nfeCabecalho?.valorIcmsSt,
				valorTotalFcpSt: nfeCabecalhoDrift.nfeCabecalho?.valorTotalFcpSt,
				valorTotalFcpStRetido: nfeCabecalhoDrift.nfeCabecalho?.valorTotalFcpStRetido,
				valorTotalProdutos: nfeCabecalhoDrift.nfeCabecalho?.valorTotalProdutos,
				valorFrete: nfeCabecalhoDrift.nfeCabecalho?.valorFrete,
				valorSeguro: nfeCabecalhoDrift.nfeCabecalho?.valorSeguro,
				valorDesconto: nfeCabecalhoDrift.nfeCabecalho?.valorDesconto,
				valorImpostoImportacao: nfeCabecalhoDrift.nfeCabecalho?.valorImpostoImportacao,
				valorIpi: nfeCabecalhoDrift.nfeCabecalho?.valorIpi,
				valorIpiDevolvido: nfeCabecalhoDrift.nfeCabecalho?.valorIpiDevolvido,
				valorPis: nfeCabecalhoDrift.nfeCabecalho?.valorPis,
				valorCofins: nfeCabecalhoDrift.nfeCabecalho?.valorCofins,
				valorDespesasAcessorias: nfeCabecalhoDrift.nfeCabecalho?.valorDespesasAcessorias,
				valorTotal: nfeCabecalhoDrift.nfeCabecalho?.valorTotal,
				valorTotalTributos: nfeCabecalhoDrift.nfeCabecalho?.valorTotalTributos,
				valorServicos: nfeCabecalhoDrift.nfeCabecalho?.valorServicos,
				baseCalculoIssqn: nfeCabecalhoDrift.nfeCabecalho?.baseCalculoIssqn,
				valorIssqn: nfeCabecalhoDrift.nfeCabecalho?.valorIssqn,
				valorPisIssqn: nfeCabecalhoDrift.nfeCabecalho?.valorPisIssqn,
				valorCofinsIssqn: nfeCabecalhoDrift.nfeCabecalho?.valorCofinsIssqn,
				dataPrestacaoServico: nfeCabecalhoDrift.nfeCabecalho?.dataPrestacaoServico,
				valorDeducaoIssqn: nfeCabecalhoDrift.nfeCabecalho?.valorDeducaoIssqn,
				outrasRetencoesIssqn: nfeCabecalhoDrift.nfeCabecalho?.outrasRetencoesIssqn,
				descontoIncondicionadoIssqn: nfeCabecalhoDrift.nfeCabecalho?.descontoIncondicionadoIssqn,
				descontoCondicionadoIssqn: nfeCabecalhoDrift.nfeCabecalho?.descontoCondicionadoIssqn,
				totalRetencaoIssqn: nfeCabecalhoDrift.nfeCabecalho?.totalRetencaoIssqn,
				regimeEspecialTributacao: NfeCabecalhoDomain.getRegimeEspecialTributacao(nfeCabecalhoDrift.nfeCabecalho?.regimeEspecialTributacao),
				valorRetidoPis: nfeCabecalhoDrift.nfeCabecalho?.valorRetidoPis,
				valorRetidoCofins: nfeCabecalhoDrift.nfeCabecalho?.valorRetidoCofins,
				valorRetidoCsll: nfeCabecalhoDrift.nfeCabecalho?.valorRetidoCsll,
				baseCalculoIrrf: nfeCabecalhoDrift.nfeCabecalho?.baseCalculoIrrf,
				valorRetidoIrrf: nfeCabecalhoDrift.nfeCabecalho?.valorRetidoIrrf,
				baseCalculoPrevidencia: nfeCabecalhoDrift.nfeCabecalho?.baseCalculoPrevidencia,
				valorRetidoPrevidencia: nfeCabecalhoDrift.nfeCabecalho?.valorRetidoPrevidencia,
				informacoesAddFisco: nfeCabecalhoDrift.nfeCabecalho?.informacoesAddFisco,
				informacoesAddContribuinte: nfeCabecalhoDrift.nfeCabecalho?.informacoesAddContribuinte,
				comexUfEmbarque: NfeCabecalhoDomain.getComexUfEmbarque(nfeCabecalhoDrift.nfeCabecalho?.comexUfEmbarque),
				comexLocalEmbarque: nfeCabecalhoDrift.nfeCabecalho?.comexLocalEmbarque,
				comexLocalDespacho: nfeCabecalhoDrift.nfeCabecalho?.comexLocalDespacho,
				compraNotaEmpenho: nfeCabecalhoDrift.nfeCabecalho?.compraNotaEmpenho,
				compraPedido: nfeCabecalhoDrift.nfeCabecalho?.compraPedido,
				compraContrato: nfeCabecalhoDrift.nfeCabecalho?.compraContrato,
				qrcode: nfeCabecalhoDrift.nfeCabecalho?.qrcode,
				urlChave: nfeCabecalhoDrift.nfeCabecalho?.urlChave,
				statusNota: NfeCabecalhoDomain.getStatusNota(nfeCabecalhoDrift.nfeCabecalho?.statusNota),
				indicadorIntermediario: NfeCabecalhoDomain.getIndicadorIntermediario(nfeCabecalhoDrift.nfeCabecalho?.indicadorIntermediario),
				intermediadorCnpj: nfeCabecalhoDrift.nfeCabecalho?.intermediadorCnpj,
				intermediadorIdCadastro: nfeCabecalhoDrift.nfeCabecalho?.intermediadorIdCadastro,
				codigoMunicipioFgIbs: nfeCabecalhoDrift.nfeCabecalho?.codigoMunicipioFgIbs,
				tipoNotaDebito: NfeCabecalhoDomain.getTipoNotaDebito(nfeCabecalhoDrift.nfeCabecalho?.tipoNotaDebito),
				tipoNotaCredito: NfeCabecalhoDomain.getTipoNotaCredito(nfeCabecalhoDrift.nfeCabecalho?.tipoNotaCredito),
				totalImpostoSeletivo: nfeCabecalhoDrift.nfeCabecalho?.totalImpostoSeletivo,
				totalBcIbsCbs: nfeCabecalhoDrift.nfeCabecalho?.totalBcIbsCbs,
				ibsUfTotalDiferimento: nfeCabecalhoDrift.nfeCabecalho?.ibsUfTotalDiferimento,
				ibsUfTotalDevTributos: nfeCabecalhoDrift.nfeCabecalho?.ibsUfTotalDevTributos,
				ibsUfValorTotal: nfeCabecalhoDrift.nfeCabecalho?.ibsUfValorTotal,
				ibsMunTotalDiferimento: nfeCabecalhoDrift.nfeCabecalho?.ibsMunTotalDiferimento,
				ibsMunTotalDevTributos: nfeCabecalhoDrift.nfeCabecalho?.ibsMunTotalDevTributos,
				ibsMunValorTotal: nfeCabecalhoDrift.nfeCabecalho?.ibsMunValorTotal,
				cbsTotalDiferimento: nfeCabecalhoDrift.nfeCabecalho?.cbsTotalDiferimento,
				cbsTotalDevTributos: nfeCabecalhoDrift.nfeCabecalho?.cbsTotalDevTributos,
				cbsValorTotal: nfeCabecalhoDrift.nfeCabecalho?.cbsValorTotal,
				cbsTotalCreditoPresumido: nfeCabecalhoDrift.nfeCabecalho?.cbsTotalCreditoPresumido,
				cbsTotCrePreSuspensivo: nfeCabecalhoDrift.nfeCabecalho?.cbsTotCrePreSuspensivo,
				monoIbsTotal: nfeCabecalhoDrift.nfeCabecalho?.monoIbsTotal,
				monoCbsTotal: nfeCabecalhoDrift.nfeCabecalho?.monoCbsTotal,
				monoIbsTotalRetencao: nfeCabecalhoDrift.nfeCabecalho?.monoIbsTotalRetencao,
				monoCbsTotalRetencao: nfeCabecalhoDrift.nfeCabecalho?.monoCbsTotalRetencao,
				monoIbsRetido: nfeCabecalhoDrift.nfeCabecalho?.monoIbsRetido,
				monoCbsRetido: nfeCabecalhoDrift.nfeCabecalho?.monoCbsRetido,
				valorTotalNfe: nfeCabecalhoDrift.nfeCabecalho?.valorTotalNfe,
				totalQtdeTributadaMono: nfeCabecalhoDrift.nfeCabecalho?.totalQtdeTributadaMono,
				totalIcmsMono: nfeCabecalhoDrift.nfeCabecalho?.totalIcmsMono,
				totalQuantidadeMonoRetencao: nfeCabecalhoDrift.nfeCabecalho?.totalQuantidadeMonoRetencao,
				totalIcmsMonoRetencao: nfeCabecalhoDrift.nfeCabecalho?.totalIcmsMonoRetencao,
				totalQuantidadeMonoRetida: nfeCabecalhoDrift.nfeCabecalho?.totalQuantidadeMonoRetida,
				totalIcmsMonoRetido: nfeCabecalhoDrift.nfeCabecalho?.totalIcmsMonoRetido,
				ibsValorTotal: nfeCabecalhoDrift.nfeCabecalho?.ibsValorTotal,
				totalCreditoPresumido: nfeCabecalhoDrift.nfeCabecalho?.totalCreditoPresumido,
				totalCredPresSuspensivo: nfeCabecalhoDrift.nfeCabecalho?.totalCredPresSuspensivo,
				nfeEmitenteModel: NfeEmitenteModel(
					id: nfeCabecalhoDrift.nfeEmitente?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeEmitente?.idNfeCabecalho,
					cnpj: nfeCabecalhoDrift.nfeEmitente?.cnpj,
					cpf: nfeCabecalhoDrift.nfeEmitente?.cpf,
					nome: nfeCabecalhoDrift.nfeEmitente?.nome,
					fantasia: nfeCabecalhoDrift.nfeEmitente?.fantasia,
					logradouro: nfeCabecalhoDrift.nfeEmitente?.logradouro,
					numero: nfeCabecalhoDrift.nfeEmitente?.numero,
					complemento: nfeCabecalhoDrift.nfeEmitente?.complemento,
					bairro: nfeCabecalhoDrift.nfeEmitente?.bairro,
					codigoMunicipio: nfeCabecalhoDrift.nfeEmitente?.codigoMunicipio,
					nomeMunicipio: nfeCabecalhoDrift.nfeEmitente?.nomeMunicipio,
					uf: NfeEmitenteDomain.getUf(nfeCabecalhoDrift.nfeEmitente?.uf),
					cep: nfeCabecalhoDrift.nfeEmitente?.cep,
					codigoPais: nfeCabecalhoDrift.nfeEmitente?.codigoPais,
					nomePais: nfeCabecalhoDrift.nfeEmitente?.nomePais,
					telefone: nfeCabecalhoDrift.nfeEmitente?.telefone,
					inscricaoEstadual: nfeCabecalhoDrift.nfeEmitente?.inscricaoEstadual,
					inscricaoEstadualSt: nfeCabecalhoDrift.nfeEmitente?.inscricaoEstadualSt,
					inscricaoMunicipal: nfeCabecalhoDrift.nfeEmitente?.inscricaoMunicipal,
					cnae: nfeCabecalhoDrift.nfeEmitente?.cnae,
					crt: NfeEmitenteDomain.getCrt(nfeCabecalhoDrift.nfeEmitente?.crt),
				),
				nfeDestinatarioModel: NfeDestinatarioModel(
					id: nfeCabecalhoDrift.nfeDestinatario?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeDestinatario?.idNfeCabecalho,
					cnpj: nfeCabecalhoDrift.nfeDestinatario?.cnpj,
					cpf: nfeCabecalhoDrift.nfeDestinatario?.cpf,
					estrangeiroIdentificacao: nfeCabecalhoDrift.nfeDestinatario?.estrangeiroIdentificacao,
					nome: nfeCabecalhoDrift.nfeDestinatario?.nome,
					logradouro: nfeCabecalhoDrift.nfeDestinatario?.logradouro,
					numero: nfeCabecalhoDrift.nfeDestinatario?.numero,
					complemento: nfeCabecalhoDrift.nfeDestinatario?.complemento,
					bairro: nfeCabecalhoDrift.nfeDestinatario?.bairro,
					codigoMunicipio: nfeCabecalhoDrift.nfeDestinatario?.codigoMunicipio,
					nomeMunicipio: nfeCabecalhoDrift.nfeDestinatario?.nomeMunicipio,
					uf: NfeDestinatarioDomain.getUf(nfeCabecalhoDrift.nfeDestinatario?.uf),
					cep: nfeCabecalhoDrift.nfeDestinatario?.cep,
					codigoPais: nfeCabecalhoDrift.nfeDestinatario?.codigoPais,
					nomePais: nfeCabecalhoDrift.nfeDestinatario?.nomePais,
					telefone: nfeCabecalhoDrift.nfeDestinatario?.telefone,
					indicadorIe: NfeDestinatarioDomain.getIndicadorIe(nfeCabecalhoDrift.nfeDestinatario?.indicadorIe),
					inscricaoEstadual: nfeCabecalhoDrift.nfeDestinatario?.inscricaoEstadual,
					suframa: nfeCabecalhoDrift.nfeDestinatario?.suframa,
					inscricaoMunicipal: nfeCabecalhoDrift.nfeDestinatario?.inscricaoMunicipal,
					email: nfeCabecalhoDrift.nfeDestinatario?.email,
				),
				nfeLocalRetiradaModel: NfeLocalRetiradaModel(
					id: nfeCabecalhoDrift.nfeLocalRetirada?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeLocalRetirada?.idNfeCabecalho,
					cnpj: nfeCabecalhoDrift.nfeLocalRetirada?.cnpj,
					cpf: nfeCabecalhoDrift.nfeLocalRetirada?.cpf,
					nomeExpedidor: nfeCabecalhoDrift.nfeLocalRetirada?.nomeExpedidor,
					logradouro: nfeCabecalhoDrift.nfeLocalRetirada?.logradouro,
					numero: nfeCabecalhoDrift.nfeLocalRetirada?.numero,
					complemento: nfeCabecalhoDrift.nfeLocalRetirada?.complemento,
					bairro: nfeCabecalhoDrift.nfeLocalRetirada?.bairro,
					codigoMunicipio: nfeCabecalhoDrift.nfeLocalRetirada?.codigoMunicipio,
					nomeMunicipio: nfeCabecalhoDrift.nfeLocalRetirada?.nomeMunicipio,
					uf: NfeLocalRetiradaDomain.getUf(nfeCabecalhoDrift.nfeLocalRetirada?.uf),
					cep: nfeCabecalhoDrift.nfeLocalRetirada?.cep,
					codigoPais: nfeCabecalhoDrift.nfeLocalRetirada?.codigoPais,
					nomePais: nfeCabecalhoDrift.nfeLocalRetirada?.nomePais,
					telefone: nfeCabecalhoDrift.nfeLocalRetirada?.telefone,
					email: nfeCabecalhoDrift.nfeLocalRetirada?.email,
					inscricaoEstadual: nfeCabecalhoDrift.nfeLocalRetirada?.inscricaoEstadual,
				),
				nfeLocalEntregaModel: NfeLocalEntregaModel(
					id: nfeCabecalhoDrift.nfeLocalEntrega?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeLocalEntrega?.idNfeCabecalho,
					cnpj: nfeCabecalhoDrift.nfeLocalEntrega?.cnpj,
					cpf: nfeCabecalhoDrift.nfeLocalEntrega?.cpf,
					nomeRecebedor: nfeCabecalhoDrift.nfeLocalEntrega?.nomeRecebedor,
					logradouro: nfeCabecalhoDrift.nfeLocalEntrega?.logradouro,
					numero: nfeCabecalhoDrift.nfeLocalEntrega?.numero,
					complemento: nfeCabecalhoDrift.nfeLocalEntrega?.complemento,
					bairro: nfeCabecalhoDrift.nfeLocalEntrega?.bairro,
					codigoMunicipio: nfeCabecalhoDrift.nfeLocalEntrega?.codigoMunicipio,
					nomeMunicipio: nfeCabecalhoDrift.nfeLocalEntrega?.nomeMunicipio,
					uf: NfeLocalEntregaDomain.getUf(nfeCabecalhoDrift.nfeLocalEntrega?.uf),
					cep: nfeCabecalhoDrift.nfeLocalEntrega?.cep,
					codigoPais: nfeCabecalhoDrift.nfeLocalEntrega?.codigoPais,
					nomePais: nfeCabecalhoDrift.nfeLocalEntrega?.nomePais,
					telefone: nfeCabecalhoDrift.nfeLocalEntrega?.telefone,
					email: nfeCabecalhoDrift.nfeLocalEntrega?.email,
					inscricaoEstadual: nfeCabecalhoDrift.nfeLocalEntrega?.inscricaoEstadual,
				),
				nfeResponsavelTecnicoModel: NfeResponsavelTecnicoModel(
					id: nfeCabecalhoDrift.nfeResponsavelTecnico?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeResponsavelTecnico?.idNfeCabecalho,
					cnpj: nfeCabecalhoDrift.nfeResponsavelTecnico?.cnpj,
					contato: nfeCabecalhoDrift.nfeResponsavelTecnico?.contato,
					email: nfeCabecalhoDrift.nfeResponsavelTecnico?.email,
					telefone: nfeCabecalhoDrift.nfeResponsavelTecnico?.telefone,
					identificadorCsrt: nfeCabecalhoDrift.nfeResponsavelTecnico?.identificadorCsrt,
					hashCsrt: nfeCabecalhoDrift.nfeResponsavelTecnico?.hashCsrt,
				),
				nfeCanaModel: NfeCanaModel(
					id: nfeCabecalhoDrift.nfeCana?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeCana?.idNfeCabecalho,
					safra: nfeCabecalhoDrift.nfeCana?.safra,
					mesAnoReferencia: nfeCabecalhoDrift.nfeCana?.mesAnoReferencia,
				),
				nfeFaturaModel: NfeFaturaModel(
					id: nfeCabecalhoDrift.nfeFatura?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeFatura?.idNfeCabecalho,
					numero: nfeCabecalhoDrift.nfeFatura?.numero,
					valorOriginal: nfeCabecalhoDrift.nfeFatura?.valorOriginal,
					valorDesconto: nfeCabecalhoDrift.nfeFatura?.valorDesconto,
					valorLiquido: nfeCabecalhoDrift.nfeFatura?.valorLiquido,
				),
				nfeTransporteModel: NfeTransporteModel(
					id: nfeCabecalhoDrift.nfeTransporte?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeTransporte?.idNfeCabecalho,
					idTransportadora: nfeCabecalhoDrift.nfeTransporte?.idTransportadora,
					modalidadeFrete: NfeTransporteDomain.getModalidadeFrete(nfeCabecalhoDrift.nfeTransporte?.modalidadeFrete),
					cnpj: nfeCabecalhoDrift.nfeTransporte?.cnpj,
					cpf: nfeCabecalhoDrift.nfeTransporte?.cpf,
					nome: nfeCabecalhoDrift.nfeTransporte?.nome,
					inscricaoEstadual: nfeCabecalhoDrift.nfeTransporte?.inscricaoEstadual,
					endereco: nfeCabecalhoDrift.nfeTransporte?.endereco,
					nomeMunicipio: nfeCabecalhoDrift.nfeTransporte?.nomeMunicipio,
					uf: NfeTransporteDomain.getUf(nfeCabecalhoDrift.nfeTransporte?.uf),
					valorServico: nfeCabecalhoDrift.nfeTransporte?.valorServico,
					valorBcRetencaoIcms: nfeCabecalhoDrift.nfeTransporte?.valorBcRetencaoIcms,
					aliquotaRetencaoIcms: nfeCabecalhoDrift.nfeTransporte?.aliquotaRetencaoIcms,
					valorIcmsRetido: nfeCabecalhoDrift.nfeTransporte?.valorIcmsRetido,
					cfop: nfeCabecalhoDrift.nfeTransporte?.cfop,
					municipio: nfeCabecalhoDrift.nfeTransporte?.municipio,
					placaVeiculo: nfeCabecalhoDrift.nfeTransporte?.placaVeiculo,
					ufVeiculo: NfeTransporteDomain.getUfVeiculo(nfeCabecalhoDrift.nfeTransporte?.ufVeiculo),
					rntcVeiculo: nfeCabecalhoDrift.nfeTransporte?.rntcVeiculo,
				),
				nfeCompraGovernamentalModel: NfeCompraGovernamentalModel(
					id: nfeCabecalhoDrift.nfeCompraGovernamental?.id,
					idNfeCabecalho: nfeCabecalhoDrift.nfeCompraGovernamental?.idNfeCabecalho,
					tipoEnte: NfeCompraGovernamentalDomain.getTipoEnte(nfeCabecalhoDrift.nfeCompraGovernamental?.tipoEnte),
					percentualReducao: nfeCabecalhoDrift.nfeCompraGovernamental?.percentualReducao,
					tipoOperacao: NfeCompraGovernamentalDomain.getTipoOperacao(nfeCabecalhoDrift.nfeCompraGovernamental?.tipoOperacao),
				),
				nfeReferenciadaModelList: nfeReferenciadaDriftToModel(nfeCabecalhoDrift.nfeReferenciadaGroupedList),
				nfeProdRuralReferenciadaModelList: nfeProdRuralReferenciadaDriftToModel(nfeCabecalhoDrift.nfeProdRuralReferenciadaGroupedList),
				nfeNfReferenciadaModelList: nfeNfReferenciadaDriftToModel(nfeCabecalhoDrift.nfeNfReferenciadaGroupedList),
				nfeProcessoReferenciadoModelList: nfeProcessoReferenciadoDriftToModel(nfeCabecalhoDrift.nfeProcessoReferenciadoGroupedList),
				nfeAcessoXmlModelList: nfeAcessoXmlDriftToModel(nfeCabecalhoDrift.nfeAcessoXmlGroupedList),
				nfeInformacaoPagamentoModelList: nfeInformacaoPagamentoDriftToModel(nfeCabecalhoDrift.nfeInformacaoPagamentoGroupedList),
				tributOperacaoFiscalModel: TributOperacaoFiscalModel(
					id: nfeCabecalhoDrift.tributOperacaoFiscal?.id,
					descricao: nfeCabecalhoDrift.tributOperacaoFiscal?.descricao,
					descricaoNaNf: nfeCabecalhoDrift.tributOperacaoFiscal?.descricaoNaNf,
					cfop: nfeCabecalhoDrift.tributOperacaoFiscal?.cfop,
					observacao: nfeCabecalhoDrift.tributOperacaoFiscal?.observacao,
				),
				vendaCabecalhoModel: VendaCabecalhoModel(
					id: nfeCabecalhoDrift.vendaCabecalho?.id,
					idVendaOrcamentoCabecalho: nfeCabecalhoDrift.vendaCabecalho?.idVendaOrcamentoCabecalho,
					idVendaCondicoesPagamento: nfeCabecalhoDrift.vendaCabecalho?.idVendaCondicoesPagamento,
					idNotaFiscalTipo: nfeCabecalhoDrift.vendaCabecalho?.idNotaFiscalTipo,
					idTransportadora: nfeCabecalhoDrift.vendaCabecalho?.idTransportadora,
					dataVenda: nfeCabecalhoDrift.vendaCabecalho?.dataVenda,
					dataSaida: nfeCabecalhoDrift.vendaCabecalho?.dataSaida,
					horaSaida: nfeCabecalhoDrift.vendaCabecalho?.horaSaida,
					numeroFatura: nfeCabecalhoDrift.vendaCabecalho?.numeroFatura,
					localEntrega: nfeCabecalhoDrift.vendaCabecalho?.localEntrega,
					localCobranca: nfeCabecalhoDrift.vendaCabecalho?.localCobranca,
					valorSubtotal: nfeCabecalhoDrift.vendaCabecalho?.valorSubtotal,
					taxaComissao: nfeCabecalhoDrift.vendaCabecalho?.taxaComissao,
					valorComissao: nfeCabecalhoDrift.vendaCabecalho?.valorComissao,
					taxaDesconto: nfeCabecalhoDrift.vendaCabecalho?.taxaDesconto,
					valorDesconto: nfeCabecalhoDrift.vendaCabecalho?.valorDesconto,
					valorTotal: nfeCabecalhoDrift.vendaCabecalho?.valorTotal,
					tipoFrete: nfeCabecalhoDrift.vendaCabecalho?.tipoFrete,
					formaPagamento: nfeCabecalhoDrift.vendaCabecalho?.formaPagamento,
					valorFrete: nfeCabecalhoDrift.vendaCabecalho?.valorFrete,
					valorSeguro: nfeCabecalhoDrift.vendaCabecalho?.valorSeguro,
					observacao: nfeCabecalhoDrift.vendaCabecalho?.observacao,
					situacao: nfeCabecalhoDrift.vendaCabecalho?.situacao,
					diaFixoParcela: nfeCabecalhoDrift.vendaCabecalho?.diaFixoParcela,
				),
				viewPessoaClienteModel: ViewPessoaClienteModel(
					id: nfeCabecalhoDrift.viewPessoaCliente?.id,
					nome: nfeCabecalhoDrift.viewPessoaCliente?.nome,
					tipo: nfeCabecalhoDrift.viewPessoaCliente?.tipo,
					email: nfeCabecalhoDrift.viewPessoaCliente?.email,
					site: nfeCabecalhoDrift.viewPessoaCliente?.site,
					cpfCnpj: nfeCabecalhoDrift.viewPessoaCliente?.cpfCnpj,
					rgIe: nfeCabecalhoDrift.viewPessoaCliente?.rgIe,
					desde: nfeCabecalhoDrift.viewPessoaCliente?.desde,
					taxaDesconto: nfeCabecalhoDrift.viewPessoaCliente?.taxaDesconto,
					limiteCredito: nfeCabecalhoDrift.viewPessoaCliente?.limiteCredito,
					dataCadastro: nfeCabecalhoDrift.viewPessoaCliente?.dataCadastro,
					observacao: nfeCabecalhoDrift.viewPessoaCliente?.observacao,
					idPessoa: nfeCabecalhoDrift.viewPessoaCliente?.idPessoa,
				),
				viewPessoaColaboradorModel: ViewPessoaColaboradorModel(
					id: nfeCabecalhoDrift.viewPessoaColaborador?.id,
					nome: nfeCabecalhoDrift.viewPessoaColaborador?.nome,
					tipo: nfeCabecalhoDrift.viewPessoaColaborador?.tipo,
					email: nfeCabecalhoDrift.viewPessoaColaborador?.email,
					site: nfeCabecalhoDrift.viewPessoaColaborador?.site,
					cpfCnpj: nfeCabecalhoDrift.viewPessoaColaborador?.cpfCnpj,
					rgIe: nfeCabecalhoDrift.viewPessoaColaborador?.rgIe,
					matricula: nfeCabecalhoDrift.viewPessoaColaborador?.matricula,
					dataCadastro: nfeCabecalhoDrift.viewPessoaColaborador?.dataCadastro,
					dataAdmissao: nfeCabecalhoDrift.viewPessoaColaborador?.dataAdmissao,
					dataDemissao: nfeCabecalhoDrift.viewPessoaColaborador?.dataDemissao,
					ctpsNumero: nfeCabecalhoDrift.viewPessoaColaborador?.ctpsNumero,
					ctpsSerie: nfeCabecalhoDrift.viewPessoaColaborador?.ctpsSerie,
					ctpsDataExpedicao: nfeCabecalhoDrift.viewPessoaColaborador?.ctpsDataExpedicao,
					ctpsUf: nfeCabecalhoDrift.viewPessoaColaborador?.ctpsUf,
					observacao: nfeCabecalhoDrift.viewPessoaColaborador?.observacao,
					logradouro: nfeCabecalhoDrift.viewPessoaColaborador?.logradouro,
					numero: nfeCabecalhoDrift.viewPessoaColaborador?.numero,
					complemento: nfeCabecalhoDrift.viewPessoaColaborador?.complemento,
					bairro: nfeCabecalhoDrift.viewPessoaColaborador?.bairro,
					cidade: nfeCabecalhoDrift.viewPessoaColaborador?.cidade,
					cep: nfeCabecalhoDrift.viewPessoaColaborador?.cep,
					municipioIbge: nfeCabecalhoDrift.viewPessoaColaborador?.municipioIbge,
					uf: nfeCabecalhoDrift.viewPessoaColaborador?.uf,
					idPessoa: nfeCabecalhoDrift.viewPessoaColaborador?.idPessoa,
					idCargo: nfeCabecalhoDrift.viewPessoaColaborador?.idCargo,
					idSetor: nfeCabecalhoDrift.viewPessoaColaborador?.idSetor,
				),
				viewPessoaFornecedorModel: ViewPessoaFornecedorModel(
					id: nfeCabecalhoDrift.viewPessoaFornecedor?.id,
					nome: nfeCabecalhoDrift.viewPessoaFornecedor?.nome,
					tipo: nfeCabecalhoDrift.viewPessoaFornecedor?.tipo,
					email: nfeCabecalhoDrift.viewPessoaFornecedor?.email,
					site: nfeCabecalhoDrift.viewPessoaFornecedor?.site,
					cpfCnpj: nfeCabecalhoDrift.viewPessoaFornecedor?.cpfCnpj,
					rgIe: nfeCabecalhoDrift.viewPessoaFornecedor?.rgIe,
					desde: nfeCabecalhoDrift.viewPessoaFornecedor?.desde,
					dataCadastro: nfeCabecalhoDrift.viewPessoaFornecedor?.dataCadastro,
					observacao: nfeCabecalhoDrift.viewPessoaFornecedor?.observacao,
					idPessoa: nfeCabecalhoDrift.viewPessoaFornecedor?.idPessoa,
				),
				nfeCupomFiscalReferenciadoModelList: nfeCupomFiscalReferenciadoDriftToModel(nfeCabecalhoDrift.nfeCupomFiscalReferenciadoGroupedList),
				nfeCteReferenciadoModelList: nfeCteReferenciadoDriftToModel(nfeCabecalhoDrift.nfeCteReferenciadoGroupedList),
				nfeAntecipacaoPagamentoModelList: nfeAntecipacaoPagamentoDriftToModel(nfeCabecalhoDrift.nfeAntecipacaoPagamentoGroupedList),
				nfeInformacaoAgropecuarioModelList: nfeInformacaoAgropecuarioDriftToModel(nfeCabecalhoDrift.nfeInformacaoAgropecuarioGroupedList),
				nfeDetalheModelList: nfeDetalheDriftToModel(nfeCabecalhoDrift.nfeDetalheGroupedList),
			);
		} else {
			return null;
		}
	}

	List<NfeDetalheModel> nfeDetalheDriftToModel(List<NfeDetalheGrouped>? nfeDetalheDriftList) { 
		List<NfeDetalheModel> nfeDetalheModelList = [];
		if (nfeDetalheDriftList != null) {
			for (var nfeDetalheGrouped in nfeDetalheDriftList) {
				nfeDetalheModelList.add(
					NfeDetalheModel(
						id: nfeDetalheGrouped.nfeDetalhe?.id,
						idNfeCabecalho: nfeDetalheGrouped.nfeDetalhe?.idNfeCabecalho,
						idProduto: nfeDetalheGrouped.nfeDetalhe?.idProduto,
						produtoModel: ProdutoModel(
							id: nfeDetalheGrouped.produto?.id,
							idProdutoSubgrupo: nfeDetalheGrouped.produto?.idProdutoSubgrupo,
							idProdutoMarca: nfeDetalheGrouped.produto?.idProdutoMarca,
							idProdutoUnidade: nfeDetalheGrouped.produto?.idProdutoUnidade,
							idTributIcmsCustomCab: nfeDetalheGrouped.produto?.idTributIcmsCustomCab,
							idTributGrupoTributario: nfeDetalheGrouped.produto?.idTributGrupoTributario,
							nome: nfeDetalheGrouped.produto?.nome,
							descricao: nfeDetalheGrouped.produto?.descricao,
							gtin: nfeDetalheGrouped.produto?.gtin,
							codigoInterno: nfeDetalheGrouped.produto?.codigoInterno,
							valorCompra: nfeDetalheGrouped.produto?.valorCompra,
							valorVenda: nfeDetalheGrouped.produto?.valorVenda,
							codigoNcm: nfeDetalheGrouped.produto?.codigoNcm,
							estoqueMinimo: nfeDetalheGrouped.produto?.estoqueMinimo,
							estoqueMaximo: nfeDetalheGrouped.produto?.estoqueMaximo,
							quantidadeEstoque: nfeDetalheGrouped.produto?.quantidadeEstoque,
							dataCadastro: nfeDetalheGrouped.produto?.dataCadastro,
						),
						numeroItem: nfeDetalheGrouped.nfeDetalhe?.numeroItem,
						codigoProduto: nfeDetalheGrouped.nfeDetalhe?.codigoProduto,
						gtin: nfeDetalheGrouped.nfeDetalhe?.gtin,
						nomeProduto: nfeDetalheGrouped.nfeDetalhe?.nomeProduto,
						ncm: nfeDetalheGrouped.nfeDetalhe?.ncm,
						nve: nfeDetalheGrouped.nfeDetalhe?.nve,
						cest: nfeDetalheGrouped.nfeDetalhe?.cest,
						indicadorEscalaRelevante: NfeDetalheDomain.getIndicadorEscalaRelevante(nfeDetalheGrouped.nfeDetalhe?.indicadorEscalaRelevante),
						cnpjFabricante: nfeDetalheGrouped.nfeDetalhe?.cnpjFabricante,
						codigoBeneficioFiscal: nfeDetalheGrouped.nfeDetalhe?.codigoBeneficioFiscal,
						exTipi: nfeDetalheGrouped.nfeDetalhe?.exTipi,
						cfop: nfeDetalheGrouped.nfeDetalhe?.cfop,
						unidadeComercial: nfeDetalheGrouped.nfeDetalhe?.unidadeComercial,
						quantidadeComercial: nfeDetalheGrouped.nfeDetalhe?.quantidadeComercial,
						numeroPedidoCompra: nfeDetalheGrouped.nfeDetalhe?.numeroPedidoCompra,
						itemPedidoCompra: nfeDetalheGrouped.nfeDetalhe?.itemPedidoCompra,
						numeroFci: nfeDetalheGrouped.nfeDetalhe?.numeroFci,
						numeroRecopi: nfeDetalheGrouped.nfeDetalhe?.numeroRecopi,
						valorUnitarioComercial: nfeDetalheGrouped.nfeDetalhe?.valorUnitarioComercial,
						valorBrutoProduto: nfeDetalheGrouped.nfeDetalhe?.valorBrutoProduto,
						gtinUnidadeTributavel: nfeDetalheGrouped.nfeDetalhe?.gtinUnidadeTributavel,
						unidadeTributavel: nfeDetalheGrouped.nfeDetalhe?.unidadeTributavel,
						quantidadeTributavel: nfeDetalheGrouped.nfeDetalhe?.quantidadeTributavel,
						valorUnitarioTributavel: nfeDetalheGrouped.nfeDetalhe?.valorUnitarioTributavel,
						valorFrete: nfeDetalheGrouped.nfeDetalhe?.valorFrete,
						valorSeguro: nfeDetalheGrouped.nfeDetalhe?.valorSeguro,
						valorDesconto: nfeDetalheGrouped.nfeDetalhe?.valorDesconto,
						valorOutrasDespesas: nfeDetalheGrouped.nfeDetalhe?.valorOutrasDespesas,
						entraTotal: NfeDetalheDomain.getEntraTotal(nfeDetalheGrouped.nfeDetalhe?.entraTotal),
						valorTotalTributos: nfeDetalheGrouped.nfeDetalhe?.valorTotalTributos,
						percentualDevolvido: nfeDetalheGrouped.nfeDetalhe?.percentualDevolvido,
						valorIpiDevolvido: nfeDetalheGrouped.nfeDetalhe?.valorIpiDevolvido,
						informacoesAdicionais: nfeDetalheGrouped.nfeDetalhe?.informacoesAdicionais,
						valorSubtotal: nfeDetalheGrouped.nfeDetalhe?.valorSubtotal,
						valorTotal: nfeDetalheGrouped.nfeDetalhe?.valorTotal,
						indicadorBemMovelUsado: NfeDetalheDomain.getIndicadorBemMovelUsado(nfeDetalheGrouped.nfeDetalhe?.indicadorBemMovelUsado),
						codigoBarraDifGtin: nfeDetalheGrouped.nfeDetalhe?.codigoBarraDifGtin,
						codigoBarraTribDifGtin: nfeDetalheGrouped.nfeDetalhe?.codigoBarraTribDifGtin,
					)
				);
			}
			return nfeDetalheModelList;
		}
		return [];
	}

	List<NfeReferenciadaModel> nfeReferenciadaDriftToModel(List<NfeReferenciadaGrouped>? nfeReferenciadaDriftList) { 
		List<NfeReferenciadaModel> nfeReferenciadaModelList = [];
		if (nfeReferenciadaDriftList != null) {
			for (var nfeReferenciadaGrouped in nfeReferenciadaDriftList) {
				nfeReferenciadaModelList.add(
					NfeReferenciadaModel(
						id: nfeReferenciadaGrouped.nfeReferenciada?.id,
						idNfeCabecalho: nfeReferenciadaGrouped.nfeReferenciada?.idNfeCabecalho,
						chaveAcesso: nfeReferenciadaGrouped.nfeReferenciada?.chaveAcesso,
						chaveCodigoZerado: nfeReferenciadaGrouped.nfeReferenciada?.chaveCodigoZerado,
					)
				);
			}
			return nfeReferenciadaModelList;
		}
		return [];
	}

	List<NfeProdRuralReferenciadaModel> nfeProdRuralReferenciadaDriftToModel(List<NfeProdRuralReferenciadaGrouped>? nfeProdRuralReferenciadaDriftList) { 
		List<NfeProdRuralReferenciadaModel> nfeProdRuralReferenciadaModelList = [];
		if (nfeProdRuralReferenciadaDriftList != null) {
			for (var nfeProdRuralReferenciadaGrouped in nfeProdRuralReferenciadaDriftList) {
				nfeProdRuralReferenciadaModelList.add(
					NfeProdRuralReferenciadaModel(
						id: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.id,
						idNfeCabecalho: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.idNfeCabecalho,
						codigoUf: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.codigoUf,
						anoMes: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.anoMes,
						cnpj: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.cnpj,
						cpf: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.cpf,
						inscricaoEstadual: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.inscricaoEstadual,
						modelo: NfeProdRuralReferenciadaDomain.getModelo(nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.modelo),
						serie: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.serie,
						numeroNf: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.numeroNf,
						cte: nfeProdRuralReferenciadaGrouped.nfeProdRuralReferenciada?.cte,
					)
				);
			}
			return nfeProdRuralReferenciadaModelList;
		}
		return [];
	}

	List<NfeNfReferenciadaModel> nfeNfReferenciadaDriftToModel(List<NfeNfReferenciadaGrouped>? nfeNfReferenciadaDriftList) { 
		List<NfeNfReferenciadaModel> nfeNfReferenciadaModelList = [];
		if (nfeNfReferenciadaDriftList != null) {
			for (var nfeNfReferenciadaGrouped in nfeNfReferenciadaDriftList) {
				nfeNfReferenciadaModelList.add(
					NfeNfReferenciadaModel(
						id: nfeNfReferenciadaGrouped.nfeNfReferenciada?.id,
						idNfeCabecalho: nfeNfReferenciadaGrouped.nfeNfReferenciada?.idNfeCabecalho,
						codigoUf: nfeNfReferenciadaGrouped.nfeNfReferenciada?.codigoUf,
						anoMes: nfeNfReferenciadaGrouped.nfeNfReferenciada?.anoMes,
						cnpj: nfeNfReferenciadaGrouped.nfeNfReferenciada?.cnpj,
						modelo: NfeNfReferenciadaDomain.getModelo(nfeNfReferenciadaGrouped.nfeNfReferenciada?.modelo),
						serie: nfeNfReferenciadaGrouped.nfeNfReferenciada?.serie,
						numeroNf: nfeNfReferenciadaGrouped.nfeNfReferenciada?.numeroNf,
					)
				);
			}
			return nfeNfReferenciadaModelList;
		}
		return [];
	}

	List<NfeProcessoReferenciadoModel> nfeProcessoReferenciadoDriftToModel(List<NfeProcessoReferenciadoGrouped>? nfeProcessoReferenciadoDriftList) { 
		List<NfeProcessoReferenciadoModel> nfeProcessoReferenciadoModelList = [];
		if (nfeProcessoReferenciadoDriftList != null) {
			for (var nfeProcessoReferenciadoGrouped in nfeProcessoReferenciadoDriftList) {
				nfeProcessoReferenciadoModelList.add(
					NfeProcessoReferenciadoModel(
						id: nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado?.id,
						idNfeCabecalho: nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado?.idNfeCabecalho,
						identificador: nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado?.identificador,
						origem: NfeProcessoReferenciadoDomain.getOrigem(nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado?.origem),
						tipoAtoConcessorio: NfeProcessoReferenciadoDomain.getTipoAtoConcessorio(nfeProcessoReferenciadoGrouped.nfeProcessoReferenciado?.tipoAtoConcessorio),
					)
				);
			}
			return nfeProcessoReferenciadoModelList;
		}
		return [];
	}

	List<NfeAcessoXmlModel> nfeAcessoXmlDriftToModel(List<NfeAcessoXmlGrouped>? nfeAcessoXmlDriftList) { 
		List<NfeAcessoXmlModel> nfeAcessoXmlModelList = [];
		if (nfeAcessoXmlDriftList != null) {
			for (var nfeAcessoXmlGrouped in nfeAcessoXmlDriftList) {
				nfeAcessoXmlModelList.add(
					NfeAcessoXmlModel(
						id: nfeAcessoXmlGrouped.nfeAcessoXml?.id,
						idNfeCabecalho: nfeAcessoXmlGrouped.nfeAcessoXml?.idNfeCabecalho,
						cnpj: nfeAcessoXmlGrouped.nfeAcessoXml?.cnpj,
						cpf: nfeAcessoXmlGrouped.nfeAcessoXml?.cpf,
					)
				);
			}
			return nfeAcessoXmlModelList;
		}
		return [];
	}

	List<NfeInformacaoPagamentoModel> nfeInformacaoPagamentoDriftToModel(List<NfeInformacaoPagamentoGrouped>? nfeInformacaoPagamentoDriftList) { 
		List<NfeInformacaoPagamentoModel> nfeInformacaoPagamentoModelList = [];
		if (nfeInformacaoPagamentoDriftList != null) {
			for (var nfeInformacaoPagamentoGrouped in nfeInformacaoPagamentoDriftList) {
				nfeInformacaoPagamentoModelList.add(
					NfeInformacaoPagamentoModel(
						id: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.id,
						idNfeCabecalho: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.idNfeCabecalho,
						indicadorPagamento: NfeInformacaoPagamentoDomain.getIndicadorPagamento(nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.indicadorPagamento),
						meioPagamento: NfeInformacaoPagamentoDomain.getMeioPagamento(nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.meioPagamento),
						valor: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.valor,
						tipoIntegracao: NfeInformacaoPagamentoDomain.getTipoIntegracao(nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.tipoIntegracao),
						cnpjOperadoraCartao: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.cnpjOperadoraCartao,
						bandeira: NfeInformacaoPagamentoDomain.getBandeira(nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.bandeira),
						numeroAutorizacao: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.numeroAutorizacao,
						troco: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.troco,
						descricaoQuandoOutros: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.descricaoQuandoOutros,
						dataPagamento: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.dataPagamento,
						cnpjTransacional: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.cnpjTransacional,
						ufCnpjTransacional: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.ufCnpjTransacional,
						cnpjBeneficiario: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.cnpjBeneficiario,
						idTerminalPagamento: nfeInformacaoPagamentoGrouped.nfeInformacaoPagamento?.idTerminalPagamento,
					)
				);
			}
			return nfeInformacaoPagamentoModelList;
		}
		return [];
	}

	List<NfeCupomFiscalReferenciadoModel> nfeCupomFiscalReferenciadoDriftToModel(List<NfeCupomFiscalReferenciadoGrouped>? nfeCupomFiscalReferenciadoDriftList) { 
		List<NfeCupomFiscalReferenciadoModel> nfeCupomFiscalReferenciadoModelList = [];
		if (nfeCupomFiscalReferenciadoDriftList != null) {
			for (var nfeCupomFiscalReferenciadoGrouped in nfeCupomFiscalReferenciadoDriftList) {
				nfeCupomFiscalReferenciadoModelList.add(
					NfeCupomFiscalReferenciadoModel(
						id: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.id,
						idNfeCabecalho: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.idNfeCabecalho,
						modeloDocumentoFiscal: NfeCupomFiscalReferenciadoDomain.getModeloDocumentoFiscal(nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.modeloDocumentoFiscal),
						numeroOrdemEcf: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.numeroOrdemEcf,
						coo: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.coo,
						dataEmissaoCupom: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.dataEmissaoCupom,
						numeroCaixa: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.numeroCaixa,
						numeroSerieEcf: nfeCupomFiscalReferenciadoGrouped.nfeCupomFiscalReferenciado?.numeroSerieEcf,
					)
				);
			}
			return nfeCupomFiscalReferenciadoModelList;
		}
		return [];
	}

	List<NfeCteReferenciadoModel> nfeCteReferenciadoDriftToModel(List<NfeCteReferenciadoGrouped>? nfeCteReferenciadoDriftList) { 
		List<NfeCteReferenciadoModel> nfeCteReferenciadoModelList = [];
		if (nfeCteReferenciadoDriftList != null) {
			for (var nfeCteReferenciadoGrouped in nfeCteReferenciadoDriftList) {
				nfeCteReferenciadoModelList.add(
					NfeCteReferenciadoModel(
						id: nfeCteReferenciadoGrouped.nfeCteReferenciado?.id,
						idNfeCabecalho: nfeCteReferenciadoGrouped.nfeCteReferenciado?.idNfeCabecalho,
						chaveAcesso: nfeCteReferenciadoGrouped.nfeCteReferenciado?.chaveAcesso,
					)
				);
			}
			return nfeCteReferenciadoModelList;
		}
		return [];
	}

	List<NfeAntecipacaoPagamentoModel> nfeAntecipacaoPagamentoDriftToModel(List<NfeAntecipacaoPagamentoGrouped>? nfeAntecipacaoPagamentoDriftList) { 
		List<NfeAntecipacaoPagamentoModel> nfeAntecipacaoPagamentoModelList = [];
		if (nfeAntecipacaoPagamentoDriftList != null) {
			for (var nfeAntecipacaoPagamentoGrouped in nfeAntecipacaoPagamentoDriftList) {
				nfeAntecipacaoPagamentoModelList.add(
					NfeAntecipacaoPagamentoModel(
						id: nfeAntecipacaoPagamentoGrouped.nfeAntecipacaoPagamento?.id,
						idNfeCabecalho: nfeAntecipacaoPagamentoGrouped.nfeAntecipacaoPagamento?.idNfeCabecalho,
						chaveAcesso: nfeAntecipacaoPagamentoGrouped.nfeAntecipacaoPagamento?.chaveAcesso,
					)
				);
			}
			return nfeAntecipacaoPagamentoModelList;
		}
		return [];
	}

	List<NfeInformacaoAgropecuarioModel> nfeInformacaoAgropecuarioDriftToModel(List<NfeInformacaoAgropecuarioGrouped>? nfeInformacaoAgropecuarioDriftList) { 
		List<NfeInformacaoAgropecuarioModel> nfeInformacaoAgropecuarioModelList = [];
		if (nfeInformacaoAgropecuarioDriftList != null) {
			for (var nfeInformacaoAgropecuarioGrouped in nfeInformacaoAgropecuarioDriftList) {
				nfeInformacaoAgropecuarioModelList.add(
					NfeInformacaoAgropecuarioModel(
						id: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.id,
						idNfeCabecalho: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.idNfeCabecalho,
						numeroReceituario: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.numeroReceituario,
						cpfResponsavelTecnico: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.cpfResponsavelTecnico,
						guiaTipo: NfeInformacaoAgropecuarioDomain.getGuiaTipo(nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.guiaTipo),
						guiaUfEmissao: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.guiaUfEmissao,
						guiaSerie: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.guiaSerie,
						guiaNumero: nfeInformacaoAgropecuarioGrouped.nfeInformacaoAgropecuario?.guiaNumero,
					)
				);
			}
			return nfeInformacaoAgropecuarioModelList;
		}
		return [];
	}


	NfeCabecalhoGrouped toDrift(NfeCabecalhoModel nfeCabecalhoModel) {
		return NfeCabecalhoGrouped(
			nfeCabecalho: NfeCabecalho(
				id: nfeCabecalhoModel.id,
				idVendaCabecalho: nfeCabecalhoModel.idVendaCabecalho,
				idTributOperacaoFiscal: nfeCabecalhoModel.idTributOperacaoFiscal,
				idCliente: nfeCabecalhoModel.idCliente,
				idColaborador: nfeCabecalhoModel.idColaborador,
				idFornecedor: nfeCabecalhoModel.idFornecedor,
				ufEmitente: NfeCabecalhoDomain.setUfEmitente(nfeCabecalhoModel.ufEmitente),
				codigoNumerico: nfeCabecalhoModel.codigoNumerico,
				naturezaOperacao: nfeCabecalhoModel.naturezaOperacao,
				codigoModelo: NfeCabecalhoDomain.setCodigoModelo(nfeCabecalhoModel.codigoModelo),
				serie: nfeCabecalhoModel.serie,
				numero: nfeCabecalhoModel.numero,
				dataHoraEmissao: nfeCabecalhoModel.dataHoraEmissao,
				dataHoraEntradaSaida: nfeCabecalhoModel.dataHoraEntradaSaida,
				tipoOperacao: NfeCabecalhoDomain.setTipoOperacao(nfeCabecalhoModel.tipoOperacao),
				localDestino: NfeCabecalhoDomain.setLocalDestino(nfeCabecalhoModel.localDestino),
				codigoMunicipio: nfeCabecalhoModel.codigoMunicipio,
				formatoImpressaoDanfe: NfeCabecalhoDomain.setFormatoImpressaoDanfe(nfeCabecalhoModel.formatoImpressaoDanfe),
				tipoEmissao: NfeCabecalhoDomain.setTipoEmissao(nfeCabecalhoModel.tipoEmissao),
				chaveAcesso: nfeCabecalhoModel.chaveAcesso,
				digitoChaveAcesso: nfeCabecalhoModel.digitoChaveAcesso,
				ambiente: NfeCabecalhoDomain.setAmbiente(nfeCabecalhoModel.ambiente),
				finalidadeEmissao: NfeCabecalhoDomain.setFinalidadeEmissao(nfeCabecalhoModel.finalidadeEmissao),
				consumidorOperacao: NfeCabecalhoDomain.setConsumidorOperacao(nfeCabecalhoModel.consumidorOperacao),
				consumidorPresenca: NfeCabecalhoDomain.setConsumidorPresenca(nfeCabecalhoModel.consumidorPresenca),
				processoEmissao: NfeCabecalhoDomain.setProcessoEmissao(nfeCabecalhoModel.processoEmissao),
				versaoProcessoEmissao: nfeCabecalhoModel.versaoProcessoEmissao,
				dataEntradaContingencia: nfeCabecalhoModel.dataEntradaContingencia,
				justificativaContingencia: nfeCabecalhoModel.justificativaContingencia,
				baseCalculoIcms: nfeCabecalhoModel.baseCalculoIcms,
				valorIcms: nfeCabecalhoModel.valorIcms,
				valorIcmsDesonerado: nfeCabecalhoModel.valorIcmsDesonerado,
				totalIcmsFcpUfDestino: nfeCabecalhoModel.totalIcmsFcpUfDestino,
				totalIcmsInterestadualUfDestino: nfeCabecalhoModel.totalIcmsInterestadualUfDestino,
				totalIcmsInterestadualUfRemetente: nfeCabecalhoModel.totalIcmsInterestadualUfRemetente,
				valorTotalFcp: nfeCabecalhoModel.valorTotalFcp,
				baseCalculoIcmsSt: nfeCabecalhoModel.baseCalculoIcmsSt,
				valorIcmsSt: nfeCabecalhoModel.valorIcmsSt,
				valorTotalFcpSt: nfeCabecalhoModel.valorTotalFcpSt,
				valorTotalFcpStRetido: nfeCabecalhoModel.valorTotalFcpStRetido,
				valorTotalProdutos: nfeCabecalhoModel.valorTotalProdutos,
				valorFrete: nfeCabecalhoModel.valorFrete,
				valorSeguro: nfeCabecalhoModel.valorSeguro,
				valorDesconto: nfeCabecalhoModel.valorDesconto,
				valorImpostoImportacao: nfeCabecalhoModel.valorImpostoImportacao,
				valorIpi: nfeCabecalhoModel.valorIpi,
				valorIpiDevolvido: nfeCabecalhoModel.valorIpiDevolvido,
				valorPis: nfeCabecalhoModel.valorPis,
				valorCofins: nfeCabecalhoModel.valorCofins,
				valorDespesasAcessorias: nfeCabecalhoModel.valorDespesasAcessorias,
				valorTotal: nfeCabecalhoModel.valorTotal,
				valorTotalTributos: nfeCabecalhoModel.valorTotalTributos,
				valorServicos: nfeCabecalhoModel.valorServicos,
				baseCalculoIssqn: nfeCabecalhoModel.baseCalculoIssqn,
				valorIssqn: nfeCabecalhoModel.valorIssqn,
				valorPisIssqn: nfeCabecalhoModel.valorPisIssqn,
				valorCofinsIssqn: nfeCabecalhoModel.valorCofinsIssqn,
				dataPrestacaoServico: nfeCabecalhoModel.dataPrestacaoServico,
				valorDeducaoIssqn: nfeCabecalhoModel.valorDeducaoIssqn,
				outrasRetencoesIssqn: nfeCabecalhoModel.outrasRetencoesIssqn,
				descontoIncondicionadoIssqn: nfeCabecalhoModel.descontoIncondicionadoIssqn,
				descontoCondicionadoIssqn: nfeCabecalhoModel.descontoCondicionadoIssqn,
				totalRetencaoIssqn: nfeCabecalhoModel.totalRetencaoIssqn,
				regimeEspecialTributacao: NfeCabecalhoDomain.setRegimeEspecialTributacao(nfeCabecalhoModel.regimeEspecialTributacao),
				valorRetidoPis: nfeCabecalhoModel.valorRetidoPis,
				valorRetidoCofins: nfeCabecalhoModel.valorRetidoCofins,
				valorRetidoCsll: nfeCabecalhoModel.valorRetidoCsll,
				baseCalculoIrrf: nfeCabecalhoModel.baseCalculoIrrf,
				valorRetidoIrrf: nfeCabecalhoModel.valorRetidoIrrf,
				baseCalculoPrevidencia: nfeCabecalhoModel.baseCalculoPrevidencia,
				valorRetidoPrevidencia: nfeCabecalhoModel.valorRetidoPrevidencia,
				informacoesAddFisco: nfeCabecalhoModel.informacoesAddFisco,
				informacoesAddContribuinte: nfeCabecalhoModel.informacoesAddContribuinte,
				comexUfEmbarque: NfeCabecalhoDomain.setComexUfEmbarque(nfeCabecalhoModel.comexUfEmbarque),
				comexLocalEmbarque: nfeCabecalhoModel.comexLocalEmbarque,
				comexLocalDespacho: nfeCabecalhoModel.comexLocalDespacho,
				compraNotaEmpenho: nfeCabecalhoModel.compraNotaEmpenho,
				compraPedido: nfeCabecalhoModel.compraPedido,
				compraContrato: nfeCabecalhoModel.compraContrato,
				qrcode: nfeCabecalhoModel.qrcode,
				urlChave: nfeCabecalhoModel.urlChave,
				statusNota: NfeCabecalhoDomain.setStatusNota(nfeCabecalhoModel.statusNota),
				indicadorIntermediario: NfeCabecalhoDomain.setIndicadorIntermediario(nfeCabecalhoModel.indicadorIntermediario),
				intermediadorCnpj: nfeCabecalhoModel.intermediadorCnpj,
				intermediadorIdCadastro: nfeCabecalhoModel.intermediadorIdCadastro,
				codigoMunicipioFgIbs: nfeCabecalhoModel.codigoMunicipioFgIbs,
				tipoNotaDebito: NfeCabecalhoDomain.setTipoNotaDebito(nfeCabecalhoModel.tipoNotaDebito),
				tipoNotaCredito: NfeCabecalhoDomain.setTipoNotaCredito(nfeCabecalhoModel.tipoNotaCredito),
				totalImpostoSeletivo: nfeCabecalhoModel.totalImpostoSeletivo,
				totalBcIbsCbs: nfeCabecalhoModel.totalBcIbsCbs,
				ibsUfTotalDiferimento: nfeCabecalhoModel.ibsUfTotalDiferimento,
				ibsUfTotalDevTributos: nfeCabecalhoModel.ibsUfTotalDevTributos,
				ibsUfValorTotal: nfeCabecalhoModel.ibsUfValorTotal,
				ibsMunTotalDiferimento: nfeCabecalhoModel.ibsMunTotalDiferimento,
				ibsMunTotalDevTributos: nfeCabecalhoModel.ibsMunTotalDevTributos,
				ibsMunValorTotal: nfeCabecalhoModel.ibsMunValorTotal,
				cbsTotalDiferimento: nfeCabecalhoModel.cbsTotalDiferimento,
				cbsTotalDevTributos: nfeCabecalhoModel.cbsTotalDevTributos,
				cbsValorTotal: nfeCabecalhoModel.cbsValorTotal,
				cbsTotalCreditoPresumido: nfeCabecalhoModel.cbsTotalCreditoPresumido,
				cbsTotCrePreSuspensivo: nfeCabecalhoModel.cbsTotCrePreSuspensivo,
				monoIbsTotal: nfeCabecalhoModel.monoIbsTotal,
				monoCbsTotal: nfeCabecalhoModel.monoCbsTotal,
				monoIbsTotalRetencao: nfeCabecalhoModel.monoIbsTotalRetencao,
				monoCbsTotalRetencao: nfeCabecalhoModel.monoCbsTotalRetencao,
				monoIbsRetido: nfeCabecalhoModel.monoIbsRetido,
				monoCbsRetido: nfeCabecalhoModel.monoCbsRetido,
				valorTotalNfe: nfeCabecalhoModel.valorTotalNfe,
				totalQtdeTributadaMono: nfeCabecalhoModel.totalQtdeTributadaMono,
				totalIcmsMono: nfeCabecalhoModel.totalIcmsMono,
				totalQuantidadeMonoRetencao: nfeCabecalhoModel.totalQuantidadeMonoRetencao,
				totalIcmsMonoRetencao: nfeCabecalhoModel.totalIcmsMonoRetencao,
				totalQuantidadeMonoRetida: nfeCabecalhoModel.totalQuantidadeMonoRetida,
				totalIcmsMonoRetido: nfeCabecalhoModel.totalIcmsMonoRetido,
				ibsValorTotal: nfeCabecalhoModel.ibsValorTotal,
				totalCreditoPresumido: nfeCabecalhoModel.totalCreditoPresumido,
				totalCredPresSuspensivo: nfeCabecalhoModel.totalCredPresSuspensivo,
			),
			nfeEmitente: NfeEmitente(
				id: nfeCabecalhoModel.nfeEmitenteModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeEmitenteModel?.idNfeCabecalho,
				cnpj: Util.removeMask(nfeCabecalhoModel.nfeEmitenteModel?.cnpj),
				cpf: Util.removeMask(nfeCabecalhoModel.nfeEmitenteModel?.cpf),
				nome: nfeCabecalhoModel.nfeEmitenteModel?.nome,
				fantasia: nfeCabecalhoModel.nfeEmitenteModel?.fantasia,
				logradouro: nfeCabecalhoModel.nfeEmitenteModel?.logradouro,
				numero: nfeCabecalhoModel.nfeEmitenteModel?.numero,
				complemento: nfeCabecalhoModel.nfeEmitenteModel?.complemento,
				bairro: nfeCabecalhoModel.nfeEmitenteModel?.bairro,
				codigoMunicipio: nfeCabecalhoModel.nfeEmitenteModel?.codigoMunicipio,
				nomeMunicipio: nfeCabecalhoModel.nfeEmitenteModel?.nomeMunicipio,
				uf: NfeEmitenteDomain.setUf(nfeCabecalhoModel.nfeEmitenteModel?.uf),
				cep: Util.removeMask(nfeCabecalhoModel.nfeEmitenteModel?.cep),
				codigoPais: nfeCabecalhoModel.nfeEmitenteModel?.codigoPais,
				nomePais: nfeCabecalhoModel.nfeEmitenteModel?.nomePais,
				telefone: nfeCabecalhoModel.nfeEmitenteModel?.telefone,
				inscricaoEstadual: nfeCabecalhoModel.nfeEmitenteModel?.inscricaoEstadual,
				inscricaoEstadualSt: nfeCabecalhoModel.nfeEmitenteModel?.inscricaoEstadualSt,
				inscricaoMunicipal: nfeCabecalhoModel.nfeEmitenteModel?.inscricaoMunicipal,
				cnae: nfeCabecalhoModel.nfeEmitenteModel?.cnae,
				crt: NfeEmitenteDomain.setCrt(nfeCabecalhoModel.nfeEmitenteModel?.crt),
			),
			nfeDestinatario: NfeDestinatario(
				id: nfeCabecalhoModel.nfeDestinatarioModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeDestinatarioModel?.idNfeCabecalho,
				cnpj: Util.removeMask(nfeCabecalhoModel.nfeDestinatarioModel?.cnpj),
				cpf: Util.removeMask(nfeCabecalhoModel.nfeDestinatarioModel?.cpf),
				estrangeiroIdentificacao: nfeCabecalhoModel.nfeDestinatarioModel?.estrangeiroIdentificacao,
				nome: nfeCabecalhoModel.nfeDestinatarioModel?.nome,
				logradouro: nfeCabecalhoModel.nfeDestinatarioModel?.logradouro,
				numero: nfeCabecalhoModel.nfeDestinatarioModel?.numero,
				complemento: nfeCabecalhoModel.nfeDestinatarioModel?.complemento,
				bairro: nfeCabecalhoModel.nfeDestinatarioModel?.bairro,
				codigoMunicipio: nfeCabecalhoModel.nfeDestinatarioModel?.codigoMunicipio,
				nomeMunicipio: nfeCabecalhoModel.nfeDestinatarioModel?.nomeMunicipio,
				uf: NfeDestinatarioDomain.setUf(nfeCabecalhoModel.nfeDestinatarioModel?.uf),
				cep: Util.removeMask(nfeCabecalhoModel.nfeDestinatarioModel?.cep),
				codigoPais: nfeCabecalhoModel.nfeDestinatarioModel?.codigoPais,
				nomePais: nfeCabecalhoModel.nfeDestinatarioModel?.nomePais,
				telefone: nfeCabecalhoModel.nfeDestinatarioModel?.telefone,
				indicadorIe: NfeDestinatarioDomain.setIndicadorIe(nfeCabecalhoModel.nfeDestinatarioModel?.indicadorIe),
				inscricaoEstadual: nfeCabecalhoModel.nfeDestinatarioModel?.inscricaoEstadual,
				suframa: nfeCabecalhoModel.nfeDestinatarioModel?.suframa,
				inscricaoMunicipal: nfeCabecalhoModel.nfeDestinatarioModel?.inscricaoMunicipal,
				email: nfeCabecalhoModel.nfeDestinatarioModel?.email,
			),
			nfeLocalRetirada: NfeLocalRetirada(
				id: nfeCabecalhoModel.nfeLocalRetiradaModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeLocalRetiradaModel?.idNfeCabecalho,
				cnpj: Util.removeMask(nfeCabecalhoModel.nfeLocalRetiradaModel?.cnpj),
				cpf: Util.removeMask(nfeCabecalhoModel.nfeLocalRetiradaModel?.cpf),
				nomeExpedidor: nfeCabecalhoModel.nfeLocalRetiradaModel?.nomeExpedidor,
				logradouro: nfeCabecalhoModel.nfeLocalRetiradaModel?.logradouro,
				numero: nfeCabecalhoModel.nfeLocalRetiradaModel?.numero,
				complemento: nfeCabecalhoModel.nfeLocalRetiradaModel?.complemento,
				bairro: nfeCabecalhoModel.nfeLocalRetiradaModel?.bairro,
				codigoMunicipio: nfeCabecalhoModel.nfeLocalRetiradaModel?.codigoMunicipio,
				nomeMunicipio: nfeCabecalhoModel.nfeLocalRetiradaModel?.nomeMunicipio,
				uf: NfeLocalRetiradaDomain.setUf(nfeCabecalhoModel.nfeLocalRetiradaModel?.uf),
				cep: Util.removeMask(nfeCabecalhoModel.nfeLocalRetiradaModel?.cep),
				codigoPais: nfeCabecalhoModel.nfeLocalRetiradaModel?.codigoPais,
				nomePais: nfeCabecalhoModel.nfeLocalRetiradaModel?.nomePais,
				telefone: nfeCabecalhoModel.nfeLocalRetiradaModel?.telefone,
				email: nfeCabecalhoModel.nfeLocalRetiradaModel?.email,
				inscricaoEstadual: nfeCabecalhoModel.nfeLocalRetiradaModel?.inscricaoEstadual,
			),
			nfeLocalEntrega: NfeLocalEntrega(
				id: nfeCabecalhoModel.nfeLocalEntregaModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeLocalEntregaModel?.idNfeCabecalho,
				cnpj: Util.removeMask(nfeCabecalhoModel.nfeLocalEntregaModel?.cnpj),
				cpf: Util.removeMask(nfeCabecalhoModel.nfeLocalEntregaModel?.cpf),
				nomeRecebedor: nfeCabecalhoModel.nfeLocalEntregaModel?.nomeRecebedor,
				logradouro: nfeCabecalhoModel.nfeLocalEntregaModel?.logradouro,
				numero: nfeCabecalhoModel.nfeLocalEntregaModel?.numero,
				complemento: nfeCabecalhoModel.nfeLocalEntregaModel?.complemento,
				bairro: nfeCabecalhoModel.nfeLocalEntregaModel?.bairro,
				codigoMunicipio: nfeCabecalhoModel.nfeLocalEntregaModel?.codigoMunicipio,
				nomeMunicipio: nfeCabecalhoModel.nfeLocalEntregaModel?.nomeMunicipio,
				uf: NfeLocalEntregaDomain.setUf(nfeCabecalhoModel.nfeLocalEntregaModel?.uf),
				cep: Util.removeMask(nfeCabecalhoModel.nfeLocalEntregaModel?.cep),
				codigoPais: nfeCabecalhoModel.nfeLocalEntregaModel?.codigoPais,
				nomePais: nfeCabecalhoModel.nfeLocalEntregaModel?.nomePais,
				telefone: nfeCabecalhoModel.nfeLocalEntregaModel?.telefone,
				email: nfeCabecalhoModel.nfeLocalEntregaModel?.email,
				inscricaoEstadual: nfeCabecalhoModel.nfeLocalEntregaModel?.inscricaoEstadual,
			),
			nfeResponsavelTecnico: NfeResponsavelTecnico(
				id: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.idNfeCabecalho,
				cnpj: Util.removeMask(nfeCabecalhoModel.nfeResponsavelTecnicoModel?.cnpj),
				contato: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.contato,
				email: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.email,
				telefone: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.telefone,
				identificadorCsrt: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.identificadorCsrt,
				hashCsrt: nfeCabecalhoModel.nfeResponsavelTecnicoModel?.hashCsrt,
			),
			nfeCana: NfeCana(
				id: nfeCabecalhoModel.nfeCanaModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeCanaModel?.idNfeCabecalho,
				safra: nfeCabecalhoModel.nfeCanaModel?.safra,
				mesAnoReferencia: nfeCabecalhoModel.nfeCanaModel?.mesAnoReferencia,
			),
			nfeFatura: NfeFatura(
				id: nfeCabecalhoModel.nfeFaturaModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeFaturaModel?.idNfeCabecalho,
				numero: nfeCabecalhoModel.nfeFaturaModel?.numero,
				valorOriginal: nfeCabecalhoModel.nfeFaturaModel?.valorOriginal,
				valorDesconto: nfeCabecalhoModel.nfeFaturaModel?.valorDesconto,
				valorLiquido: nfeCabecalhoModel.nfeFaturaModel?.valorLiquido,
			),
			nfeTransporte: NfeTransporte(
				id: nfeCabecalhoModel.nfeTransporteModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeTransporteModel?.idNfeCabecalho,
				idTransportadora: nfeCabecalhoModel.nfeTransporteModel?.idTransportadora,
				modalidadeFrete: NfeTransporteDomain.setModalidadeFrete(nfeCabecalhoModel.nfeTransporteModel?.modalidadeFrete),
				cnpj: Util.removeMask(nfeCabecalhoModel.nfeTransporteModel?.cnpj),
				cpf: Util.removeMask(nfeCabecalhoModel.nfeTransporteModel?.cpf),
				nome: nfeCabecalhoModel.nfeTransporteModel?.nome,
				inscricaoEstadual: nfeCabecalhoModel.nfeTransporteModel?.inscricaoEstadual,
				endereco: nfeCabecalhoModel.nfeTransporteModel?.endereco,
				nomeMunicipio: nfeCabecalhoModel.nfeTransporteModel?.nomeMunicipio,
				uf: NfeTransporteDomain.setUf(nfeCabecalhoModel.nfeTransporteModel?.uf),
				valorServico: nfeCabecalhoModel.nfeTransporteModel?.valorServico,
				valorBcRetencaoIcms: nfeCabecalhoModel.nfeTransporteModel?.valorBcRetencaoIcms,
				aliquotaRetencaoIcms: nfeCabecalhoModel.nfeTransporteModel?.aliquotaRetencaoIcms,
				valorIcmsRetido: nfeCabecalhoModel.nfeTransporteModel?.valorIcmsRetido,
				cfop: nfeCabecalhoModel.nfeTransporteModel?.cfop,
				municipio: nfeCabecalhoModel.nfeTransporteModel?.municipio,
				placaVeiculo: nfeCabecalhoModel.nfeTransporteModel?.placaVeiculo,
				ufVeiculo: NfeTransporteDomain.setUfVeiculo(nfeCabecalhoModel.nfeTransporteModel?.ufVeiculo),
				rntcVeiculo: nfeCabecalhoModel.nfeTransporteModel?.rntcVeiculo,
			),
			nfeCompraGovernamental: NfeCompraGovernamental(
				id: nfeCabecalhoModel.nfeCompraGovernamentalModel?.id,
				idNfeCabecalho: nfeCabecalhoModel.nfeCompraGovernamentalModel?.idNfeCabecalho,
				tipoEnte: NfeCompraGovernamentalDomain.setTipoEnte(nfeCabecalhoModel.nfeCompraGovernamentalModel?.tipoEnte),
				percentualReducao: nfeCabecalhoModel.nfeCompraGovernamentalModel?.percentualReducao,
				tipoOperacao: NfeCompraGovernamentalDomain.setTipoOperacao(nfeCabecalhoModel.nfeCompraGovernamentalModel?.tipoOperacao),
			),
			nfeReferenciadaGroupedList: nfeReferenciadaModelToDrift(nfeCabecalhoModel.nfeReferenciadaModelList),
			nfeProdRuralReferenciadaGroupedList: nfeProdRuralReferenciadaModelToDrift(nfeCabecalhoModel.nfeProdRuralReferenciadaModelList),
			nfeNfReferenciadaGroupedList: nfeNfReferenciadaModelToDrift(nfeCabecalhoModel.nfeNfReferenciadaModelList),
			nfeProcessoReferenciadoGroupedList: nfeProcessoReferenciadoModelToDrift(nfeCabecalhoModel.nfeProcessoReferenciadoModelList),
			nfeAcessoXmlGroupedList: nfeAcessoXmlModelToDrift(nfeCabecalhoModel.nfeAcessoXmlModelList),
			nfeInformacaoPagamentoGroupedList: nfeInformacaoPagamentoModelToDrift(nfeCabecalhoModel.nfeInformacaoPagamentoModelList),
			nfeCupomFiscalReferenciadoGroupedList: nfeCupomFiscalReferenciadoModelToDrift(nfeCabecalhoModel.nfeCupomFiscalReferenciadoModelList),
			nfeCteReferenciadoGroupedList: nfeCteReferenciadoModelToDrift(nfeCabecalhoModel.nfeCteReferenciadoModelList),
			nfeAntecipacaoPagamentoGroupedList: nfeAntecipacaoPagamentoModelToDrift(nfeCabecalhoModel.nfeAntecipacaoPagamentoModelList),
			nfeInformacaoAgropecuarioGroupedList: nfeInformacaoAgropecuarioModelToDrift(nfeCabecalhoModel.nfeInformacaoAgropecuarioModelList),
			nfeDetalheGroupedList: nfeDetalheModelToDrift(nfeCabecalhoModel.nfeDetalheModelList),
		);
	}

	List<NfeReferenciadaGrouped> nfeReferenciadaModelToDrift(List<NfeReferenciadaModel>? nfeReferenciadaModelList) { 
		List<NfeReferenciadaGrouped> nfeReferenciadaGroupedList = [];
		if (nfeReferenciadaModelList != null) {
			for (var nfeReferenciadaModel in nfeReferenciadaModelList) {
				nfeReferenciadaGroupedList.add(
					NfeReferenciadaGrouped(
						nfeReferenciada: NfeReferenciada(
							id: nfeReferenciadaModel.id,
							idNfeCabecalho: nfeReferenciadaModel.idNfeCabecalho,
							chaveAcesso: nfeReferenciadaModel.chaveAcesso,
							chaveCodigoZerado: nfeReferenciadaModel.chaveCodigoZerado,
						),
					),
				);
			}
			return nfeReferenciadaGroupedList;
		}
		return [];
	}

	List<NfeProdRuralReferenciadaGrouped> nfeProdRuralReferenciadaModelToDrift(List<NfeProdRuralReferenciadaModel>? nfeProdRuralReferenciadaModelList) { 
		List<NfeProdRuralReferenciadaGrouped> nfeProdRuralReferenciadaGroupedList = [];
		if (nfeProdRuralReferenciadaModelList != null) {
			for (var nfeProdRuralReferenciadaModel in nfeProdRuralReferenciadaModelList) {
				nfeProdRuralReferenciadaGroupedList.add(
					NfeProdRuralReferenciadaGrouped(
						nfeProdRuralReferenciada: NfeProdRuralReferenciada(
							id: nfeProdRuralReferenciadaModel.id,
							idNfeCabecalho: nfeProdRuralReferenciadaModel.idNfeCabecalho,
							codigoUf: nfeProdRuralReferenciadaModel.codigoUf,
							anoMes: nfeProdRuralReferenciadaModel.anoMes,
							cnpj: Util.removeMask(nfeProdRuralReferenciadaModel.cnpj),
							cpf: Util.removeMask(nfeProdRuralReferenciadaModel.cpf),
							inscricaoEstadual: nfeProdRuralReferenciadaModel.inscricaoEstadual,
							modelo: NfeProdRuralReferenciadaDomain.setModelo(nfeProdRuralReferenciadaModel.modelo),
							serie: nfeProdRuralReferenciadaModel.serie,
							numeroNf: nfeProdRuralReferenciadaModel.numeroNf,
							cte: nfeProdRuralReferenciadaModel.cte,
						),
					),
				);
			}
			return nfeProdRuralReferenciadaGroupedList;
		}
		return [];
	}

	List<NfeNfReferenciadaGrouped> nfeNfReferenciadaModelToDrift(List<NfeNfReferenciadaModel>? nfeNfReferenciadaModelList) { 
		List<NfeNfReferenciadaGrouped> nfeNfReferenciadaGroupedList = [];
		if (nfeNfReferenciadaModelList != null) {
			for (var nfeNfReferenciadaModel in nfeNfReferenciadaModelList) {
				nfeNfReferenciadaGroupedList.add(
					NfeNfReferenciadaGrouped(
						nfeNfReferenciada: NfeNfReferenciada(
							id: nfeNfReferenciadaModel.id,
							idNfeCabecalho: nfeNfReferenciadaModel.idNfeCabecalho,
							codigoUf: nfeNfReferenciadaModel.codigoUf,
							anoMes: nfeNfReferenciadaModel.anoMes,
							cnpj: Util.removeMask(nfeNfReferenciadaModel.cnpj),
							modelo: NfeNfReferenciadaDomain.setModelo(nfeNfReferenciadaModel.modelo),
							serie: nfeNfReferenciadaModel.serie,
							numeroNf: nfeNfReferenciadaModel.numeroNf,
						),
					),
				);
			}
			return nfeNfReferenciadaGroupedList;
		}
		return [];
	}

	List<NfeProcessoReferenciadoGrouped> nfeProcessoReferenciadoModelToDrift(List<NfeProcessoReferenciadoModel>? nfeProcessoReferenciadoModelList) { 
		List<NfeProcessoReferenciadoGrouped> nfeProcessoReferenciadoGroupedList = [];
		if (nfeProcessoReferenciadoModelList != null) {
			for (var nfeProcessoReferenciadoModel in nfeProcessoReferenciadoModelList) {
				nfeProcessoReferenciadoGroupedList.add(
					NfeProcessoReferenciadoGrouped(
						nfeProcessoReferenciado: NfeProcessoReferenciado(
							id: nfeProcessoReferenciadoModel.id,
							idNfeCabecalho: nfeProcessoReferenciadoModel.idNfeCabecalho,
							identificador: nfeProcessoReferenciadoModel.identificador,
							origem: NfeProcessoReferenciadoDomain.setOrigem(nfeProcessoReferenciadoModel.origem),
							tipoAtoConcessorio: NfeProcessoReferenciadoDomain.setTipoAtoConcessorio(nfeProcessoReferenciadoModel.tipoAtoConcessorio),
						),
					),
				);
			}
			return nfeProcessoReferenciadoGroupedList;
		}
		return [];
	}

	List<NfeAcessoXmlGrouped> nfeAcessoXmlModelToDrift(List<NfeAcessoXmlModel>? nfeAcessoXmlModelList) { 
		List<NfeAcessoXmlGrouped> nfeAcessoXmlGroupedList = [];
		if (nfeAcessoXmlModelList != null) {
			for (var nfeAcessoXmlModel in nfeAcessoXmlModelList) {
				nfeAcessoXmlGroupedList.add(
					NfeAcessoXmlGrouped(
						nfeAcessoXml: NfeAcessoXml(
							id: nfeAcessoXmlModel.id,
							idNfeCabecalho: nfeAcessoXmlModel.idNfeCabecalho,
							cnpj: Util.removeMask(nfeAcessoXmlModel.cnpj),
							cpf: Util.removeMask(nfeAcessoXmlModel.cpf),
						),
					),
				);
			}
			return nfeAcessoXmlGroupedList;
		}
		return [];
	}

	List<NfeInformacaoPagamentoGrouped> nfeInformacaoPagamentoModelToDrift(List<NfeInformacaoPagamentoModel>? nfeInformacaoPagamentoModelList) { 
		List<NfeInformacaoPagamentoGrouped> nfeInformacaoPagamentoGroupedList = [];
		if (nfeInformacaoPagamentoModelList != null) {
			for (var nfeInformacaoPagamentoModel in nfeInformacaoPagamentoModelList) {
				nfeInformacaoPagamentoGroupedList.add(
					NfeInformacaoPagamentoGrouped(
						nfeInformacaoPagamento: NfeInformacaoPagamento(
							id: nfeInformacaoPagamentoModel.id,
							idNfeCabecalho: nfeInformacaoPagamentoModel.idNfeCabecalho,
							indicadorPagamento: NfeInformacaoPagamentoDomain.setIndicadorPagamento(nfeInformacaoPagamentoModel.indicadorPagamento),
							meioPagamento: NfeInformacaoPagamentoDomain.setMeioPagamento(nfeInformacaoPagamentoModel.meioPagamento),
							valor: nfeInformacaoPagamentoModel.valor,
							tipoIntegracao: NfeInformacaoPagamentoDomain.setTipoIntegracao(nfeInformacaoPagamentoModel.tipoIntegracao),
							cnpjOperadoraCartao: Util.removeMask(nfeInformacaoPagamentoModel.cnpjOperadoraCartao),
							bandeira: NfeInformacaoPagamentoDomain.setBandeira(nfeInformacaoPagamentoModel.bandeira),
							numeroAutorizacao: nfeInformacaoPagamentoModel.numeroAutorizacao,
							troco: nfeInformacaoPagamentoModel.troco,
							descricaoQuandoOutros: nfeInformacaoPagamentoModel.descricaoQuandoOutros,
							dataPagamento: nfeInformacaoPagamentoModel.dataPagamento,
							cnpjTransacional: nfeInformacaoPagamentoModel.cnpjTransacional,
							ufCnpjTransacional: nfeInformacaoPagamentoModel.ufCnpjTransacional,
							cnpjBeneficiario: nfeInformacaoPagamentoModel.cnpjBeneficiario,
							idTerminalPagamento: nfeInformacaoPagamentoModel.idTerminalPagamento,
						),
					),
				);
			}
			return nfeInformacaoPagamentoGroupedList;
		}
		return [];
	}

	List<NfeCupomFiscalReferenciadoGrouped> nfeCupomFiscalReferenciadoModelToDrift(List<NfeCupomFiscalReferenciadoModel>? nfeCupomFiscalReferenciadoModelList) { 
		List<NfeCupomFiscalReferenciadoGrouped> nfeCupomFiscalReferenciadoGroupedList = [];
		if (nfeCupomFiscalReferenciadoModelList != null) {
			for (var nfeCupomFiscalReferenciadoModel in nfeCupomFiscalReferenciadoModelList) {
				nfeCupomFiscalReferenciadoGroupedList.add(
					NfeCupomFiscalReferenciadoGrouped(
						nfeCupomFiscalReferenciado: NfeCupomFiscalReferenciado(
							id: nfeCupomFiscalReferenciadoModel.id,
							idNfeCabecalho: nfeCupomFiscalReferenciadoModel.idNfeCabecalho,
							modeloDocumentoFiscal: NfeCupomFiscalReferenciadoDomain.setModeloDocumentoFiscal(nfeCupomFiscalReferenciadoModel.modeloDocumentoFiscal),
							numeroOrdemEcf: nfeCupomFiscalReferenciadoModel.numeroOrdemEcf,
							coo: nfeCupomFiscalReferenciadoModel.coo,
							dataEmissaoCupom: nfeCupomFiscalReferenciadoModel.dataEmissaoCupom,
							numeroCaixa: nfeCupomFiscalReferenciadoModel.numeroCaixa,
							numeroSerieEcf: nfeCupomFiscalReferenciadoModel.numeroSerieEcf,
						),
					),
				);
			}
			return nfeCupomFiscalReferenciadoGroupedList;
		}
		return [];
	}

	List<NfeCteReferenciadoGrouped> nfeCteReferenciadoModelToDrift(List<NfeCteReferenciadoModel>? nfeCteReferenciadoModelList) { 
		List<NfeCteReferenciadoGrouped> nfeCteReferenciadoGroupedList = [];
		if (nfeCteReferenciadoModelList != null) {
			for (var nfeCteReferenciadoModel in nfeCteReferenciadoModelList) {
				nfeCteReferenciadoGroupedList.add(
					NfeCteReferenciadoGrouped(
						nfeCteReferenciado: NfeCteReferenciado(
							id: nfeCteReferenciadoModel.id,
							idNfeCabecalho: nfeCteReferenciadoModel.idNfeCabecalho,
							chaveAcesso: nfeCteReferenciadoModel.chaveAcesso,
						),
					),
				);
			}
			return nfeCteReferenciadoGroupedList;
		}
		return [];
	}

	List<NfeAntecipacaoPagamentoGrouped> nfeAntecipacaoPagamentoModelToDrift(List<NfeAntecipacaoPagamentoModel>? nfeAntecipacaoPagamentoModelList) { 
		List<NfeAntecipacaoPagamentoGrouped> nfeAntecipacaoPagamentoGroupedList = [];
		if (nfeAntecipacaoPagamentoModelList != null) {
			for (var nfeAntecipacaoPagamentoModel in nfeAntecipacaoPagamentoModelList) {
				nfeAntecipacaoPagamentoGroupedList.add(
					NfeAntecipacaoPagamentoGrouped(
						nfeAntecipacaoPagamento: NfeAntecipacaoPagamento(
							id: nfeAntecipacaoPagamentoModel.id,
							idNfeCabecalho: nfeAntecipacaoPagamentoModel.idNfeCabecalho,
							chaveAcesso: nfeAntecipacaoPagamentoModel.chaveAcesso,
						),
					),
				);
			}
			return nfeAntecipacaoPagamentoGroupedList;
		}
		return [];
	}

	List<NfeInformacaoAgropecuarioGrouped> nfeInformacaoAgropecuarioModelToDrift(List<NfeInformacaoAgropecuarioModel>? nfeInformacaoAgropecuarioModelList) { 
		List<NfeInformacaoAgropecuarioGrouped> nfeInformacaoAgropecuarioGroupedList = [];
		if (nfeInformacaoAgropecuarioModelList != null) {
			for (var nfeInformacaoAgropecuarioModel in nfeInformacaoAgropecuarioModelList) {
				nfeInformacaoAgropecuarioGroupedList.add(
					NfeInformacaoAgropecuarioGrouped(
						nfeInformacaoAgropecuario: NfeInformacaoAgropecuario(
							id: nfeInformacaoAgropecuarioModel.id,
							idNfeCabecalho: nfeInformacaoAgropecuarioModel.idNfeCabecalho,
							numeroReceituario: nfeInformacaoAgropecuarioModel.numeroReceituario,
							cpfResponsavelTecnico: nfeInformacaoAgropecuarioModel.cpfResponsavelTecnico,
							guiaTipo: NfeInformacaoAgropecuarioDomain.setGuiaTipo(nfeInformacaoAgropecuarioModel.guiaTipo),
							guiaUfEmissao: nfeInformacaoAgropecuarioModel.guiaUfEmissao,
							guiaSerie: nfeInformacaoAgropecuarioModel.guiaSerie,
							guiaNumero: nfeInformacaoAgropecuarioModel.guiaNumero,
						),
					),
				);
			}
			return nfeInformacaoAgropecuarioGroupedList;
		}
		return [];
	}

	List<NfeDetalheGrouped> nfeDetalheModelToDrift(List<NfeDetalheModel>? nfeDetalheModelList) { 
		List<NfeDetalheGrouped> nfeDetalheGroupedList = [];
		if (nfeDetalheModelList != null) {
			for (var nfeDetalheModel in nfeDetalheModelList) {
				nfeDetalheGroupedList.add(
					NfeDetalheGrouped(
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
					),
				);
			}
			return nfeDetalheGroupedList;
		}
		return [];
	}

}
