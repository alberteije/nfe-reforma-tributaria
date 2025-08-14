import 'dart:convert';
import 'package:nfe/app/data/domain/domain_imports.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoPisStModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? valorBaseCalculoPisSt;
  double? aliquotaPisStPercentual;
  double? quantidadeVendidaPisSt;
  double? aliquotaPisStReais;
  double? valorPisSt;
  String? pisStCompoeValorTotal;

  NfeDetalheImpostoPisStModel({
    this.id,
    this.idNfeDetalhe,
    this.valorBaseCalculoPisSt,
    this.aliquotaPisStPercentual,
    this.quantidadeVendidaPisSt,
    this.aliquotaPisStReais,
    this.valorPisSt,
    this.pisStCompoeValorTotal = '0=Valor do PISST não compõe o valor total da NF-e',
  });

  static List<String> dbColumns = <String>[
    'id',
    'valor_base_calculo_pis_st',
    'aliquota_pis_st_percentual',
    'quantidade_vendida_pis_st',
    'aliquota_pis_st_reais',
    'valor_pis_st',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Valor Base Calculo Pis St',
    'Aliquota Pis St Percentual',
    'Quantidade Vendida Pis St',
    'Aliquota Pis St Reais',
    'Valor Pis St',
  ];

  NfeDetalheImpostoPisStModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    valorBaseCalculoPisSt = jsonData['valorBaseCalculoPisSt']?.toDouble();
    aliquotaPisStPercentual = jsonData['aliquotaPisStPercentual']?.toDouble();
    quantidadeVendidaPisSt = jsonData['quantidadeVendidaPisSt']?.toDouble();
    aliquotaPisStReais = jsonData['aliquotaPisStReais']?.toDouble();
    valorPisSt = jsonData['valorPisSt']?.toDouble();
    pisStCompoeValorTotal = NfeDetalheImpostoPisStDomain.getPisStCompoeValorTotal(jsonData['pisStCompoeValorTotal']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['valorBaseCalculoPisSt'] = valorBaseCalculoPisSt;
    jsonData['aliquotaPisStPercentual'] = aliquotaPisStPercentual;
    jsonData['quantidadeVendidaPisSt'] = quantidadeVendidaPisSt;
    jsonData['aliquotaPisStReais'] = aliquotaPisStReais;
    jsonData['valorPisSt'] = valorPisSt;
    jsonData['pisStCompoeValorTotal'] = NfeDetalheImpostoPisStDomain.setPisStCompoeValorTotal(pisStCompoeValorTotal);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoPisStModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoPisStModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      valorBaseCalculoPisSt: row.cells['valorBaseCalculoPisSt']?.value,
      aliquotaPisStPercentual: row.cells['aliquotaPisStPercentual']?.value,
      quantidadeVendidaPisSt: row.cells['quantidadeVendidaPisSt']?.value,
      aliquotaPisStReais: row.cells['aliquotaPisStReais']?.value,
      valorPisSt: row.cells['valorPisSt']?.value,
      pisStCompoeValorTotal: row.cells['pisStCompoeValorTotal']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'valorBaseCalculoPisSt': PlutoCell(value: valorBaseCalculoPisSt ?? 0.0),
        'aliquotaPisStPercentual': PlutoCell(value: aliquotaPisStPercentual ?? 0.0),
        'quantidadeVendidaPisSt': PlutoCell(value: quantidadeVendidaPisSt ?? 0.0),
        'aliquotaPisStReais': PlutoCell(value: aliquotaPisStReais ?? 0.0),
        'valorPisSt': PlutoCell(value: valorPisSt ?? 0.0),
        'pisStCompoeValorTotal': PlutoCell(value: pisStCompoeValorTotal ?? ''),
      },
    );
  }

  NfeDetalheImpostoPisStModel clone() {
    return NfeDetalheImpostoPisStModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      valorBaseCalculoPisSt: valorBaseCalculoPisSt,
      aliquotaPisStPercentual: aliquotaPisStPercentual,
      quantidadeVendidaPisSt: quantidadeVendidaPisSt,
      aliquotaPisStReais: aliquotaPisStReais,
      valorPisSt: valorPisSt,
      pisStCompoeValorTotal: pisStCompoeValorTotal,
    );
  }


}