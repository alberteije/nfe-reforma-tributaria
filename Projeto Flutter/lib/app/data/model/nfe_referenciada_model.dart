import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeReferenciadaModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? chaveAcesso;
  String? chaveCodigoZerado;

  NfeReferenciadaModel({
    this.id,
    this.idNfeCabecalho,
    this.chaveAcesso,
    this.chaveCodigoZerado,
  });

  static List<String> dbColumns = <String>[
    'id',
    'chave_acesso',
    'chave_codigo_zerado',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Chave Acesso',
    'Chave Codigo Zerado',
  ];

  NfeReferenciadaModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    chaveAcesso = jsonData['chaveAcesso'];
    chaveCodigoZerado = jsonData['chaveCodigoZerado'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['chaveAcesso'] = chaveAcesso;
    jsonData['chaveCodigoZerado'] = chaveCodigoZerado;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeReferenciadaModel fromPlutoRow(PlutoRow row) {
    return NfeReferenciadaModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      chaveAcesso: row.cells['chaveAcesso']?.value,
      chaveCodigoZerado: row.cells['chaveCodigoZerado']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'chaveAcesso': PlutoCell(value: chaveAcesso ?? ''),
        'chaveCodigoZerado': PlutoCell(value: chaveCodigoZerado ?? ''),
      },
    );
  }

  NfeReferenciadaModel clone() {
    return NfeReferenciadaModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      chaveAcesso: chaveAcesso,
      chaveCodigoZerado: chaveCodigoZerado,
    );
  }


}