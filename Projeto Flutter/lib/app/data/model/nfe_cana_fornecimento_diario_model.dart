import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeCanaFornecimentoDiarioModel extends ModelBase {
  int? id;
  int? idNfeCana;
  String? dia;
  double? quantidade;
  double? quantidadeTotalMes;
  double? quantidadeTotalAnterior;
  double? quantidadeTotalGeral;

  NfeCanaFornecimentoDiarioModel({
    this.id,
    this.idNfeCana,
    this.dia,
    this.quantidade,
    this.quantidadeTotalMes,
    this.quantidadeTotalAnterior,
    this.quantidadeTotalGeral,
  });

  static List<String> dbColumns = <String>[
    'id',
    'dia',
    'quantidade',
    'quantidade_total_mes',
    'quantidade_total_anterior',
    'quantidade_total_geral',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Dia',
    'Quantidade',
    'Quantidade Total Mes',
    'Quantidade Total Anterior',
    'Quantidade Total Geral',
  ];

  NfeCanaFornecimentoDiarioModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCana = jsonData['idNfeCana'];
    dia = jsonData['dia'];
    quantidade = jsonData['quantidade']?.toDouble();
    quantidadeTotalMes = jsonData['quantidadeTotalMes']?.toDouble();
    quantidadeTotalAnterior = jsonData['quantidadeTotalAnterior']?.toDouble();
    quantidadeTotalGeral = jsonData['quantidadeTotalGeral']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCana'] = idNfeCana != 0 ? idNfeCana : null;
    jsonData['dia'] = dia;
    jsonData['quantidade'] = quantidade;
    jsonData['quantidadeTotalMes'] = quantidadeTotalMes;
    jsonData['quantidadeTotalAnterior'] = quantidadeTotalAnterior;
    jsonData['quantidadeTotalGeral'] = quantidadeTotalGeral;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCanaFornecimentoDiarioModel fromPlutoRow(PlutoRow row) {
    return NfeCanaFornecimentoDiarioModel(
      id: row.cells['id']?.value,
      idNfeCana: row.cells['idNfeCana']?.value,
      dia: row.cells['dia']?.value,
      quantidade: row.cells['quantidade']?.value,
      quantidadeTotalMes: row.cells['quantidadeTotalMes']?.value,
      quantidadeTotalAnterior: row.cells['quantidadeTotalAnterior']?.value,
      quantidadeTotalGeral: row.cells['quantidadeTotalGeral']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCana': PlutoCell(value: idNfeCana ?? 0),
        'dia': PlutoCell(value: dia ?? ''),
        'quantidade': PlutoCell(value: quantidade ?? 0.0),
        'quantidadeTotalMes': PlutoCell(value: quantidadeTotalMes ?? 0.0),
        'quantidadeTotalAnterior': PlutoCell(value: quantidadeTotalAnterior ?? 0.0),
        'quantidadeTotalGeral': PlutoCell(value: quantidadeTotalGeral ?? 0.0),
      },
    );
  }

  NfeCanaFornecimentoDiarioModel clone() {
    return NfeCanaFornecimentoDiarioModel(
      id: id,
      idNfeCana: idNfeCana,
      dia: dia,
      quantidade: quantidade,
      quantidadeTotalMes: quantidadeTotalMes,
      quantidadeTotalAnterior: quantidadeTotalAnterior,
      quantidadeTotalGeral: quantidadeTotalGeral,
    );
  }

}