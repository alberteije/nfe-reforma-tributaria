import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheDfeReferenciadoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? chaveAcesso;
  int? numeroItem;

  NfeDetalheDfeReferenciadoModel({
    this.id,
    this.idNfeDetalhe,
    this.chaveAcesso,
    this.numeroItem,
  });

  static List<String> dbColumns = <String>[
    'id',
    'chave_acesso',
    'numero_item',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Chave Acesso',
    'Numero Item',
  ];

  NfeDetalheDfeReferenciadoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    chaveAcesso = jsonData['chaveAcesso'];
    numeroItem = jsonData['numeroItem'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['chaveAcesso'] = chaveAcesso;
    jsonData['numeroItem'] = numeroItem;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheDfeReferenciadoModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheDfeReferenciadoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      chaveAcesso: row.cells['chaveAcesso']?.value,
      numeroItem: row.cells['numeroItem']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'chaveAcesso': PlutoCell(value: chaveAcesso ?? ''),
        'numeroItem': PlutoCell(value: numeroItem ?? 0),
      },
    );
  }

  NfeDetalheDfeReferenciadoModel clone() {
    return NfeDetalheDfeReferenciadoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      chaveAcesso: chaveAcesso,
      numeroItem: numeroItem,
    );
  }


}