import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheImpostoIcmsModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? origemMercadoria;
  String? cstIcms;
  String? csosn;
  String? modalidadeBcIcms;
  double? percentualReducaoBcIcms;
  double? valorBcIcms;
  double? aliquotaIcms;
  double? valorIcmsOperacao;
  double? percentualDiferimento;
  double? valorIcmsDiferido;
  double? valorIcms;
  double? baseCalculoFcp;
  double? percentualFcp;
  double? valorFcp;
  double? taxaFcpDiferido;
  double? valorFcpDiferido;
  double? valorFcpEfetivo;
  String? modalidadeBcIcmsSt;
  double? percentualMvaIcmsSt;
  double? percentualReducaoBcIcmsSt;
  double? valorBaseCalculoIcmsSt;
  double? aliquotaIcmsSt;
  double? valorIcmsSt;
  double? baseCalculoFcpSt;
  double? percentualFcpSt;
  double? valorFcpSt;
  String? ufSt;
  double? percentualBcOperacaoPropria;
  double? valorBcIcmsStRetido;
  double? aliquotaSuportadaConsumidor;
  double? valorIcmsSubstituto;
  double? valorIcmsStRetido;
  double? baseCalculoFcpStRetido;
  double? percentualFcpStRetido;
  double? valorFcpStRetido;
  String? motivoDesoneracaoIcms;
  double? valorIcmsDesonerado;
  String? desoneradoDeduz;
  double? aliquotaCreditoIcmsSn;
  double? valorCreditoIcmsSn;
  double? valorBcIcmsStDestino;
  double? valorIcmsStDestino;
  double? valorIcmsStDesonerado;
  String? motivoDesoneracaoIcmsSt;
  double? percentualReducaoBcEfetivo;
  double? valorBcEfetivo;
  double? aliquotaIcmsEfetivo;
  double? valorIcmsEfetivo;
  double? quantidadeTributada;
  double? aliquotaAdRem;
  double? valorIcmsMono;
  double? quantidadeSujeitaRetencao;
  double? aliquotaAdRemRetencao;
  double? valorIcmsMonoRetencao;
  double? valorIcmsMonoOperacao;
  double? percentualDiferimentoMono;
  double? valorIcmsDiferidoMono;
  double? quantidadeTributadaRetida;
  double? aliquotaAdRemRetida;
  double? valorIcmsRetido;
  double? percentualReducaoAdRem;
  String? motivoReducaoAdRem;

  NfeDetalheImpostoIcmsModel({
    this.id,
    this.idNfeDetalhe,
    this.origemMercadoria = '0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8',
    this.cstIcms,
    this.csosn,
    this.modalidadeBcIcms = '0=Margem Valor Agregado (%)',
    this.percentualReducaoBcIcms,
    this.valorBcIcms,
    this.aliquotaIcms,
    this.valorIcmsOperacao,
    this.percentualDiferimento,
    this.valorIcmsDiferido,
    this.valorIcms,
    this.baseCalculoFcp,
    this.percentualFcp,
    this.valorFcp,
    this.taxaFcpDiferido,
    this.valorFcpDiferido,
    this.valorFcpEfetivo,
    this.modalidadeBcIcmsSt = '0=Preço tabelado ou máximo sugerido',
    this.percentualMvaIcmsSt,
    this.percentualReducaoBcIcmsSt,
    this.valorBaseCalculoIcmsSt,
    this.aliquotaIcmsSt,
    this.valorIcmsSt,
    this.baseCalculoFcpSt,
    this.percentualFcpSt,
    this.valorFcpSt,
    this.ufSt = 'AC',
    this.percentualBcOperacaoPropria,
    this.valorBcIcmsStRetido,
    this.aliquotaSuportadaConsumidor,
    this.valorIcmsSubstituto,
    this.valorIcmsStRetido,
    this.baseCalculoFcpStRetido,
    this.percentualFcpStRetido,
    this.valorFcpStRetido,
    this.motivoDesoneracaoIcms,
    this.valorIcmsDesonerado,
    this.desoneradoDeduz = '0-Não',
    this.aliquotaCreditoIcmsSn,
    this.valorCreditoIcmsSn,
    this.valorBcIcmsStDestino,
    this.valorIcmsStDestino,
    this.valorIcmsStDesonerado,
    this.motivoDesoneracaoIcmsSt = '03=Uso na agropecuária',
    this.percentualReducaoBcEfetivo,
    this.valorBcEfetivo,
    this.aliquotaIcmsEfetivo,
    this.valorIcmsEfetivo,
    this.quantidadeTributada,
    this.aliquotaAdRem,
    this.valorIcmsMono,
    this.quantidadeSujeitaRetencao,
    this.aliquotaAdRemRetencao,
    this.valorIcmsMonoRetencao,
    this.valorIcmsMonoOperacao,
    this.percentualDiferimentoMono,
    this.valorIcmsDiferidoMono,
    this.quantidadeTributadaRetida,
    this.aliquotaAdRemRetida,
    this.valorIcmsRetido,
    this.percentualReducaoAdRem,
    this.motivoReducaoAdRem = '1= Transporte coletivo de passageiros',
  });

  static List<String> dbColumns = <String>[
    'id',
    'origem_mercadoria',
    'cst_icms',
    'csosn',
    'modalidade_bc_icms',
    'percentual_reducao_bc_icms',
    'valor_bc_icms',
    'aliquota_icms',
    'valor_icms_operacao',
    'percentual_diferimento',
    'valor_icms_diferido',
    'valor_icms',
    'base_calculo_fcp',
    'percentual_fcp',
    'valor_fcp',
    'modalidade_bc_icms_st',
    'percentual_mva_icms_st',
    'percentual_reducao_bc_icms_st',
    'valor_base_calculo_icms_st',
    'aliquota_icms_st',
    'valor_icms_st',
    'base_calculo_fcp_st',
    'percentual_fcp_st',
    'valor_fcp_st',
    'uf_st',
    'percentual_bc_operacao_propria',
    'valor_bc_icms_st_retido',
    'aliquota_suportada_consumidor',
    'valor_icms_substituto',
    'valor_icms_st_retido',
    'base_calculo_fcp_st_retido',
    'percentual_fcp_st_retido',
    'valor_fcp_st_retido',
    'motivo_desoneracao_icms',
    'valor_icms_desonerado',
    'aliquota_credito_icms_sn',
    'valor_credito_icms_sn',
    'valor_bc_icms_st_destino',
    'valor_icms_st_destino',
    'percentual_reducao_bc_efetivo',
    'valor_bc_efetivo',
    'aliquota_icms_efetivo',
    'valor_icms_efetivo',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Origem Mercadoria',
    'Cst Icms',
    'Csosn',
    'Modalidade Bc Icms',
    'Percentual Reducao Bc Icms',
    'Valor Bc Icms',
    'Aliquota Icms',
    'Valor Icms Operacao',
    'Percentual Diferimento',
    'Valor Icms Diferido',
    'Valor Icms',
    'Base Calculo Fcp',
    'Percentual Fcp',
    'Valor Fcp',
    'Modalidade Bc Icms St',
    'Percentual Mva Icms St',
    'Percentual Reducao Bc Icms St',
    'Valor Base Calculo Icms St',
    'Aliquota Icms St',
    'Valor Icms St',
    'Base Calculo Fcp St',
    'Percentual Fcp St',
    'Valor Fcp St',
    'Uf St',
    'Percentual Bc Operacao Propria',
    'Valor Bc Icms St Retido',
    'Aliquota Suportada Consumidor',
    'Valor Icms Substituto',
    'Valor Icms St Retido',
    'Base Calculo Fcp St Retido',
    'Percentual Fcp St Retido',
    'Valor Fcp St Retido',
    'Motivo Desoneracao Icms',
    'Valor Icms Desonerado',
    'Aliquota Credito Icms Sn',
    'Valor Credito Icms Sn',
    'Valor Bc Icms St Destino',
    'Valor Icms St Destino',
    'Percentual Reducao Bc Efetivo',
    'Valor Bc Efetivo',
    'Aliquota Icms Efetivo',
    'Valor Icms Efetivo',
  ];

  NfeDetalheImpostoIcmsModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    origemMercadoria = NfeDetalheImpostoIcmsDomain.getOrigemMercadoria(jsonData['origemMercadoria']);
    cstIcms = jsonData['cstIcms'];
    csosn = jsonData['csosn'];
    modalidadeBcIcms = NfeDetalheImpostoIcmsDomain.getModalidadeBcIcms(jsonData['modalidadeBcIcms']);
    percentualReducaoBcIcms = jsonData['percentualReducaoBcIcms']?.toDouble();
    valorBcIcms = jsonData['valorBcIcms']?.toDouble();
    aliquotaIcms = jsonData['aliquotaIcms']?.toDouble();
    valorIcmsOperacao = jsonData['valorIcmsOperacao']?.toDouble();
    percentualDiferimento = jsonData['percentualDiferimento']?.toDouble();
    valorIcmsDiferido = jsonData['valorIcmsDiferido']?.toDouble();
    valorIcms = jsonData['valorIcms']?.toDouble();
    baseCalculoFcp = jsonData['baseCalculoFcp']?.toDouble();
    percentualFcp = jsonData['percentualFcp']?.toDouble();
    valorFcp = jsonData['valorFcp']?.toDouble();
    taxaFcpDiferido = jsonData['taxaFcpDiferido']?.toDouble();
    valorFcpDiferido = jsonData['valorFcpDiferido']?.toDouble();
    valorFcpEfetivo = jsonData['valorFcpEfetivo']?.toDouble();
    modalidadeBcIcmsSt = NfeDetalheImpostoIcmsDomain.getModalidadeBcIcmsSt(jsonData['modalidadeBcIcmsSt']);
    percentualMvaIcmsSt = jsonData['percentualMvaIcmsSt']?.toDouble();
    percentualReducaoBcIcmsSt = jsonData['percentualReducaoBcIcmsSt']?.toDouble();
    valorBaseCalculoIcmsSt = jsonData['valorBaseCalculoIcmsSt']?.toDouble();
    aliquotaIcmsSt = jsonData['aliquotaIcmsSt']?.toDouble();
    valorIcmsSt = jsonData['valorIcmsSt']?.toDouble();
    baseCalculoFcpSt = jsonData['baseCalculoFcpSt']?.toDouble();
    percentualFcpSt = jsonData['percentualFcpSt']?.toDouble();
    valorFcpSt = jsonData['valorFcpSt']?.toDouble();
    ufSt = NfeDetalheImpostoIcmsDomain.getUfSt(jsonData['ufSt']);
    percentualBcOperacaoPropria = jsonData['percentualBcOperacaoPropria']?.toDouble();
    valorBcIcmsStRetido = jsonData['valorBcIcmsStRetido']?.toDouble();
    aliquotaSuportadaConsumidor = jsonData['aliquotaSuportadaConsumidor']?.toDouble();
    valorIcmsSubstituto = jsonData['valorIcmsSubstituto']?.toDouble();
    valorIcmsStRetido = jsonData['valorIcmsStRetido']?.toDouble();
    baseCalculoFcpStRetido = jsonData['baseCalculoFcpStRetido']?.toDouble();
    percentualFcpStRetido = jsonData['percentualFcpStRetido']?.toDouble();
    valorFcpStRetido = jsonData['valorFcpStRetido']?.toDouble();
    motivoDesoneracaoIcms = jsonData['motivoDesoneracaoIcms'];
    valorIcmsDesonerado = jsonData['valorIcmsDesonerado']?.toDouble();
    desoneradoDeduz = NfeDetalheImpostoIcmsDomain.getDesoneradoDeduz(jsonData['desoneradoDeduz']);
    aliquotaCreditoIcmsSn = jsonData['aliquotaCreditoIcmsSn']?.toDouble();
    valorCreditoIcmsSn = jsonData['valorCreditoIcmsSn']?.toDouble();
    valorBcIcmsStDestino = jsonData['valorBcIcmsStDestino']?.toDouble();
    valorIcmsStDestino = jsonData['valorIcmsStDestino']?.toDouble();
    valorIcmsStDesonerado = jsonData['valorIcmsStDesonerado']?.toDouble();
    motivoDesoneracaoIcmsSt = NfeDetalheImpostoIcmsDomain.getMotivoDesoneracaoIcmsSt(jsonData['motivoDesoneracaoIcmsSt']);
    percentualReducaoBcEfetivo = jsonData['percentualReducaoBcEfetivo']?.toDouble();
    valorBcEfetivo = jsonData['valorBcEfetivo']?.toDouble();
    aliquotaIcmsEfetivo = jsonData['aliquotaIcmsEfetivo']?.toDouble();
    valorIcmsEfetivo = jsonData['valorIcmsEfetivo']?.toDouble();
    valorIcmsEfetivo = jsonData['valorIcmsEfetivo']?.toDouble();
    quantidadeTributada = jsonData['quantidadeTributada']?.toDouble();
    aliquotaAdRem = jsonData['aliquotaAdRem']?.toDouble();
    valorIcmsMono = jsonData['valorIcmsMono']?.toDouble();
    quantidadeSujeitaRetencao = jsonData['quantidadeSujeitaRetencao']?.toDouble();
    aliquotaAdRemRetencao = jsonData['aliquotaAdRemRetencao']?.toDouble();
    valorIcmsMonoRetencao = jsonData['valorIcmsMonoRetencao']?.toDouble();
    valorIcmsMonoOperacao = jsonData['valorIcmsMonoOperacao']?.toDouble();
    percentualDiferimentoMono = jsonData['percentualDiferimentoMono']?.toDouble();
    valorIcmsDiferidoMono = jsonData['valorIcmsDiferidoMono']?.toDouble();
    quantidadeTributadaRetida = jsonData['quantidadeTributadaRetida']?.toDouble();
    aliquotaAdRemRetida = jsonData['aliquotaAdRemRetida']?.toDouble();
    valorIcmsRetido = jsonData['valorIcmsRetido']?.toDouble();
    percentualReducaoAdRem = jsonData['percentualReducaoAdRem']?.toDouble();
    motivoReducaoAdRem = NfeDetalheImpostoIcmsDomain.getMotivoReducaoAdRem(jsonData['motivoReducaoAdRem']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['origemMercadoria'] = NfeDetalheImpostoIcmsDomain.setOrigemMercadoria(origemMercadoria);
    jsonData['cstIcms'] = cstIcms;
    jsonData['csosn'] = csosn;
    jsonData['modalidadeBcIcms'] = NfeDetalheImpostoIcmsDomain.setModalidadeBcIcms(modalidadeBcIcms);
    jsonData['percentualReducaoBcIcms'] = percentualReducaoBcIcms;
    jsonData['valorBcIcms'] = valorBcIcms;
    jsonData['aliquotaIcms'] = aliquotaIcms;
    jsonData['valorIcmsOperacao'] = valorIcmsOperacao;
    jsonData['percentualDiferimento'] = percentualDiferimento;
    jsonData['valorIcmsDiferido'] = valorIcmsDiferido;
    jsonData['valorIcms'] = valorIcms;
    jsonData['baseCalculoFcp'] = baseCalculoFcp;
    jsonData['percentualFcp'] = percentualFcp;
    jsonData['valorFcp'] = valorFcp;
    jsonData['taxaFcpDiferido'] = taxaFcpDiferido;
    jsonData['valorFcpDiferido'] = valorFcpDiferido;
    jsonData['valorFcpEfetivo'] = valorFcpEfetivo;
    jsonData['modalidadeBcIcmsSt'] = NfeDetalheImpostoIcmsDomain.setModalidadeBcIcmsSt(modalidadeBcIcmsSt);
    jsonData['percentualMvaIcmsSt'] = percentualMvaIcmsSt;
    jsonData['percentualReducaoBcIcmsSt'] = percentualReducaoBcIcmsSt;
    jsonData['valorBaseCalculoIcmsSt'] = valorBaseCalculoIcmsSt;
    jsonData['aliquotaIcmsSt'] = aliquotaIcmsSt;
    jsonData['valorIcmsSt'] = valorIcmsSt;
    jsonData['baseCalculoFcpSt'] = baseCalculoFcpSt;
    jsonData['percentualFcpSt'] = percentualFcpSt;
    jsonData['valorFcpSt'] = valorFcpSt;
    jsonData['ufSt'] = NfeDetalheImpostoIcmsDomain.setUfSt(ufSt);
    jsonData['percentualBcOperacaoPropria'] = percentualBcOperacaoPropria;
    jsonData['valorBcIcmsStRetido'] = valorBcIcmsStRetido;
    jsonData['aliquotaSuportadaConsumidor'] = aliquotaSuportadaConsumidor;
    jsonData['valorIcmsSubstituto'] = valorIcmsSubstituto;
    jsonData['valorIcmsStRetido'] = valorIcmsStRetido;
    jsonData['baseCalculoFcpStRetido'] = baseCalculoFcpStRetido;
    jsonData['percentualFcpStRetido'] = percentualFcpStRetido;
    jsonData['valorFcpStRetido'] = valorFcpStRetido;
    jsonData['motivoDesoneracaoIcms'] = motivoDesoneracaoIcms;
    jsonData['valorIcmsDesonerado'] = valorIcmsDesonerado;
    jsonData['desoneradoDeduz'] = NfeDetalheImpostoIcmsDomain.setDesoneradoDeduz(desoneradoDeduz);
    jsonData['aliquotaCreditoIcmsSn'] = aliquotaCreditoIcmsSn;
    jsonData['valorCreditoIcmsSn'] = valorCreditoIcmsSn;
    jsonData['valorBcIcmsStDestino'] = valorBcIcmsStDestino;
    jsonData['valorIcmsStDestino'] = valorIcmsStDestino;
    jsonData['valorIcmsStDesonerado'] = valorIcmsStDesonerado;
    jsonData['motivoDesoneracaoIcmsSt'] = NfeDetalheImpostoIcmsDomain.setMotivoDesoneracaoIcmsSt(motivoDesoneracaoIcmsSt);
    jsonData['percentualReducaoBcEfetivo'] = percentualReducaoBcEfetivo;
    jsonData['valorBcEfetivo'] = valorBcEfetivo;
    jsonData['aliquotaIcmsEfetivo'] = aliquotaIcmsEfetivo;
    jsonData['valorIcmsEfetivo'] = valorIcmsEfetivo;
    jsonData['valorIcmsEfetivo'] = valorIcmsEfetivo;
    jsonData['quantidadeTributada'] = quantidadeTributada;
    jsonData['aliquotaAdRem'] = aliquotaAdRem;
    jsonData['valorIcmsMono'] = valorIcmsMono;
    jsonData['quantidadeSujeitaRetencao'] = quantidadeSujeitaRetencao;
    jsonData['aliquotaAdRemRetencao'] = aliquotaAdRemRetencao;
    jsonData['valorIcmsMonoRetencao'] = valorIcmsMonoRetencao;
    jsonData['valorIcmsMonoOperacao'] = valorIcmsMonoOperacao;
    jsonData['percentualDiferimentoMono'] = percentualDiferimentoMono;
    jsonData['valorIcmsDiferidoMono'] = valorIcmsDiferidoMono;
    jsonData['quantidadeTributadaRetida'] = quantidadeTributadaRetida;
    jsonData['aliquotaAdRemRetida'] = aliquotaAdRemRetida;
    jsonData['valorIcmsRetido'] = valorIcmsRetido;
    jsonData['percentualReducaoAdRem'] = percentualReducaoAdRem;
    jsonData['motivoReducaoAdRem'] = NfeDetalheImpostoIcmsDomain.setMotivoReducaoAdRem(motivoReducaoAdRem);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheImpostoIcmsModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheImpostoIcmsModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      origemMercadoria: row.cells['origemMercadoria']?.value,
      cstIcms: row.cells['cstIcms']?.value,
      csosn: row.cells['csosn']?.value,
      modalidadeBcIcms: row.cells['modalidadeBcIcms']?.value,
      percentualReducaoBcIcms: row.cells['percentualReducaoBcIcms']?.value,
      valorBcIcms: row.cells['valorBcIcms']?.value,
      aliquotaIcms: row.cells['aliquotaIcms']?.value,
      valorIcmsOperacao: row.cells['valorIcmsOperacao']?.value,
      percentualDiferimento: row.cells['percentualDiferimento']?.value,
      valorIcmsDiferido: row.cells['valorIcmsDiferido']?.value,
      valorIcms: row.cells['valorIcms']?.value,
      baseCalculoFcp: row.cells['baseCalculoFcp']?.value,
      percentualFcp: row.cells['percentualFcp']?.value,
      valorFcp: row.cells['valorFcp']?.value,
      taxaFcpDiferido: row.cells['taxaFcpDiferido']?.value,
      valorFcpDiferido: row.cells['valorFcpDiferido']?.value,
      valorFcpEfetivo: row.cells['valorFcpEfetivo']?.value,
      modalidadeBcIcmsSt: row.cells['modalidadeBcIcmsSt']?.value,
      percentualMvaIcmsSt: row.cells['percentualMvaIcmsSt']?.value,
      percentualReducaoBcIcmsSt: row.cells['percentualReducaoBcIcmsSt']?.value,
      valorBaseCalculoIcmsSt: row.cells['valorBaseCalculoIcmsSt']?.value,
      aliquotaIcmsSt: row.cells['aliquotaIcmsSt']?.value,
      valorIcmsSt: row.cells['valorIcmsSt']?.value,
      baseCalculoFcpSt: row.cells['baseCalculoFcpSt']?.value,
      percentualFcpSt: row.cells['percentualFcpSt']?.value,
      valorFcpSt: row.cells['valorFcpSt']?.value,
      ufSt: row.cells['ufSt']?.value,
      percentualBcOperacaoPropria: row.cells['percentualBcOperacaoPropria']?.value,
      valorBcIcmsStRetido: row.cells['valorBcIcmsStRetido']?.value,
      aliquotaSuportadaConsumidor: row.cells['aliquotaSuportadaConsumidor']?.value,
      valorIcmsSubstituto: row.cells['valorIcmsSubstituto']?.value,
      valorIcmsStRetido: row.cells['valorIcmsStRetido']?.value,
      baseCalculoFcpStRetido: row.cells['baseCalculoFcpStRetido']?.value,
      percentualFcpStRetido: row.cells['percentualFcpStRetido']?.value,
      valorFcpStRetido: row.cells['valorFcpStRetido']?.value,
      motivoDesoneracaoIcms: row.cells['motivoDesoneracaoIcms']?.value,
      valorIcmsDesonerado: row.cells['valorIcmsDesonerado']?.value,
      desoneradoDeduz: row.cells['desoneradoDeduz']?.value,
      aliquotaCreditoIcmsSn: row.cells['aliquotaCreditoIcmsSn']?.value,
      valorCreditoIcmsSn: row.cells['valorCreditoIcmsSn']?.value,
      valorBcIcmsStDestino: row.cells['valorBcIcmsStDestino']?.value,
      valorIcmsStDestino: row.cells['valorIcmsStDestino']?.value,
      valorIcmsStDesonerado: row.cells['valorIcmsStDesonerado']?.value,
      motivoDesoneracaoIcmsSt: row.cells['motivoDesoneracaoIcmsSt']?.value,
      percentualReducaoBcEfetivo: row.cells['percentualReducaoBcEfetivo']?.value,
      valorBcEfetivo: row.cells['valorBcEfetivo']?.value,
      aliquotaIcmsEfetivo: row.cells['aliquotaIcmsEfetivo']?.value,
      valorIcmsEfetivo: row.cells['valorIcmsEfetivo']?.value,
      quantidadeTributada: row.cells['quantidadeTributada']?.value,
      aliquotaAdRem: row.cells['aliquotaAdRem']?.value,
      valorIcmsMono: row.cells['valorIcmsMono']?.value,
      quantidadeSujeitaRetencao: row.cells['quantidadeSujeitaRetencao']?.value,
      aliquotaAdRemRetencao: row.cells['aliquotaAdRemRetencao']?.value,
      valorIcmsMonoRetencao: row.cells['valorIcmsMonoRetencao']?.value,
      valorIcmsMonoOperacao: row.cells['valorIcmsMonoOperacao']?.value,
      percentualDiferimentoMono: row.cells['percentualDiferimentoMono']?.value,
      valorIcmsDiferidoMono: row.cells['valorIcmsDiferidoMono']?.value,
      quantidadeTributadaRetida: row.cells['quantidadeTributadaRetida']?.value,
      aliquotaAdRemRetida: row.cells['aliquotaAdRemRetida']?.value,
      valorIcmsRetido: row.cells['valorIcmsRetido']?.value,
      percentualReducaoAdRem: row.cells['percentualReducaoAdRem']?.value,
      motivoReducaoAdRem: row.cells['motivoReducaoAdRem']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'origemMercadoria': PlutoCell(value: origemMercadoria ?? ''),
        'cstIcms': PlutoCell(value: cstIcms ?? ''),
        'csosn': PlutoCell(value: csosn ?? ''),
        'modalidadeBcIcms': PlutoCell(value: modalidadeBcIcms ?? ''),
        'percentualReducaoBcIcms': PlutoCell(value: percentualReducaoBcIcms ?? 0.0),
        'valorBcIcms': PlutoCell(value: valorBcIcms ?? 0.0),
        'aliquotaIcms': PlutoCell(value: aliquotaIcms ?? 0.0),
        'valorIcmsOperacao': PlutoCell(value: valorIcmsOperacao ?? 0.0),
        'percentualDiferimento': PlutoCell(value: percentualDiferimento ?? 0.0),
        'valorIcmsDiferido': PlutoCell(value: valorIcmsDiferido ?? 0.0),
        'valorIcms': PlutoCell(value: valorIcms ?? 0.0),
        'baseCalculoFcp': PlutoCell(value: baseCalculoFcp ?? 0.0),
        'percentualFcp': PlutoCell(value: percentualFcp ?? 0.0),
        'valorFcp': PlutoCell(value: valorFcp ?? 0.0),
        'taxaFcpDiferido': PlutoCell(value: taxaFcpDiferido ?? 0.0),
        'valorFcpDiferido': PlutoCell(value: valorFcpDiferido ?? 0.0),
        'valorFcpEfetivo': PlutoCell(value: valorFcpEfetivo ?? 0.0),
        'modalidadeBcIcmsSt': PlutoCell(value: modalidadeBcIcmsSt ?? ''),
        'percentualMvaIcmsSt': PlutoCell(value: percentualMvaIcmsSt ?? 0.0),
        'percentualReducaoBcIcmsSt': PlutoCell(value: percentualReducaoBcIcmsSt ?? 0.0),
        'valorBaseCalculoIcmsSt': PlutoCell(value: valorBaseCalculoIcmsSt ?? 0.0),
        'aliquotaIcmsSt': PlutoCell(value: aliquotaIcmsSt ?? 0.0),
        'valorIcmsSt': PlutoCell(value: valorIcmsSt ?? 0.0),
        'baseCalculoFcpSt': PlutoCell(value: baseCalculoFcpSt ?? 0.0),
        'percentualFcpSt': PlutoCell(value: percentualFcpSt ?? 0.0),
        'valorFcpSt': PlutoCell(value: valorFcpSt ?? 0.0),
        'ufSt': PlutoCell(value: ufSt ?? ''),
        'percentualBcOperacaoPropria': PlutoCell(value: percentualBcOperacaoPropria ?? 0.0),
        'valorBcIcmsStRetido': PlutoCell(value: valorBcIcmsStRetido ?? 0.0),
        'aliquotaSuportadaConsumidor': PlutoCell(value: aliquotaSuportadaConsumidor ?? 0.0),
        'valorIcmsSubstituto': PlutoCell(value: valorIcmsSubstituto ?? 0.0),
        'valorIcmsStRetido': PlutoCell(value: valorIcmsStRetido ?? 0.0),
        'baseCalculoFcpStRetido': PlutoCell(value: baseCalculoFcpStRetido ?? 0.0),
        'percentualFcpStRetido': PlutoCell(value: percentualFcpStRetido ?? 0.0),
        'valorFcpStRetido': PlutoCell(value: valorFcpStRetido ?? 0.0),
        'motivoDesoneracaoIcms': PlutoCell(value: motivoDesoneracaoIcms ?? ''),
        'valorIcmsDesonerado': PlutoCell(value: valorIcmsDesonerado ?? 0.0),
        'desoneradoDeduz': PlutoCell(value: desoneradoDeduz ?? ''),
        'aliquotaCreditoIcmsSn': PlutoCell(value: aliquotaCreditoIcmsSn ?? 0.0),
        'valorCreditoIcmsSn': PlutoCell(value: valorCreditoIcmsSn ?? 0.0),
        'valorBcIcmsStDestino': PlutoCell(value: valorBcIcmsStDestino ?? 0.0),
        'valorIcmsStDestino': PlutoCell(value: valorIcmsStDestino ?? 0.0),
        'valorIcmsStDesonerado': PlutoCell(value: valorIcmsStDesonerado ?? 0.0),
        'motivoDesoneracaoIcmsSt': PlutoCell(value: motivoDesoneracaoIcmsSt ?? ''),
        'percentualReducaoBcEfetivo': PlutoCell(value: percentualReducaoBcEfetivo ?? 0.0),
        'valorBcEfetivo': PlutoCell(value: valorBcEfetivo ?? 0.0),
        'aliquotaIcmsEfetivo': PlutoCell(value: aliquotaIcmsEfetivo ?? 0.0),
        'valorIcmsEfetivo': PlutoCell(value: valorIcmsEfetivo ?? 0.0),
        'quantidadeTributada': PlutoCell(value: quantidadeTributada ?? 0.0),
        'aliquotaAdRem': PlutoCell(value: aliquotaAdRem ?? 0.0),
        'valorIcmsMono': PlutoCell(value: valorIcmsMono ?? 0.0),
        'quantidadeSujeitaRetencao': PlutoCell(value: quantidadeSujeitaRetencao ?? 0.0),
        'aliquotaAdRemRetencao': PlutoCell(value: aliquotaAdRemRetencao ?? 0.0),
        'valorIcmsMonoRetencao': PlutoCell(value: valorIcmsMonoRetencao ?? 0.0),
        'valorIcmsMonoOperacao': PlutoCell(value: valorIcmsMonoOperacao ?? 0.0),
        'percentualDiferimentoMono': PlutoCell(value: percentualDiferimentoMono ?? 0.0),
        'valorIcmsDiferidoMono': PlutoCell(value: valorIcmsDiferidoMono ?? 0.0),
        'quantidadeTributadaRetida': PlutoCell(value: quantidadeTributadaRetida ?? 0.0),
        'aliquotaAdRemRetida': PlutoCell(value: aliquotaAdRemRetida ?? 0.0),
        'valorIcmsRetido': PlutoCell(value: valorIcmsRetido ?? 0.0),
        'percentualReducaoAdRem': PlutoCell(value: percentualReducaoAdRem ?? 0.0),
        'motivoReducaoAdRem': PlutoCell(value: motivoReducaoAdRem ?? ''),
      },
    );
  }

  NfeDetalheImpostoIcmsModel clone() {
    return NfeDetalheImpostoIcmsModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      origemMercadoria: origemMercadoria,
      cstIcms: cstIcms,
      csosn: csosn,
      modalidadeBcIcms: modalidadeBcIcms,
      percentualReducaoBcIcms: percentualReducaoBcIcms,
      valorBcIcms: valorBcIcms,
      aliquotaIcms: aliquotaIcms,
      valorIcmsOperacao: valorIcmsOperacao,
      percentualDiferimento: percentualDiferimento,
      valorIcmsDiferido: valorIcmsDiferido,
      valorIcms: valorIcms,
      baseCalculoFcp: baseCalculoFcp,
      percentualFcp: percentualFcp,
      valorFcp: valorFcp,
      taxaFcpDiferido: taxaFcpDiferido,
      valorFcpDiferido: valorFcpDiferido,
      valorFcpEfetivo: valorFcpEfetivo,
      modalidadeBcIcmsSt: modalidadeBcIcmsSt,
      percentualMvaIcmsSt: percentualMvaIcmsSt,
      percentualReducaoBcIcmsSt: percentualReducaoBcIcmsSt,
      valorBaseCalculoIcmsSt: valorBaseCalculoIcmsSt,
      aliquotaIcmsSt: aliquotaIcmsSt,
      valorIcmsSt: valorIcmsSt,
      baseCalculoFcpSt: baseCalculoFcpSt,
      percentualFcpSt: percentualFcpSt,
      valorFcpSt: valorFcpSt,
      ufSt: ufSt,
      percentualBcOperacaoPropria: percentualBcOperacaoPropria,
      valorBcIcmsStRetido: valorBcIcmsStRetido,
      aliquotaSuportadaConsumidor: aliquotaSuportadaConsumidor,
      valorIcmsSubstituto: valorIcmsSubstituto,
      valorIcmsStRetido: valorIcmsStRetido,
      baseCalculoFcpStRetido: baseCalculoFcpStRetido,
      percentualFcpStRetido: percentualFcpStRetido,
      valorFcpStRetido: valorFcpStRetido,
      motivoDesoneracaoIcms: motivoDesoneracaoIcms,
      valorIcmsDesonerado: valorIcmsDesonerado,
      desoneradoDeduz: desoneradoDeduz,
      aliquotaCreditoIcmsSn: aliquotaCreditoIcmsSn,
      valorCreditoIcmsSn: valorCreditoIcmsSn,
      valorBcIcmsStDestino: valorBcIcmsStDestino,
      valorIcmsStDestino: valorIcmsStDestino,
      valorIcmsStDesonerado: valorIcmsStDesonerado,
      motivoDesoneracaoIcmsSt: motivoDesoneracaoIcmsSt,
      percentualReducaoBcEfetivo: percentualReducaoBcEfetivo,
      valorBcEfetivo: valorBcEfetivo,
      aliquotaIcmsEfetivo: aliquotaIcmsEfetivo,
      valorIcmsEfetivo: valorIcmsEfetivo,
      quantidadeTributada: quantidadeTributada,
      aliquotaAdRem: aliquotaAdRem,
      valorIcmsMono: valorIcmsMono,
      quantidadeSujeitaRetencao: quantidadeSujeitaRetencao,
      aliquotaAdRemRetencao: aliquotaAdRemRetencao,
      valorIcmsMonoRetencao: valorIcmsMonoRetencao,
      valorIcmsMonoOperacao: valorIcmsMonoOperacao,
      percentualDiferimentoMono: percentualDiferimentoMono,
      valorIcmsDiferidoMono: valorIcmsDiferidoMono,
      quantidadeTributadaRetida: quantidadeTributadaRetida,
      aliquotaAdRemRetida: aliquotaAdRemRetida,
      valorIcmsRetido: valorIcmsRetido,
      percentualReducaoAdRem: percentualReducaoAdRem,
      motivoReducaoAdRem: motivoReducaoAdRem,
    );
  }


}