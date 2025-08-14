import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeExportacaoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  int? drawback;
  int? numeroRegistro;
  String? chaveAcesso;
  double? quantidade;

  NfeExportacaoModel({
    this.id,
    this.idNfeDetalhe,
    this.drawback,
    this.numeroRegistro,
    this.chaveAcesso,
    this.quantidade,
  });

  static List<String> dbColumns = <String>[
    'id',
    'drawback',
    'numero_registro',
    'chave_acesso',
    'quantidade',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Drawback',
    'Numero Registro',
    'Chave Acesso',
    'Quantidade',
  ];

  NfeExportacaoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    drawback = jsonData['drawback'];
    numeroRegistro = jsonData['numeroRegistro'];
    chaveAcesso = jsonData['chaveAcesso'];
    quantidade = jsonData['quantidade']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['drawback'] = drawback;
    jsonData['numeroRegistro'] = numeroRegistro;
    jsonData['chaveAcesso'] = chaveAcesso;
    jsonData['quantidade'] = quantidade;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeExportacaoModel fromPlutoRow(PlutoRow row) {
    return NfeExportacaoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      drawback: row.cells['drawback']?.value,
      numeroRegistro: row.cells['numeroRegistro']?.value,
      chaveAcesso: row.cells['chaveAcesso']?.value,
      quantidade: row.cells['quantidade']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'drawback': PlutoCell(value: drawback ?? 0),
        'numeroRegistro': PlutoCell(value: numeroRegistro ?? 0),
        'chaveAcesso': PlutoCell(value: chaveAcesso ?? ''),
        'quantidade': PlutoCell(value: quantidade ?? 0.0),
      },
    );
  }

  NfeExportacaoModel clone() {
    return NfeExportacaoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      drawback: drawback,
      numeroRegistro: numeroRegistro,
      chaveAcesso: chaveAcesso,
      quantidade: quantidade,
    );
  }

}