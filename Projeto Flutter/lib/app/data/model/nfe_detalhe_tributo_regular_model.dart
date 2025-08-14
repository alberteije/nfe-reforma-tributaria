import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheTributoRegularModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? cst;
  String? codigoClassificacaoTributaria;
  double? aliquotaIbsUf;
  double? valorTributoIbsUf;
  double? aliquotaIbsMun;
  double? valorTributoIbsMun;
  double? alquotaCbs;
  double? valorTributoCbs;

  NfeDetalheTributoRegularModel({
    this.id,
    this.idNfeDetalhe,
    this.cst,
    this.codigoClassificacaoTributaria,
    this.aliquotaIbsUf,
    this.valorTributoIbsUf,
    this.aliquotaIbsMun,
    this.valorTributoIbsMun,
    this.alquotaCbs,
    this.valorTributoCbs,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cst',
    'codigo_classificacao_tributaria',
    'aliquota_ibs_uf',
    'valor_tributo_ibs_uf',
    'aliquota_ibs_mun',
    'valor_tributo_ibs_mun',
    'alquota_cbs',
    'valor_tributo_cbs',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cst',
    'Codigo Classificacao Tributaria',
    'Aliquota Ibs Uf',
    'Valor Tributo Ibs Uf',
    'Aliquota Ibs Mun',
    'Valor Tributo Ibs Mun',
    'Alquota Cbs',
    'Valor Tributo Cbs',
  ];

  NfeDetalheTributoRegularModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    cst = jsonData['cst'];
    codigoClassificacaoTributaria = jsonData['codigoClassificacaoTributaria'];
    aliquotaIbsUf = jsonData['aliquotaIbsUf']?.toDouble();
    valorTributoIbsUf = jsonData['valorTributoIbsUf']?.toDouble();
    aliquotaIbsMun = jsonData['aliquotaIbsMun']?.toDouble();
    valorTributoIbsMun = jsonData['valorTributoIbsMun']?.toDouble();
    alquotaCbs = jsonData['alquotaCbs']?.toDouble();
    valorTributoCbs = jsonData['valorTributoCbs']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['cst'] = cst;
    jsonData['codigoClassificacaoTributaria'] = codigoClassificacaoTributaria;
    jsonData['aliquotaIbsUf'] = aliquotaIbsUf;
    jsonData['valorTributoIbsUf'] = valorTributoIbsUf;
    jsonData['aliquotaIbsMun'] = aliquotaIbsMun;
    jsonData['valorTributoIbsMun'] = valorTributoIbsMun;
    jsonData['alquotaCbs'] = alquotaCbs;
    jsonData['valorTributoCbs'] = valorTributoCbs;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheTributoRegularModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheTributoRegularModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      cst: row.cells['cst']?.value,
      codigoClassificacaoTributaria: row.cells['codigoClassificacaoTributaria']?.value,
      aliquotaIbsUf: row.cells['aliquotaIbsUf']?.value,
      valorTributoIbsUf: row.cells['valorTributoIbsUf']?.value,
      aliquotaIbsMun: row.cells['aliquotaIbsMun']?.value,
      valorTributoIbsMun: row.cells['valorTributoIbsMun']?.value,
      alquotaCbs: row.cells['alquotaCbs']?.value,
      valorTributoCbs: row.cells['valorTributoCbs']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'cst': PlutoCell(value: cst ?? ''),
        'codigoClassificacaoTributaria': PlutoCell(value: codigoClassificacaoTributaria ?? ''),
        'aliquotaIbsUf': PlutoCell(value: aliquotaIbsUf ?? 0.0),
        'valorTributoIbsUf': PlutoCell(value: valorTributoIbsUf ?? 0.0),
        'aliquotaIbsMun': PlutoCell(value: aliquotaIbsMun ?? 0.0),
        'valorTributoIbsMun': PlutoCell(value: valorTributoIbsMun ?? 0.0),
        'alquotaCbs': PlutoCell(value: alquotaCbs ?? 0.0),
        'valorTributoCbs': PlutoCell(value: valorTributoCbs ?? 0.0),
      },
    );
  }

  NfeDetalheTributoRegularModel clone() {
    return NfeDetalheTributoRegularModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      cst: cst,
      codigoClassificacaoTributaria: codigoClassificacaoTributaria,
      aliquotaIbsUf: aliquotaIbsUf,
      valorTributoIbsUf: valorTributoIbsUf,
      aliquotaIbsMun: aliquotaIbsMun,
      valorTributoIbsMun: valorTributoIbsMun,
      alquotaCbs: alquotaCbs,
      valorTributoCbs: valorTributoCbs,
    );
  }


}