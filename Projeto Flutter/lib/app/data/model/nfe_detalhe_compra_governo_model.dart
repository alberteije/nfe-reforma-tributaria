import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheCompraGovernoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? aliquotaIbsUf;
  double? valorIbsUf;
  double? aliquotaIbsMun;
  double? valorIbsMun;
  double? aliquotaCbs;
  double? valorCbs;

  NfeDetalheCompraGovernoModel({
    this.id,
    this.idNfeDetalhe,
    this.aliquotaIbsUf,
    this.valorIbsUf,
    this.aliquotaIbsMun,
    this.valorIbsMun,
    this.aliquotaCbs,
    this.valorCbs,
  });

  static List<String> dbColumns = <String>[
    'id',
    'aliquota_ibs_uf',
    'valor_ibs_uf',
    'aliquota_ibs_mun',
    'valor_ibs_mun',
    'aliquota_cbs',
    'valor_cbs',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Aliquota Ibs Uf',
    'Valor Ibs Uf',
    'Aliquota Ibs Mun',
    'Valor Ibs Mun',
    'Aliquota Cbs',
    'Valor Cbs',
  ];

  NfeDetalheCompraGovernoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    aliquotaIbsUf = jsonData['aliquotaIbsUf']?.toDouble();
    valorIbsUf = jsonData['valorIbsUf']?.toDouble();
    aliquotaIbsMun = jsonData['aliquotaIbsMun']?.toDouble();
    valorIbsMun = jsonData['valorIbsMun']?.toDouble();
    aliquotaCbs = jsonData['aliquotaCbs']?.toDouble();
    valorCbs = jsonData['valorCbs']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['aliquotaIbsUf'] = aliquotaIbsUf;
    jsonData['valorIbsUf'] = valorIbsUf;
    jsonData['aliquotaIbsMun'] = aliquotaIbsMun;
    jsonData['valorIbsMun'] = valorIbsMun;
    jsonData['aliquotaCbs'] = aliquotaCbs;
    jsonData['valorCbs'] = valorCbs;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheCompraGovernoModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheCompraGovernoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      aliquotaIbsUf: row.cells['aliquotaIbsUf']?.value,
      valorIbsUf: row.cells['valorIbsUf']?.value,
      aliquotaIbsMun: row.cells['aliquotaIbsMun']?.value,
      valorIbsMun: row.cells['valorIbsMun']?.value,
      aliquotaCbs: row.cells['aliquotaCbs']?.value,
      valorCbs: row.cells['valorCbs']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'aliquotaIbsUf': PlutoCell(value: aliquotaIbsUf ?? 0.0),
        'valorIbsUf': PlutoCell(value: valorIbsUf ?? 0.0),
        'aliquotaIbsMun': PlutoCell(value: aliquotaIbsMun ?? 0.0),
        'valorIbsMun': PlutoCell(value: valorIbsMun ?? 0.0),
        'aliquotaCbs': PlutoCell(value: aliquotaCbs ?? 0.0),
        'valorCbs': PlutoCell(value: valorCbs ?? 0.0),
      },
    );
  }

  NfeDetalheCompraGovernoModel clone() {
    return NfeDetalheCompraGovernoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      aliquotaIbsUf: aliquotaIbsUf,
      valorIbsUf: valorIbsUf,
      aliquotaIbsMun: aliquotaIbsMun,
      valorIbsMun: valorIbsMun,
      aliquotaCbs: aliquotaCbs,
      valorCbs: valorCbs,
    );
  }


}