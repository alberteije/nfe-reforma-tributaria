import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';

class NfeAcessoXmlModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? cnpj;
  String? cpf;

  NfeAcessoXmlModel({
    this.id,
    this.idNfeCabecalho,
    this.cnpj,
    this.cpf,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cnpj',
    'cpf',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cnpj',
    'Cpf',
  ];

  NfeAcessoXmlModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = Util.removeMask(cpf);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeAcessoXmlModel fromPlutoRow(PlutoRow row) {
    return NfeAcessoXmlModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'cnpj': PlutoCell(value: cnpj ?? ''),
        'cpf': PlutoCell(value: cpf ?? ''),
      },
    );
  }

  NfeAcessoXmlModel clone() {
    return NfeAcessoXmlModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      cnpj: cnpj,
      cpf: cpf,
    );
  }

}