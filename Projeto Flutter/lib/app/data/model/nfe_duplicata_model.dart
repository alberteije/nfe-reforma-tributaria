import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class NfeDuplicataModel extends ModelBase {
  int? id;
  int? idNfeFatura;
  String? numero;
  DateTime? dataVencimento;
  double? valor;

  NfeDuplicataModel({
    this.id,
    this.idNfeFatura,
    this.numero,
    this.dataVencimento,
    this.valor,
  });

  static List<String> dbColumns = <String>[
    'id',
    'numero',
    'data_vencimento',
    'valor',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero',
    'Data Vencimento',
    'Valor',
  ];

  NfeDuplicataModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeFatura = jsonData['idNfeFatura'];
    numero = jsonData['numero'];
    dataVencimento = jsonData['dataVencimento'] != null ? DateTime.tryParse(jsonData['dataVencimento']) : null;
    valor = jsonData['valor']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeFatura'] = idNfeFatura != 0 ? idNfeFatura : null;
    jsonData['numero'] = numero;
    jsonData['dataVencimento'] = dataVencimento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVencimento!) : null;
    jsonData['valor'] = valor;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDuplicataModel fromPlutoRow(PlutoRow row) {
    return NfeDuplicataModel(
      id: row.cells['id']?.value,
      idNfeFatura: row.cells['idNfeFatura']?.value,
      numero: row.cells['numero']?.value,
      dataVencimento: Util.stringToDate(row.cells['dataVencimento']?.value),
      valor: row.cells['valor']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeFatura': PlutoCell(value: idNfeFatura ?? 0),
        'numero': PlutoCell(value: numero ?? ''),
        'dataVencimento': PlutoCell(value: dataVencimento),
        'valor': PlutoCell(value: valor ?? 0.0),
      },
    );
  }

  NfeDuplicataModel clone() {
    return NfeDuplicataModel(
      id: id,
      idNfeFatura: idNfeFatura,
      numero: numero,
      dataVencimento: dataVencimento,
      valor: valor,
    );
  }


}