import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetEspecificoMedicamentoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? codigoAnvisa;
  String? motivoIsencao;
  double? precoMaximoConsumidor;

  NfeDetEspecificoMedicamentoModel({
    this.id,
    this.idNfeDetalhe,
    this.codigoAnvisa,
    this.motivoIsencao,
    this.precoMaximoConsumidor,
  });

  static List<String> dbColumns = <String>[
    'id',
    'codigo_anvisa',
    'motivo_isencao',
    'preco_maximo_consumidor',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Codigo Anvisa',
    'Motivo Isencao',
    'Preco Maximo Consumidor',
  ];

  NfeDetEspecificoMedicamentoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    codigoAnvisa = jsonData['codigoAnvisa'];
    motivoIsencao = jsonData['motivoIsencao'];
    precoMaximoConsumidor = jsonData['precoMaximoConsumidor']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['codigoAnvisa'] = codigoAnvisa;
    jsonData['motivoIsencao'] = motivoIsencao;
    jsonData['precoMaximoConsumidor'] = precoMaximoConsumidor;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetEspecificoMedicamentoModel fromPlutoRow(PlutoRow row) {
    return NfeDetEspecificoMedicamentoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      codigoAnvisa: row.cells['codigoAnvisa']?.value,
      motivoIsencao: row.cells['motivoIsencao']?.value,
      precoMaximoConsumidor: row.cells['precoMaximoConsumidor']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'codigoAnvisa': PlutoCell(value: codigoAnvisa ?? ''),
        'motivoIsencao': PlutoCell(value: motivoIsencao ?? ''),
        'precoMaximoConsumidor': PlutoCell(value: precoMaximoConsumidor ?? 0.0),
      },
    );
  }

  NfeDetEspecificoMedicamentoModel clone() {
    return NfeDetEspecificoMedicamentoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      codigoAnvisa: codigoAnvisa,
      motivoIsencao: motivoIsencao,
      precoMaximoConsumidor: precoMaximoConsumidor,
    );
  }


}