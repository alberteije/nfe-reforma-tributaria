import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeTransporteReboqueModel extends ModelBase {
  int? id;
  int? idNfeTransporte;
  String? placa;
  String? uf;
  String? rntc;
  String? vagao;
  String? balsa;

  NfeTransporteReboqueModel({
    this.id,
    this.idNfeTransporte,
    this.placa,
    this.uf = 'AC',
    this.rntc,
    this.vagao,
    this.balsa,
  });

  static List<String> dbColumns = <String>[
    'id',
    'placa',
    'uf',
    'rntc',
    'vagao',
    'balsa',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Placa',
    'Uf',
    'Rntc',
    'Vagao',
    'Balsa',
  ];

  NfeTransporteReboqueModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeTransporte = jsonData['idNfeTransporte'];
    placa = jsonData['placa'];
    uf = NfeTransporteReboqueDomain.getUf(jsonData['uf']);
    rntc = jsonData['rntc'];
    vagao = jsonData['vagao'];
    balsa = jsonData['balsa'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeTransporte'] = idNfeTransporte != 0 ? idNfeTransporte : null;
    jsonData['placa'] = placa;
    jsonData['uf'] = NfeTransporteReboqueDomain.setUf(uf);
    jsonData['rntc'] = rntc;
    jsonData['vagao'] = vagao;
    jsonData['balsa'] = balsa;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeTransporteReboqueModel fromPlutoRow(PlutoRow row) {
    return NfeTransporteReboqueModel(
      id: row.cells['id']?.value,
      idNfeTransporte: row.cells['idNfeTransporte']?.value,
      placa: row.cells['placa']?.value,
      uf: row.cells['uf']?.value,
      rntc: row.cells['rntc']?.value,
      vagao: row.cells['vagao']?.value,
      balsa: row.cells['balsa']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeTransporte': PlutoCell(value: idNfeTransporte ?? 0),
        'placa': PlutoCell(value: placa ?? ''),
        'uf': PlutoCell(value: uf ?? ''),
        'rntc': PlutoCell(value: rntc ?? ''),
        'vagao': PlutoCell(value: vagao ?? ''),
        'balsa': PlutoCell(value: balsa ?? ''),
      },
    );
  }

  NfeTransporteReboqueModel clone() {
    return NfeTransporteReboqueModel(
      id: id,
      idNfeTransporte: idNfeTransporte,
      placa: placa,
      uf: uf,
      rntc: rntc,
      vagao: vagao,
      balsa: balsa,
    );
  }

}