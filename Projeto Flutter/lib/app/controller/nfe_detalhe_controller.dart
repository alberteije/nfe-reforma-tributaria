import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/routes/app_routes.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheController extends ControllerBase<NfeDetalheModel, void> with GetSingleTickerProviderStateMixin {

  NfeDetalheController() : super(repository: null) {
    dbColumns = NfeDetalheModel.dbColumns;
    aliasColumns = NfeDetalheModel.aliasColumns;
    gridColumns = nfeDetalheGridColumns();
    functionName = "nfe_detalhe";
    screenTitle = "Itens da Nota";
  }

  final _nfeDetalheModel = NfeDetalheModel().obs;
  NfeDetalheModel get nfeDetalheModel => _nfeDetalheModel.value;
  set nfeDetalheModel(value) => _nfeDetalheModel.value = value ?? NfeDetalheModel();

  List<NfeDetalheModel> get nfeDetalheModelList => Get.find<NfeCabecalhoController>().currentModel.nfeDetalheModelList ?? [];

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheTabPageScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheFormKey = GlobalKey<FormState>();
  late TabController tabController;
  String? mandatoryMessage;

  @override
  NfeDetalheModel createNewModel() => NfeDetalheModel();

  @override
  final standardFieldForFilter = NfeDetalheModel.aliasColumns[NfeDetalheModel.dbColumns.indexOf('numero_item')];

  final nfeCabecalhoModelController = TextEditingController();
  final produtoModelController = TextEditingController();
  final numeroItemController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final codigoProdutoController = TextEditingController();
  final codigoBarraDifGtinController = TextEditingController();
  final codigoBarraTribDifGtinController = TextEditingController();
  final gtinController = TextEditingController();
  final nomeProdutoController = TextEditingController();
  final ncmController = TextEditingController();
  final nveController = TextEditingController();
  final cestController = TextEditingController();
  final cnpjFabricanteController = MaskedTextController(mask: '00.000.000/0000-00',);
  final codigoBeneficioFiscalController = TextEditingController();
  final exTipiController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final cfopController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final unidadeComercialController = TextEditingController();
  final quantidadeComercialController = MoneyMaskedTextController();
  final numeroPedidoCompraController = TextEditingController();
  final itemPedidoCompraController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final numeroFciController = TextEditingController();
  final numeroRecopiController = TextEditingController();
  final valorUnitarioComercialController = MoneyMaskedTextController();
  final valorBrutoProdutoController = MoneyMaskedTextController();
  final gtinUnidadeTributavelController = TextEditingController();
  final unidadeTributavelController = TextEditingController();
  final quantidadeTributavelController = MoneyMaskedTextController();
  final valorUnitarioTributavelController = MoneyMaskedTextController();
  final valorFreteController = MoneyMaskedTextController();
  final valorSeguroController = MoneyMaskedTextController();
  final valorDescontoController = MoneyMaskedTextController();
  final valorOutrasDespesasController = MoneyMaskedTextController();
  final valorTotalTributosController = MoneyMaskedTextController();
  final percentualDevolvidoController = MoneyMaskedTextController();
  final valorIpiDevolvidoController = MoneyMaskedTextController();
  final informacoesAdicionaisController = TextEditingController();
  final valorSubtotalController = MoneyMaskedTextController();
  final valorTotalController = MoneyMaskedTextController();
	final indicadorEscalaRelevanteController = CustomDropdownButtonController('Sim');
	final entraTotalController = CustomDropdownButtonController('0=Valor do item (vProd) não compõe o valor total da NF-e');
  final indicadorBemMovelUsadoController = CustomDropdownButtonController('1 - Bem Móvel Usado');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero_item'],
    'secondaryColumns': ['codigo_produto'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalhe) => nfeDetalhe.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeDetalheModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeDetalheModel = createNewModel();
    _resetForm();
    tabController.animateTo(0);
    // configureChildrenControllers();
    updateControllersFromModel();
    Get.toNamed(Routes.nfeDetalheTabPage);
  }

  void _resetForm() {
    formWasChangedDetail = false;
    nfeCabecalhoModelController.text = '';
    produtoModelController.text = '';
    numeroItemController.updateValue(0);
    codigoProdutoController.text = '';
    codigoBarraDifGtinController.text = '';
    codigoBarraTribDifGtinController.text = '';
    gtinController.text = '';
    nomeProdutoController.text = '';
    ncmController.text = '';
    nveController.text = '';
    cestController.text = '';
    cnpjFabricanteController.text = '';
    codigoBeneficioFiscalController.text = '';
    exTipiController.updateValue(0);
    cfopController.updateValue(0);
    unidadeComercialController.text = '';
    quantidadeComercialController.updateValue(0);
    numeroPedidoCompraController.text = '';
    itemPedidoCompraController.updateValue(0);
    numeroFciController.text = '';
    numeroRecopiController.text = '';
    valorUnitarioComercialController.updateValue(0);
    valorBrutoProdutoController.updateValue(0);
    gtinUnidadeTributavelController.text = '';
    unidadeTributavelController.text = '';
    quantidadeTributavelController.updateValue(0);
    valorUnitarioTributavelController.updateValue(0);
    valorFreteController.updateValue(0);
    valorSeguroController.updateValue(0);
    valorDescontoController.updateValue(0);
    valorOutrasDespesasController.updateValue(0);
    valorTotalTributosController.updateValue(0);
    percentualDevolvidoController.updateValue(0);
    valorIpiDevolvidoController.updateValue(0);
    informacoesAdicionaisController.text = '';
    valorSubtotalController.updateValue(0);
    valorTotalController.updateValue(0);
    indicadorEscalaRelevanteController.selected = 'Sim';
    entraTotalController.selected = '0=Valor do item (vProd) não compõe o valor total da NF-e';
    indicadorBemMovelUsadoController.selected = '1 - Bem Móvel Usado';
  }

  @override
  void selectRowForEditing(PlutoRow? row) async {
    if (row == null) {
      showInfoSnackBar(message: 'message_select_one_to_edited'.tr);
      return;
    }

    selectRowForEditingByTempId(row.cells['tempId']?.value);
  }

  @override
  void selectRowForEditingById(int id) {}

  void selectRowForEditingByTempId(String tempId) {
		isNewRecord = false;
    final model = nfeDetalheModelList.firstWhere((m) => m.tempId == tempId);
    nfeDetalheModel = model.clone();
		nfeDetalheModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeDetalheTabPage());
  }

  void _configureChildrenControllers() {
    //Veículo
		Get.put<NfeDetEspecificoVeiculoController>(NfeDetEspecificoVeiculoController()); 

    //Medicamento
		Get.put<NfeDetEspecificoMedicamentoController>(NfeDetEspecificoMedicamentoController()); 

    //Combustível
		Get.put<NfeDetEspecificoCombustivelController>(NfeDetEspecificoCombustivelController()); 

    //ICMS
		Get.put<NfeDetalheImpostoIcmsController>(NfeDetalheImpostoIcmsController()); 

    //IPI
		Get.put<NfeDetalheImpostoIpiController>(NfeDetalheImpostoIpiController()); 

    //Imposto Importação
		Get.put<NfeDetalheImpostoIiController>(NfeDetalheImpostoIiController()); 

    //PIS
		Get.put<NfeDetalheImpostoPisController>(NfeDetalheImpostoPisController()); 

    //PIS ST
		Get.put<NfeDetalheImpostoPisStController>(NfeDetalheImpostoPisStController()); 

    //COFINS
		Get.put<NfeDetalheImpostoCofinsController>(NfeDetalheImpostoCofinsController()); 

    //COFINS ST
		Get.put<NfeDetalheImpostoCofinsStController>(NfeDetalheImpostoCofinsStController()); 

    //ISSQN
		Get.put<NfeDetalheImpostoIssqnController>(NfeDetalheImpostoIssqnController()); 

    //ICMS UF Destinatário
		Get.put<NfeDetalheImpostoIcmsUfdestController>(NfeDetalheImpostoIcmsUfdestController()); 

    //Imposto Seletivo
		Get.put<NfeDetalheImpostoSeletivoController>(NfeDetalheImpostoSeletivoController()); 

    //IBS UF
		Get.put<NfeDetalheImpostoIbsUfController>(NfeDetalheImpostoIbsUfController()); 

    //IBS Município
		Get.put<NfeDetalheImpostoIbsMunController>(NfeDetalheImpostoIbsMunController()); 

    //CBS
		Get.put<NfeDetalheImpostoCbsController>(NfeDetalheImpostoCbsController()); 

    //Tributação Regular
		Get.put<NfeDetalheTributoRegularController>(NfeDetalheTributoRegularController()); 

    //Credito Presumido - IBS
		Get.put<NfeDetalheCreditoPresumidoIbsController>(NfeDetalheCreditoPresumidoIbsController()); 

    //Credito Presumido - CBS
		Get.put<NfeDetalheCreditoPresumidoCbsController>(NfeDetalheCreditoPresumidoCbsController()); 

    //Compra Governamental
		Get.put<NfeDetalheCompraGovernoController>(NfeDetalheCompraGovernoController()); 

    //Imposto Monofásico
		Get.put<NfeDetalheImpostoMonofasicoController>(NfeDetalheImpostoMonofasicoController()); 

    //Transferência de Crédito
		Get.put<NfeDetalheTransfCreditoController>(NfeDetalheTransfCreditoController()); 

    //IBS Zona Franca Manau
		Get.put<NfeDetalheIbsZfmController>(NfeDetalheIbsZfmController()); 

    //DFe Referenciado
		Get.put<NfeDetalheDfeReferenciadoController>(NfeDetalheDfeReferenciadoController()); 

    //Armamento
		Get.put<NfeDetEspecificoArmamentoController>(NfeDetEspecificoArmamentoController()); 

    //Declaração Importação
		Get.put<NfeDeclaracaoImportacaoController>(NfeDeclaracaoImportacaoController()); 

    //Declaração Importação - detalhes
		Get.put<NfeImportacaoDetalheController>(NfeImportacaoDetalheController()); 

    //Exportacao
		Get.put<NfeExportacaoController>(NfeExportacaoController()); 

    //Item Rastreado
		Get.put<NfeItemRastreadoController>(NfeItemRastreadoController()); 

    // update children controllers
    _updateChildrenControllersFromModel();
  }

  _releaseChildrenControllers() {
    //Veículo
		Get.delete<NfeDetEspecificoVeiculoController>(); 

    //Medicamento
		Get.delete<NfeDetEspecificoMedicamentoController>(); 

    //Combustível
		Get.delete<NfeDetEspecificoCombustivelController>(); 

    //ICMS
		Get.delete<NfeDetalheImpostoIcmsController>(); 

    //IPI
		Get.delete<NfeDetalheImpostoIpiController>(); 

    //Imposto Importação
		Get.delete<NfeDetalheImpostoIiController>(); 

    //PIS
		Get.delete<NfeDetalheImpostoPisController>(); 

    //PIS ST
		Get.delete<NfeDetalheImpostoPisStController>(); 

    //COFINS
		Get.delete<NfeDetalheImpostoCofinsController>(); 

    //COFINS ST
		Get.delete<NfeDetalheImpostoCofinsStController>(); 

    //ISSQN
		Get.delete<NfeDetalheImpostoIssqnController>(); 

    //ICMS UF Destinatário
		Get.delete<NfeDetalheImpostoIcmsUfdestController>(); 

    //Imposto Seletivo
		Get.delete<NfeDetalheImpostoSeletivoController>(); 

    //IBS UF
		Get.delete<NfeDetalheImpostoIbsUfController>(); 

    //IBS Município
		Get.delete<NfeDetalheImpostoIbsMunController>(); 

    //CBS
		Get.delete<NfeDetalheImpostoCbsController>(); 

    //Tributação Regular
		Get.delete<NfeDetalheTributoRegularController>(); 

    //Credito Presumido - IBS
		Get.delete<NfeDetalheCreditoPresumidoIbsController>(); 

    //Credito Presumido - CBS
		Get.delete<NfeDetalheCreditoPresumidoCbsController>(); 

    //Compra Governamental
		Get.delete<NfeDetalheCompraGovernoController>(); 

    //Imposto Monofásico
		Get.delete<NfeDetalheImpostoMonofasicoController>(); 

    //Transferência de Crédito
		Get.delete<NfeDetalheTransfCreditoController>(); 

    //IBS Zona Franca Manau
		Get.delete<NfeDetalheIbsZfmController>(); 

    //DFe Referenciado
		Get.delete<NfeDetalheDfeReferenciadoController>(); 

    //Armamento
		Get.delete<NfeDetEspecificoArmamentoController>(); 

    //Declaração Importação
		Get.delete<NfeDeclaracaoImportacaoController>(); 

    //Declaração Importação - detalhes
		Get.delete<NfeImportacaoDetalheController>(); 

    //Exportacao
		Get.delete<NfeExportacaoController>(); 

    //Item Rastreado
		Get.delete<NfeItemRastreadoController>(); 
  }

  void updateControllersFromModel() {
    produtoModelController.text = nfeDetalheModel.produtoModel?.nome?.toString() ?? '';
    numeroItemController.updateValue((nfeDetalheModel.numeroItem ?? 0).toDouble());
    codigoProdutoController.text = nfeDetalheModel.codigoProduto ?? '';
    codigoBarraDifGtinController.text = currentModel.codigoBarraDifGtin ?? '';
    codigoBarraTribDifGtinController.text = currentModel.codigoBarraTribDifGtin ?? '';
    gtinController.text = nfeDetalheModel.gtin ?? '';
    nomeProdutoController.text = nfeDetalheModel.nomeProduto ?? '';
    ncmController.text = nfeDetalheModel.ncm ?? '';
    nveController.text = nfeDetalheModel.nve ?? '';
    cestController.text = nfeDetalheModel.cest ?? '';
    cnpjFabricanteController.text = nfeDetalheModel.cnpjFabricante ?? '';
    codigoBeneficioFiscalController.text = nfeDetalheModel.codigoBeneficioFiscal ?? '';
    exTipiController.updateValue((nfeDetalheModel.exTipi ?? 0).toDouble());
    cfopController.updateValue((nfeDetalheModel.cfop ?? 0).toDouble());
    unidadeComercialController.text = nfeDetalheModel.unidadeComercial ?? '';
    quantidadeComercialController.updateValue(nfeDetalheModel.quantidadeComercial ?? 0);
    numeroPedidoCompraController.text = nfeDetalheModel.numeroPedidoCompra ?? '';
    itemPedidoCompraController.updateValue((nfeDetalheModel.itemPedidoCompra ?? 0).toDouble());
    numeroFciController.text = nfeDetalheModel.numeroFci ?? '';
    numeroRecopiController.text = nfeDetalheModel.numeroRecopi ?? '';
    valorUnitarioComercialController.updateValue(nfeDetalheModel.valorUnitarioComercial ?? 0);
    valorBrutoProdutoController.updateValue(nfeDetalheModel.valorBrutoProduto ?? 0);
    gtinUnidadeTributavelController.text = nfeDetalheModel.gtinUnidadeTributavel ?? '';
    unidadeTributavelController.text = nfeDetalheModel.unidadeTributavel ?? '';
    quantidadeTributavelController.updateValue(nfeDetalheModel.quantidadeTributavel ?? 0);
    valorUnitarioTributavelController.updateValue(nfeDetalheModel.valorUnitarioTributavel ?? 0);
    valorFreteController.updateValue(nfeDetalheModel.valorFrete ?? 0);
    valorSeguroController.updateValue(nfeDetalheModel.valorSeguro ?? 0);
    valorDescontoController.updateValue(nfeDetalheModel.valorDesconto ?? 0);
    valorOutrasDespesasController.updateValue(nfeDetalheModel.valorOutrasDespesas ?? 0);
    valorTotalTributosController.updateValue(nfeDetalheModel.valorTotalTributos ?? 0);
    percentualDevolvidoController.updateValue(nfeDetalheModel.percentualDevolvido ?? 0);
    valorIpiDevolvidoController.updateValue(nfeDetalheModel.valorIpiDevolvido ?? 0);
    informacoesAdicionaisController.text = nfeDetalheModel.informacoesAdicionais ?? '';
    valorSubtotalController.updateValue(nfeDetalheModel.valorSubtotal ?? 0);
    valorTotalController.updateValue(nfeDetalheModel.valorTotal ?? 0);
    indicadorEscalaRelevanteController.selected = currentModel.indicadorEscalaRelevante ?? 'Sim';
    entraTotalController.selected = currentModel.entraTotal ?? '0=Valor do item (vProd) não compõe o valor total da NF-e';
    indicadorBemMovelUsadoController.selected = currentModel.indicadorBemMovelUsado ?? '1 - Bem Móvel Usado';
    formWasChangedDetail = false;

    // update children controllers
    _updateChildrenControllersFromModel();
  }

  void _updateChildrenControllersFromModel() {
    //Veículo
		final nfeDetEspecificoVeiculoController = Get.find<NfeDetEspecificoVeiculoController>(); 
		nfeDetEspecificoVeiculoController.updateControllersFromModel(); 

    //Medicamento
		final nfeDetEspecificoMedicamentoController = Get.find<NfeDetEspecificoMedicamentoController>(); 
		nfeDetEspecificoMedicamentoController.updateControllersFromModel(); 

    //Combustível
		final nfeDetEspecificoCombustivelController = Get.find<NfeDetEspecificoCombustivelController>(); 
		nfeDetEspecificoCombustivelController.updateControllersFromModel(); 

    //ICMS
		final nfeDetalheImpostoIcmsController = Get.find<NfeDetalheImpostoIcmsController>(); 
		nfeDetalheImpostoIcmsController.updateControllersFromModel(); 

    //IPI
		final nfeDetalheImpostoIpiController = Get.find<NfeDetalheImpostoIpiController>(); 
		nfeDetalheImpostoIpiController.updateControllersFromModel(); 

    //Imposto Importação
		final nfeDetalheImpostoIiController = Get.find<NfeDetalheImpostoIiController>(); 
		nfeDetalheImpostoIiController.updateControllersFromModel(); 

    //PIS
		final nfeDetalheImpostoPisController = Get.find<NfeDetalheImpostoPisController>(); 
		nfeDetalheImpostoPisController.updateControllersFromModel(); 

    //PIS ST
		final nfeDetalheImpostoPisStController = Get.find<NfeDetalheImpostoPisStController>(); 
		nfeDetalheImpostoPisStController.updateControllersFromModel(); 

    //COFINS
		final nfeDetalheImpostoCofinsController = Get.find<NfeDetalheImpostoCofinsController>(); 
		nfeDetalheImpostoCofinsController.updateControllersFromModel(); 

    //COFINS ST
		final nfeDetalheImpostoCofinsStController = Get.find<NfeDetalheImpostoCofinsStController>(); 
		nfeDetalheImpostoCofinsStController.updateControllersFromModel(); 

    //ISSQN
		final nfeDetalheImpostoIssqnController = Get.find<NfeDetalheImpostoIssqnController>(); 
		nfeDetalheImpostoIssqnController.updateControllersFromModel(); 

    //ICMS UF Destinatário
		final nfeDetalheImpostoIcmsUfdestController = Get.find<NfeDetalheImpostoIcmsUfdestController>(); 
		nfeDetalheImpostoIcmsUfdestController.updateControllersFromModel(); 

    //Imposto Seletivo
		final nfeDetalheImpostoSeletivoController = Get.find<NfeDetalheImpostoSeletivoController>(); 
		nfeDetalheImpostoSeletivoController.updateControllersFromModel(); 

    //IBS UF
		final nfeDetalheImpostoIbsUfController = Get.find<NfeDetalheImpostoIbsUfController>(); 
		nfeDetalheImpostoIbsUfController.updateControllersFromModel(); 

    //IBS Município
		final nfeDetalheImpostoIbsMunController = Get.find<NfeDetalheImpostoIbsMunController>(); 
		nfeDetalheImpostoIbsMunController.updateControllersFromModel(); 

    //CBS
		final nfeDetalheImpostoCbsController = Get.find<NfeDetalheImpostoCbsController>(); 
		nfeDetalheImpostoCbsController.updateControllersFromModel(); 

    //Tributação Regular
		final nfeDetalheTributoRegularController = Get.find<NfeDetalheTributoRegularController>(); 
		nfeDetalheTributoRegularController.updateControllersFromModel(); 

    //Credito Presumido - IBS
		final nfeDetalheCreditoPresumidoIbsController = Get.find<NfeDetalheCreditoPresumidoIbsController>(); 
		nfeDetalheCreditoPresumidoIbsController.updateControllersFromModel(); 

    //Credito Presumido - CBS
		final nfeDetalheCreditoPresumidoCbsController = Get.find<NfeDetalheCreditoPresumidoCbsController>(); 
		nfeDetalheCreditoPresumidoCbsController.updateControllersFromModel(); 

    //Compra Governamental
		final nfeDetalheCompraGovernoController = Get.find<NfeDetalheCompraGovernoController>(); 
		nfeDetalheCompraGovernoController.updateControllersFromModel(); 

    //Imposto Monofásico
		final nfeDetalheImpostoMonofasicoController = Get.find<NfeDetalheImpostoMonofasicoController>(); 
		nfeDetalheImpostoMonofasicoController.updateControllersFromModel(); 

    //Transferência de Crédito
		final nfeDetalheTransfCreditoController = Get.find<NfeDetalheTransfCreditoController>(); 
		nfeDetalheTransfCreditoController.updateControllersFromModel(); 

    //IBS Zona Franca Manau
		final nfeDetalheIbsZfmController = Get.find<NfeDetalheIbsZfmController>(); 
		nfeDetalheIbsZfmController.updateControllersFromModel(); 

    //DFe Referenciado
		final nfeDetalheDfeReferenciadoController = Get.find<NfeDetalheDfeReferenciadoController>(); 
		nfeDetalheDfeReferenciadoController.updateControllersFromModel(); 

    //Armamento
		final nfeDetEspecificoArmamentoController = Get.find<NfeDetEspecificoArmamentoController>(); 
		nfeDetEspecificoArmamentoController.userMadeChanges = false; 

    //Declaração Importação
		final nfeDeclaracaoImportacaoController = Get.find<NfeDeclaracaoImportacaoController>(); 
		nfeDeclaracaoImportacaoController.userMadeChanges = false; 

    //Declaração Importação - detalhes
		final nfeImportacaoDetalheController = Get.find<NfeImportacaoDetalheController>(); 
		nfeImportacaoDetalheController.updateControllersFromModel(); 

    //Exportacao
		final nfeExportacaoController = Get.find<NfeExportacaoController>(); 
		nfeExportacaoController.userMadeChanges = false; 

    //Item Rastreado
		final nfeItemRastreadoController = Get.find<NfeItemRastreadoController>(); 
		nfeItemRastreadoController.userMadeChanges = false; 
  }

  @override
  Future<void> save() async {
    if (!validateCurrentForm()) return;

    if (validateForms()) {
      if (userMadeChanges()) {
        if (isNewRecord) {
          nfeDetalheModelList.insert(0, nfeDetalheModel.clone());
        } else {
          final index = nfeDetalheModelList.indexWhere((m) => m.tempId == nfeDetalheModel.tempId);
          if (index >= 0) {
            nfeDetalheModelList[index] = nfeDetalheModel.clone();
          }
        }
        loadData();
        Get.back(result: true);
      }
    } else {
      Get.back();
    }
  }

  Future callProdutoLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Id Produto]'; 
		lookupController.route = '/produto/'; 
		lookupController.gridColumns = produtoGridColumns(isForLookup: true); 
		lookupController.aliasColumns = ProdutoModel.aliasColumns; 
		lookupController.dbColumns = ProdutoModel.dbColumns; 
		lookupController.standardColumn = ProdutoModel.aliasColumns[ProdutoModel.dbColumns.indexOf('nome')]; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			nfeDetalheModel.idProduto = plutoRowResult.cells['id']!.value; 
			nfeDetalheModel.produtoModel = ProdutoModel.fromPlutoRow(plutoRowResult); 
			produtoModelController.text = nfeDetalheModel.produtoModel?.nome ?? ''; 
			formWasChangedDetail = true; 
		}
	}

  List<Tab> tabItems = [
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Itens da Nota', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Veículo', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Medicamento', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Combustível', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'ICMS', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'IPI', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Imposto Importação', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'PIS', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'PIS ST', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'COFINS', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'COFINS ST', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'ISSQN', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'ICMS UF Destinatário', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Imposto Seletivo', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'IBS UF', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'IBS Município', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'CBS', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Tributação Regular', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Credito Presumido - IBS', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Credito Presumido - CBS', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Compra Governamental', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Imposto Monofásico', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Transferência de Crédito', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'IBS Zona Franca Manau', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'DFe Referenciado', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Armamento', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Declaração Importação', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Exportacao', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Item Rastreado', 
		),
  ];

  List<Widget> tabPages() {
    return [
      NfeDetalheEditPage(),
      NfeDetEspecificoVeiculoEditPage(),
      NfeDetEspecificoMedicamentoEditPage(),
      NfeDetEspecificoCombustivelEditPage(),
      NfeDetalheImpostoIcmsEditPage(),
      NfeDetalheImpostoIpiEditPage(),
      NfeDetalheImpostoIiEditPage(),
      NfeDetalheImpostoPisEditPage(),
      NfeDetalheImpostoPisStEditPage(),
      NfeDetalheImpostoCofinsEditPage(),
      NfeDetalheImpostoCofinsStEditPage(),
      NfeDetalheImpostoIssqnEditPage(),
      NfeDetalheImpostoIcmsUfdestEditPage(),
      NfeDetalheImpostoSeletivoEditPage(),
      NfeDetalheImpostoIbsUfEditPage(),
      NfeDetalheImpostoIbsMunEditPage(),
      NfeDetalheImpostoCbsEditPage(),
      NfeDetalheTributoRegularEditPage(),
      NfeDetalheCreditoPresumidoIbsEditPage(),
      NfeDetalheCreditoPresumidoCbsEditPage(),
      NfeDetalheCompraGovernoEditPage(),
      NfeDetalheImpostoMonofasicoEditPage(),
      NfeDetalheTransfCreditoEditPage(),
      NfeDetalheIbsZfmEditPage(),
      NfeDetalheDfeReferenciadoEditPage(),
      const NfeDetEspecificoArmamentoListPage(),
      const NfeDeclaracaoImportacaoListPage(),
      const NfeExportacaoListPage(),
      const NfeItemRastreadoListPage(),
    ];
  }

  @override
  void preventDataLoss() {
    if (userMadeChanges()) {
      showQuestionDialog('message_data_loss'.tr, () { 
        Get.back(); 
      });
    } else {
      Get.back();
    }
  }  

  bool userMadeChanges() {
    return
    formWasChangedDetail 
    || 
		Get.find<NfeDetEspecificoVeiculoController>().formWasChangedDetail
    || 
		Get.find<NfeDetEspecificoMedicamentoController>().formWasChangedDetail
    || 
		Get.find<NfeDetEspecificoCombustivelController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIcmsController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIpiController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIiController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoPisController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoPisStController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoCofinsController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoCofinsStController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIssqnController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIcmsUfdestController>().formWasChangedDetail
    || 
		Get.find<NfeDetEspecificoArmamentoController>().userMadeChanges
    || 
		Get.find<NfeDeclaracaoImportacaoController>().userMadeChanges
    || 
		Get.find<NfeExportacaoController>().userMadeChanges
    || 
		Get.find<NfeItemRastreadoController>().userMadeChanges
    || 
		Get.find<NfeDetalheImpostoSeletivoController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIbsUfController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoIbsMunController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoCbsController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheTributoRegularController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheCreditoPresumidoIbsController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheCreditoPresumidoCbsController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheCompraGovernoController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheImpostoMonofasicoController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheTransfCreditoController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheIbsZfmController>().formWasChangedDetail
    || 
		Get.find<NfeDetalheDfeReferenciadoController>().formWasChangedDetail
    ;
  }

  void tabChange(int index) {
    validateCurrentForm();
  }

  bool validateCurrentForm() {
    return true;
  }

  bool validateForms() {
    final resultNfeDetEspecificoVeiculo = Get.find<NfeDetEspecificoVeiculoController>().validateForm(); 
		if (!resultNfeDetEspecificoVeiculo) { 
			tabController.animateTo(1); 
			return false; 
		}
    final resultNfeDetEspecificoMedicamento = Get.find<NfeDetEspecificoMedicamentoController>().validateForm(); 
		if (!resultNfeDetEspecificoMedicamento) { 
			tabController.animateTo(2); 
			return false; 
		}
    final resultNfeDetEspecificoCombustivel = Get.find<NfeDetEspecificoCombustivelController>().validateForm(); 
		if (!resultNfeDetEspecificoCombustivel) { 
			tabController.animateTo(3); 
			return false; 
		}
    final resultNfeDetalheImpostoIcms = Get.find<NfeDetalheImpostoIcmsController>().validateForm(); 
		if (!resultNfeDetalheImpostoIcms) { 
			tabController.animateTo(4); 
			return false; 
		}
    final resultNfeDetalheImpostoIpi = Get.find<NfeDetalheImpostoIpiController>().validateForm(); 
		if (!resultNfeDetalheImpostoIpi) { 
			tabController.animateTo(5); 
			return false; 
		}
    final resultNfeDetalheImpostoIi = Get.find<NfeDetalheImpostoIiController>().validateForm(); 
		if (!resultNfeDetalheImpostoIi) { 
			tabController.animateTo(6); 
			return false; 
		}
    final resultNfeDetalheImpostoPis = Get.find<NfeDetalheImpostoPisController>().validateForm(); 
		if (!resultNfeDetalheImpostoPis) { 
			tabController.animateTo(7); 
			return false; 
		}
    final resultNfeDetalheImpostoPisSt = Get.find<NfeDetalheImpostoPisStController>().validateForm(); 
		if (!resultNfeDetalheImpostoPisSt) { 
			tabController.animateTo(8); 
			return false; 
		}
    final resultNfeDetalheImpostoCofins = Get.find<NfeDetalheImpostoCofinsController>().validateForm(); 
		if (!resultNfeDetalheImpostoCofins) { 
			tabController.animateTo(9); 
			return false; 
		}
    final resultNfeDetalheImpostoCofinsSt = Get.find<NfeDetalheImpostoCofinsStController>().validateForm(); 
		if (!resultNfeDetalheImpostoCofinsSt) { 
			tabController.animateTo(10); 
			return false; 
		}
    final resultNfeDetalheImpostoIssqn = Get.find<NfeDetalheImpostoIssqnController>().validateForm(); 
		if (!resultNfeDetalheImpostoIssqn) { 
			tabController.animateTo(11); 
			return false; 
		}
    final resultNfeDetalheImpostoIcmsUfdest = Get.find<NfeDetalheImpostoIcmsUfdestController>().validateForm(); 
		if (!resultNfeDetalheImpostoIcmsUfdest) { 
			tabController.animateTo(12); 
			return false; 
		}
    final resultNfeDetalheImpostoSeletivo = Get.find<NfeDetalheImpostoSeletivoController>().validateForm(); 
		if (!resultNfeDetalheImpostoSeletivo) { 
			tabController.animateTo(13); 
			return false; 
		}
    final resultNfeDetalheImpostoIbsUf = Get.find<NfeDetalheImpostoIbsUfController>().validateForm(); 
		if (!resultNfeDetalheImpostoIbsUf) { 
			tabController.animateTo(14); 
			return false; 
		}
    final resultNfeDetalheImpostoIbsMun = Get.find<NfeDetalheImpostoIbsMunController>().validateForm(); 
		if (!resultNfeDetalheImpostoIbsMun) { 
			tabController.animateTo(15); 
			return false; 
		}
    final resultNfeDetalheImpostoCbs = Get.find<NfeDetalheImpostoCbsController>().validateForm(); 
		if (!resultNfeDetalheImpostoCbs) { 
			tabController.animateTo(16); 
			return false; 
		}
    final resultNfeDetalheTributoRegular = Get.find<NfeDetalheTributoRegularController>().validateForm(); 
		if (!resultNfeDetalheTributoRegular) { 
			tabController.animateTo(17); 
			return false; 
		}
    final resultNfeDetalheCreditoPresumidoIbs = Get.find<NfeDetalheCreditoPresumidoIbsController>().validateForm(); 
		if (!resultNfeDetalheCreditoPresumidoIbs) { 
			tabController.animateTo(18); 
			return false; 
		}
    final resultNfeDetalheCreditoPresumidoCbs = Get.find<NfeDetalheCreditoPresumidoCbsController>().validateForm(); 
		if (!resultNfeDetalheCreditoPresumidoCbs) { 
			tabController.animateTo(19); 
			return false; 
		}
    final resultNfeDetalheCompraGoverno = Get.find<NfeDetalheCompraGovernoController>().validateForm(); 
		if (!resultNfeDetalheCompraGoverno) { 
			tabController.animateTo(20); 
			return false; 
		}
    final resultNfeDetalheImpostoMonofasico = Get.find<NfeDetalheImpostoMonofasicoController>().validateForm(); 
		if (!resultNfeDetalheImpostoMonofasico) { 
			tabController.animateTo(21); 
			return false; 
		}
    final resultNfeDetalheTransfCredito = Get.find<NfeDetalheTransfCreditoController>().validateForm(); 
		if (!resultNfeDetalheTransfCredito) { 
			tabController.animateTo(22); 
			return false; 
		}
    final resultNfeDetalheIbsZfm = Get.find<NfeDetalheIbsZfmController>().validateForm(); 
		if (!resultNfeDetalheIbsZfm) { 
			tabController.animateTo(23); 
			return false; 
		}
    final resultNfeDetalheDfeReferenciado = Get.find<NfeDetalheDfeReferenciadoController>().validateForm(); 
		if (!resultNfeDetalheDfeReferenciado) { 
			tabController.animateTo(24); 
			return false; 
		}
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabItems.length);
    _configureChildrenControllers();
  }
	
  @override
  void onClose() {
    tabController.dispose();
    nfeCabecalhoModelController.dispose();
    produtoModelController.dispose();
    numeroItemController.dispose();
    codigoProdutoController.dispose();
    codigoBarraDifGtinController.dispose();
    codigoBarraTribDifGtinController.dispose();
    gtinController.dispose();
    nomeProdutoController.dispose();
    ncmController.dispose();
    nveController.dispose();
    cestController.dispose();
    cnpjFabricanteController.dispose();
    codigoBeneficioFiscalController.dispose();
    exTipiController.dispose();
    cfopController.dispose();
    unidadeComercialController.dispose();
    quantidadeComercialController.dispose();
    numeroPedidoCompraController.dispose();
    itemPedidoCompraController.dispose();
    numeroFciController.dispose();
    numeroRecopiController.dispose();
    valorUnitarioComercialController.dispose();
    valorBrutoProdutoController.dispose();
    gtinUnidadeTributavelController.dispose();
    unidadeTributavelController.dispose();
    quantidadeTributavelController.dispose();
    valorUnitarioTributavelController.dispose();
    valorFreteController.dispose();
    valorSeguroController.dispose();
    valorDescontoController.dispose();
    valorOutrasDespesasController.dispose();
    valorTotalTributosController.dispose();
    percentualDevolvidoController.dispose();
    valorIpiDevolvidoController.dispose();
    informacoesAdicionaisController.dispose();
    valorSubtotalController.dispose();
    valorTotalController.dispose();
    indicadorEscalaRelevanteController.dispose();
    entraTotalController.dispose();
    indicadorBemMovelUsadoController.dispose();

    _releaseChildrenControllers();
  }
}