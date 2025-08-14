import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeTransporteModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  int? idTransportadora;
  String? modalidadeFrete;
  String? cnpj;
  String? cpf;
  String? nome;
  String? inscricaoEstadual;
  String? endereco;
  String? nomeMunicipio;
  String? uf;
  double? valorServico;
  double? valorBcRetencaoIcms;
  double? aliquotaRetencaoIcms;
  double? valorIcmsRetido;
  int? cfop;
  int? municipio;
  String? placaVeiculo;
  String? ufVeiculo;
  String? rntcVeiculo;
  List<NfeTransporteReboqueModel>? nfeTransporteReboqueModelList;
  List<NfeTransporteVolumeModel>? nfeTransporteVolumeModelList;

  NfeTransporteModel({
    this.id,
    this.idNfeCabecalho,
    this.idTransportadora,
    this.modalidadeFrete = '0=Contratação do Frete por conta do Remetente (CIF)',
    this.cnpj,
    this.cpf,
    this.nome,
    this.inscricaoEstadual,
    this.endereco,
    this.nomeMunicipio,
    this.uf = 'AC',
    this.valorServico,
    this.valorBcRetencaoIcms,
    this.aliquotaRetencaoIcms,
    this.valorIcmsRetido,
    this.cfop,
    this.municipio,
    this.placaVeiculo,
    this.ufVeiculo = 'AC',
    this.rntcVeiculo,
    List<NfeTransporteReboqueModel>? nfeTransporteReboqueModelList,
    List<NfeTransporteVolumeModel>? nfeTransporteVolumeModelList,
  }) {
    this.nfeTransporteReboqueModelList = nfeTransporteReboqueModelList?.toList(growable: true) ?? [];
    this.nfeTransporteVolumeModelList = nfeTransporteVolumeModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'id_transportadora',
    'modalidade_frete',
    'cnpj',
    'cpf',
    'nome',
    'inscricao_estadual',
    'endereco',
    'nome_municipio',
    'uf',
    'valor_servico',
    'valor_bc_retencao_icms',
    'aliquota_retencao_icms',
    'valor_icms_retido',
    'cfop',
    'municipio',
    'placa_veiculo',
    'uf_veiculo',
    'rntc_veiculo',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Id Transportadora',
    'Modalidade Frete',
    'Cnpj',
    'Cpf',
    'Nome',
    'Inscricao Estadual',
    'Endereco',
    'Nome Municipio',
    'Uf',
    'Valor Servico',
    'Valor Bc Retencao Icms',
    'Aliquota Retencao Icms',
    'Valor Icms Retido',
    'Cfop',
    'Municipio',
    'Placa Veiculo',
    'Uf Veiculo',
    'Rntc Veiculo',
  ];

  NfeTransporteModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    idTransportadora = jsonData['idTransportadora'];
    modalidadeFrete = NfeTransporteDomain.getModalidadeFrete(jsonData['modalidadeFrete']);
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
    nome = jsonData['nome'];
    inscricaoEstadual = jsonData['inscricaoEstadual'];
    endereco = jsonData['endereco'];
    nomeMunicipio = jsonData['nomeMunicipio'];
    uf = NfeTransporteDomain.getUf(jsonData['uf']);
    valorServico = jsonData['valorServico']?.toDouble();
    valorBcRetencaoIcms = jsonData['valorBcRetencaoIcms']?.toDouble();
    aliquotaRetencaoIcms = jsonData['aliquotaRetencaoIcms']?.toDouble();
    valorIcmsRetido = jsonData['valorIcmsRetido']?.toDouble();
    cfop = jsonData['cfop'];
    municipio = jsonData['municipio'];
    placaVeiculo = jsonData['placaVeiculo'];
    ufVeiculo = NfeTransporteDomain.getUfVeiculo(jsonData['ufVeiculo']);
    rntcVeiculo = jsonData['rntcVeiculo'];
    nfeTransporteReboqueModelList = (jsonData['nfeTransporteReboqueModelList'] as Iterable?)?.map((m) => NfeTransporteReboqueModel.fromJson(m)).toList() ?? [];
    nfeTransporteVolumeModelList = (jsonData['nfeTransporteVolumeModelList'] as Iterable?)?.map((m) => NfeTransporteVolumeModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['idTransportadora'] = idTransportadora;
    jsonData['modalidadeFrete'] = NfeTransporteDomain.setModalidadeFrete(modalidadeFrete);
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = Util.removeMask(cpf);
    jsonData['nome'] = nome;
    jsonData['inscricaoEstadual'] = inscricaoEstadual;
    jsonData['endereco'] = endereco;
    jsonData['nomeMunicipio'] = nomeMunicipio;
    jsonData['uf'] = NfeTransporteDomain.setUf(uf);
    jsonData['valorServico'] = valorServico;
    jsonData['valorBcRetencaoIcms'] = valorBcRetencaoIcms;
    jsonData['aliquotaRetencaoIcms'] = aliquotaRetencaoIcms;
    jsonData['valorIcmsRetido'] = valorIcmsRetido;
    jsonData['cfop'] = cfop;
    jsonData['municipio'] = municipio;
    jsonData['placaVeiculo'] = placaVeiculo;
    jsonData['ufVeiculo'] = NfeTransporteDomain.setUfVeiculo(ufVeiculo);
    jsonData['rntcVeiculo'] = rntcVeiculo;

		var nfeTransporteReboqueModelLocalList = []; 
		for (NfeTransporteReboqueModel object in nfeTransporteReboqueModelList ?? []) { 
			nfeTransporteReboqueModelLocalList.add(object.toJson); 
		}
		jsonData['nfeTransporteReboqueModelList'] = nfeTransporteReboqueModelLocalList;

		var nfeTransporteVolumeModelLocalList = []; 
		for (NfeTransporteVolumeModel object in nfeTransporteVolumeModelList ?? []) { 
			nfeTransporteVolumeModelLocalList.add(object.toJson); 
		}
		jsonData['nfeTransporteVolumeModelList'] = nfeTransporteVolumeModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeTransporteModel fromPlutoRow(PlutoRow row) {
    return NfeTransporteModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      idTransportadora: row.cells['idTransportadora']?.value,
      modalidadeFrete: row.cells['modalidadeFrete']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
      nome: row.cells['nome']?.value,
      inscricaoEstadual: row.cells['inscricaoEstadual']?.value,
      endereco: row.cells['endereco']?.value,
      nomeMunicipio: row.cells['nomeMunicipio']?.value,
      uf: row.cells['uf']?.value,
      valorServico: row.cells['valorServico']?.value,
      valorBcRetencaoIcms: row.cells['valorBcRetencaoIcms']?.value,
      aliquotaRetencaoIcms: row.cells['aliquotaRetencaoIcms']?.value,
      valorIcmsRetido: row.cells['valorIcmsRetido']?.value,
      cfop: row.cells['cfop']?.value,
      municipio: row.cells['municipio']?.value,
      placaVeiculo: row.cells['placaVeiculo']?.value,
      ufVeiculo: row.cells['ufVeiculo']?.value,
      rntcVeiculo: row.cells['rntcVeiculo']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'idTransportadora': PlutoCell(value: idTransportadora ?? 0),
        'modalidadeFrete': PlutoCell(value: modalidadeFrete ?? ''),
        'cnpj': PlutoCell(value: cnpj ?? ''),
        'cpf': PlutoCell(value: cpf ?? ''),
        'nome': PlutoCell(value: nome ?? ''),
        'inscricaoEstadual': PlutoCell(value: inscricaoEstadual ?? ''),
        'endereco': PlutoCell(value: endereco ?? ''),
        'nomeMunicipio': PlutoCell(value: nomeMunicipio ?? ''),
        'uf': PlutoCell(value: uf ?? ''),
        'valorServico': PlutoCell(value: valorServico ?? 0.0),
        'valorBcRetencaoIcms': PlutoCell(value: valorBcRetencaoIcms ?? 0.0),
        'aliquotaRetencaoIcms': PlutoCell(value: aliquotaRetencaoIcms ?? 0.0),
        'valorIcmsRetido': PlutoCell(value: valorIcmsRetido ?? 0.0),
        'cfop': PlutoCell(value: cfop ?? 0),
        'municipio': PlutoCell(value: municipio ?? 0),
        'placaVeiculo': PlutoCell(value: placaVeiculo ?? ''),
        'ufVeiculo': PlutoCell(value: ufVeiculo ?? ''),
        'rntcVeiculo': PlutoCell(value: rntcVeiculo ?? ''),
      },
    );
  }

  NfeTransporteModel clone() {
    return NfeTransporteModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      idTransportadora: idTransportadora,
      modalidadeFrete: modalidadeFrete,
      cnpj: cnpj,
      cpf: cpf,
      nome: nome,
      inscricaoEstadual: inscricaoEstadual,
      endereco: endereco,
      nomeMunicipio: nomeMunicipio,
      uf: uf,
      valorServico: valorServico,
      valorBcRetencaoIcms: valorBcRetencaoIcms,
      aliquotaRetencaoIcms: aliquotaRetencaoIcms,
      valorIcmsRetido: valorIcmsRetido,
      cfop: cfop,
      municipio: municipio,
      placaVeiculo: placaVeiculo,
      ufVeiculo: ufVeiculo,
      rntcVeiculo: rntcVeiculo,
      nfeTransporteReboqueModelList: nfeTransporteReboqueModelListClone(nfeTransporteReboqueModelList!),
      nfeTransporteVolumeModelList: nfeTransporteVolumeModelListClone(nfeTransporteVolumeModelList!),
    );
  }

  nfeTransporteReboqueModelListClone(List<NfeTransporteReboqueModel> nfeTransporteReboqueModelList) { 
		List<NfeTransporteReboqueModel> resultList = [];
		for (var nfeTransporteReboqueModel in nfeTransporteReboqueModelList) {
			resultList.add(nfeTransporteReboqueModel.clone());
		}
		return resultList;
	}

  nfeTransporteVolumeModelListClone(List<NfeTransporteVolumeModel> nfeTransporteVolumeModelList) { 
		List<NfeTransporteVolumeModel> resultList = [];
		for (var nfeTransporteVolumeModel in nfeTransporteVolumeModelList) {
			resultList.add(nfeTransporteVolumeModel.clone());
		}
		return resultList;
	}

}