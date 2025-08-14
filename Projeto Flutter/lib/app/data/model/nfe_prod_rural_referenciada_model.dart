import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeProdRuralReferenciadaModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  int? codigoUf;
  String? anoMes;
  String? cnpj;
  String? cpf;
  String? inscricaoEstadual;
  String? modelo;
  String? serie;
  int? numeroNf;
  String? cte;

  NfeProdRuralReferenciadaModel({
    this.id,
    this.idNfeCabecalho,
    this.codigoUf,
    this.anoMes,
    this.cnpj,
    this.cpf,
    this.inscricaoEstadual,
    this.modelo = '04',
    this.serie,
    this.numeroNf,
    this.cte,
  });

  static List<String> dbColumns = <String>[
    'id',
    'codigo_uf',
    'ano_mes',
    'cnpj',
    'cpf',
    'inscricao_estadual',
    'modelo',
    'serie',
    'numero_nf',
    'cte',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Codigo Uf',
    'Ano Mes',
    'Cnpj',
    'Cpf',
    'Inscricao Estadual',
    'Modelo',
    'Serie',
    'Numero Nf',
    'Cte',
  ];

  NfeProdRuralReferenciadaModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    codigoUf = jsonData['codigoUf'];
    anoMes = jsonData['anoMes'];
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
    inscricaoEstadual = jsonData['inscricaoEstadual'];
    modelo = NfeProdRuralReferenciadaDomain.getModelo(jsonData['modelo']);
    serie = jsonData['serie'];
    numeroNf = jsonData['numeroNf'];
    cte = jsonData['cte'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['codigoUf'] = codigoUf;
    jsonData['anoMes'] = anoMes;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = Util.removeMask(cpf);
    jsonData['inscricaoEstadual'] = inscricaoEstadual;
    jsonData['modelo'] = NfeProdRuralReferenciadaDomain.setModelo(modelo);
    jsonData['serie'] = serie;
    jsonData['numeroNf'] = numeroNf;
    jsonData['cte'] = cte;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeProdRuralReferenciadaModel fromPlutoRow(PlutoRow row) {
    return NfeProdRuralReferenciadaModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      codigoUf: row.cells['codigoUf']?.value,
      anoMes: row.cells['anoMes']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
      inscricaoEstadual: row.cells['inscricaoEstadual']?.value,
      modelo: row.cells['modelo']?.value,
      serie: row.cells['serie']?.value,
      numeroNf: row.cells['numeroNf']?.value,
      cte: row.cells['cte']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'codigoUf': PlutoCell(value: codigoUf ?? 0),
        'anoMes': PlutoCell(value: anoMes ?? ''),
        'cnpj': PlutoCell(value: cnpj ?? ''),
        'cpf': PlutoCell(value: cpf ?? ''),
        'inscricaoEstadual': PlutoCell(value: inscricaoEstadual ?? ''),
        'modelo': PlutoCell(value: modelo ?? ''),
        'serie': PlutoCell(value: serie ?? ''),
        'numeroNf': PlutoCell(value: numeroNf ?? 0),
        'cte': PlutoCell(value: cte ?? ''),
      },
    );
  }

  NfeProdRuralReferenciadaModel clone() {
    return NfeProdRuralReferenciadaModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      codigoUf: codigoUf,
      anoMes: anoMes,
      cnpj: cnpj,
      cpf: cpf,
      inscricaoEstadual: inscricaoEstadual,
      modelo: modelo,
      serie: serie,
      numeroNf: numeroNf,
      cte: cte,
    );
  }

}