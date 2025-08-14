import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';

class NfeDetalheImpostoIpiModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? cnpjProdutor;
  String? codigoSeloIpi;
  int? quantidadeSeloIpi;
  String? enquadramentoLegalIpi;
  String? cstIpi;
  double? valorBaseCalculoIpi;
  double? quantidadeUnidadeTributavel;
  double? valorUnidadeTributavel;
  double? aliquotaIpi;
  double? valorIpi;

  NfeDetalheImpostoIpiModel({
    this.id,
    this.idNfeDetalhe,
    this.cnpjProdutor,
    this.codigoSeloIpi,
    this.quantidadeSeloIpi,
    this.enquadramentoLegalIpi,
    this.cstIpi,
    this.valorBaseCalculoIpi,
    this.quantidadeUnidadeTributavel,
    this.valorUnidadeTributavel,
    this.aliquotaIpi,
    this.valorIpi,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cnpj_produtor',
    'codigo_selo_ipi',
    'quantidade_selo_ipi',
    'enquadramento_legal_ipi',
    'cst_ipi',
    'valor_base_calculo_ipi',
    'quantidade_unidade_tributavel',
    'valor_unidade_tributavel',
    'aliquota_ipi',
    'valor_ipi',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cnpj Produtor',
    'Codigo Selo Ipi',
    'Quantidade Selo Ipi',
    'Enquadramento Legal Ipi',
    'Cst Ipi',
    'Valor Base Calculo Ipi',
    'Quantidade Unidade Tributavel',
    'Valor Unidade Tributavel',
    'Aliquota Ipi',
    'Valor Ipi',
  ];

  NfeDetalheImpostoIpiModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    cnpjProdutor = jsonData['cnpjProdutor'];
    codigoSeloIpi = jsonData['codigoSeloIpi'];
    quantidadeSeloIpi = jsonData['quantidadeSeloIpi'];
    enquadramentoLegalIpi = jsonData['enquadramentoLegalIpi'];
    cstIpi = jsonData['cstIpi'];
    valorBaseCalculoIpi = jsonData['valorBaseCalculoIpi']?.toDouble();
    quantidadeUnidadeTributavel = jsonData['quantidadeUnidadeTributavel']?.toDouble();
    valorUnidadeTributavel = jsonData['valorUnidadeTributavel']?.toDouble();
    aliquotaIpi = jsonData['aliquotaIpi']?.toDouble();
    valorIpi = jsonData['valorIpi']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['cnpjProdutor'] = Util.removeMask(cnpjProdutor);
    jsonData['codigoSeloIpi'] = codigoSeloIpi;
    jsonData['quantidadeSeloIpi'] = quantidadeSeloIpi;
    jsonData['enquadramentoLegalIpi'] = enquadramentoLegalIpi;
    jsonData['cstIpi'] = cstIpi;
    jsonData['valorBaseCalculoIpi'] = valorBaseCalculoIpi;
    jsonData['quantidadeUnidadeTributavel'] = quantidadeUnidadeTributavel;
    jsonData['valorUnidadeTributavel'] = valorUnidadeTributavel;
    jsonData['aliquotaIpi'] = aliquotaIpi;
    jsonData['valorIpi'] = valorIpi;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoIpiModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoIpiModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      cnpjProdutor: row.cells['cnpjProdutor']?.value,
      codigoSeloIpi: row.cells['codigoSeloIpi']?.value,
      quantidadeSeloIpi: row.cells['quantidadeSeloIpi']?.value,
      enquadramentoLegalIpi: row.cells['enquadramentoLegalIpi']?.value,
      cstIpi: row.cells['cstIpi']?.value,
      valorBaseCalculoIpi: row.cells['valorBaseCalculoIpi']?.value,
      quantidadeUnidadeTributavel: row.cells['quantidadeUnidadeTributavel']?.value,
      valorUnidadeTributavel: row.cells['valorUnidadeTributavel']?.value,
      aliquotaIpi: row.cells['aliquotaIpi']?.value,
      valorIpi: row.cells['valorIpi']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'cnpjProdutor': PlutoCell(value: cnpjProdutor ?? ''),
        'codigoSeloIpi': PlutoCell(value: codigoSeloIpi ?? ''),
        'quantidadeSeloIpi': PlutoCell(value: quantidadeSeloIpi ?? 0),
        'enquadramentoLegalIpi': PlutoCell(value: enquadramentoLegalIpi ?? ''),
        'cstIpi': PlutoCell(value: cstIpi ?? ''),
        'valorBaseCalculoIpi': PlutoCell(value: valorBaseCalculoIpi ?? 0.0),
        'quantidadeUnidadeTributavel': PlutoCell(value: quantidadeUnidadeTributavel ?? 0.0),
        'valorUnidadeTributavel': PlutoCell(value: valorUnidadeTributavel ?? 0.0),
        'aliquotaIpi': PlutoCell(value: aliquotaIpi ?? 0.0),
        'valorIpi': PlutoCell(value: valorIpi ?? 0.0),
      },
    );
  }

  NfeDetalheImpostoIpiModel clone() {
    return NfeDetalheImpostoIpiModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      cnpjProdutor: cnpjProdutor,
      codigoSeloIpi: codigoSeloIpi,
      quantidadeSeloIpi: quantidadeSeloIpi,
      enquadramentoLegalIpi: enquadramentoLegalIpi,
      cstIpi: cstIpi,
      valorBaseCalculoIpi: valorBaseCalculoIpi,
      quantidadeUnidadeTributavel: quantidadeUnidadeTributavel,
      valorUnidadeTributavel: valorUnidadeTributavel,
      aliquotaIpi: aliquotaIpi,
      valorIpi: valorIpi,
    );
  }

}