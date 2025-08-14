import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoIiModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? valorBcIi;
  double? valorDespesasAduaneiras;
  double? valorImpostoImportacao;
  double? valorIof;

  NfeDetalheImpostoIiModel({
    this.id,
    this.idNfeDetalhe,
    this.valorBcIi,
    this.valorDespesasAduaneiras,
    this.valorImpostoImportacao,
    this.valorIof,
  });

  static List<String> dbColumns = <String>[
    'id',
    'valor_bc_ii',
    'valor_despesas_aduaneiras',
    'valor_imposto_importacao',
    'valor_iof',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Valor Bc Ii',
    'Valor Despesas Aduaneiras',
    'Valor Imposto Importacao',
    'Valor Iof',
  ];

  NfeDetalheImpostoIiModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    valorBcIi = jsonData['valorBcIi']?.toDouble();
    valorDespesasAduaneiras = jsonData['valorDespesasAduaneiras']?.toDouble();
    valorImpostoImportacao = jsonData['valorImpostoImportacao']?.toDouble();
    valorIof = jsonData['valorIof']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['valorBcIi'] = valorBcIi;
    jsonData['valorDespesasAduaneiras'] = valorDespesasAduaneiras;
    jsonData['valorImpostoImportacao'] = valorImpostoImportacao;
    jsonData['valorIof'] = valorIof;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoIiModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoIiModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      valorBcIi: row.cells['valorBcIi']?.value,
      valorDespesasAduaneiras: row.cells['valorDespesasAduaneiras']?.value,
      valorImpostoImportacao: row.cells['valorImpostoImportacao']?.value,
      valorIof: row.cells['valorIof']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'valorBcIi': PlutoCell(value: valorBcIi ?? 0.0),
        'valorDespesasAduaneiras': PlutoCell(value: valorDespesasAduaneiras ?? 0.0),
        'valorImpostoImportacao': PlutoCell(value: valorImpostoImportacao ?? 0.0),
        'valorIof': PlutoCell(value: valorIof ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoIiModel clone() {
    return NfeDetalheImpostoIiModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      valorBcIi: valorBcIi,
      valorDespesasAduaneiras: valorDespesasAduaneiras,
      valorImpostoImportacao: valorImpostoImportacao,
      valorIof: valorIof,
    );
  }


}