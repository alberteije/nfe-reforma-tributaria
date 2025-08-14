import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheIbsZfmModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? tipoCredito;
  double? valorCredito;

  NfeDetalheIbsZfmModel({
    this.id,
    this.idNfeDetalhe,
    this.tipoCredito = '0 - Sem Crédito Presumido',
    this.valorCredito,
  });

  static List<String> dbColumns = <String>[
    'id',
    'tipo_credito',
    'valor_credito',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Tipo Credito',
    'Valor Credito',
  ];

  NfeDetalheIbsZfmModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    tipoCredito = NfeDetalheIbsZfmDomain.getTipoCredito(jsonData['tipoCredito']);
    valorCredito = jsonData['valorCredito']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['tipoCredito'] = NfeDetalheIbsZfmDomain.setTipoCredito(tipoCredito);
    jsonData['valorCredito'] = valorCredito;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheIbsZfmModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheIbsZfmModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      tipoCredito: row.cells['tipoCredito']?.value,
      valorCredito: row.cells['valorCredito']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'tipoCredito': PlutoCell(value: tipoCredito ?? ''),
        'valorCredito': PlutoCell(value: valorCredito ?? 0.0),
      },
    );
  }

  NfeDetalheIbsZfmModel clone() {
    return NfeDetalheIbsZfmModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      tipoCredito: tipoCredito,
      valorCredito: valorCredito,
    );
  }


}