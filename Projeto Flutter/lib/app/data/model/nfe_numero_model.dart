import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeNumeroModel extends ModelBase {
  int? id;
  String? serie;
  int? numero;

  NfeNumeroModel({
    this.id,
    this.serie,
    this.numero,
  });

  static List<String> dbColumns = <String>[
    'id',
    'serie',
    'numero',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Serie',
    'Numero',
  ];

  NfeNumeroModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    serie = jsonData['serie'];
    numero = jsonData['numero'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['serie'] = serie;
    jsonData['numero'] = numero;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeNumeroModel fromPlutoRow(PlutoRow row) {
    return NfeNumeroModel(
      id: row.cells['id']?.value,
      serie: row.cells['serie']?.value,
      numero: row.cells['numero']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'serie': PlutoCell(value: serie ?? ''),
        'numero': PlutoCell(value: numero ?? 0),
      },
    );
  }

  NfeNumeroModel clone() {
    return NfeNumeroModel(
      id: id,
      serie: serie,
      numero: numero,
    );
  }

}