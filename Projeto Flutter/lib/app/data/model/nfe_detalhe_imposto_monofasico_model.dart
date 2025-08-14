import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoMonofasicoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? quantidadeTributada;
  double? aliquotaIbs;
  double? aliquotaCbs;
  double? valorIbs;
  double? valorCbs;
  double? quantidadeTributadaRetencao;
  double? aliquotaIbsRetencao;
  double? valorIbsRetencao;
  double? aliquotaCbsRetencao;
  double? valorCbsRetencao;
  double? quantidadeTributadaRetido;
  double? aliquotaIbsRetido;
  double? valorIbsRetido;
  double? aliquotaCbsRetido;
  double? valorCbsRetido;
  double? percentualIbsDiferido;
  double? valorIbsDiferido;
  double? percentualCbsDiferido;
  double? valorCbsDiferido;
  double? totalIbs;
  double? totalCbs;

  NfeDetalheImpostoMonofasicoModel({
    this.id,
    this.idNfeDetalhe,
    this.quantidadeTributada,
    this.aliquotaIbs,
    this.aliquotaCbs,
    this.valorIbs,
    this.valorCbs,
    this.quantidadeTributadaRetencao,
    this.aliquotaIbsRetencao,
    this.valorIbsRetencao,
    this.aliquotaCbsRetencao,
    this.valorCbsRetencao,
    this.quantidadeTributadaRetido,
    this.aliquotaIbsRetido,
    this.valorIbsRetido,
    this.aliquotaCbsRetido,
    this.valorCbsRetido,
    this.percentualIbsDiferido,
    this.valorIbsDiferido,
    this.percentualCbsDiferido,
    this.valorCbsDiferido,
    this.totalIbs,
    this.totalCbs,
  });

  static List<String> dbColumns = <String>[
    'id',
    'quantidade_tributada',
    'aliquota_ibs',
    'aliquota_cbs',
    'valor_ibs',
    'valor_cbs',
    'quantidade_tributada_retencao',
    'aliquota_ibs_retencao',
    'valor_ibs_retencao',
    'aliquota_cbs_retencao',
    'valor_cbs_retencao',
    'quantidade_tributada_retido',
    'aliquota_ibs_retido',
    'valor_ibs_retido',
    'aliquota_cbs_retido',
    'valor_cbs_retido',
    'percentual_ibs_diferido',
    'valor_ibs_diferido',
    'percentual_cbs_diferido',
    'valor_cbs_diferido',
    'total_ibs',
    'total_cbs',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Quantidade Tributada',
    'Aliquota Ibs',
    'Aliquota Cbs',
    'Valor Ibs',
    'Valor Cbs',
    'Quantidade Tributada Retencao',
    'Aliquota Ibs Retencao',
    'Valor Ibs Retencao',
    'Aliquota Cbs Retencao',
    'Valor Cbs Retencao',
    'Quantidade Tributada Retido',
    'Aliquota Ibs Retido',
    'Valor Ibs Retido',
    'Aliquota Cbs Retido',
    'Valor Cbs Retido',
    'Percentual Ibs Diferido',
    'Valor Ibs Diferido',
    'Percentual Cbs Diferido',
    'Valor Cbs Diferido',
    'Total Ibs',
    'Total Cbs',
  ];

  NfeDetalheImpostoMonofasicoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    quantidadeTributada = jsonData['quantidadeTributada']?.toDouble();
    aliquotaIbs = jsonData['aliquotaIbs']?.toDouble();
    aliquotaCbs = jsonData['aliquotaCbs']?.toDouble();
    valorIbs = jsonData['valorIbs']?.toDouble();
    valorCbs = jsonData['valorCbs']?.toDouble();
    quantidadeTributadaRetencao = jsonData['quantidadeTributadaRetencao']?.toDouble();
    aliquotaIbsRetencao = jsonData['aliquotaIbsRetencao']?.toDouble();
    valorIbsRetencao = jsonData['valorIbsRetencao']?.toDouble();
    aliquotaCbsRetencao = jsonData['aliquotaCbsRetencao']?.toDouble();
    valorCbsRetencao = jsonData['valorCbsRetencao']?.toDouble();
    quantidadeTributadaRetido = jsonData['quantidadeTributadaRetido']?.toDouble();
    aliquotaIbsRetido = jsonData['aliquotaIbsRetido']?.toDouble();
    valorIbsRetido = jsonData['valorIbsRetido']?.toDouble();
    aliquotaCbsRetido = jsonData['aliquotaCbsRetido']?.toDouble();
    valorCbsRetido = jsonData['valorCbsRetido']?.toDouble();
    percentualIbsDiferido = jsonData['percentualIbsDiferido']?.toDouble();
    valorIbsDiferido = jsonData['valorIbsDiferido']?.toDouble();
    percentualCbsDiferido = jsonData['percentualCbsDiferido']?.toDouble();
    valorCbsDiferido = jsonData['valorCbsDiferido']?.toDouble();
    totalIbs = jsonData['totalIbs']?.toDouble();
    totalCbs = jsonData['totalCbs']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['quantidadeTributada'] = quantidadeTributada;
    jsonData['aliquotaIbs'] = aliquotaIbs;
    jsonData['aliquotaCbs'] = aliquotaCbs;
    jsonData['valorIbs'] = valorIbs;
    jsonData['valorCbs'] = valorCbs;
    jsonData['quantidadeTributadaRetencao'] = quantidadeTributadaRetencao;
    jsonData['aliquotaIbsRetencao'] = aliquotaIbsRetencao;
    jsonData['valorIbsRetencao'] = valorIbsRetencao;
    jsonData['aliquotaCbsRetencao'] = aliquotaCbsRetencao;
    jsonData['valorCbsRetencao'] = valorCbsRetencao;
    jsonData['quantidadeTributadaRetido'] = quantidadeTributadaRetido;
    jsonData['aliquotaIbsRetido'] = aliquotaIbsRetido;
    jsonData['valorIbsRetido'] = valorIbsRetido;
    jsonData['aliquotaCbsRetido'] = aliquotaCbsRetido;
    jsonData['valorCbsRetido'] = valorCbsRetido;
    jsonData['percentualIbsDiferido'] = percentualIbsDiferido;
    jsonData['valorIbsDiferido'] = valorIbsDiferido;
    jsonData['percentualCbsDiferido'] = percentualCbsDiferido;
    jsonData['valorCbsDiferido'] = valorCbsDiferido;
    jsonData['totalIbs'] = totalIbs;
    jsonData['totalCbs'] = totalCbs;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoMonofasicoModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoMonofasicoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      quantidadeTributada: row.cells['quantidadeTributada']?.value,
      aliquotaIbs: row.cells['aliquotaIbs']?.value,
      aliquotaCbs: row.cells['aliquotaCbs']?.value,
      valorIbs: row.cells['valorIbs']?.value,
      valorCbs: row.cells['valorCbs']?.value,
      quantidadeTributadaRetencao: row.cells['quantidadeTributadaRetencao']?.value,
      aliquotaIbsRetencao: row.cells['aliquotaIbsRetencao']?.value,
      valorIbsRetencao: row.cells['valorIbsRetencao']?.value,
      aliquotaCbsRetencao: row.cells['aliquotaCbsRetencao']?.value,
      valorCbsRetencao: row.cells['valorCbsRetencao']?.value,
      quantidadeTributadaRetido: row.cells['quantidadeTributadaRetido']?.value,
      aliquotaIbsRetido: row.cells['aliquotaIbsRetido']?.value,
      valorIbsRetido: row.cells['valorIbsRetido']?.value,
      aliquotaCbsRetido: row.cells['aliquotaCbsRetido']?.value,
      valorCbsRetido: row.cells['valorCbsRetido']?.value,
      percentualIbsDiferido: row.cells['percentualIbsDiferido']?.value,
      valorIbsDiferido: row.cells['valorIbsDiferido']?.value,
      percentualCbsDiferido: row.cells['percentualCbsDiferido']?.value,
      valorCbsDiferido: row.cells['valorCbsDiferido']?.value,
      totalIbs: row.cells['totalIbs']?.value,
      totalCbs: row.cells['totalCbs']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'quantidadeTributada': PlutoCell(value: quantidadeTributada ?? 0.0),
        'aliquotaIbs': PlutoCell(value: aliquotaIbs ?? 0.0),
        'aliquotaCbs': PlutoCell(value: aliquotaCbs ?? 0.0),
        'valorIbs': PlutoCell(value: valorIbs ?? 0.0),
        'valorCbs': PlutoCell(value: valorCbs ?? 0.0),
        'quantidadeTributadaRetencao': PlutoCell(value: quantidadeTributadaRetencao ?? 0.0),
        'aliquotaIbsRetencao': PlutoCell(value: aliquotaIbsRetencao ?? 0.0),
        'valorIbsRetencao': PlutoCell(value: valorIbsRetencao ?? 0.0),
        'aliquotaCbsRetencao': PlutoCell(value: aliquotaCbsRetencao ?? 0.0),
        'valorCbsRetencao': PlutoCell(value: valorCbsRetencao ?? 0.0),
        'quantidadeTributadaRetido': PlutoCell(value: quantidadeTributadaRetido ?? 0.0),
        'aliquotaIbsRetido': PlutoCell(value: aliquotaIbsRetido ?? 0.0),
        'valorIbsRetido': PlutoCell(value: valorIbsRetido ?? 0.0),
        'aliquotaCbsRetido': PlutoCell(value: aliquotaCbsRetido ?? 0.0),
        'valorCbsRetido': PlutoCell(value: valorCbsRetido ?? 0.0),
        'percentualIbsDiferido': PlutoCell(value: percentualIbsDiferido ?? 0.0),
        'valorIbsDiferido': PlutoCell(value: valorIbsDiferido ?? 0.0),
        'percentualCbsDiferido': PlutoCell(value: percentualCbsDiferido ?? 0.0),
        'valorCbsDiferido': PlutoCell(value: valorCbsDiferido ?? 0.0),
        'totalIbs': PlutoCell(value: totalIbs ?? 0.0),
        'totalCbs': PlutoCell(value: totalCbs ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoMonofasicoModel clone() {
    return NfeDetalheImpostoMonofasicoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      quantidadeTributada: quantidadeTributada,
      aliquotaIbs: aliquotaIbs,
      aliquotaCbs: aliquotaCbs,
      valorIbs: valorIbs,
      valorCbs: valorCbs,
      quantidadeTributadaRetencao: quantidadeTributadaRetencao,
      aliquotaIbsRetencao: aliquotaIbsRetencao,
      valorIbsRetencao: valorIbsRetencao,
      aliquotaCbsRetencao: aliquotaCbsRetencao,
      valorCbsRetencao: valorCbsRetencao,
      quantidadeTributadaRetido: quantidadeTributadaRetido,
      aliquotaIbsRetido: aliquotaIbsRetido,
      valorIbsRetido: valorIbsRetido,
      aliquotaCbsRetido: aliquotaCbsRetido,
      valorCbsRetido: valorCbsRetido,
      percentualIbsDiferido: percentualIbsDiferido,
      valorIbsDiferido: valorIbsDiferido,
      percentualCbsDiferido: percentualCbsDiferido,
      valorCbsDiferido: valorCbsDiferido,
      totalIbs: totalIbs,
      totalCbs: totalCbs,
    );
  }


}