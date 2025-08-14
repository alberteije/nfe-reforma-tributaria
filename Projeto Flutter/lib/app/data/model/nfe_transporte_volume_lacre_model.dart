import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeTransporteVolumeLacreModel extends ModelBase {
  int? id;
  int? idNfeTransporteVolume;
  String? numero;

  NfeTransporteVolumeLacreModel({
    this.id,
    this.idNfeTransporteVolume,
    this.numero,
  });

  static List<String> dbColumns = <String>[
    'id',
    'numero',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero',
  ];

  NfeTransporteVolumeLacreModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeTransporteVolume = jsonData['idNfeTransporteVolume'];
    numero = jsonData['numero'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeTransporteVolume'] = idNfeTransporteVolume != 0 ? idNfeTransporteVolume : null;
    jsonData['numero'] = numero;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeTransporteVolumeLacreModel fromPlutoRow(PlutoRow row) {
    return NfeTransporteVolumeLacreModel(
      id: row.cells['id']?.value,
      idNfeTransporteVolume: row.cells['idNfeTransporteVolume']?.value,
      numero: row.cells['numero']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeTransporteVolume': PlutoCell(value: idNfeTransporteVolume ?? 0),
        'numero': PlutoCell(value: numero ?? ''),
      },
    );
  }

  NfeTransporteVolumeLacreModel clone() {
    return NfeTransporteVolumeLacreModel(
      id: id,
      idNfeTransporteVolume: idNfeTransporteVolume,
      numero: numero,
    );
  }


}