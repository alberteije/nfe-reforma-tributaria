import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoPisModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? cstPis;
  double? valorBaseCalculoPis;
  double? aliquotaPisPercentual;
  double? valorPis;
  double? quantidadeVendida;
  double? aliquotaPisReais;

  NfeDetalheImpostoPisModel({
    this.id,
    this.idNfeDetalhe,
    this.cstPis,
    this.valorBaseCalculoPis,
    this.aliquotaPisPercentual,
    this.valorPis,
    this.quantidadeVendida,
    this.aliquotaPisReais,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cst_pis',
    'valor_base_calculo_pis',
    'aliquota_pis_percentual',
    'valor_pis',
    'quantidade_vendida',
    'aliquota_pis_reais',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cst Pis',
    'Valor Base Calculo Pis',
    'Aliquota Pis Percentual',
    'Valor Pis',
    'Quantidade Vendida',
    'Aliquota Pis Reais',
  ];

  NfeDetalheImpostoPisModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    cstPis = jsonData['cstPis'];
    valorBaseCalculoPis = jsonData['valorBaseCalculoPis']?.toDouble();
    aliquotaPisPercentual = jsonData['aliquotaPisPercentual']?.toDouble();
    valorPis = jsonData['valorPis']?.toDouble();
    quantidadeVendida = jsonData['quantidadeVendida']?.toDouble();
    aliquotaPisReais = jsonData['aliquotaPisReais']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['cstPis'] = cstPis;
    jsonData['valorBaseCalculoPis'] = valorBaseCalculoPis;
    jsonData['aliquotaPisPercentual'] = aliquotaPisPercentual;
    jsonData['valorPis'] = valorPis;
    jsonData['quantidadeVendida'] = quantidadeVendida;
    jsonData['aliquotaPisReais'] = aliquotaPisReais;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoPisModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoPisModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      cstPis: row.cells['cstPis']?.value,
      valorBaseCalculoPis: row.cells['valorBaseCalculoPis']?.value,
      aliquotaPisPercentual: row.cells['aliquotaPisPercentual']?.value,
      valorPis: row.cells['valorPis']?.value,
      quantidadeVendida: row.cells['quantidadeVendida']?.value,
      aliquotaPisReais: row.cells['aliquotaPisReais']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'cstPis': PlutoCell(value: cstPis ?? ''),
        'valorBaseCalculoPis': PlutoCell(value: valorBaseCalculoPis ?? 0.0),
        'aliquotaPisPercentual': PlutoCell(value: aliquotaPisPercentual ?? 0.0),
        'valorPis': PlutoCell(value: valorPis ?? 0.0),
        'quantidadeVendida': PlutoCell(value: quantidadeVendida ?? 0.0),
        'aliquotaPisReais': PlutoCell(value: aliquotaPisReais ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoPisModel clone() {
    return NfeDetalheImpostoPisModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      cstPis: cstPis,
      valorBaseCalculoPis: valorBaseCalculoPis,
      aliquotaPisPercentual: aliquotaPisPercentual,
      valorPis: valorPis,
      quantidadeVendida: quantidadeVendida,
      aliquotaPisReais: aliquotaPisReais,
    );
  }

}