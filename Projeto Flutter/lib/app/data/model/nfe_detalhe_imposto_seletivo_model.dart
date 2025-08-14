import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoSeletivoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? cst;
  String? codigoClassificacaoTributaria;
  double? valorBaseCalculo;
  double? aliquota;
  double? aliquotaEspecifica;
  String? unidadeTributavel;
  double? quantidadeTributavel;
  double? valor;

  NfeDetalheImpostoSeletivoModel({
    this.id,
    this.idNfeDetalhe,
    this.cst,
    this.codigoClassificacaoTributaria,
    this.valorBaseCalculo,
    this.aliquota,
    this.aliquotaEspecifica,
    this.unidadeTributavel,
    this.quantidadeTributavel,
    this.valor,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cst',
    'codigo_classificacao_tributaria',
    'valor_base_calculo',
    'aliquota',
    'aliquota_especifica',
    'unidade_tributavel',
    'quantidade_tributavel',
    'valor',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cst',
    'Codigo Classificacao Tributaria',
    'Valor Base Calculo',
    'Aliquota',
    'Aliquota Especifica',
    'Unidade Tributavel',
    'Quantidade Tributavel',
    'Valor',
  ];

  NfeDetalheImpostoSeletivoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    cst = jsonData['cst'];
    codigoClassificacaoTributaria = jsonData['codigoClassificacaoTributaria'];
    valorBaseCalculo = jsonData['valorBaseCalculo']?.toDouble();
    aliquota = jsonData['aliquota']?.toDouble();
    aliquotaEspecifica = jsonData['aliquotaEspecifica']?.toDouble();
    unidadeTributavel = jsonData['unidadeTributavel'];
    quantidadeTributavel = jsonData['quantidadeTributavel']?.toDouble();
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
    jsonData['aliquotaEspecifica'] = aliquotaEspecifica;
    jsonData['unidadeTributavel'] = unidadeTributavel;
    jsonData['quantidadeTributavel'] = quantidadeTributavel;
    jsonData['valor'] = valor;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoSeletivoModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoSeletivoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      cst: row.cells['cst']?.value,
      codigoClassificacaoTributaria: row.cells['codigoClassificacaoTributaria']?.value,
      valorBaseCalculo: row.cells['valorBaseCalculo']?.value,
      aliquota: row.cells['aliquota']?.value,
      aliquotaEspecifica: row.cells['aliquotaEspecifica']?.value,
      unidadeTributavel: row.cells['unidadeTributavel']?.value,
      quantidadeTributavel: row.cells['quantidadeTributavel']?.value,
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
        'aliquotaEspecifica': PlutoCell(value: aliquotaEspecifica ?? 0.0),
        'unidadeTributavel': PlutoCell(value: unidadeTributavel ?? ''),
        'quantidadeTributavel': PlutoCell(value: quantidadeTributavel ?? 0.0),
        'valor': PlutoCell(value: valor ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoSeletivoModel clone() {
    return NfeDetalheImpostoSeletivoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      cst: cst,
      codigoClassificacaoTributaria: codigoClassificacaoTributaria,
      valorBaseCalculo: valorBaseCalculo,
      aliquota: aliquota,
      aliquotaEspecifica: aliquotaEspecifica,
      unidadeTributavel: unidadeTributavel,
      quantidadeTributavel: quantidadeTributavel,
      valor: valor,
    );
  }


}