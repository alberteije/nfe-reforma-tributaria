import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeCupomFiscalReferenciadoModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? modeloDocumentoFiscal;
  int? numeroOrdemEcf;
  int? coo;
  DateTime? dataEmissaoCupom;
  int? numeroCaixa;
  String? numeroSerieEcf;

  NfeCupomFiscalReferenciadoModel({
    this.id,
    this.idNfeCabecalho,
    this.modeloDocumentoFiscal = '2B=Cupom Fiscal emitido por máquina registradora (não ECF)',
    this.numeroOrdemEcf,
    this.coo,
    this.dataEmissaoCupom,
    this.numeroCaixa,
    this.numeroSerieEcf,
  });

  static List<String> dbColumns = <String>[
    'id',
    'modelo_documento_fiscal',
    'numero_ordem_ecf',
    'coo',
    'data_emissao_cupom',
    'numero_caixa',
    'numero_serie_ecf',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Modelo Documento Fiscal',
    'Numero Ordem Ecf',
    'Coo',
    'Data Emissao Cupom',
    'Numero Caixa',
    'Numero Serie Ecf',
  ];

  NfeCupomFiscalReferenciadoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    modeloDocumentoFiscal = NfeCupomFiscalReferenciadoDomain.getModeloDocumentoFiscal(jsonData['modeloDocumentoFiscal']);
    numeroOrdemEcf = jsonData['numeroOrdemEcf'];
    coo = jsonData['coo'];
    dataEmissaoCupom = jsonData['dataEmissaoCupom'] != null ? DateTime.tryParse(jsonData['dataEmissaoCupom']) : null;
    numeroCaixa = jsonData['numeroCaixa'];
    numeroSerieEcf = jsonData['numeroSerieEcf'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['modeloDocumentoFiscal'] = NfeCupomFiscalReferenciadoDomain.setModeloDocumentoFiscal(modeloDocumentoFiscal);
    jsonData['numeroOrdemEcf'] = numeroOrdemEcf;
    jsonData['coo'] = coo;
    jsonData['dataEmissaoCupom'] = dataEmissaoCupom != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataEmissaoCupom!) : null;
    jsonData['numeroCaixa'] = numeroCaixa;
    jsonData['numeroSerieEcf'] = numeroSerieEcf;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCupomFiscalReferenciadoModel fromPlutoRow(PlutoRow row) {
    return NfeCupomFiscalReferenciadoModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      modeloDocumentoFiscal: row.cells['modeloDocumentoFiscal']?.value,
      numeroOrdemEcf: row.cells['numeroOrdemEcf']?.value,
      coo: row.cells['coo']?.value,
      dataEmissaoCupom: Util.stringToDate(row.cells['dataEmissaoCupom']?.value),
      numeroCaixa: row.cells['numeroCaixa']?.value,
      numeroSerieEcf: row.cells['numeroSerieEcf']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'modeloDocumentoFiscal': PlutoCell(value: modeloDocumentoFiscal ?? ''),
        'numeroOrdemEcf': PlutoCell(value: numeroOrdemEcf ?? 0),
        'coo': PlutoCell(value: coo ?? 0),
        'dataEmissaoCupom': PlutoCell(value: dataEmissaoCupom),
        'numeroCaixa': PlutoCell(value: numeroCaixa ?? 0),
        'numeroSerieEcf': PlutoCell(value: numeroSerieEcf ?? ''),
      },
    );
  }

  NfeCupomFiscalReferenciadoModel clone() {
    return NfeCupomFiscalReferenciadoModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      modeloDocumentoFiscal: modeloDocumentoFiscal,
      numeroOrdemEcf: numeroOrdemEcf,
      coo: coo,
      dataEmissaoCupom: dataEmissaoCupom,
      numeroCaixa: numeroCaixa,
      numeroSerieEcf: numeroSerieEcf,
    );
  }

}