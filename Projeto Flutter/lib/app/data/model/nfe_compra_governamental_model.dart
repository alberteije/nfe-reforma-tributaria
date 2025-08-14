import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeCompraGovernamentalModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? tipoEnte;
  double? percentualReducao;
  String? tipoOperacao;

  NfeCompraGovernamentalModel({
    this.id,
    this.idNfeCabecalho,
    this.tipoEnte = '1=União',
    this.percentualReducao,
    this.tipoOperacao = '1=Fornecimento',
  });

  static List<String> dbColumns = <String>[
    'id',
    'tipo_ente',
    'percentual_reducao',
    'tipo_operacao',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Tipo Ente',
    'Percentual Reducao',
    'Tipo Operacao',
  ];

  NfeCompraGovernamentalModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    tipoEnte = NfeCompraGovernamentalDomain.getTipoEnte(jsonData['tipoEnte']);
    percentualReducao = jsonData['percentualReducao']?.toDouble();
    tipoOperacao = NfeCompraGovernamentalDomain.getTipoOperacao(jsonData['tipoOperacao']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['tipoEnte'] = NfeCompraGovernamentalDomain.setTipoEnte(tipoEnte);
    jsonData['percentualReducao'] = percentualReducao;
    jsonData['tipoOperacao'] = NfeCompraGovernamentalDomain.setTipoOperacao(tipoOperacao);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCompraGovernamentalModel fromPlutoRow(PlutoRow row) {
    return NfeCompraGovernamentalModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      tipoEnte: row.cells['tipoEnte']?.value,
      percentualReducao: row.cells['percentualReducao']?.value,
      tipoOperacao: row.cells['tipoOperacao']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'tipoEnte': PlutoCell(value: tipoEnte ?? ''),
        'percentualReducao': PlutoCell(value: percentualReducao ?? 0.0),
        'tipoOperacao': PlutoCell(value: tipoOperacao ?? ''),
      },
    );
  }

  NfeCompraGovernamentalModel clone() {
    return NfeCompraGovernamentalModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      tipoEnte: tipoEnte,
      percentualReducao: percentualReducao,
      tipoOperacao: tipoOperacao,
    );
  }


}