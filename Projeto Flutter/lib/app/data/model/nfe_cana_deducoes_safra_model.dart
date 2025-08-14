import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeCanaDeducoesSafraModel extends ModelBase {
  int? id;
  int? idNfeCana;
  String? decricao;
  double? valorDeducao;
  double? valorFornecimento;
  double? valorTotalDeducao;
  double? valorLiquidoFornecimento;

  NfeCanaDeducoesSafraModel({
    this.id,
    this.idNfeCana,
    this.decricao,
    this.valorDeducao,
    this.valorFornecimento,
    this.valorTotalDeducao,
    this.valorLiquidoFornecimento,
  });

  static List<String> dbColumns = <String>[
    'id',
    'decricao',
    'valor_deducao',
    'valor_fornecimento',
    'valor_total_deducao',
    'valor_liquido_fornecimento',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Decricao',
    'Valor Deducao',
    'Valor Fornecimento',
    'Valor Total Deducao',
    'Valor Liquido Fornecimento',
  ];

  NfeCanaDeducoesSafraModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCana = jsonData['idNfeCana'];
    decricao = jsonData['decricao'];
    valorDeducao = jsonData['valorDeducao']?.toDouble();
    valorFornecimento = jsonData['valorFornecimento']?.toDouble();
    valorTotalDeducao = jsonData['valorTotalDeducao']?.toDouble();
    valorLiquidoFornecimento = jsonData['valorLiquidoFornecimento']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCana'] = idNfeCana != 0 ? idNfeCana : null;
    jsonData['decricao'] = decricao;
    jsonData['valorDeducao'] = valorDeducao;
    jsonData['valorFornecimento'] = valorFornecimento;
    jsonData['valorTotalDeducao'] = valorTotalDeducao;
    jsonData['valorLiquidoFornecimento'] = valorLiquidoFornecimento;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCanaDeducoesSafraModel fromPlutoRow(PlutoRow row) {
    return NfeCanaDeducoesSafraModel(
      id: row.cells['id']?.value,
      idNfeCana: row.cells['idNfeCana']?.value,
      decricao: row.cells['decricao']?.value,
      valorDeducao: row.cells['valorDeducao']?.value,
      valorFornecimento: row.cells['valorFornecimento']?.value,
      valorTotalDeducao: row.cells['valorTotalDeducao']?.value,
      valorLiquidoFornecimento: row.cells['valorLiquidoFornecimento']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCana': PlutoCell(value: idNfeCana ?? 0),
        'decricao': PlutoCell(value: decricao ?? ''),
        'valorDeducao': PlutoCell(value: valorDeducao ?? 0.0),
        'valorFornecimento': PlutoCell(value: valorFornecimento ?? 0.0),
        'valorTotalDeducao': PlutoCell(value: valorTotalDeducao ?? 0.0),
        'valorLiquidoFornecimento': PlutoCell(value: valorLiquidoFornecimento ?? 0.0),
      },
    );
  }

  NfeCanaDeducoesSafraModel clone() {
    return NfeCanaDeducoesSafraModel(
      id: id,
      idNfeCana: idNfeCana,
      decricao: decricao,
      valorDeducao: valorDeducao,
      valorFornecimento: valorFornecimento,
      valorTotalDeducao: valorTotalDeducao,
      valorLiquidoFornecimento: valorLiquidoFornecimento,
    );
  }

}