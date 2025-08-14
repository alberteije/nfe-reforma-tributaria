import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoIiController extends ControllerBase<NfeDetalheImpostoIiModel, void> {

  NfeDetalheImpostoIiController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIiModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIiModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_ii";
    screenTitle = "Imposto Importação";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIiModel = NfeDetalheImpostoIiModel().obs;
  NfeDetalheImpostoIiModel get nfeDetalheImpostoIiModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoIiModel ?? NfeDetalheImpostoIiModel();
  set nfeDetalheImpostoIiModel(value) => _nfeDetalheImpostoIiModel.value = value ?? NfeDetalheImpostoIiModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIiScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIiFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIiModel createNewModel() => NfeDetalheImpostoIiModel();

  @override
  final standardFieldForFilter = "";

  final valorBcIiController = MoneyMaskedTextController();
  final valorDespesasAduaneirasController = MoneyMaskedTextController();
  final valorImpostoImportacaoController = MoneyMaskedTextController();
  final valorIofController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoIi) => nfeDetalheImpostoIi.toJson).toList();
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
    valorBcIiController.updateValue(0);
    valorDespesasAduaneirasController.updateValue(0);
    valorImpostoImportacaoController.updateValue(0);
    valorIofController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    valorBcIiController.updateValue(nfeDetalheImpostoIiModel.valorBcIi ?? 0);
    valorDespesasAduaneirasController.updateValue(nfeDetalheImpostoIiModel.valorDespesasAduaneiras ?? 0);
    valorImpostoImportacaoController.updateValue(nfeDetalheImpostoIiModel.valorImpostoImportacao ?? 0);
    valorIofController.updateValue(nfeDetalheImpostoIiModel.valorIof ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    valorBcIiController.dispose();
    valorDespesasAduaneirasController.dispose();
    valorImpostoImportacaoController.dispose();
    valorIofController.dispose();
  }

}