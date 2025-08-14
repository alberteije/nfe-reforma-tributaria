import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeNfReferenciadaModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  int? codigoUf;
  String? anoMes;
  String? cnpj;
  String? modelo;
  String? serie;
  int? numeroNf;

  NfeNfReferenciadaModel({
    this.id,
    this.idNfeCabecalho,
    this.codigoUf,
    this.anoMes,
    this.cnpj,
    this.modelo = '01',
    this.serie,
    this.numeroNf,
  });

  static List<String> dbColumns = <String>[
    'id',
    'codigo_uf',
    'ano_mes',
    'cnpj',
    'modelo',
    'serie',
    'numero_nf',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Codigo Uf',
    'Ano Mes',
    'Cnpj',
    'Modelo',
    'Serie',
    'Numero Nf',
  ];

  NfeNfReferenciadaModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    codigoUf = jsonData['codigoUf'];
    anoMes = jsonData['anoMes'];
    cnpj = jsonData['cnpj'];
    modelo = NfeNfReferenciadaDomain.getModelo(jsonData['modelo']);
    serie = jsonData['serie'];
    numeroNf = jsonData['numeroNf'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['codigoUf'] = codigoUf;
    jsonData['anoMes'] = anoMes;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['modelo'] = NfeNfReferenciadaDomain.setModelo(modelo);
    jsonData['serie'] = serie;
    jsonData['numeroNf'] = numeroNf;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeNfReferenciadaModel fromPlutoRow(PlutoRow row) {
    return NfeNfReferenciadaModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      codigoUf: row.cells['codigoUf']?.value,
      anoMes: row.cells['anoMes']?.value,
      cnpj: row.cells['cnpj']?.value,
      modelo: row.cells['modelo']?.value,
      serie: row.cells['serie']?.value,
      numeroNf: row.cells['numeroNf']?.value,
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
        'modelo': PlutoCell(value: modelo ?? ''),
        'serie': PlutoCell(value: serie ?? ''),
        'numeroNf': PlutoCell(value: numeroNf ?? 0),
      },
    );
  }

  NfeNfReferenciadaModel clone() {
    return NfeNfReferenciadaModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      codigoUf: codigoUf,
      anoMes: anoMes,
      cnpj: cnpj,
      modelo: modelo,
      serie: serie,
      numeroNf: numeroNf,
    );
  }


}