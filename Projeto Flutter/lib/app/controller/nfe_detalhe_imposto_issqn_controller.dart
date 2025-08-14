import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart' show CustomDropdownButtonController;

class NfeDetalheImpostoIssqnController extends ControllerBase<NfeDetalheImpostoIssqnModel, void> {

  NfeDetalheImpostoIssqnController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIssqnModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIssqnModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_issqn";
    screenTitle = "ISSQN";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIssqnModel = NfeDetalheImpostoIssqnModel().obs;
  NfeDetalheImpostoIssqnModel get nfeDetalheImpostoIssqnModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoIssqnModel ?? NfeDetalheImpostoIssqnModel();
  set nfeDetalheImpostoIssqnModel(value) => _nfeDetalheImpostoIssqnModel.value = value ?? NfeDetalheImpostoIssqnModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIssqnScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIssqnFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIssqnModel createNewModel() => NfeDetalheImpostoIssqnModel();

  @override
  final standardFieldForFilter = "";

  final baseCalculoIssqnController = MoneyMaskedTextController();
  final aliquotaIssqnController = MoneyMaskedTextController();
  final valorIssqnController = MoneyMaskedTextController();
  final municipioIssqnController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final itemListaServicosController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final valorDeducaoController = MoneyMaskedTextController();
  final valorOutrasRetencoesController = MoneyMaskedTextController();
  final valorDescontoIncondicionadoController = MoneyMaskedTextController();
  final valorDescontoCondicionadoController = MoneyMaskedTextController();
  final valorRetencaoIssController = MoneyMaskedTextController();
  final codigoServicoController = TextEditingController();
  final municipioIncidenciaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final paisSevicoPrestadoController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final numeroProcessoController = TextEditingController();
	final indicadorExigibilidadeIssController = CustomDropdownButtonController('1=Exigível');
	final indicadorIncentivoFiscalController = CustomDropdownButtonController('1=Sim');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoIssqn) => nfeDetalheImpostoIssqn.toJson).toList();
  }

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  Future<void> loadData() async {}

  @override
  void prepareForInsert() {}

  @override
  void selectRowForEditingById(int id) {}

  void _resetForm() {
    formWasChangedDetail = false;
    baseCalculoIssqnController.updateValue(0);
    aliquotaIssqnController.updateValue(0);
    valorIssqnController.updateValue(0);
    municipioIssqnController.updateValue(0);
    itemListaServicosController.updateValue(0);
    valorDeducaoController.updateValue(0);
    valorOutrasRetencoesController.updateValue(0);
    valorDescontoIncondicionadoController.updateValue(0);
    valorDescontoCondicionadoController.updateValue(0);
    valorRetencaoIssController.updateValue(0);
    codigoServicoController.text = '';
    municipioIncidenciaController.updateValue(0);
    paisSevicoPrestadoController.updateValue(0);
    numeroProcessoController.text = '';
    indicadorExigibilidadeIssController.selected = '1=Exigível';
    indicadorIncentivoFiscalController.selected = '1=Sim';
  }

  void updateControllersFromModel() {
		_resetForm();
    baseCalculoIssqnController.updateValue(nfeDetalheImpostoIssqnModel.baseCalculoIssqn ?? 0);
    aliquotaIssqnController.updateValue(nfeDetalheImpostoIssqnModel.aliquotaIssqn ?? 0);
    valorIssqnController.updateValue(nfeDetalheImpostoIssqnModel.valorIssqn ?? 0);
    municipioIssqnController.updateValue((nfeDetalheImpostoIssqnModel.municipioIssqn ?? 0).toDouble());
    itemListaServicosController.updateValue((nfeDetalheImpostoIssqnModel.itemListaServicos ?? 0).toDouble());
    valorDeducaoController.updateValue(nfeDetalheImpostoIssqnModel.valorDeducao ?? 0);
    valorOutrasRetencoesController.updateValue(nfeDetalheImpostoIssqnModel.valorOutrasRetencoes ?? 0);
    valorDescontoIncondicionadoController.updateValue(nfeDetalheImpostoIssqnModel.valorDescontoIncondicionado ?? 0);
    valorDescontoCondicionadoController.updateValue(nfeDetalheImpostoIssqnModel.valorDescontoCondicionado ?? 0);
    valorRetencaoIssController.updateValue(nfeDetalheImpostoIssqnModel.valorRetencaoIss ?? 0);
    codigoServicoController.text = nfeDetalheImpostoIssqnModel.codigoServico ?? '';
    municipioIncidenciaController.updateValue((nfeDetalheImpostoIssqnModel.municipioIncidencia ?? 0).toDouble());
    paisSevicoPrestadoController.updateValue((nfeDetalheImpostoIssqnModel.paisSevicoPrestado ?? 0).toDouble());
    numeroProcessoController.text = nfeDetalheImpostoIssqnModel.numeroProcesso ?? '';
    indicadorExigibilidadeIssController.selected = currentModel.indicadorExigibilidadeIss ?? '1=Exigível';
    indicadorIncentivoFiscalController.selected = currentModel.indicadorIncentivoFiscal ?? '1=Sim';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    baseCalculoIssqnController.dispose();
    aliquotaIssqnController.dispose();
    valorIssqnController.dispose();
    municipioIssqnController.dispose();
    itemListaServicosController.dispose();
    valorDeducaoController.dispose();
    valorOutrasRetencoesController.dispose();
    valorDescontoIncondicionadoController.dispose();
    valorDescontoCondicionadoController.dispose();
    valorRetencaoIssController.dispose();
    codigoServicoController.dispose();
    municipioIncidenciaController.dispose();
    paisSevicoPrestadoController.dispose();
    numeroProcessoController.dispose();
    indicadorExigibilidadeIssController.dispose();
    indicadorIncentivoFiscalController.dispose();
  }

}