import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class NfeItemRastreadoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? numeroLote;
  double? quantidadeItens;
  DateTime? dataFabricacao;
  DateTime? dataValidade;
  String? codigoAgregacao;

  NfeItemRastreadoModel({
    this.id,
    this.idNfeDetalhe,
    this.numeroLote,
    this.quantidadeItens,
    this.dataFabricacao,
    this.dataValidade,
    this.codigoAgregacao,
  });

  static List<String> dbColumns = <String>[
    'id',
    'numero_lote',
    'quantidade_itens',
    'data_fabricacao',
    'data_validade',
    'codigo_agregacao',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero Lote',
    'Quantidade Itens',
    'Data Fabricacao',
    'Data Validade',
    'Codigo Agregacao',
  ];

  NfeItemRastreadoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    numeroLote = jsonData['numeroLote'];
    quantidadeItens = jsonData['quantidadeItens']?.toDouble();
    dataFabricacao = jsonData['dataFabricacao'] != null ? DateTime.tryParse(jsonData['dataFabricacao']) : null;
    dataValidade = jsonData['dataValidade'] != null ? DateTime.tryParse(jsonData['dataValidade']) : null;
    codigoAgregacao = jsonData['codigoAgregacao'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['numeroLote'] = numeroLote;
    jsonData['quantidadeItens'] = quantidadeItens;
    jsonData['dataFabricacao'] = dataFabricacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataFabricacao!) : null;
    jsonData['dataValidade'] = dataValidade != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataValidade!) : null;
    jsonData['codigoAgregacao'] = codigoAgregacao;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeItemRastreadoModel fromPlutoRow(PlutoRow row) {
    return NfeItemRastreadoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      numeroLote: row.cells['numeroLote']?.value,
      quantidadeItens: row.cells['quantidadeItens']?.value,
      dataFabricacao: Util.stringToDate(row.cells['dataFabricacao']?.value),
      dataValidade: Util.stringToDate(row.cells['dataValidade']?.value),
      codigoAgregacao: row.cells['codigoAgregacao']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'numeroLote': PlutoCell(value: numeroLote ?? ''),
        'quantidadeItens': PlutoCell(value: quantidadeItens ?? 0.0),
        'dataFabricacao': PlutoCell(value: dataFabricacao),
        'dataValidade': PlutoCell(value: dataValidade),
        'codigoAgregacao': PlutoCell(value: codigoAgregacao ?? ''),
      },
    );
  }

  NfeItemRastreadoModel clone() {
    return NfeItemRastreadoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      numeroLote: numeroLote,
      quantidadeItens: quantidadeItens,
      dataFabricacao: dataFabricacao,
      dataValidade: dataValidade,
      codigoAgregacao: codigoAgregacao,
    );
  }

}