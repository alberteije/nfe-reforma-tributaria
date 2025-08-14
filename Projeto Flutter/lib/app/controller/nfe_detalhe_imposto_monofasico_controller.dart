import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoMonofasicoController extends ControllerBase<NfeDetalheImpostoMonofasicoModel, void> {

  NfeDetalheImpostoMonofasicoController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoMonofasicoModel.dbColumns;
    aliasColumns = NfeDetalheImpostoMonofasicoModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_monofasico";
    screenTitle = "Imposto Monofásico";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoMonofasicoModel = NfeDetalheImpostoMonofasicoModel().obs;
  NfeDetalheImpostoMonofasicoModel get nfeDetalheImpostoMonofasicoModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheImpostoMonofasicoModel ?? NfeDetalheImpostoMonofasicoModel();
  set nfeDetalheImpostoMonofasicoModel(value) => _nfeDetalheImpostoMonofasicoModel.value = value ?? NfeDetalheImpostoMonofasicoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoMonofasicoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoMonofasicoFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoMonofasicoModel createNewModel() => NfeDetalheImpostoMonofasicoModel();

  @override
  final standardFieldForFilter = "";

  final quantidadeTributadaController = MoneyMaskedTextController();
  final aliquotaIbsController = MoneyMaskedTextController();
  final aliquotaCbsController = MoneyMaskedTextController();
  final valorIbsController = MoneyMaskedTextController();
  final valorCbsController = MoneyMaskedTextController();
  final quantidadeTributadaRetencaoController = MoneyMaskedTextController();
  final aliquotaIbsRetencaoController = MoneyMaskedTextController();
  final valorIbsRetencaoController = MoneyMaskedTextController();
  final aliquotaCbsRetencaoController = MoneyMaskedTextController();
  final valorCbsRetencaoController = MoneyMaskedTextController();
  final quantidadeTributadaRetidoController = MoneyMaskedTextController();
  final aliquotaIbsRetidoController = MoneyMaskedTextController();
  final valorIbsRetidoController = MoneyMaskedTextController();
  final aliquotaCbsRetidoController = MoneyMaskedTextController();
  final valorCbsRetidoController = MoneyMaskedTextController();
  final percentualIbsDiferidoController = MoneyMaskedTextController();
  final valorIbsDiferidoController = MoneyMaskedTextController();
  final percentualCbsDiferidoController = MoneyMaskedTextController();
  final valorCbsDiferidoController = MoneyMaskedTextController();
  final totalIbsController = MoneyMaskedTextController();
  final totalCbsController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoMonofasico) => nfeDetalheImpostoMonofasico.toJson).toList();
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
    quantidadeTributadaController.updateValue(0);
    aliquotaIbsController.updateValue(0);
    aliquotaCbsController.updateValue(0);
    valorIbsController.updateValue(0);
    valorCbsController.updateValue(0);
    quantidadeTributadaRetencaoController.updateValue(0);
    aliquotaIbsRetencaoController.updateValue(0);
    valorIbsRetencaoController.updateValue(0);
    aliquotaCbsRetencaoController.updateValue(0);
    valorCbsRetencaoController.updateValue(0);
    quantidadeTributadaRetidoController.updateValue(0);
    aliquotaIbsRetidoController.updateValue(0);
    valorIbsRetidoController.updateValue(0);
    aliquotaCbsRetidoController.updateValue(0);
    valorCbsRetidoController.updateValue(0);
    percentualIbsDiferidoController.updateValue(0);
    valorIbsDiferidoController.updateValue(0);
    percentualCbsDiferidoController.updateValue(0);
    valorCbsDiferidoController.updateValue(0);
    totalIbsController.updateValue(0);
    totalCbsController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    quantidadeTributadaController.updateValue(nfeDetalheImpostoMonofasicoModel.quantidadeTributada ?? 0);
    aliquotaIbsController.updateValue(nfeDetalheImpostoMonofasicoModel.aliquotaIbs ?? 0);
    aliquotaCbsController.updateValue(nfeDetalheImpostoMonofasicoModel.aliquotaCbs ?? 0);
    valorIbsController.updateValue(nfeDetalheImpostoMonofasicoModel.valorIbs ?? 0);
    valorCbsController.updateValue(nfeDetalheImpostoMonofasicoModel.valorCbs ?? 0);
    quantidadeTributadaRetencaoController.updateValue(nfeDetalheImpostoMonofasicoModel.quantidadeTributadaRetencao ?? 0);
    aliquotaIbsRetencaoController.updateValue(nfeDetalheImpostoMonofasicoModel.aliquotaIbsRetencao ?? 0);
    valorIbsRetencaoController.updateValue(nfeDetalheImpostoMonofasicoModel.valorIbsRetencao ?? 0);
    aliquotaCbsRetencaoController.updateValue(nfeDetalheImpostoMonofasicoModel.aliquotaCbsRetencao ?? 0);
    valorCbsRetencaoController.updateValue(nfeDetalheImpostoMonofasicoModel.valorCbsRetencao ?? 0);
    quantidadeTributadaRetidoController.updateValue(nfeDetalheImpostoMonofasicoModel.quantidadeTributadaRetido ?? 0);
    aliquotaIbsRetidoController.updateValue(nfeDetalheImpostoMonofasicoModel.aliquotaIbsRetido ?? 0);
    valorIbsRetidoController.updateValue(nfeDetalheImpostoMonofasicoModel.valorIbsRetido ?? 0);
    aliquotaCbsRetidoController.updateValue(nfeDetalheImpostoMonofasicoModel.aliquotaCbsRetido ?? 0);
    valorCbsRetidoController.updateValue(nfeDetalheImpostoMonofasicoModel.valorCbsRetido ?? 0);
    percentualIbsDiferidoController.updateValue(nfeDetalheImpostoMonofasicoModel.percentualIbsDiferido ?? 0);
    valorIbsDiferidoController.updateValue(nfeDetalheImpostoMonofasicoModel.valorIbsDiferido ?? 0);
    percentualCbsDiferidoController.updateValue(nfeDetalheImpostoMonofasicoModel.percentualCbsDiferido ?? 0);
    valorCbsDiferidoController.updateValue(nfeDetalheImpostoMonofasicoModel.valorCbsDiferido ?? 0);
    totalIbsController.updateValue(nfeDetalheImpostoMonofasicoModel.totalIbs ?? 0);
    totalCbsController.updateValue(nfeDetalheImpostoMonofasicoModel.totalCbs ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    quantidadeTributadaController.dispose();
    aliquotaIbsController.dispose();
    aliquotaCbsController.dispose();
    valorIbsController.dispose();
    valorCbsController.dispose();
    quantidadeTributadaRetencaoController.dispose();
    aliquotaIbsRetencaoController.dispose();
    valorIbsRetencaoController.dispose();
    aliquotaCbsRetencaoController.dispose();
    valorCbsRetencaoController.dispose();
    quantidadeTributadaRetidoController.dispose();
    aliquotaIbsRetidoController.dispose();
    valorIbsRetidoController.dispose();
    aliquotaCbsRetidoController.dispose();
    valorCbsRetidoController.dispose();
    percentualIbsDiferidoController.dispose();
    valorIbsDiferidoController.dispose();
    percentualCbsDiferidoController.dispose();
    valorCbsDiferidoController.dispose();
    totalIbsController.dispose();
    totalCbsController.dispose();
  }

}