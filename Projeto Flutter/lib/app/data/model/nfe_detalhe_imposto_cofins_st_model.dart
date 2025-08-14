import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheImpostoCofinsStModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? baseCalculoCofinsSt;
  double? aliquotaCofinsStPercentual;
  double? quantidadeVendidaCofinsSt;
  double? aliquotaCofinsStReais;
  double? valorCofinsSt;
  String? cofinsStCompoeValorTotal;

  NfeDetalheImpostoCofinsStModel({
    this.id,
    this.idNfeDetalhe,
    this.baseCalculoCofinsSt,
    this.aliquotaCofinsStPercentual,
    this.quantidadeVendidaCofinsSt,
    this.aliquotaCofinsStReais,
    this.valorCofinsSt,
    this.cofinsStCompoeValorTotal = '0=Valor da COFINSST não compõe o valor total da NF-e',
  });

  static List<String> dbColumns = <String>[
    'id',
    'base_calculo_cofins_st',
    'aliquota_cofins_st_percentual',
    'quantidade_vendida_cofins_st',
    'aliquota_cofins_st_reais',
    'valor_cofins_st',
    'cofins_st_compoe_valor_total',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Base Calculo Cofins St',
    'Aliquota Cofins St Percentual',
    'Quantidade Vendida Cofins St',
    'Aliquota Cofins St Reais',
    'Valor Cofins St',
    'Cofins St Compoe Valor Total',
  ];

  NfeDetalheImpostoCofinsStModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    baseCalculoCofinsSt = jsonData['baseCalculoCofinsSt']?.toDouble();
    aliquotaCofinsStPercentual = jsonData['aliquotaCofinsStPercentual']?.toDouble();
    quantidadeVendidaCofinsSt = jsonData['quantidadeVendidaCofinsSt']?.toDouble();
    aliquotaCofinsStReais = jsonData['aliquotaCofinsStReais']?.toDouble();
    valorCofinsSt = jsonData['valorCofinsSt']?.toDouble();
    cofinsStCompoeValorTotal = NfeDetalheImpostoCofinsStDomain.getCofinsStCompoeValorTotal(jsonData['cofinsStCompoeValorTotal']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['baseCalculoCofinsSt'] = baseCalculoCofinsSt;
    jsonData['aliquotaCofinsStPercentual'] = aliquotaCofinsStPercentual;
    jsonData['quantidadeVendidaCofinsSt'] = quantidadeVendidaCofinsSt;
    jsonData['aliquotaCofinsStReais'] = aliquotaCofinsStReais;
    jsonData['valorCofinsSt'] = valorCofinsSt;
    jsonData['cofinsStCompoeValorTotal'] = NfeDetalheImpostoCofinsStDomain.setCofinsStCompoeValorTotal(cofinsStCompoeValorTotal);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoCofinsStModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoCofinsStModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      baseCalculoCofinsSt: row.cells['baseCalculoCofinsSt']?.value,
      aliquotaCofinsStPercentual: row.cells['aliquotaCofinsStPercentual']?.value,
      quantidadeVendidaCofinsSt: row.cells['quantidadeVendidaCofinsSt']?.value,
      aliquotaCofinsStReais: row.cells['aliquotaCofinsStReais']?.value,
      valorCofinsSt: row.cells['valorCofinsSt']?.value,
      cofinsStCompoeValorTotal: row.cells['cofinsStCompoeValorTotal']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'baseCalculoCofinsSt': PlutoCell(value: baseCalculoCofinsSt ?? 0.0),
        'aliquotaCofinsStPercentual': PlutoCell(value: aliquotaCofinsStPercentual ?? 0.0),
        'quantidadeVendidaCofinsSt': PlutoCell(value: quantidadeVendidaCofinsSt ?? 0.0),
        'aliquotaCofinsStReais': PlutoCell(value: aliquotaCofinsStReais ?? 0.0),
        'valorCofinsSt': PlutoCell(value: valorCofinsSt ?? 0.0),
        'cofinsStCompoeValorTotal': PlutoCell(value: cofinsStCompoeValorTotal ?? ''),
      },
    );
  }

  NfeDetalheImpostoCofinsStModel clone() {
    return NfeDetalheImpostoCofinsStModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      baseCalculoCofinsSt: baseCalculoCofinsSt,
      aliquotaCofinsStPercentual: aliquotaCofinsStPercentual,
      quantidadeVendidaCofinsSt: quantidadeVendidaCofinsSt,
      aliquotaCofinsStReais: aliquotaCofinsStReais,
      valorCofinsSt: valorCofinsSt,
      cofinsStCompoeValorTotal: cofinsStCompoeValorTotal,
    );
  }


}