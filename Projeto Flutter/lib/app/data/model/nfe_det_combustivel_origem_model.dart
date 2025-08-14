import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetCombustivelOrigemModel extends ModelBase {
  int? id;
  int? idNfeDetEspecificoCombustivel;
  String? indicadorImportacao;
  int? codigoUf;
  double? percentualOriginario;

  NfeDetCombustivelOrigemModel({
    this.id,
    this.idNfeDetEspecificoCombustivel,
    this.indicadorImportacao = '0=Nacional',
    this.codigoUf,
    this.percentualOriginario,
  });

  static List<String> dbColumns = <String>[
    'id',
    'indicador_importacao',
    'codigo_uf',
    'percentual_originario',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Indicador Importacao',
    'Codigo Uf',
    'Percentual Originario',
  ];

  NfeDetCombustivelOrigemModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetEspecificoCombustivel = jsonData['idNfeDetEspecificoCombustivel'];
    indicadorImportacao = NfeDetCombustivelOrigemDomain.getIndicadorImportacao(jsonData['indicadorImportacao']);
    codigoUf = jsonData['codigoUf'];
    percentualOriginario = jsonData['percentualOriginario']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetEspecificoCombustivel'] = idNfeDetEspecificoCombustivel != 0 ? idNfeDetEspecificoCombustivel : null;
    jsonData['indicadorImportacao'] = NfeDetCombustivelOrigemDomain.setIndicadorImportacao(indicadorImportacao);
    jsonData['codigoUf'] = codigoUf;
    jsonData['percentualOriginario'] = percentualOriginario;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetCombustivelOrigemModel fromPlutoRow(PlutoRow row) {
    return NfeDetCombustivelOrigemModel(
      id: row.cells['id']?.value,
      idNfeDetEspecificoCombustivel: row.cells['idNfeDetEspecificoCombustivel']?.value,
      indicadorImportacao: row.cells['indicadorImportacao']?.value,
      codigoUf: row.cells['codigoUf']?.value,
      percentualOriginario: row.cells['percentualOriginario']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetEspecificoCombustivel': PlutoCell(value: idNfeDetEspecificoCombustivel ?? 0),
        'indicadorImportacao': PlutoCell(value: indicadorImportacao ?? ''),
        'codigoUf': PlutoCell(value: codigoUf ?? 0),
        'percentualOriginario': PlutoCell(value: percentualOriginario ?? 0.0),
      },
    );
  }

  NfeDetCombustivelOrigemModel clone() {
    return NfeDetCombustivelOrigemModel(
      id: id,
      idNfeDetEspecificoCombustivel: idNfeDetEspecificoCombustivel,
      indicadorImportacao: indicadorImportacao,
      codigoUf: codigoUf,
      percentualOriginario: percentualOriginario,
    );
  }


}