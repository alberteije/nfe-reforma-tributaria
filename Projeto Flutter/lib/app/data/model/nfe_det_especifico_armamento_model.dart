import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetEspecificoArmamentoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? tipoArma;
  String? numeroSerieArma;
  String? numeroSerieCano;
  String? descricao;

  NfeDetEspecificoArmamentoModel({
    this.id,
    this.idNfeDetalhe,
    this.tipoArma = '0=Uso permitido',
    this.numeroSerieArma,
    this.numeroSerieCano,
    this.descricao,
  });

  static List<String> dbColumns = <String>[
    'id',
    'tipo_arma',
    'numero_serie_arma',
    'numero_serie_cano',
    'descricao',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Tipo Arma',
    'Numero Serie Arma',
    'Numero Serie Cano',
    'Descricao',
  ];

  NfeDetEspecificoArmamentoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    tipoArma = NfeDetEspecificoArmamentoDomain.getTipoArma(jsonData['tipoArma']);
    numeroSerieArma = jsonData['numeroSerieArma'];
    numeroSerieCano = jsonData['numeroSerieCano'];
    descricao = jsonData['descricao'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['tipoArma'] = NfeDetEspecificoArmamentoDomain.setTipoArma(tipoArma);
    jsonData['numeroSerieArma'] = numeroSerieArma;
    jsonData['numeroSerieCano'] = numeroSerieCano;
    jsonData['descricao'] = descricao;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetEspecificoArmamentoModel fromPlutoRow(PlutoRow row) {
    return NfeDetEspecificoArmamentoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      tipoArma: row.cells['tipoArma']?.value,
      numeroSerieArma: row.cells['numeroSerieArma']?.value,
      numeroSerieCano: row.cells['numeroSerieCano']?.value,
      descricao: row.cells['descricao']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'tipoArma': PlutoCell(value: tipoArma ?? ''),
        'numeroSerieArma': PlutoCell(value: numeroSerieArma ?? ''),
        'numeroSerieCano': PlutoCell(value: numeroSerieCano ?? ''),
        'descricao': PlutoCell(value: descricao ?? ''),
      },
    );
  }

  NfeDetEspecificoArmamentoModel clone() {
    return NfeDetEspecificoArmamentoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      tipoArma: tipoArma,
      numeroSerieArma: numeroSerieArma,
      numeroSerieCano: numeroSerieCano,
      descricao: descricao,
    );
  }

}