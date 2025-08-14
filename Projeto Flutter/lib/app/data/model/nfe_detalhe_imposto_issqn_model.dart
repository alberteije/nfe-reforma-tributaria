import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheImpostoIssqnModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  double? baseCalculoIssqn;
  double? aliquotaIssqn;
  double? valorIssqn;
  int? municipioIssqn;
  int? itemListaServicos;
  double? valorDeducao;
  double? valorOutrasRetencoes;
  double? valorDescontoIncondicionado;
  double? valorDescontoCondicionado;
  double? valorRetencaoIss;
  String? indicadorExigibilidadeIss;
  String? codigoServico;
  int? municipioIncidencia;
  int? paisSevicoPrestado;
  String? numeroProcesso;
  String? indicadorIncentivoFiscal;

  NfeDetalheImpostoIssqnModel({
    this.id,
    this.idNfeDetalhe,
    this.baseCalculoIssqn,
    this.aliquotaIssqn,
    this.valorIssqn,
    this.municipioIssqn,
    this.itemListaServicos,
    this.valorDeducao,
    this.valorOutrasRetencoes,
    this.valorDescontoIncondicionado,
    this.valorDescontoCondicionado,
    this.valorRetencaoIss,
    this.indicadorExigibilidadeIss = '1=Exigível',
    this.codigoServico,
    this.municipioIncidencia,
    this.paisSevicoPrestado,
    this.numeroProcesso,
    this.indicadorIncentivoFiscal = '1=Sim',
  });

  static List<String> dbColumns = <String>[
    'id',
    'base_calculo_issqn',
    'aliquota_issqn',
    'valor_issqn',
    'municipio_issqn',
    'item_lista_servicos',
    'valor_deducao',
    'valor_outras_retencoes',
    'valor_desconto_incondicionado',
    'valor_desconto_condicionado',
    'valor_retencao_iss',
    'indicador_exigibilidade_iss',
    'codigo_servico',
    'municipio_incidencia',
    'pais_sevico_prestado',
    'numero_processo',
    'indicador_incentivo_fiscal',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Base Calculo Issqn',
    'Aliquota Issqn',
    'Valor Issqn',
    'Municipio Issqn',
    'Item Lista Servicos',
    'Valor Deducao',
    'Valor Outras Retencoes',
    'Valor Desconto Incondicionado',
    'Valor Desconto Condicionado',
    'Valor Retencao Iss',
    'Indicador Exigibilidade Iss',
    'Codigo Servico',
    'Municipio Incidencia',
    'Pais Sevico Prestado',
    'Numero Processo',
    'Indicador Incentivo Fiscal',
  ];

  NfeDetalheImpostoIssqnModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    baseCalculoIssqn = jsonData['baseCalculoIssqn']?.toDouble();
    aliquotaIssqn = jsonData['aliquotaIssqn']?.toDouble();
    valorIssqn = jsonData['valorIssqn']?.toDouble();
    municipioIssqn = jsonData['municipioIssqn'];
    itemListaServicos = jsonData['itemListaServicos'];
    valorDeducao = jsonData['valorDeducao']?.toDouble();
    valorOutrasRetencoes = jsonData['valorOutrasRetencoes']?.toDouble();
    valorDescontoIncondicionado = jsonData['valorDescontoIncondicionado']?.toDouble();
    valorDescontoCondicionado = jsonData['valorDescontoCondicionado']?.toDouble();
    valorRetencaoIss = jsonData['valorRetencaoIss']?.toDouble();
    indicadorExigibilidadeIss = NfeDetalheImpostoIssqnDomain.getIndicadorExigibilidadeIss(jsonData['indicadorExigibilidadeIss']);
    codigoServico = jsonData['codigoServico'];
    municipioIncidencia = jsonData['municipioIncidencia'];
    paisSevicoPrestado = jsonData['paisSevicoPrestado'];
    numeroProcesso = jsonData['numeroProcesso'];
    indicadorIncentivoFiscal = NfeDetalheImpostoIssqnDomain.getIndicadorIncentivoFiscal(jsonData['indicadorIncentivoFiscal']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['baseCalculoIssqn'] = baseCalculoIssqn;
    jsonData['aliquotaIssqn'] = aliquotaIssqn;
    jsonData['valorIssqn'] = valorIssqn;
    jsonData['municipioIssqn'] = municipioIssqn;
    jsonData['itemListaServicos'] = itemListaServicos;
    jsonData['valorDeducao'] = valorDeducao;
    jsonData['valorOutrasRetencoes'] = valorOutrasRetencoes;
    jsonData['valorDescontoIncondicionado'] = valorDescontoIncondicionado;
    jsonData['valorDescontoCondicionado'] = valorDescontoCondicionado;
    jsonData['valorRetencaoIss'] = valorRetencaoIss;
    jsonData['indicadorExigibilidadeIss'] = NfeDetalheImpostoIssqnDomain.setIndicadorExigibilidadeIss(indicadorExigibilidadeIss);
    jsonData['codigoServico'] = codigoServico;
    jsonData['municipioIncidencia'] = municipioIncidencia;
    jsonData['paisSevicoPrestado'] = paisSevicoPrestado;
    jsonData['numeroProcesso'] = numeroProcesso;
    jsonData['indicadorIncentivoFiscal'] = NfeDetalheImpostoIssqnDomain.setIndicadorIncentivoFiscal(indicadorIncentivoFiscal);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoIssqnModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoIssqnModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      baseCalculoIssqn: row.cells['baseCalculoIssqn']?.value,
      aliquotaIssqn: row.cells['aliquotaIssqn']?.value,
      valorIssqn: row.cells['valorIssqn']?.value,
      municipioIssqn: row.cells['municipioIssqn']?.value,
      itemListaServicos: row.cells['itemListaServicos']?.value,
      valorDeducao: row.cells['valorDeducao']?.value,
      valorOutrasRetencoes: row.cells['valorOutrasRetencoes']?.value,
      valorDescontoIncondicionado: row.cells['valorDescontoIncondicionado']?.value,
      valorDescontoCondicionado: row.cells['valorDescontoCondicionado']?.value,
      valorRetencaoIss: row.cells['valorRetencaoIss']?.value,
      indicadorExigibilidadeIss: row.cells['indicadorExigibilidadeIss']?.value,
      codigoServico: row.cells['codigoServico']?.value,
      municipioIncidencia: row.cells['municipioIncidencia']?.value,
      paisSevicoPrestado: row.cells['paisSevicoPrestado']?.value,
      numeroProcesso: row.cells['numeroProcesso']?.value,
      indicadorIncentivoFiscal: row.cells['indicadorIncentivoFiscal']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'baseCalculoIssqn': PlutoCell(value: baseCalculoIssqn ?? 0.0),
        'aliquotaIssqn': PlutoCell(value: aliquotaIssqn ?? 0.0),
        'valorIssqn': PlutoCell(value: valorIssqn ?? 0.0),
        'municipioIssqn': PlutoCell(value: municipioIssqn ?? 0),
        'itemListaServicos': PlutoCell(value: itemListaServicos ?? 0),
        'valorDeducao': PlutoCell(value: valorDeducao ?? 0.0),
        'valorOutrasRetencoes': PlutoCell(value: valorOutrasRetencoes ?? 0.0),
        'valorDescontoIncondicionado': PlutoCell(value: valorDescontoIncondicionado ?? 0.0),
        'valorDescontoCondicionado': PlutoCell(value: valorDescontoCondicionado ?? 0.0),
        'valorRetencaoIss': PlutoCell(value: valorRetencaoIss ?? 0.0),
        'indicadorExigibilidadeIss': PlutoCell(value: indicadorExigibilidadeIss ?? ''),
        'codigoServico': PlutoCell(value: codigoServico ?? ''),
        'municipioIncidencia': PlutoCell(value: municipioIncidencia ?? 0),
        'paisSevicoPrestado': PlutoCell(value: paisSevicoPrestado ?? 0),
        'numeroProcesso': PlutoCell(value: numeroProcesso ?? ''),
        'indicadorIncentivoFiscal': PlutoCell(value: indicadorIncentivoFiscal ?? ''),
      },
    );
  }

  NfeDetalheImpostoIssqnModel clone() {
    return NfeDetalheImpostoIssqnModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      baseCalculoIssqn: baseCalculoIssqn,
      aliquotaIssqn: aliquotaIssqn,
      valorIssqn: valorIssqn,
      municipioIssqn: municipioIssqn,
      itemListaServicos: itemListaServicos,
      valorDeducao: valorDeducao,
      valorOutrasRetencoes: valorOutrasRetencoes,
      valorDescontoIncondicionado: valorDescontoIncondicionado,
      valorDescontoCondicionado: valorDescontoCondicionado,
      valorRetencaoIss: valorRetencaoIss,
      indicadorExigibilidadeIss: indicadorExigibilidadeIss,
      codigoServico: codigoServico,
      municipioIncidencia: municipioIncidencia,
      paisSevicoPrestado: paisSevicoPrestado,
      numeroProcesso: numeroProcesso,
      indicadorIncentivoFiscal: indicadorIncentivoFiscal,
    );
  }


}