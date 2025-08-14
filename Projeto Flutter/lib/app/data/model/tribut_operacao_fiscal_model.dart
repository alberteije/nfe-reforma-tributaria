import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class TributOperacaoFiscalModel extends ModelBase {
  int? id;
  String? descricao;
  String? descricaoNaNf;
  int? cfop;
  String? observacao;

  TributOperacaoFiscalModel({
    this.id,
    this.descricao,
    this.descricaoNaNf,
    this.cfop,
    this.observacao,
  });

  static List<String> dbColumns = <String>[
    'id',
    'descricao',
    'descricao_na_nf',
    'cfop',
    'observacao',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Descricao',
    'Descricao Na Nf',
    'Cfop',
    'Observacao',
  ];

  TributOperacaoFiscalModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    descricao = jsonData['descricao'];
    descricaoNaNf = jsonData['descricaoNaNf'];
    cfop = jsonData['cfop'];
    observacao = jsonData['observacao'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['descricao'] = descricao;
    jsonData['descricaoNaNf'] = descricaoNaNf;
    jsonData['cfop'] = cfop;
    jsonData['observacao'] = observacao;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static TributOperacaoFiscalModel fromPlutoRow(PlutoRow row) {
    return TributOperacaoFiscalModel(
      id: row.cells['id']?.value,
      descricao: row.cells['descricao']?.value,
      descricaoNaNf: row.cells['descricaoNaNf']?.value,
      cfop: row.cells['cfop']?.value,
      observacao: row.cells['observacao']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'descricao': PlutoCell(value: descricao ?? ''),
        'descricaoNaNf': PlutoCell(value: descricaoNaNf ?? ''),
        'cfop': PlutoCell(value: cfop ?? 0),
        'observacao': PlutoCell(value: observacao ?? ''),
      },
    );
  }

  TributOperacaoFiscalModel clone() {
    return TributOperacaoFiscalModel(
      id: id,
      descricao: descricao,
      descricaoNaNf: descricaoNaNf,
      cfop: cfop,
      observacao: observacao,
    );
  }


}