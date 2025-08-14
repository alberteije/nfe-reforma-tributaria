import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheTransfCreditoController extends ControllerBase<NfeDetalheTransfCreditoModel, void> {

  NfeDetalheTransfCreditoController() : super(repository: null) {
    dbColumns = NfeDetalheTransfCreditoModel.dbColumns;
    aliasColumns = NfeDetalheTransfCreditoModel.aliasColumns;
    functionName = "nfe_detalhe_transf_credito";
    screenTitle = "Transferência de Crédito";
  }

	String? mandatoryMessage;

  final _nfeDetalheTransfCreditoModel = NfeDetalheTransfCreditoModel().obs;
  NfeDetalheTransfCreditoModel get nfeDetalheTransfCreditoModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheTransfCreditoModel ?? NfeDetalheTransfCreditoModel();
  set nfeDetalheTransfCreditoModel(value) => _nfeDetalheTransfCreditoModel.value = value ?? NfeDetalheTransfCreditoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheTransfCreditoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheTransfCreditoFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheTransfCreditoModel createNewModel() => NfeDetalheTransfCreditoModel();

  @override
  final standardFieldForFilter = "";

  final valorIbsController = MoneyMaskedTextController();
  final valorCbsController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheTransfCredito) => nfeDetalheTransfCredito.toJson).toList();
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
    valorIbsController.updateValue(0);
    valorCbsController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    valorIbsController.updateValue(nfeDetalheTransfCreditoModel.valorIbs ?? 0);
    valorCbsController.updateValue(nfeDetalheTransfCreditoModel.valorCbs ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    valorIbsController.dispose();
    valorCbsController.dispose();
  }

}