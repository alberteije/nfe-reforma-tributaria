import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoCofinsModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? cstCofins;
  double? baseCalculoCofins;
  double? aliquotaCofinsPercentual;
  double? quantidadeVendida;
  double? aliquotaCofinsReais;
  double? valorCofins;

  NfeDetalheImpostoCofinsModel({
    this.id,
    this.idNfeDetalhe,
    this.cstCofins,
    this.baseCalculoCofins,
    this.aliquotaCofinsPercentual,
    this.quantidadeVendida,
    this.aliquotaCofinsReais,
    this.valorCofins,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cst_cofins',
    'base_calculo_cofins',
    'aliquota_cofins_percentual',
    'quantidade_vendida',
    'aliquota_cofins_reais',
    'valor_cofins',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cst Cofins',
    'Base Calculo Cofins',
    'Aliquota Cofins Percentual',
    'Quantidade Vendida',
    'Aliquota Cofins Reais',
    'Valor Cofins',
  ];

  NfeDetalheImpostoCofinsModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    cstCofins = jsonData['cstCofins'];
    baseCalculoCofins = jsonData['baseCalculoCofins']?.toDouble();
    aliquotaCofinsPercentual = jsonData['aliquotaCofinsPercentual']?.toDouble();
    quantidadeVendida = jsonData['quantidadeVendida']?.toDouble();
    aliquotaCofinsReais = jsonData['aliquotaCofinsReais']?.toDouble();
    valorCofins = jsonData['valorCofins']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['cstCofins'] = cstCofins;
    jsonData['baseCalculoCofins'] = baseCalculoCofins;
    jsonData['aliquotaCofinsPercentual'] = aliquotaCofinsPercentual;
    jsonData['quantidadeVendida'] = quantidadeVendida;
    jsonData['aliquotaCofinsReais'] = aliquotaCofinsReais;
    jsonData['valorCofins'] = valorCofins;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoCofinsModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoCofinsModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      cstCofins: row.cells['cstCofins']?.value,
      baseCalculoCofins: row.cells['baseCalculoCofins']?.value,
      aliquotaCofinsPercentual: row.cells['aliquotaCofinsPercentual']?.value,
      quantidadeVendida: row.cells['quantidadeVendida']?.value,
      aliquotaCofinsReais: row.cells['aliquotaCofinsReais']?.value,
      valorCofins: row.cells['valorCofins']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'cstCofins': PlutoCell(value: cstCofins ?? ''),
        'baseCalculoCofins': PlutoCell(value: baseCalculoCofins ?? 0.0),
        'aliquotaCofinsPercentual': PlutoCell(value: aliquotaCofinsPercentual ?? 0.0),
        'quantidadeVendida': PlutoCell(value: quantidadeVendida ?? 0.0),
        'aliquotaCofinsReais': PlutoCell(value: aliquotaCofinsReais ?? 0.0),
        'valorCofins': PlutoCell(value: valorCofins ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoCofinsModel clone() {
    return NfeDetalheImpostoCofinsModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      cstCofins: cstCofins,
      baseCalculoCofins: baseCalculoCofins,
      aliquotaCofinsPercentual: aliquotaCofinsPercentual,
      quantidadeVendida: quantidadeVendida,
      aliquotaCofinsReais: aliquotaCofinsReais,
      valorCofins: valorCofins,
    );
  }

}