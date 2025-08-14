import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetalheModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  int? idProduto;
  int? numeroItem;
  String? codigoProduto;
  String? codigoBarraDifGtin;
  String? codigoBarraTribDifGtin;
  String? gtin;
  String? nomeProduto;
  String? ncm;
  String? nve;
  String? cest;
  String? indicadorEscalaRelevante;
  String? cnpjFabricante;
  String? codigoBeneficioFiscal;
  int? exTipi;
  int? cfop;
  String? unidadeComercial;
  double? quantidadeComercial;
  String? numeroPedidoCompra;
  int? itemPedidoCompra;
  String? numeroFci;
  String? numeroRecopi;
  double? valorUnitarioComercial;
  double? valorBrutoProduto;
  String? gtinUnidadeTributavel;
  String? unidadeTributavel;
  double? quantidadeTributavel;
  double? valorUnitarioTributavel;
  double? valorFrete;
  double? valorSeguro;
  double? valorDesconto;
  double? valorOutrasDespesas;
  String? entraTotal;
  String? indicadorBemMovelUsado;
  double? valorTotalTributos;
  double? percentualDevolvido;
  double? valorIpiDevolvido;
  String? informacoesAdicionais;
  double? valorSubtotal;
  double? valorTotal;

  NfeDetEspecificoVeiculoModel? nfeDetEspecificoVeiculoModel;
  NfeDetEspecificoMedicamentoModel? nfeDetEspecificoMedicamentoModel;
  NfeDetEspecificoCombustivelModel? nfeDetEspecificoCombustivelModel;
  NfeDetalheImpostoIcmsModel? nfeDetalheImpostoIcmsModel;
  NfeDetalheImpostoIpiModel? nfeDetalheImpostoIpiModel;
  NfeDetalheImpostoIiModel? nfeDetalheImpostoIiModel;
  NfeDetalheImpostoPisModel? nfeDetalheImpostoPisModel;
  NfeDetalheImpostoPisStModel? nfeDetalheImpostoPisStModel;
  NfeDetalheImpostoCofinsModel? nfeDetalheImpostoCofinsModel;
  NfeDetalheImpostoCofinsStModel? nfeDetalheImpostoCofinsStModel;
  NfeDetalheImpostoIssqnModel? nfeDetalheImpostoIssqnModel;
  NfeDetalheImpostoIcmsUfdestModel? nfeDetalheImpostoIcmsUfdestModel;
  NfeDetalheImpostoSeletivoModel? nfeDetalheImpostoSeletivoModel;
  NfeDetalheImpostoIbsUfModel? nfeDetalheImpostoIbsUfModel;
  NfeDetalheImpostoIbsMunModel? nfeDetalheImpostoIbsMunModel;
  NfeDetalheImpostoCbsModel? nfeDetalheImpostoCbsModel;
  NfeDetalheTributoRegularModel? nfeDetalheTributoRegularModel;
  NfeDetalheCreditoPresumidoIbsModel? nfeDetalheCreditoPresumidoIbsModel;
  NfeDetalheCreditoPresumidoCbsModel? nfeDetalheCreditoPresumidoCbsModel;
  NfeDetalheCompraGovernoModel? nfeDetalheCompraGovernoModel;
  NfeDetalheImpostoMonofasicoModel? nfeDetalheImpostoMonofasicoModel;
  NfeDetalheTransfCreditoModel? nfeDetalheTransfCreditoModel;
  NfeDetalheIbsZfmModel? nfeDetalheIbsZfmModel;
  NfeDetalheDfeReferenciadoModel? nfeDetalheDfeReferenciadoModel;

  List<NfeDetEspecificoArmamentoModel>? nfeDetEspecificoArmamentoModelList;
  List<NfeDeclaracaoImportacaoModel>? nfeDeclaracaoImportacaoModelList;
  List<NfeExportacaoModel>? nfeExportacaoModelList;
  List<NfeItemRastreadoModel>? nfeItemRastreadoModelList;
  ProdutoModel? produtoModel;

  NfeDetalheModel({
    this.id,
    this.idNfeCabecalho,
    this.idProduto,
    this.numeroItem,
    this.codigoProduto,
    this.codigoBarraDifGtin,
    this.codigoBarraTribDifGtin,
    this.gtin,
    this.nomeProduto,
    this.ncm,
    this.nve,
    this.cest,
    this.indicadorEscalaRelevante = 'Sim',
    this.cnpjFabricante,
    this.codigoBeneficioFiscal,
    this.exTipi,
    this.cfop,
    this.unidadeComercial,
    this.quantidadeComercial,
    this.numeroPedidoCompra,
    this.itemPedidoCompra,
    this.numeroFci,
    this.numeroRecopi,
    this.valorUnitarioComercial,
    this.valorBrutoProduto,
    this.gtinUnidadeTributavel,
    this.unidadeTributavel,
    this.quantidadeTributavel,
    this.valorUnitarioTributavel,
    this.valorFrete,
    this.valorSeguro,
    this.valorDesconto,
    this.valorOutrasDespesas,
    this.entraTotal = '0=Valor do item (vProd) não compõe o valor total da NF-e',
    this.indicadorBemMovelUsado = '1 - Bem Móvel Usado',
    this.valorTotalTributos,
    this.percentualDevolvido,
    this.valorIpiDevolvido,
    this.informacoesAdicionais,
    this.valorSubtotal,
    this.valorTotal,
    NfeDetEspecificoVeiculoModel? nfeDetEspecificoVeiculoModel,
    NfeDetEspecificoMedicamentoModel? nfeDetEspecificoMedicamentoModel,
    NfeDetEspecificoCombustivelModel? nfeDetEspecificoCombustivelModel,
    NfeDetalheImpostoIcmsModel? nfeDetalheImpostoIcmsModel,
    NfeDetalheImpostoIpiModel? nfeDetalheImpostoIpiModel,
    NfeDetalheImpostoIiModel? nfeDetalheImpostoIiModel,
    NfeDetalheImpostoPisModel? nfeDetalheImpostoPisModel,
    NfeDetalheImpostoPisStModel? nfeDetalheImpostoPisStModel,
    NfeDetalheImpostoCofinsModel? nfeDetalheImpostoCofinsModel,
    NfeDetalheImpostoCofinsStModel? nfeDetalheImpostoCofinsStModel,
    NfeDetalheImpostoIssqnModel? nfeDetalheImpostoIssqnModel,
    NfeDetalheImpostoIcmsUfdestModel? nfeDetalheImpostoIcmsUfdestModel,
    NfeDetalheImpostoSeletivoModel? nfeDetalheImpostoSeletivoModel,
    NfeDetalheImpostoIbsUfModel? nfeDetalheImpostoIbsUfModel,
    NfeDetalheImpostoIbsMunModel? nfeDetalheImpostoIbsMunModel,
    NfeDetalheImpostoCbsModel? nfeDetalheImpostoCbsModel,
    NfeDetalheTributoRegularModel? nfeDetalheTributoRegularModel,
    NfeDetalheCreditoPresumidoIbsModel? nfeDetalheCreditoPresumidoIbsModel,
    NfeDetalheCreditoPresumidoCbsModel? nfeDetalheCreditoPresumidoCbsModel,
    NfeDetalheCompraGovernoModel? nfeDetalheCompraGovernoModel,
    NfeDetalheImpostoMonofasicoModel? nfeDetalheImpostoMonofasicoModel,
    NfeDetalheTransfCreditoModel? nfeDetalheTransfCreditoModel,
    NfeDetalheIbsZfmModel? nfeDetalheIbsZfmModel,
    NfeDetalheDfeReferenciadoModel? nfeDetalheDfeReferenciadoModel,
    List<NfeDetEspecificoArmamentoModel>? nfeDetEspecificoArmamentoModelList,
    List<NfeDeclaracaoImportacaoModel>? nfeDeclaracaoImportacaoModelList,
    List<NfeExportacaoModel>? nfeExportacaoModelList,
    List<NfeItemRastreadoModel>? nfeItemRastreadoModelList,
    ProdutoModel? produtoModel,
  }) {
    this.nfeDetEspecificoVeiculoModel = nfeDetEspecificoVeiculoModel ?? NfeDetEspecificoVeiculoModel();
    this.nfeDetEspecificoMedicamentoModel = nfeDetEspecificoMedicamentoModel ?? NfeDetEspecificoMedicamentoModel();
    this.nfeDetEspecificoCombustivelModel = nfeDetEspecificoCombustivelModel ?? NfeDetEspecificoCombustivelModel();
    this.nfeDetalheImpostoIcmsModel = nfeDetalheImpostoIcmsModel ?? NfeDetalheImpostoIcmsModel();
    this.nfeDetalheImpostoIpiModel = nfeDetalheImpostoIpiModel ?? NfeDetalheImpostoIpiModel();
    this.nfeDetalheImpostoIiModel = nfeDetalheImpostoIiModel ?? NfeDetalheImpostoIiModel();
    this.nfeDetalheImpostoPisModel = nfeDetalheImpostoPisModel ?? NfeDetalheImpostoPisModel();
    this.nfeDetalheImpostoPisStModel = nfeDetalheImpostoPisStModel ?? NfeDetalheImpostoPisStModel();
    this.nfeDetalheImpostoCofinsModel = nfeDetalheImpostoCofinsModel ?? NfeDetalheImpostoCofinsModel();
    this.nfeDetalheImpostoCofinsStModel = nfeDetalheImpostoCofinsStModel ?? NfeDetalheImpostoCofinsStModel();
    this.nfeDetalheImpostoIssqnModel = nfeDetalheImpostoIssqnModel ?? NfeDetalheImpostoIssqnModel();
    this.nfeDetalheImpostoIcmsUfdestModel = nfeDetalheImpostoIcmsUfdestModel ?? NfeDetalheImpostoIcmsUfdestModel();
    this.nfeDetalheImpostoSeletivoModel = nfeDetalheImpostoSeletivoModel ?? NfeDetalheImpostoSeletivoModel();
    this.nfeDetalheImpostoIbsUfModel = nfeDetalheImpostoIbsUfModel ?? NfeDetalheImpostoIbsUfModel();
    this.nfeDetalheImpostoIbsMunModel = nfeDetalheImpostoIbsMunModel ?? NfeDetalheImpostoIbsMunModel();
    this.nfeDetalheImpostoCbsModel = nfeDetalheImpostoCbsModel ?? NfeDetalheImpostoCbsModel();
    this.nfeDetalheTributoRegularModel = nfeDetalheTributoRegularModel ?? NfeDetalheTributoRegularModel();
    this.nfeDetalheCreditoPresumidoIbsModel = nfeDetalheCreditoPresumidoIbsModel ?? NfeDetalheCreditoPresumidoIbsModel();
    this.nfeDetalheCreditoPresumidoCbsModel = nfeDetalheCreditoPresumidoCbsModel ?? NfeDetalheCreditoPresumidoCbsModel();
    this.nfeDetalheCompraGovernoModel = nfeDetalheCompraGovernoModel ?? NfeDetalheCompraGovernoModel();
    this.nfeDetalheImpostoMonofasicoModel = nfeDetalheImpostoMonofasicoModel ?? NfeDetalheImpostoMonofasicoModel();
    this.nfeDetalheTransfCreditoModel = nfeDetalheTransfCreditoModel ?? NfeDetalheTransfCreditoModel();
    this.nfeDetalheIbsZfmModel = nfeDetalheIbsZfmModel ?? NfeDetalheIbsZfmModel();
    this.nfeDetalheDfeReferenciadoModel = nfeDetalheDfeReferenciadoModel ?? NfeDetalheDfeReferenciadoModel();
    this.nfeDetEspecificoArmamentoModelList = nfeDetEspecificoArmamentoModelList?.toList(growable: true) ?? [];
    this.nfeDeclaracaoImportacaoModelList = nfeDeclaracaoImportacaoModelList?.toList(growable: true) ?? [];
    this.nfeExportacaoModelList = nfeExportacaoModelList?.toList(growable: true) ?? [];
    this.nfeItemRastreadoModelList = nfeItemRastreadoModelList?.toList(growable: true) ?? [];
    this.produtoModel = produtoModel ?? ProdutoModel();
  }

  static List<String> dbColumns = <String>[
    'id',
    'numero_item',
    'codigo_produto',
    'gtin',
    'nome_produto',
    'ncm',
    'nve',
    'cest',
    'indicador_escala_relevante',
    'cnpj_fabricante',
    'codigo_beneficio_fiscal',
    'ex_tipi',
    'cfop',
    'unidade_comercial',
    'quantidade_comercial',
    'numero_pedido_compra',
    'item_pedido_compra',
    'numero_fci',
    'numero_recopi',
    'valor_unitario_comercial',
    'valor_bruto_produto',
    'gtin_unidade_tributavel',
    'unidade_tributavel',
    'quantidade_tributavel',
    'valor_unitario_tributavel',
    'valor_frete',
    'valor_seguro',
    'valor_desconto',
    'valor_outras_despesas',
    'entra_total',
    'valor_total_tributos',
    'percentual_devolvido',
    'valor_ipi_devolvido',
    'informacoes_adicionais',
    'valor_subtotal',
    'valor_total',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero Item',
    'Codigo Produto',
    'Gtin',
    'Nome Produto',
    'Ncm',
    'Nve',
    'Cest',
    'Indicador Escala Relevante',
    'Cnpj Fabricante',
    'Codigo Beneficio Fiscal',
    'Ex Tipi',
    'Cfop',
    'Unidade Comercial',
    'Quantidade Comercial',
    'Numero Pedido Compra',
    'Item Pedido Compra',
    'Numero Fci',
    'Numero Recopi',
    'Valor Unitario Comercial',
    'Valor Bruto Produto',
    'Gtin Unidade Tributavel',
    'Unidade Tributavel',
    'Quantidade Tributavel',
    'Valor Unitario Tributavel',
    'Valor Frete',
    'Valor Seguro',
    'Valor Desconto',
    'Valor Outras Despesas',
    'Entra Total',
    'Valor Total Tributos',
    'Percentual Devolvido',
    'Valor Ipi Devolvido',
    'Informacoes Adicionais',
    'Valor Subtotal',
    'Valor Total',
  ];

  NfeDetalheModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    idProduto = jsonData['idProduto'];
    numeroItem = jsonData['numeroItem'];
    codigoProduto = jsonData['codigoProduto'];
    codigoBarraDifGtin = jsonData['codigoBarraDifGtin'];
    codigoBarraTribDifGtin = jsonData['codigoBarraTribDifGtin'];
    gtin = jsonData['gtin'];
    nomeProduto = jsonData['nomeProduto'];
    ncm = jsonData['ncm'];
    nve = jsonData['nve'];
    cest = jsonData['cest'];
    indicadorEscalaRelevante = NfeDetalheDomain.getIndicadorEscalaRelevante(jsonData['indicadorEscalaRelevante']);
    cnpjFabricante = jsonData['cnpjFabricante'];
    codigoBeneficioFiscal = jsonData['codigoBeneficioFiscal'];
    exTipi = jsonData['exTipi'];
    cfop = jsonData['cfop'];
    unidadeComercial = jsonData['unidadeComercial'];
    quantidadeComercial = jsonData['quantidadeComercial']?.toDouble();
    numeroPedidoCompra = jsonData['numeroPedidoCompra'];
    itemPedidoCompra = jsonData['itemPedidoCompra'];
    numeroFci = jsonData['numeroFci'];
    numeroRecopi = jsonData['numeroRecopi'];
    valorUnitarioComercial = jsonData['valorUnitarioComercial']?.toDouble();
    valorBrutoProduto = jsonData['valorBrutoProduto']?.toDouble();
    gtinUnidadeTributavel = jsonData['gtinUnidadeTributavel'];
    unidadeTributavel = jsonData['unidadeTributavel'];
    quantidadeTributavel = jsonData['quantidadeTributavel']?.toDouble();
    valorUnitarioTributavel = jsonData['valorUnitarioTributavel']?.toDouble();
    valorFrete = jsonData['valorFrete']?.toDouble();
    valorSeguro = jsonData['valorSeguro']?.toDouble();
    valorDesconto = jsonData['valorDesconto']?.toDouble();
    valorOutrasDespesas = jsonData['valorOutrasDespesas']?.toDouble();
    entraTotal = NfeDetalheDomain.getEntraTotal(jsonData['entraTotal']);
    indicadorBemMovelUsado = NfeDetalheDomain.getIndicadorBemMovelUsado(jsonData['indicadorBemMovelUsado']);
    valorTotalTributos = jsonData['valorTotalTributos']?.toDouble();
    percentualDevolvido = jsonData['percentualDevolvido']?.toDouble();
    valorIpiDevolvido = jsonData['valorIpiDevolvido']?.toDouble();
    informacoesAdicionais = jsonData['informacoesAdicionais'];
    valorSubtotal = jsonData['valorSubtotal']?.toDouble();
    valorTotal = jsonData['valorTotal']?.toDouble();
    nfeDetEspecificoVeiculoModel = jsonData['nfeDetEspecificoVeiculoModel'] == null ? NfeDetEspecificoVeiculoModel() : NfeDetEspecificoVeiculoModel.fromJson(jsonData['nfeDetEspecificoVeiculoModel']);
    nfeDetEspecificoMedicamentoModel = jsonData['nfeDetEspecificoMedicamentoModel'] == null ? NfeDetEspecificoMedicamentoModel() : NfeDetEspecificoMedicamentoModel.fromJson(jsonData['nfeDetEspecificoMedicamentoModel']);
    nfeDetEspecificoCombustivelModel = jsonData['nfeDetEspecificoCombustivelModel'] == null ? NfeDetEspecificoCombustivelModel() : NfeDetEspecificoCombustivelModel.fromJson(jsonData['nfeDetEspecificoCombustivelModel']);
    nfeDetalheImpostoIcmsModel = jsonData['nfeDetalheImpostoIcmsModel'] == null ? NfeDetalheImpostoIcmsModel() : NfeDetalheImpostoIcmsModel.fromJson(jsonData['nfeDetalheImpostoIcmsModel']);
    nfeDetalheImpostoIpiModel = jsonData['nfeDetalheImpostoIpiModel'] == null ? NfeDetalheImpostoIpiModel() : NfeDetalheImpostoIpiModel.fromJson(jsonData['nfeDetalheImpostoIpiModel']);
    nfeDetalheImpostoIiModel = jsonData['nfeDetalheImpostoIiModel'] == null ? NfeDetalheImpostoIiModel() : NfeDetalheImpostoIiModel.fromJson(jsonData['nfeDetalheImpostoIiModel']);
    nfeDetalheImpostoPisModel = jsonData['nfeDetalheImpostoPisModel'] == null ? NfeDetalheImpostoPisModel() : NfeDetalheImpostoPisModel.fromJson(jsonData['nfeDetalheImpostoPisModel']);
    nfeDetalheImpostoPisStModel = jsonData['nfeDetalheImpostoPisStModel'] == null ? NfeDetalheImpostoPisStModel() : NfeDetalheImpostoPisStModel.fromJson(jsonData['nfeDetalheImpostoPisStModel']);
    nfeDetalheImpostoCofinsModel = jsonData['nfeDetalheImpostoCofinsModel'] == null ? NfeDetalheImpostoCofinsModel() : NfeDetalheImpostoCofinsModel.fromJson(jsonData['nfeDetalheImpostoCofinsModel']);
    nfeDetalheImpostoCofinsStModel = jsonData['nfeDetalheImpostoCofinsStModel'] == null ? NfeDetalheImpostoCofinsStModel() : NfeDetalheImpostoCofinsStModel.fromJson(jsonData['nfeDetalheImpostoCofinsStModel']);
    nfeDetalheImpostoIssqnModel = jsonData['nfeDetalheImpostoIssqnModel'] == null ? NfeDetalheImpostoIssqnModel() : NfeDetalheImpostoIssqnModel.fromJson(jsonData['nfeDetalheImpostoIssqnModel']);
    nfeDetalheImpostoIcmsUfdestModel = jsonData['nfeDetalheImpostoIcmsUfdestModel'] == null ? NfeDetalheImpostoIcmsUfdestModel() : NfeDetalheImpostoIcmsUfdestModel.fromJson(jsonData['nfeDetalheImpostoIcmsUfdestModel']);
    nfeDetalheImpostoSeletivoModel = jsonData['nfeDetalheImpostoSeletivoModel'] == null ? NfeDetalheImpostoSeletivoModel() : NfeDetalheImpostoSeletivoModel.fromJson(jsonData['nfeDetalheImpostoSeletivoModel']);
    nfeDetalheImpostoIbsUfModel = jsonData['nfeDetalheImpostoIbsUfModel'] == null ? NfeDetalheImpostoIbsUfModel() : NfeDetalheImpostoIbsUfModel.fromJson(jsonData['nfeDetalheImpostoIbsUfModel']);
    nfeDetalheImpostoIbsMunModel = jsonData['nfeDetalheImpostoIbsMunModel'] == null ? NfeDetalheImpostoIbsMunModel() : NfeDetalheImpostoIbsMunModel.fromJson(jsonData['nfeDetalheImpostoIbsMunModel']);
    nfeDetalheImpostoCbsModel = jsonData['nfeDetalheImpostoCbsModel'] == null ? NfeDetalheImpostoCbsModel() : NfeDetalheImpostoCbsModel.fromJson(jsonData['nfeDetalheImpostoCbsModel']);
    nfeDetalheTributoRegularModel = jsonData['nfeDetalheTributoRegularModel'] == null ? NfeDetalheTributoRegularModel() : NfeDetalheTributoRegularModel.fromJson(jsonData['nfeDetalheTributoRegularModel']);
    nfeDetalheCreditoPresumidoIbsModel = jsonData['nfeDetalheCreditoPresumidoIbsModel'] == null ? NfeDetalheCreditoPresumidoIbsModel() : NfeDetalheCreditoPresumidoIbsModel.fromJson(jsonData['nfeDetalheCreditoPresumidoIbsModel']);
    nfeDetalheCreditoPresumidoCbsModel = jsonData['nfeDetalheCreditoPresumidoCbsModel'] == null ? NfeDetalheCreditoPresumidoCbsModel() : NfeDetalheCreditoPresumidoCbsModel.fromJson(jsonData['nfeDetalheCreditoPresumidoCbsModel']);
    nfeDetalheCompraGovernoModel = jsonData['nfeDetalheCompraGovernoModel'] == null ? NfeDetalheCompraGovernoModel() : NfeDetalheCompraGovernoModel.fromJson(jsonData['nfeDetalheCompraGovernoModel']);
    nfeDetalheImpostoMonofasicoModel = jsonData['nfeDetalheImpostoMonofasicoModel'] == null ? NfeDetalheImpostoMonofasicoModel() : NfeDetalheImpostoMonofasicoModel.fromJson(jsonData['nfeDetalheImpostoMonofasicoModel']);
    nfeDetalheTransfCreditoModel = jsonData['nfeDetalheTransfCreditoModel'] == null ? NfeDetalheTransfCreditoModel() : NfeDetalheTransfCreditoModel.fromJson(jsonData['nfeDetalheTransfCreditoModel']);
    nfeDetalheIbsZfmModel = jsonData['nfeDetalheIbsZfmModel'] == null ? NfeDetalheIbsZfmModel() : NfeDetalheIbsZfmModel.fromJson(jsonData['nfeDetalheIbsZfmModel']);
    nfeDetalheDfeReferenciadoModel = jsonData['nfeDetalheDfeReferenciadoModel'] == null ? NfeDetalheDfeReferenciadoModel() : NfeDetalheDfeReferenciadoModel.fromJson(jsonData['nfeDetalheDfeReferenciadoModel']);
    nfeDetEspecificoArmamentoModelList = (jsonData['nfeDetEspecificoArmamentoModelList'] as Iterable?)?.map((m) => NfeDetEspecificoArmamentoModel.fromJson(m)).toList() ?? [];
    nfeDeclaracaoImportacaoModelList = (jsonData['nfeDeclaracaoImportacaoModelList'] as Iterable?)?.map((m) => NfeDeclaracaoImportacaoModel.fromJson(m)).toList() ?? [];
    nfeExportacaoModelList = (jsonData['nfeExportacaoModelList'] as Iterable?)?.map((m) => NfeExportacaoModel.fromJson(m)).toList() ?? [];
    nfeItemRastreadoModelList = (jsonData['nfeItemRastreadoModelList'] as Iterable?)?.map((m) => NfeItemRastreadoModel.fromJson(m)).toList() ?? [];
    produtoModel = jsonData['produtoModel'] == null ? ProdutoModel() : ProdutoModel.fromJson(jsonData['produtoModel']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['idProduto'] = idProduto != 0 ? idProduto : null;
    jsonData['numeroItem'] = numeroItem;
    jsonData['codigoProduto'] = codigoProduto;
    jsonData['codigoBarraDifGtin'] = codigoBarraDifGtin;
    jsonData['codigoBarraTribDifGtin'] = codigoBarraTribDifGtin;
    jsonData['gtin'] = gtin;
    jsonData['nomeProduto'] = nomeProduto;
    jsonData['ncm'] = ncm;
    jsonData['nve'] = nve;
    jsonData['cest'] = cest;
    jsonData['indicadorEscalaRelevante'] = NfeDetalheDomain.setIndicadorEscalaRelevante(indicadorEscalaRelevante);
    jsonData['cnpjFabricante'] = Util.removeMask(cnpjFabricante);
    jsonData['codigoBeneficioFiscal'] = codigoBeneficioFiscal;
    jsonData['exTipi'] = exTipi;
    jsonData['cfop'] = cfop;
    jsonData['unidadeComercial'] = unidadeComercial;
    jsonData['quantidadeComercial'] = quantidadeComercial;
    jsonData['numeroPedidoCompra'] = numeroPedidoCompra;
    jsonData['itemPedidoCompra'] = itemPedidoCompra;
    jsonData['numeroFci'] = numeroFci;
    jsonData['numeroRecopi'] = numeroRecopi;
    jsonData['valorUnitarioComercial'] = valorUnitarioComercial;
    jsonData['valorBrutoProduto'] = valorBrutoProduto;
    jsonData['gtinUnidadeTributavel'] = gtinUnidadeTributavel;
    jsonData['unidadeTributavel'] = unidadeTributavel;
    jsonData['quantidadeTributavel'] = quantidadeTributavel;
    jsonData['valorUnitarioTributavel'] = valorUnitarioTributavel;
    jsonData['valorFrete'] = valorFrete;
    jsonData['valorSeguro'] = valorSeguro;
    jsonData['valorDesconto'] = valorDesconto;
    jsonData['valorOutrasDespesas'] = valorOutrasDespesas;
    jsonData['entraTotal'] = NfeDetalheDomain.setEntraTotal(entraTotal);
    jsonData['indicadorBemMovelUsado'] = NfeDetalheDomain.setIndicadorBemMovelUsado(indicadorBemMovelUsado);
    jsonData['valorTotalTributos'] = valorTotalTributos;
    jsonData['percentualDevolvido'] = percentualDevolvido;
    jsonData['valorIpiDevolvido'] = valorIpiDevolvido;
    jsonData['informacoesAdicionais'] = informacoesAdicionais;
    jsonData['valorSubtotal'] = valorSubtotal;
    jsonData['valorTotal'] = valorTotal;
    jsonData['nfeDetEspecificoVeiculoModel'] = nfeDetEspecificoVeiculoModel?.toJson;
    jsonData['nfeDetEspecificoMedicamentoModel'] = nfeDetEspecificoMedicamentoModel?.toJson;
    jsonData['nfeDetEspecificoCombustivelModel'] = nfeDetEspecificoCombustivelModel?.toJson;
    jsonData['nfeDetalheImpostoIcmsModel'] = nfeDetalheImpostoIcmsModel?.toJson;
    jsonData['nfeDetalheImpostoIpiModel'] = nfeDetalheImpostoIpiModel?.toJson;
    jsonData['nfeDetalheImpostoIiModel'] = nfeDetalheImpostoIiModel?.toJson;
    jsonData['nfeDetalheImpostoPisModel'] = nfeDetalheImpostoPisModel?.toJson;
    jsonData['nfeDetalheImpostoPisStModel'] = nfeDetalheImpostoPisStModel?.toJson;
    jsonData['nfeDetalheImpostoCofinsModel'] = nfeDetalheImpostoCofinsModel?.toJson;
    jsonData['nfeDetalheImpostoCofinsStModel'] = nfeDetalheImpostoCofinsStModel?.toJson;
    jsonData['nfeDetalheImpostoIssqnModel'] = nfeDetalheImpostoIssqnModel?.toJson;
    jsonData['nfeDetalheImpostoIcmsUfdestModel'] = nfeDetalheImpostoIcmsUfdestModel?.toJson;
    jsonData['nfeDetalheImpostoSeletivoModel'] = nfeDetalheImpostoSeletivoModel?.toJson;
    jsonData['nfeDetalheImpostoIbsUfModel'] = nfeDetalheImpostoIbsUfModel?.toJson;
    jsonData['nfeDetalheImpostoIbsMunModel'] = nfeDetalheImpostoIbsMunModel?.toJson;
    jsonData['nfeDetalheImpostoCbsModel'] = nfeDetalheImpostoCbsModel?.toJson;
    jsonData['nfeDetalheTributoRegularModel'] = nfeDetalheTributoRegularModel?.toJson;
    jsonData['nfeDetalheCreditoPresumidoIbsModel'] = nfeDetalheCreditoPresumidoIbsModel?.toJson;
    jsonData['nfeDetalheCreditoPresumidoCbsModel'] = nfeDetalheCreditoPresumidoCbsModel?.toJson;
    jsonData['nfeDetalheCompraGovernoModel'] = nfeDetalheCompraGovernoModel?.toJson;
    jsonData['nfeDetalheImpostoMonofasicoModel'] = nfeDetalheImpostoMonofasicoModel?.toJson;
    jsonData['nfeDetalheTransfCreditoModel'] = nfeDetalheTransfCreditoModel?.toJson;
    jsonData['nfeDetalheIbsZfmModel'] = nfeDetalheIbsZfmModel?.toJson;
    jsonData['nfeDetalheDfeReferenciadoModel'] = nfeDetalheDfeReferenciadoModel?.toJson;

		var nfeDetEspecificoArmamentoModelLocalList = []; 
		for (NfeDetEspecificoArmamentoModel object in nfeDetEspecificoArmamentoModelList ?? []) { 
			nfeDetEspecificoArmamentoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeDetEspecificoArmamentoModelList'] = nfeDetEspecificoArmamentoModelLocalList;
    
		var nfeDeclaracaoImportacaoModelLocalList = []; 
		for (NfeDeclaracaoImportacaoModel object in nfeDeclaracaoImportacaoModelList ?? []) { 
			nfeDeclaracaoImportacaoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeDeclaracaoImportacaoModelList'] = nfeDeclaracaoImportacaoModelLocalList;
    
		var nfeExportacaoModelLocalList = []; 
		for (NfeExportacaoModel object in nfeExportacaoModelList ?? []) { 
			nfeExportacaoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeExportacaoModelList'] = nfeExportacaoModelLocalList;
    
		var nfeItemRastreadoModelLocalList = []; 
		for (NfeItemRastreadoModel object in nfeItemRastreadoModelList ?? []) { 
			nfeItemRastreadoModelLocalList.add(object.toJson); 
		}
		jsonData['nfeItemRastreadoModelList'] = nfeItemRastreadoModelLocalList;
    jsonData['produtoModel'] = produtoModel?.toJson;
    jsonData['produto'] = produtoModel?.nome ?? '';

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetalheModel fromPlutoRow(PlutoRow row) {
    return NfeDetalheModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      idProduto: row.cells['idProduto']?.value,
      numeroItem: row.cells['numeroItem']?.value,
      codigoProduto: row.cells['codigoProduto']?.value,
      codigoBarraDifGtin: row.cells['codigoBarraDifGtin']?.value,
      codigoBarraTribDifGtin: row.cells['codigoBarraTribDifGtin']?.value,
      gtin: row.cells['gtin']?.value,
      nomeProduto: row.cells['nomeProduto']?.value,
      ncm: row.cells['ncm']?.value,
      nve: row.cells['nve']?.value,
      cest: row.cells['cest']?.value,
      indicadorEscalaRelevante: row.cells['indicadorEscalaRelevante']?.value,
      cnpjFabricante: row.cells['cnpjFabricante']?.value,
      codigoBeneficioFiscal: row.cells['codigoBeneficioFiscal']?.value,
      exTipi: row.cells['exTipi']?.value,
      cfop: row.cells['cfop']?.value,
      unidadeComercial: row.cells['unidadeComercial']?.value,
      quantidadeComercial: row.cells['quantidadeComercial']?.value,
      numeroPedidoCompra: row.cells['numeroPedidoCompra']?.value,
      itemPedidoCompra: row.cells['itemPedidoCompra']?.value,
      numeroFci: row.cells['numeroFci']?.value,
      numeroRecopi: row.cells['numeroRecopi']?.value,
      valorUnitarioComercial: row.cells['valorUnitarioComercial']?.value,
      valorBrutoProduto: row.cells['valorBrutoProduto']?.value,
      gtinUnidadeTributavel: row.cells['gtinUnidadeTributavel']?.value,
      unidadeTributavel: row.cells['unidadeTributavel']?.value,
      quantidadeTributavel: row.cells['quantidadeTributavel']?.value,
      valorUnitarioTributavel: row.cells['valorUnitarioTributavel']?.value,
      valorFrete: row.cells['valorFrete']?.value,
      valorSeguro: row.cells['valorSeguro']?.value,
      valorDesconto: row.cells['valorDesconto']?.value,
      valorOutrasDespesas: row.cells['valorOutrasDespesas']?.value,
      entraTotal: row.cells['entraTotal']?.value,
      indicadorBemMovelUsado: row.cells['indicadorBemMovelUsado']?.value,
      valorTotalTributos: row.cells['valorTotalTributos']?.value,
      percentualDevolvido: row.cells['percentualDevolvido']?.value,
      valorIpiDevolvido: row.cells['valorIpiDevolvido']?.value,
      informacoesAdicionais: row.cells['informacoesAdicionais']?.value,
      valorSubtotal: row.cells['valorSubtotal']?.value,
      valorTotal: row.cells['valorTotal']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'idProduto': PlutoCell(value: idProduto ?? 0),
        'numeroItem': PlutoCell(value: numeroItem ?? 0),
        'codigoProduto': PlutoCell(value: codigoProduto ?? ''),
        'codigoBarraDifGtin': PlutoCell(value: codigoBarraDifGtin ?? ''),
        'codigoBarraTribDifGtin': PlutoCell(value: codigoBarraTribDifGtin ?? ''),
        'gtin': PlutoCell(value: gtin ?? ''),
        'nomeProduto': PlutoCell(value: nomeProduto ?? ''),
        'ncm': PlutoCell(value: ncm ?? ''),
        'nve': PlutoCell(value: nve ?? ''),
        'cest': PlutoCell(value: cest ?? ''),
        'indicadorEscalaRelevante': PlutoCell(value: indicadorEscalaRelevante ?? ''),
        'cnpjFabricante': PlutoCell(value: cnpjFabricante ?? ''),
        'codigoBeneficioFiscal': PlutoCell(value: codigoBeneficioFiscal ?? ''),
        'exTipi': PlutoCell(value: exTipi ?? 0),
        'cfop': PlutoCell(value: cfop ?? 0),
        'unidadeComercial': PlutoCell(value: unidadeComercial ?? ''),
        'quantidadeComercial': PlutoCell(value: quantidadeComercial ?? 0.0),
        'numeroPedidoCompra': PlutoCell(value: numeroPedidoCompra ?? ''),
        'itemPedidoCompra': PlutoCell(value: itemPedidoCompra ?? 0),
        'numeroFci': PlutoCell(value: numeroFci ?? ''),
        'numeroRecopi': PlutoCell(value: numeroRecopi ?? ''),
        'valorUnitarioComercial': PlutoCell(value: valorUnitarioComercial ?? 0.0),
        'valorBrutoProduto': PlutoCell(value: valorBrutoProduto ?? 0.0),
        'gtinUnidadeTributavel': PlutoCell(value: gtinUnidadeTributavel ?? ''),
        'unidadeTributavel': PlutoCell(value: unidadeTributavel ?? ''),
        'quantidadeTributavel': PlutoCell(value: quantidadeTributavel ?? 0.0),
        'valorUnitarioTributavel': PlutoCell(value: valorUnitarioTributavel ?? 0.0),
        'valorFrete': PlutoCell(value: valorFrete ?? 0.0),
        'valorSeguro': PlutoCell(value: valorSeguro ?? 0.0),
        'valorDesconto': PlutoCell(value: valorDesconto ?? 0.0),
        'valorOutrasDespesas': PlutoCell(value: valorOutrasDespesas ?? 0.0),
        'entraTotal': PlutoCell(value: entraTotal ?? ''),
        'indicadorBemMovelUsado': PlutoCell(value: indicadorBemMovelUsado ?? ''),
        'valorTotalTributos': PlutoCell(value: valorTotalTributos ?? 0.0),
        'percentualDevolvido': PlutoCell(value: percentualDevolvido ?? 0.0),
        'valorIpiDevolvido': PlutoCell(value: valorIpiDevolvido ?? 0.0),
        'informacoesAdicionais': PlutoCell(value: informacoesAdicionais ?? ''),
        'valorSubtotal': PlutoCell(value: valorSubtotal ?? 0.0),
        'valorTotal': PlutoCell(value: valorTotal ?? 0.0),
        'produto': PlutoCell(value: produtoModel?.nome ?? ''),
      },
    );
  }

  NfeDetalheModel clone() {
    return NfeDetalheModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      idProduto: idProduto,
      numeroItem: numeroItem,
      codigoProduto: codigoProduto,
      codigoBarraDifGtin: codigoBarraDifGtin,
      codigoBarraTribDifGtin: codigoBarraTribDifGtin,
      gtin: gtin,
      nomeProduto: nomeProduto,
      ncm: ncm,
      nve: nve,
      cest: cest,
      indicadorEscalaRelevante: indicadorEscalaRelevante,
      cnpjFabricante: cnpjFabricante,
      codigoBeneficioFiscal: codigoBeneficioFiscal,
      exTipi: exTipi,
      cfop: cfop,
      unidadeComercial: unidadeComercial,
      quantidadeComercial: quantidadeComercial,
      numeroPedidoCompra: numeroPedidoCompra,
      itemPedidoCompra: itemPedidoCompra,
      numeroFci: numeroFci,
      numeroRecopi: numeroRecopi,
      valorUnitarioComercial: valorUnitarioComercial,
      valorBrutoProduto: valorBrutoProduto,
      gtinUnidadeTributavel: gtinUnidadeTributavel,
      unidadeTributavel: unidadeTributavel,
      quantidadeTributavel: quantidadeTributavel,
      valorUnitarioTributavel: valorUnitarioTributavel,
      valorFrete: valorFrete,
      valorSeguro: valorSeguro,
      valorDesconto: valorDesconto,
      valorOutrasDespesas: valorOutrasDespesas,
      entraTotal: entraTotal,
      indicadorBemMovelUsado: indicadorBemMovelUsado,
      valorTotalTributos: valorTotalTributos,
      percentualDevolvido: percentualDevolvido,
      valorIpiDevolvido: valorIpiDevolvido,
      informacoesAdicionais: informacoesAdicionais,
      valorSubtotal: valorSubtotal,
      valorTotal: valorTotal,
      nfeDetEspecificoVeiculoModel: nfeDetEspecificoVeiculoModel?.clone(),
      nfeDetEspecificoMedicamentoModel: nfeDetEspecificoMedicamentoModel?.clone(),
      nfeDetEspecificoCombustivelModel: nfeDetEspecificoCombustivelModel?.clone(),
      nfeDetalheImpostoIcmsModel: nfeDetalheImpostoIcmsModel?.clone(),
      nfeDetalheImpostoIpiModel: nfeDetalheImpostoIpiModel?.clone(),
      nfeDetalheImpostoIiModel: nfeDetalheImpostoIiModel?.clone(),
      nfeDetalheImpostoPisModel: nfeDetalheImpostoPisModel?.clone(),
      nfeDetalheImpostoPisStModel: nfeDetalheImpostoPisStModel?.clone(),
      nfeDetalheImpostoCofinsModel: nfeDetalheImpostoCofinsModel?.clone(),
      nfeDetalheImpostoCofinsStModel: nfeDetalheImpostoCofinsStModel?.clone(),
      nfeDetalheImpostoIssqnModel: nfeDetalheImpostoIssqnModel?.clone(),
      nfeDetalheImpostoIcmsUfdestModel: nfeDetalheImpostoIcmsUfdestModel?.clone(),
      nfeDetalheImpostoSeletivoModel: nfeDetalheImpostoSeletivoModel?.clone(),
      nfeDetalheImpostoIbsUfModel: nfeDetalheImpostoIbsUfModel?.clone(),
      nfeDetalheImpostoIbsMunModel: nfeDetalheImpostoIbsMunModel?.clone(),
      nfeDetalheImpostoCbsModel: nfeDetalheImpostoCbsModel?.clone(),
      nfeDetalheTributoRegularModel: nfeDetalheTributoRegularModel?.clone(),
      nfeDetalheCreditoPresumidoIbsModel: nfeDetalheCreditoPresumidoIbsModel?.clone(),
      nfeDetalheCreditoPresumidoCbsModel: nfeDetalheCreditoPresumidoCbsModel?.clone(),
      nfeDetalheCompraGovernoModel: nfeDetalheCompraGovernoModel?.clone(),
      nfeDetalheImpostoMonofasicoModel: nfeDetalheImpostoMonofasicoModel?.clone(),
      nfeDetalheTransfCreditoModel: nfeDetalheTransfCreditoModel?.clone(),
      nfeDetalheIbsZfmModel: nfeDetalheIbsZfmModel?.clone(),
      nfeDetalheDfeReferenciadoModel: nfeDetalheDfeReferenciadoModel?.clone(),
      nfeDetEspecificoArmamentoModelList: nfeDetEspecificoArmamentoModelListClone(nfeDetEspecificoArmamentoModelList!),
      nfeDeclaracaoImportacaoModelList: nfeDeclaracaoImportacaoModelListClone(nfeDeclaracaoImportacaoModelList!),
      nfeExportacaoModelList: nfeExportacaoModelListClone(nfeExportacaoModelList!),
      nfeItemRastreadoModelList: nfeItemRastreadoModelListClone(nfeItemRastreadoModelList!),
      produtoModel: produtoModel?.clone(),
    );
  }

  nfeDetEspecificoArmamentoModelListClone(List<NfeDetEspecificoArmamentoModel> nfeDetEspecificoArmamentoModelList) { 
		List<NfeDetEspecificoArmamentoModel> resultList = [];
		for (var nfeDetEspecificoArmamentoModel in nfeDetEspecificoArmamentoModelList) {
			resultList.add(nfeDetEspecificoArmamentoModel.clone());
		}
		return resultList;
	}

  nfeDeclaracaoImportacaoModelListClone(List<NfeDeclaracaoImportacaoModel> nfeDeclaracaoImportacaoModelList) { 
		List<NfeDeclaracaoImportacaoModel> resultList = [];
		for (var nfeDeclaracaoImportacaoModel in nfeDeclaracaoImportacaoModelList) {
			resultList.add(nfeDeclaracaoImportacaoModel.clone());
		}
		return resultList;
	}

  nfeExportacaoModelListClone(List<NfeExportacaoModel> nfeExportacaoModelList) { 
		List<NfeExportacaoModel> resultList = [];
		for (var nfeExportacaoModel in nfeExportacaoModelList) {
			resultList.add(nfeExportacaoModel.clone());
		}
		return resultList;
	}

  nfeItemRastreadoModelListClone(List<NfeItemRastreadoModel> nfeItemRastreadoModelList) { 
		List<NfeItemRastreadoModel> resultList = [];
		for (var nfeItemRastreadoModel in nfeItemRastreadoModelList) {
			resultList.add(nfeItemRastreadoModel.clone());
		}
		return resultList;
	}


}