import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeInformacaoPagamentoModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? indicadorPagamento;
  String? meioPagamento;
  String? descricaoQuandoOutros;
  double? valor;
  DateTime? dataPagamento;
  String? cnpjTransacional;
  String? ufCnpjTransacional;
  String? tipoIntegracao;
  String? cnpjOperadoraCartao;
  String? bandeira;
  String? numeroAutorizacao;
  String? cnpjBeneficiario;
  String? idTerminalPagamento;
  double? troco;

  NfeInformacaoPagamentoModel({
    this.id,
    this.idNfeCabecalho,
    this.indicadorPagamento = '0= Pagamento à Vista',
    this.meioPagamento = '01=Dinheiro',
    this.descricaoQuandoOutros,
    this.valor,
    this.dataPagamento,
    this.cnpjTransacional,
    this.ufCnpjTransacional,
    this.tipoIntegracao = '1=Pagamento integrado',
    this.cnpjOperadoraCartao,
    this.bandeira = '01=Visa',
    this.numeroAutorizacao,
    this.cnpjBeneficiario,
    this.idTerminalPagamento,
    this.troco,
  });

  static List<String> dbColumns = <String>[
    'id',
    'indicador_pagamento',
    'meio_pagamento',
    'descricao_quando_outros',
    'valor',
    'data_pagamento',
    'cnpj_transacional',
    'uf_cnpj_transacional',
    'tipo_integracao',
    'cnpj_operadora_cartao',
    'bandeira',
    'numero_autorizacao',
    'cnpj_beneficiario',
    'id_terminal_pagamento',
    'troco',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Indicador Pagamento',
    'Meio Pagamento',
    'Descricao Quando Outros',
    'Valor',
    'Data Pagamento',
    'Cnpj Transacional',
    'Uf Cnpj Transacional',
    'Tipo Integracao',
    'Cnpj Operadora Cartao',
    'Bandeira',
    'Numero Autorizacao',
    'Cnpj Beneficiario',
    'Id Terminal Pagamento',
    'Troco',
  ];

  NfeInformacaoPagamentoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    indicadorPagamento = NfeInformacaoPagamentoDomain.getIndicadorPagamento(jsonData['indicadorPagamento']);
    meioPagamento = NfeInformacaoPagamentoDomain.getMeioPagamento(jsonData['meioPagamento']);
    descricaoQuandoOutros = jsonData['descricaoQuandoOutros'];
    valor = jsonData['valor']?.toDouble();
    dataPagamento = jsonData['dataPagamento'] != null ? DateTime.tryParse(jsonData['dataPagamento']) : null;
    cnpjTransacional = jsonData['cnpjTransacional'];
    ufCnpjTransacional = jsonData['ufCnpjTransacional'];
    tipoIntegracao = NfeInformacaoPagamentoDomain.getTipoIntegracao(jsonData['tipoIntegracao']);
    cnpjOperadoraCartao = jsonData['cnpjOperadoraCartao'];
    bandeira = NfeInformacaoPagamentoDomain.getBandeira(jsonData['bandeira']);
    numeroAutorizacao = jsonData['numeroAutorizacao'];
    cnpjBeneficiario = jsonData['cnpjBeneficiario'];
    idTerminalPagamento = jsonData['idTerminalPagamento'];
    troco = jsonData['troco']?.toDouble();
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['indicadorPagamento'] = NfeInformacaoPagamentoDomain.setIndicadorPagamento(indicadorPagamento);
    jsonData['meioPagamento'] = NfeInformacaoPagamentoDomain.setMeioPagamento(meioPagamento);
    jsonData['descricaoQuandoOutros'] = descricaoQuandoOutros;
    jsonData['valor'] = valor;
    jsonData['dataPagamento'] = dataPagamento != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataPagamento!) : null;
    jsonData['cnpjTransacional'] = cnpjTransacional;
    jsonData['ufCnpjTransacional'] = ufCnpjTransacional;
    jsonData['tipoIntegracao'] = NfeInformacaoPagamentoDomain.setTipoIntegracao(tipoIntegracao);
    jsonData['cnpjOperadoraCartao'] = Util.removeMask(cnpjOperadoraCartao);
    jsonData['bandeira'] = NfeInformacaoPagamentoDomain.setBandeira(bandeira);
    jsonData['numeroAutorizacao'] = numeroAutorizacao;
    jsonData['cnpjBeneficiario'] = cnpjBeneficiario;
    jsonData['idTerminalPagamento'] = idTerminalPagamento;
    jsonData['troco'] = troco;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeInformacaoPagamentoModel fromPlutoRow(PlutoRow row) {
    return NfeInformacaoPagamentoModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      indicadorPagamento: row.cells['indicadorPagamento']?.value,
      meioPagamento: row.cells['meioPagamento']?.value,
      descricaoQuandoOutros: row.cells['descricaoQuandoOutros']?.value,
      valor: row.cells['valor']?.value,
      dataPagamento: Util.stringToDate(row.cells['dataPagamento']?.value),
      cnpjTransacional: row.cells['cnpjTransacional']?.value,
      ufCnpjTransacional: row.cells['ufCnpjTransacional']?.value,
      tipoIntegracao: row.cells['tipoIntegracao']?.value,
      cnpjOperadoraCartao: row.cells['cnpjOperadoraCartao']?.value,
      bandeira: row.cells['bandeira']?.value,
      numeroAutorizacao: row.cells['numeroAutorizacao']?.value,
      cnpjBeneficiario: row.cells['cnpjBeneficiario']?.value,
      idTerminalPagamento: row.cells['idTerminalPagamento']?.value,
      troco: row.cells['troco']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'indicadorPagamento': PlutoCell(value: indicadorPagamento ?? ''),
        'meioPagamento': PlutoCell(value: meioPagamento ?? ''),
        'descricaoQuandoOutros': PlutoCell(value: descricaoQuandoOutros ?? ''),
        'valor': PlutoCell(value: valor ?? 0.0),
        'dataPagamento': PlutoCell(value: dataPagamento),
        'cnpjTransacional': PlutoCell(value: cnpjTransacional ?? ''),
        'ufCnpjTransacional': PlutoCell(value: ufCnpjTransacional ?? ''),
        'tipoIntegracao': PlutoCell(value: tipoIntegracao ?? ''),
        'cnpjOperadoraCartao': PlutoCell(value: cnpjOperadoraCartao ?? ''),
        'bandeira': PlutoCell(value: bandeira ?? ''),
        'numeroAutorizacao': PlutoCell(value: numeroAutorizacao ?? ''),
        'cnpjBeneficiario': PlutoCell(value: cnpjBeneficiario ?? ''),
        'idTerminalPagamento': PlutoCell(value: idTerminalPagamento ?? ''),
        'troco': PlutoCell(value: troco ?? 0.0),
      },
    );
  }

  NfeInformacaoPagamentoModel clone() {
    return NfeInformacaoPagamentoModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      indicadorPagamento: indicadorPagamento,
      meioPagamento: meioPagamento,
      descricaoQuandoOutros: descricaoQuandoOutros,
      valor: valor,
      dataPagamento: dataPagamento,
      cnpjTransacional: cnpjTransacional,
      ufCnpjTransacional: ufCnpjTransacional,
      tipoIntegracao: tipoIntegracao,
      cnpjOperadoraCartao: cnpjOperadoraCartao,
      bandeira: bandeira,
      numeroAutorizacao: numeroAutorizacao,
      cnpjBeneficiario: cnpjBeneficiario,
      idTerminalPagamento: idTerminalPagamento,
      troco: troco,
    );
  }


}