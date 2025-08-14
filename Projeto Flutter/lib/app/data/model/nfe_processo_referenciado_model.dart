import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeProcessoReferenciadoModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? identificador;
  String? origem;
  String? tipoAtoConcessorio;

  NfeProcessoReferenciadoModel({
    this.id,
    this.idNfeCabecalho,
    this.identificador,
    this.origem = '0=SEFAZ',
    this.tipoAtoConcessorio = '08=Termo de Acordo',
  });

  static List<String> dbColumns = <String>[
    'id',
    'identificador',
    'origem',
    'tipo_ato_concessorio',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Identificador',
    'Origem',
    'Tipo Ato Concessorio',
  ];

  NfeProcessoReferenciadoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    identificador = jsonData['identificador'];
    origem = NfeProcessoReferenciadoDomain.getOrigem(jsonData['origem']);
    tipoAtoConcessorio = NfeProcessoReferenciadoDomain.getTipoAtoConcessorio(jsonData['tipoAtoConcessorio']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['identificador'] = identificador;
    jsonData['origem'] = NfeProcessoReferenciadoDomain.setOrigem(origem);
    jsonData['tipoAtoConcessorio'] = NfeProcessoReferenciadoDomain.setTipoAtoConcessorio(tipoAtoConcessorio);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeProcessoReferenciadoModel fromPlutoRow(PlutoRow row) {
    return NfeProcessoReferenciadoModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      identificador: row.cells['identificador']?.value,
      origem: row.cells['origem']?.value,
      tipoAtoConcessorio: row.cells['tipoAtoConcessorio']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'identificador': PlutoCell(value: identificador ?? ''),
        'origem': PlutoCell(value: origem ?? ''),
        'tipoAtoConcessorio': PlutoCell(value: tipoAtoConcessorio ?? ''),
      },
    );
  }

  NfeProcessoReferenciadoModel clone() {
    return NfeProcessoReferenciadoModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      identificador: identificador,
      origem: origem,
      tipoAtoConcessorio: tipoAtoConcessorio,
    );
  }


}