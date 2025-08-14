import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoCbsModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? cst;
  String? codigoClassificacaoTributaria;
  double? valorBaseCalculo;
  double? aliquota;
  double? percentualDiferimento;
  double? valorDiferimento;
  double? valorTributoDevolvido;
  double? percentualReducaoAliquota;
  double? aliquotaEfetiva;
  double? valor;

  NfeDetalheImpostoCbsModel({
    this.id,
    this.idNfeDetalhe,
    this.cst,
    this.codigoClassificacaoTributaria,
    this.valorBaseCalculo,
    this.aliquota,
    this.percentualDiferimento,
    this.valorDiferimento,
    this.valorTributoDevolvido,
    this.percentualReducaoAliquota,
    this.aliquotaEfetiva,
    this.valor,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cst',
    'codigo_classificacao_tributaria',
    'valor_base_calculo',
    'aliquota',
    'percentual_diferimento',
    'valor_diferimento',
    'valor_tributo_devolvido',
    'percentual_reducao_aliquota',
    'aliquota_efetiva',
    'valor',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cst',
    'Codigo Classificacao Tributaria',
    'Valor Base Calculo',
    'Aliquota',
    'Percentual Diferimento',
    'Valor Diferimento',
    'Valor Tributo Devolvido',
    'Percentual Reducao Aliquota',
    'Aliquota Efetiva',
    'Valor',
  ];

  NfeDetalheImpostoCbsModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    cst = jsonData['cst'];
    codigoClassificacaoTributaria = jsonData['codigoClassificacaoTributaria'];
    valorBaseCalculo = jsonData['valorBaseCalculo']?.toDouble();
    aliquota = jsonData['aliquota']?.toDouble();
    percentualDiferimento = jsonData['percentualDiferimento']?.toDouble();
    valorDiferimento = jsonData['valorDiferimento']?.toDouble();
    valorTributoDevolvido = jsonData['valorTributoDevolvido']?.toDouble();
    percentualReducaoAliquota = jsonData['percentualReducaoAliquota']?.toDouble();
    aliquotaEfetiva = jsonData['aliquotaEfetiva']?.toDouble();
    valor = jsonData['valor']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['cst'] = cst;
    jsonData['codigoClassificacaoTributaria'] = codigoClassificacaoTributaria;
    jsonData['valorBaseCalculo'] = valorBaseCalculo;
    jsonData['aliquota'] = aliquota;
    jsonData['percentualDiferimento'] = percentualDiferimento;
    jsonData['valorDiferimento'] = valorDiferimento;
    jsonData['valorTributoDevolvido'] = valorTributoDevolvido;
    jsonData['percentualReducaoAliquota'] = percentualReducaoAliquota;
    jsonData['aliquotaEfetiva'] = aliquotaEfetiva;
    jsonData['valor'] = valor;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoCbsModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoCbsModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      cst: row.cells['cst']?.value,
      codigoClassificacaoTributaria: row.cells['codigoClassificacaoTributaria']?.value,
      valorBaseCalculo: row.cells['valorBaseCalculo']?.value,
      aliquota: row.cells['aliquota']?.value,
      percentualDiferimento: row.cells['percentualDiferimento']?.value,
      valorDiferimento: row.cells['valorDiferimento']?.value,
      valorTributoDevolvido: row.cells['valorTributoDevolvido']?.value,
      percentualReducaoAliquota: row.cells['percentualReducaoAliquota']?.value,
      aliquotaEfetiva: row.cells['aliquotaEfetiva']?.value,
      valor: row.cells['valor']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'cst': PlutoCell(value: cst ?? ''),
        'codigoClassificacaoTributaria': PlutoCell(value: codigoClassificacaoTributaria ?? ''),
        'valorBaseCalculo': PlutoCell(value: valorBaseCalculo ?? 0.0),
        'aliquota': PlutoCell(value: aliquota ?? 0.0),
        'percentualDiferimento': PlutoCell(value: percentualDiferimento ?? 0.0),
        'valorDiferimento': PlutoCell(value: valorDiferimento ?? 0.0),
        'valorTributoDevolvido': PlutoCell(value: valorTributoDevolvido ?? 0.0),
        'percentualReducaoAliquota': PlutoCell(value: percentualReducaoAliquota ?? 0.0),
        'aliquotaEfetiva': PlutoCell(value: aliquotaEfetiva ?? 0.0),
        'valor': PlutoCell(value: valor ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoCbsModel clone() {
    return NfeDetalheImpostoCbsModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      cst: cst,
      codigoClassificacaoTributaria: codigoClassificacaoTributaria,
      valorBaseCalculo: valorBaseCalculo,
      aliquota: aliquota,
      percentualDiferimento: percentualDiferimento,
      valorDiferimento: valorDiferimento,
      valorTributoDevolvido: valorTributoDevolvido,
      percentualReducaoAliquota: percentualReducaoAliquota,
      aliquotaEfetiva: aliquotaEfetiva,
      valor: valor,
    );
  }


}