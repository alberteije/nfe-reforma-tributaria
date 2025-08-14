import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';

class NfeResponsavelTecnicoModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? cnpj;
  String? contato;
  String? email;
  String? telefone;
  String? identificadorCsrt;
  String? hashCsrt;

  NfeResponsavelTecnicoModel({
    this.id,
    this.idNfeCabecalho,
    this.cnpj,
    this.contato,
    this.email,
    this.telefone,
    this.identificadorCsrt,
    this.hashCsrt,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cnpj',
    'contato',
    'email',
    'telefone',
    'identificador_csrt',
    'hash_csrt',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cnpj',
    'Contato',
    'Email',
    'Telefone',
    'Identificador Csrt',
    'Hash Csrt',
  ];

  NfeResponsavelTecnicoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    cnpj = jsonData['cnpj'];
    contato = jsonData['contato'];
    email = jsonData['email'];
    telefone = jsonData['telefone'];
    identificadorCsrt = jsonData['identificadorCsrt'];
    hashCsrt = jsonData['hashCsrt'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['contato'] = contato;
    jsonData['email'] = email;
    jsonData['telefone'] = telefone;
    jsonData['identificadorCsrt'] = identificadorCsrt;
    jsonData['hashCsrt'] = hashCsrt;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeResponsavelTecnicoModel fromPlutoRow(PlutoRow row) {
    return NfeResponsavelTecnicoModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      cnpj: row.cells['cnpj']?.value,
      contato: row.cells['contato']?.value,
      email: row.cells['email']?.value,
      telefone: row.cells['telefone']?.value,
      identificadorCsrt: row.cells['identificadorCsrt']?.value,
      hashCsrt: row.cells['hashCsrt']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'cnpj': PlutoCell(value: cnpj ?? ''),
        'contato': PlutoCell(value: contato ?? ''),
        'email': PlutoCell(value: email ?? ''),
        'telefone': PlutoCell(value: telefone ?? ''),
        'identificadorCsrt': PlutoCell(value: identificadorCsrt ?? ''),
        'hashCsrt': PlutoCell(value: hashCsrt ?? ''),
      },
    );
  }

  NfeResponsavelTecnicoModel clone() {
    return NfeResponsavelTecnicoModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      cnpj: cnpj,
      contato: contato,
      email: email,
      telefone: telefone,
      identificadorCsrt: identificadorCsrt,
      hashCsrt: hashCsrt,
    );
  }

}