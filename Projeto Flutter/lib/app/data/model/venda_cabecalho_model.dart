import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class VendaCabecalhoModel extends ModelBase {
  int? id;
  int? idVendaOrcamentoCabecalho;
  int? idVendaCondicoesPagamento;
  int? idNotaFiscalTipo;
  int? idTransportadora;
  DateTime? dataVenda;
  DateTime? dataSaida;
  String? horaSaida;
  int? numeroFatura;
  String? localEntrega;
  String? localCobranca;
  double? valorSubtotal;
  double? taxaComissao;
  double? valorComissao;
  double? taxaDesconto;
  double? valorDesconto;
  double? valorTotal;
  String? tipoFrete;
  String? formaPagamento;
  double? valorFrete;
  double? valorSeguro;
  String? observacao;
  String? situacao;
  String? diaFixoParcela;

  VendaCabecalhoModel({
    this.id,
    this.idVendaOrcamentoCabecalho,
    this.idVendaCondicoesPagamento,
    this.idNotaFiscalTipo,
    this.idTransportadora,
    this.dataVenda,
    this.dataSaida,
    this.horaSaida,
    this.numeroFatura,
    this.localEntrega,
    this.localCobranca,
    this.valorSubtotal,
    this.taxaComissao,
    this.valorComissao,
    this.taxaDesconto,
    this.valorDesconto,
    this.valorTotal,
    this.tipoFrete,
    this.formaPagamento,
    this.valorFrete,
    this.valorSeguro,
    this.observacao,
    this.situacao,
    this.diaFixoParcela,
  });

  static List<String> dbColumns = <String>[
    'id',
    'id_venda_orcamento_cabecalho',
    'id_venda_condicoes_pagamento',
    'id_nota_fiscal_tipo',
    'id_transportadora',
    'data_venda',
    'data_saida',
    'hora_saida',
    'numero_fatura',
    'local_entrega',
    'local_cobranca',
    'valor_subtotal',
    'taxa_comissao',
    'valor_comissao',
    'taxa_desconto',
    'valor_desconto',
    'valor_total',
    'tipo_frete',
    'forma_pagamento',
    'valor_frete',
    'valor_seguro',
    'observacao',
    'situacao',
    'dia_fixo_parcela',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Id Venda Orcamento Cabecalho',
    'Id Venda Condicoes Pagamento',
    'Id Nota Fiscal Tipo',
    'Id Transportadora',
    'Data Venda',
    'Data Saida',
    'Hora Saida',
    'Numero Fatura',
    'Local Entrega',
    'Local Cobranca',
    'Valor Subtotal',
    'Taxa Comissao',
    'Valor Comissao',
    'Taxa Desconto',
    'Valor Desconto',
    'Valor Total',
    'Tipo Frete',
    'Forma Pagamento',
    'Valor Frete',
    'Valor Seguro',
    'Observacao',
    'Situacao',
    'Dia Fixo Parcela',
  ];

  VendaCabecalhoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idVendaOrcamentoCabecalho = jsonData['idVendaOrcamentoCabecalho'];
    idVendaCondicoesPagamento = jsonData['idVendaCondicoesPagamento'];
    idNotaFiscalTipo = jsonData['idNotaFiscalTipo'];
    idTransportadora = jsonData['idTransportadora'];
    dataVenda = jsonData['dataVenda'] != null ? DateTime.tryParse(jsonData['dataVenda']) : null;
    dataSaida = jsonData['dataSaida'] != null ? DateTime.tryParse(jsonData['dataSaida']) : null;
    horaSaida = jsonData['horaSaida'];
    numeroFatura = jsonData['numeroFatura'];
    localEntrega = jsonData['localEntrega'];
    localCobranca = jsonData['localCobranca'];
    valorSubtotal = jsonData['valorSubtotal']?.toDouble();
    taxaComissao = jsonData['taxaComissao']?.toDouble();
    valorComissao = jsonData['valorComissao']?.toDouble();
    taxaDesconto = jsonData['taxaDesconto']?.toDouble();
    valorDesconto = jsonData['valorDesconto']?.toDouble();
    valorTotal = jsonData['valorTotal']?.toDouble();
    tipoFrete = jsonData['tipoFrete'];
    formaPagamento = jsonData['formaPagamento'];
    valorFrete = jsonData['valorFrete']?.toDouble();
    valorSeguro = jsonData['valorSeguro']?.toDouble();
    observacao = jsonData['observacao'];
    situacao = jsonData['situacao'];
    diaFixoParcela = jsonData['diaFixoParcela'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idVendaOrcamentoCabecalho'] = idVendaOrcamentoCabecalho;
    jsonData['idVendaCondicoesPagamento'] = idVendaCondicoesPagamento;
    jsonData['idNotaFiscalTipo'] = idNotaFiscalTipo;
    jsonData['idTransportadora'] = idTransportadora;
    jsonData['dataVenda'] = dataVenda != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataVenda!) : null;
    jsonData['dataSaida'] = dataSaida != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataSaida!) : null;
    jsonData['horaSaida'] = horaSaida;
    jsonData['numeroFatura'] = numeroFatura;
    jsonData['localEntrega'] = localEntrega;
    jsonData['localCobranca'] = localCobranca;
    jsonData['valorSubtotal'] = valorSubtotal;
    jsonData['taxaComissao'] = taxaComissao;
    jsonData['valorComissao'] = valorComissao;
    jsonData['taxaDesconto'] = taxaDesconto;
    jsonData['valorDesconto'] = valorDesconto;
    jsonData['valorTotal'] = valorTotal;
    jsonData['tipoFrete'] = tipoFrete;
    jsonData['formaPagamento'] = formaPagamento;
    jsonData['valorFrete'] = valorFrete;
    jsonData['valorSeguro'] = valorSeguro;
    jsonData['observacao'] = observacao;
    jsonData['situacao'] = situacao;
    jsonData['diaFixoParcela'] = diaFixoParcela;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static VendaCabecalhoModel fromPlutoRow(PlutoRow row) {
    return VendaCabecalhoModel(
      id: row.cells['id']?.value,
      idVendaOrcamentoCabecalho: row.cells['idVendaOrcamentoCabecalho']?.value,
      idVendaCondicoesPagamento: row.cells['idVendaCondicoesPagamento']?.value,
      idNotaFiscalTipo: row.cells['idNotaFiscalTipo']?.value,
      idTransportadora: row.cells['idTransportadora']?.value,
      dataVenda: Util.stringToDate(row.cells['dataVenda']?.value),
      dataSaida: Util.stringToDate(row.cells['dataSaida']?.value),
      horaSaida: row.cells['horaSaida']?.value,
      numeroFatura: row.cells['numeroFatura']?.value,
      localEntrega: row.cells['localEntrega']?.value,
      localCobranca: row.cells['localCobranca']?.value,
      valorSubtotal: row.cells['valorSubtotal']?.value,
      taxaComissao: row.cells['taxaComissao']?.value,
      valorComissao: row.cells['valorComissao']?.value,
      taxaDesconto: row.cells['taxaDesconto']?.value,
      valorDesconto: row.cells['valorDesconto']?.value,
      valorTotal: row.cells['valorTotal']?.value,
      tipoFrete: row.cells['tipoFrete']?.value,
      formaPagamento: row.cells['formaPagamento']?.value,
      valorFrete: row.cells['valorFrete']?.value,
      valorSeguro: row.cells['valorSeguro']?.value,
      observacao: row.cells['observacao']?.value,
      situacao: row.cells['situacao']?.value,
      diaFixoParcela: row.cells['diaFixoParcela']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idVendaOrcamentoCabecalho': PlutoCell(value: idVendaOrcamentoCabecalho ?? 0),
        'idVendaCondicoesPagamento': PlutoCell(value: idVendaCondicoesPagamento ?? 0),
        'idNotaFiscalTipo': PlutoCell(value: idNotaFiscalTipo ?? 0),
        'idTransportadora': PlutoCell(value: idTransportadora ?? 0),
        'dataVenda': PlutoCell(value: dataVenda),
        'dataSaida': PlutoCell(value: dataSaida),
        'horaSaida': PlutoCell(value: horaSaida ?? ''),
        'numeroFatura': PlutoCell(value: numeroFatura ?? 0),
        'localEntrega': PlutoCell(value: localEntrega ?? ''),
        'localCobranca': PlutoCell(value: localCobranca ?? ''),
        'valorSubtotal': PlutoCell(value: valorSubtotal ?? 0.0),
        'taxaComissao': PlutoCell(value: taxaComissao ?? 0.0),
        'valorComissao': PlutoCell(value: valorComissao ?? 0.0),
        'taxaDesconto': PlutoCell(value: taxaDesconto ?? 0.0),
        'valorDesconto': PlutoCell(value: valorDesconto ?? 0.0),
        'valorTotal': PlutoCell(value: valorTotal ?? 0.0),
        'tipoFrete': PlutoCell(value: tipoFrete ?? ''),
        'formaPagamento': PlutoCell(value: formaPagamento ?? ''),
        'valorFrete': PlutoCell(value: valorFrete ?? 0.0),
        'valorSeguro': PlutoCell(value: valorSeguro ?? 0.0),
        'observacao': PlutoCell(value: observacao ?? ''),
        'situacao': PlutoCell(value: situacao ?? ''),
        'diaFixoParcela': PlutoCell(value: diaFixoParcela ?? ''),
      },
    );
  }

  VendaCabecalhoModel clone() {
    return VendaCabecalhoModel(
      id: id,
      idVendaOrcamentoCabecalho: idVendaOrcamentoCabecalho,
      idVendaCondicoesPagamento: idVendaCondicoesPagamento,
      idNotaFiscalTipo: idNotaFiscalTipo,
      idTransportadora: idTransportadora,
      dataVenda: dataVenda,
      dataSaida: dataSaida,
      horaSaida: horaSaida,
      numeroFatura: numeroFatura,
      localEntrega: localEntrega,
      localCobranca: localCobranca,
      valorSubtotal: valorSubtotal,
      taxaComissao: taxaComissao,
      valorComissao: valorComissao,
      taxaDesconto: taxaDesconto,
      valorDesconto: valorDesconto,
      valorTotal: valorTotal,
      tipoFrete: tipoFrete,
      formaPagamento: formaPagamento,
      valorFrete: valorFrete,
      valorSeguro: valorSeguro,
      observacao: observacao,
      situacao: situacao,
      diaFixoParcela: diaFixoParcela,
    );
  }

}