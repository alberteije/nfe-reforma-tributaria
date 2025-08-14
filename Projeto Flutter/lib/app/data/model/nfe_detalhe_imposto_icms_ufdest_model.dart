import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeDetalheImpostoIcmsUfdestModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? valorBcIcmsUfDestino;
  double? valorBcFcpUfDestino;
  double? percentualFcpUfDestino;
  double? aliquotaInternaUfDestino;
  double? aliquotaInteresdatualUfEnvolvidas;
  double? percentualProvisorioPartilhaIcms;
  double? valorIcmsFcpUfDestino;
  double? valorInterestadualUfDestino;
  double? valorInterestadualUfRemetente;

  NfeDetalheImpostoIcmsUfdestModel({
    this.id,
    this.idNfeDetalhe,
    this.valorBcIcmsUfDestino,
    this.valorBcFcpUfDestino,
    this.percentualFcpUfDestino,
    this.aliquotaInternaUfDestino,
    this.aliquotaInteresdatualUfEnvolvidas,
    this.percentualProvisorioPartilhaIcms,
    this.valorIcmsFcpUfDestino,
    this.valorInterestadualUfDestino,
    this.valorInterestadualUfRemetente,
  });

  static List<String> dbColumns = <String>[
    'id',
    'valor_bc_icms_uf_destino',
    'valor_bc_fcp_uf_destino',
    'percentual_fcp_uf_destino',
    'aliquota_interna_uf_destino',
    'aliquota_interesdatual_uf_envolvidas',
    'percentual_provisorio_partilha_icms',
    'valor_icms_fcp_uf_destino',
    'valor_interestadual_uf_destino',
    'valor_interestadual_uf_remetente',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Valor Bc Icms Uf Destino',
    'Valor Bc Fcp Uf Destino',
    'Percentual Fcp Uf Destino',
    'Aliquota Interna Uf Destino',
    'Aliquota Interesdatual Uf Envolvidas',
    'Percentual Provisorio Partilha Icms',
    'Valor Icms Fcp Uf Destino',
    'Valor Interestadual Uf Destino',
    'Valor Interestadual Uf Remetente',
  ];

  NfeDetalheImpostoIcmsUfdestModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    valorBcIcmsUfDestino = jsonData['valorBcIcmsUfDestino']?.toDouble();
    valorBcFcpUfDestino = jsonData['valorBcFcpUfDestino']?.toDouble();
    percentualFcpUfDestino = jsonData['percentualFcpUfDestino']?.toDouble();
    aliquotaInternaUfDestino = jsonData['aliquotaInternaUfDestino']?.toDouble();
    aliquotaInteresdatualUfEnvolvidas = jsonData['aliquotaInteresdatualUfEnvolvidas']?.toDouble();
    percentualProvisorioPartilhaIcms = jsonData['percentualProvisorioPartilhaIcms']?.toDouble();
    valorIcmsFcpUfDestino = jsonData['valorIcmsFcpUfDestino']?.toDouble();
    valorInterestadualUfDestino = jsonData['valorInterestadualUfDestino']?.toDouble();
    valorInterestadualUfRemetente = jsonData['valorInterestadualUfRemetente']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['valorBcIcmsUfDestino'] = valorBcIcmsUfDestino;
    jsonData['valorBcFcpUfDestino'] = valorBcFcpUfDestino;
    jsonData['percentualFcpUfDestino'] = percentualFcpUfDestino;
    jsonData['aliquotaInternaUfDestino'] = aliquotaInternaUfDestino;
    jsonData['aliquotaInteresdatualUfEnvolvidas'] = aliquotaInteresdatualUfEnvolvidas;
    jsonData['percentualProvisorioPartilhaIcms'] = percentualProvisorioPartilhaIcms;
    jsonData['valorIcmsFcpUfDestino'] = valorIcmsFcpUfDestino;
    jsonData['valorInterestadualUfDestino'] = valorInterestadualUfDestino;
    jsonData['valorInterestadualUfRemetente'] = valorInterestadualUfRemetente;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoIcmsUfdestModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoIcmsUfdestModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      valorBcIcmsUfDestino: row.cells['valorBcIcmsUfDestino']?.value,
      valorBcFcpUfDestino: row.cells['valorBcFcpUfDestino']?.value,
      percentualFcpUfDestino: row.cells['percentualFcpUfDestino']?.value,
      aliquotaInternaUfDestino: row.cells['aliquotaInternaUfDestino']?.value,
      aliquotaInteresdatualUfEnvolvidas: row.cells['aliquotaInteresdatualUfEnvolvidas']?.value,
      percentualProvisorioPartilhaIcms: row.cells['percentualProvisorioPartilhaIcms']?.value,
      valorIcmsFcpUfDestino: row.cells['valorIcmsFcpUfDestino']?.value,
      valorInterestadualUfDestino: row.cells['valorInterestadualUfDestino']?.value,
      valorInterestadualUfRemetente: row.cells['valorInterestadualUfRemetente']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'valorBcIcmsUfDestino': PlutoCell(value: valorBcIcmsUfDestino ?? 0.0),
        'valorBcFcpUfDestino': PlutoCell(value: valorBcFcpUfDestino ?? 0.0),
        'percentualFcpUfDestino': PlutoCell(value: percentualFcpUfDestino ?? 0.0),
        'aliquotaInternaUfDestino': PlutoCell(value: aliquotaInternaUfDestino ?? 0.0),
        'aliquotaInteresdatualUfEnvolvidas': PlutoCell(value: aliquotaInteresdatualUfEnvolvidas ?? 0.0),
        'percentualProvisorioPartilhaIcms': PlutoCell(value: percentualProvisorioPartilhaIcms ?? 0.0),
        'valorIcmsFcpUfDestino': PlutoCell(value: valorIcmsFcpUfDestino ?? 0.0),
        'valorInterestadualUfDestino': PlutoCell(value: valorInterestadualUfDestino ?? 0.0),
        'valorInterestadualUfRemetente': PlutoCell(value: valorInterestadualUfRemetente ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoIcmsUfdestModel clone() {
    return NfeDetalheImpostoIcmsUfdestModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      valorBcIcmsUfDestino: valorBcIcmsUfDestino,
      valorBcFcpUfDestino: valorBcFcpUfDestino,
      percentualFcpUfDestino: percentualFcpUfDestino,
      aliquotaInternaUfDestino: aliquotaInternaUfDestino,
      aliquotaInteresdatualUfEnvolvidas: aliquotaInteresdatualUfEnvolvidas,
      percentualProvisorioPartilhaIcms: percentualProvisorioPartilhaIcms,
      valorIcmsFcpUfDestino: valorIcmsFcpUfDestino,
      valorInterestadualUfDestino: valorInterestadualUfDestino,
      valorInterestadualUfRemetente: valorInterestadualUfRemetente,
    );
  }

}