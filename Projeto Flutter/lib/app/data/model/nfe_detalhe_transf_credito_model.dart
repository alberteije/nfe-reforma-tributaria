import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheTransfCreditoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? valorIbs;
  double? valorCbs;

  NfeDetalheTransfCreditoModel({
    this.id,
    this.idNfeDetalhe,
    this.valorIbs,
    this.valorCbs,
  });

  static List<String> dbColumns = <String>[
    'id',
    'valor_ibs',
    'valor_cbs',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Valor Ibs',
    'Valor Cbs',
  ];

  NfeDetalheTransfCreditoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    valorIbs = jsonData['valorIbs']?.toDouble();
    valorCbs = jsonData['valorCbs']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['valorIbs'] = valorIbs;
    jsonData['valorCbs'] = valorCbs;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheTransfCreditoModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheTransfCreditoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      valorIbs: row.cells['valorIbs']?.value,
      valorCbs: row.cells['valorCbs']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'valorIbs': PlutoCell(value: valorIbs ?? 0.0),
        'valorCbs': PlutoCell(value: valorCbs ?? 0.0),
      },
    );
  }

  NfeDetalheTransfCreditoModel clone() {
    return NfeDetalheTransfCreditoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      valorIbs: valorIbs,
      valorCbs: valorCbs,
    );
  }


}