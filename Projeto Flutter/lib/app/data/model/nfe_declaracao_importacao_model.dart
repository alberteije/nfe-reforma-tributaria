import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDeclaracaoImportacaoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? numeroDocumento;
  DateTime? dataRegistro;
  String? localDesembaraco;
  String? ufDesembaraco;
  DateTime? dataDesembaraco;
  String? viaTransporte;
  double? valorAfrmm;
  String? formaIntermediacao;
  String? cnpj;
  String? cpf;
  String? ufTerceiro;
  String? codigoExportador;
  List<NfeImportacaoDetalheModel>? nfeImportacaoDetalheModelList;

  NfeDeclaracaoImportacaoModel({
    this.id,
    this.idNfeDetalhe,
    this.numeroDocumento,
    this.dataRegistro,
    this.localDesembaraco,
    this.ufDesembaraco = 'AC',
    this.dataDesembaraco,
    this.viaTransporte = '1=Marítima',
    this.valorAfrmm,
    this.formaIntermediacao = '1=Importação por conta própria',
    this.cnpj,
    this.cpf,
    this.ufTerceiro = 'AC',
    this.codigoExportador,
    List<NfeImportacaoDetalheModel>? nfeImportacaoDetalheModelList,
  }) {
    this.nfeImportacaoDetalheModelList = nfeImportacaoDetalheModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'numero_documento',
    'data_registro',
    'local_desembaraco',
    'uf_desembaraco',
    'data_desembaraco',
    'via_transporte',
    'valor_afrmm',
    'forma_intermediacao',
    'cnpj',
    'cpf',
    'uf_terceiro',
    'codigo_exportador',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero Documento',
    'Data Registro',
    'Local Desembaraco',
    'Uf Desembaraco',
    'Data Desembaraco',
    'Via Transporte',
    'Valor Afrmm',
    'Forma Intermediacao',
    'Cnpj',
    'Cpf',
    'Uf Terceiro',
    'Codigo Exportador',
  ];

  NfeDeclaracaoImportacaoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    numeroDocumento = jsonData['numeroDocumento'];
    dataRegistro = jsonData['dataRegistro'] != null ? DateTime.tryParse(jsonData['dataRegistro']) : null;
    localDesembaraco = jsonData['localDesembaraco'];
    ufDesembaraco = NfeDeclaracaoImportacaoDomain.getUfDesembaraco(jsonData['ufDesembaraco']);
    dataDesembaraco = jsonData['dataDesembaraco'] != null ? DateTime.tryParse(jsonData['dataDesembaraco']) : null;
    viaTransporte = NfeDeclaracaoImportacaoDomain.getViaTransporte(jsonData['viaTransporte']);
    valorAfrmm = jsonData['valorAfrmm']?.toDouble();
    formaIntermediacao = NfeDeclaracaoImportacaoDomain.getFormaIntermediacao(jsonData['formaIntermediacao']);
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
    ufTerceiro = NfeDeclaracaoImportacaoDomain.getUfTerceiro(jsonData['ufTerceiro']);
    codigoExportador = jsonData['codigoExportador'];
    nfeImportacaoDetalheModelList = (jsonData['nfeImportacaoDetalheModelList'] as Iterable?)?.map((m) => NfeImportacaoDetalheModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['numeroDocumento'] = numeroDocumento;
    jsonData['dataRegistro'] = dataRegistro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRegistro!) : null;
    jsonData['localDesembaraco'] = localDesembaraco;
    jsonData['ufDesembaraco'] = NfeDeclaracaoImportacaoDomain.setUfDesembaraco(ufDesembaraco);
    jsonData['dataDesembaraco'] = dataDesembaraco != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataDesembaraco!) : null;
    jsonData['viaTransporte'] = NfeDeclaracaoImportacaoDomain.setViaTransporte(viaTransporte);
    jsonData['valorAfrmm'] = valorAfrmm;
    jsonData['formaIntermediacao'] = NfeDeclaracaoImportacaoDomain.setFormaIntermediacao(formaIntermediacao);
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = cpf;
    jsonData['ufTerceiro'] = NfeDeclaracaoImportacaoDomain.setUfTerceiro(ufTerceiro);
    jsonData['codigoExportador'] = codigoExportador;

		var nfeImportacaoDetalheModelLocalList = []; 
		for (NfeImportacaoDetalheModel object in nfeImportacaoDetalheModelList ?? []) { 
			nfeImportacaoDetalheModelLocalList.add(object.toJson); 
		}
		jsonData['nfeImportacaoDetalheModelList'] = nfeImportacaoDetalheModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDeclaracaoImportacaoModel fromPlutoRow(PlutoRow row) {
    return NfeDeclaracaoImportacaoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      numeroDocumento: row.cells['numeroDocumento']?.value,
      dataRegistro: Util.stringToDate(row.cells['dataRegistro']?.value),
      localDesembaraco: row.cells['localDesembaraco']?.value,
      ufDesembaraco: row.cells['ufDesembaraco']?.value,
      dataDesembaraco: Util.stringToDate(row.cells['dataDesembaraco']?.value),
      viaTransporte: row.cells['viaTransporte']?.value,
      valorAfrmm: row.cells['valorAfrmm']?.value,
      formaIntermediacao: row.cells['formaIntermediacao']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
      ufTerceiro: row.cells['ufTerceiro']?.value,
      codigoExportador: row.cells['codigoExportador']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'numeroDocumento': PlutoCell(value: numeroDocumento ?? ''),
        'dataRegistro': PlutoCell(value: dataRegistro),
        'localDesembaraco': PlutoCell(value: localDesembaraco ?? ''),
        'ufDesembaraco': PlutoCell(value: ufDesembaraco ?? ''),
        'dataDesembaraco': PlutoCell(value: dataDesembaraco),
        'viaTransporte': PlutoCell(value: viaTransporte ?? ''),
        'valorAfrmm': PlutoCell(value: valorAfrmm ?? 0.0),
        'formaIntermediacao': PlutoCell(value: formaIntermediacao ?? ''),
        'cnpj': PlutoCell(value: cnpj ?? ''),
        'cpf': PlutoCell(value: cpf ?? ''),
        'ufTerceiro': PlutoCell(value: ufTerceiro ?? ''),
        'codigoExportador': PlutoCell(value: codigoExportador ?? ''),
      },
    );
  }

  NfeDeclaracaoImportacaoModel clone() {
    return NfeDeclaracaoImportacaoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      numeroDocumento: numeroDocumento,
      dataRegistro: dataRegistro,
      localDesembaraco: localDesembaraco,
      ufDesembaraco: ufDesembaraco,
      dataDesembaraco: dataDesembaraco,
      viaTransporte: viaTransporte,
      valorAfrmm: valorAfrmm,
      formaIntermediacao: formaIntermediacao,
      cnpj: cnpj,
      cpf: cpf,
      ufTerceiro: ufTerceiro,
      codigoExportador: codigoExportador,
      nfeImportacaoDetalheModelList: nfeImportacaoDetalheModelListClone(nfeImportacaoDetalheModelList!),
    );
  }

  nfeImportacaoDetalheModelListClone(List<NfeImportacaoDetalheModel> nfeImportacaoDetalheModelList) { 
		List<NfeImportacaoDetalheModel> resultList = [];
		for (var nfeImportacaoDetalheModel in nfeImportacaoDetalheModelList) {
			resultList.add(nfeImportacaoDetalheModel.clone());
		}
		return resultList;
	}


}