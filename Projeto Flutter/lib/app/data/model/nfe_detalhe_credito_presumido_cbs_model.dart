import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheCreditoPresumidoCbsModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? codigoClassificacao;
  double? percentual;
  double? valor;
  double? valorSuspensivo;

  NfeDetalheCreditoPresumidoCbsModel({
    this.id,
    this.idNfeDetalhe,
    this.codigoClassificacao = '1-Aquisição de Produtor Rural não contribuinte',
    this.percentual,
    this.valor,
    this.valorSuspensivo,
  });

  static List<String> dbColumns = <String>[
    'id',
    'codigo_classificacao',
    'percentual',
    'valor',
    'valor_suspensivo',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Codigo Classificacao',
    'Percentual',
    'Valor',
    'Valor Suspensivo',
  ];

  NfeDetalheCreditoPresumidoCbsModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    codigoClassificacao = NfeDetalheCreditoPresumidoCbsDomain.getCodigoClassificacao(jsonData['codigoClassificacao']);
    percentual = jsonData['percentual']?.toDouble();
    valor = jsonData['valor']?.toDouble();
    valorSuspensivo = jsonData['valorSuspensivo']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['codigoClassificacao'] = NfeDetalheCreditoPresumidoCbsDomain.setCodigoClassificacao(codigoClassificacao);
    jsonData['percentual'] = percentual;
    jsonData['valor'] = valor;
    jsonData['valorSuspensivo'] = valorSuspensivo;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheCreditoPresumidoCbsModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheCreditoPresumidoCbsModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      codigoClassificacao: row.cells['codigoClassificacao']?.value,
      percentual: row.cells['percentual']?.value,
      valor: row.cells['valor']?.value,
      valorSuspensivo: row.cells['valorSuspensivo']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'codigoClassificacao': PlutoCell(value: codigoClassificacao ?? ''),
        'percentual': PlutoCell(value: percentual ?? 0.0),
        'valor': PlutoCell(value: valor ?? 0.0),
        'valorSuspensivo': PlutoCell(value: valorSuspensivo ?? 0.0),
      },
    );
  }

  NfeDetalheCreditoPresumidoCbsModel clone() {
    return NfeDetalheCreditoPresumidoCbsModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      codigoClassificacao: codigoClassificacao,
      percentual: percentual,
      valor: valor,
      valorSuspensivo: valorSuspensivo,
    );
  }


}