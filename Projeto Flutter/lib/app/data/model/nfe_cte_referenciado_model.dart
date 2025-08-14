import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeCteReferenciadoModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? chaveAcesso;

  NfeCteReferenciadoModel({
    this.id,
    this.idNfeCabecalho,
    this.chaveAcesso,
  });

  static List<String> dbColumns = <String>[
    'id',
    'chave_acesso',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Chave Acesso',
  ];

  NfeCteReferenciadoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    chaveAcesso = jsonData['chaveAcesso'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['chaveAcesso'] = chaveAcesso;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCteReferenciadoModel fromPlutoRow(PlutoRow row) {
    return NfeCteReferenciadoModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      chaveAcesso: row.cells['chaveAcesso']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'chaveAcesso': PlutoCell(value: chaveAcesso ?? ''),
      },
    );
  }

  NfeCteReferenciadoModel clone() {
    return NfeCteReferenciadoModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      chaveAcesso: chaveAcesso,
    );
  }

}