import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheCompraGovernoController extends ControllerBase<NfeDetalheCompraGovernoModel, void> {

  NfeDetalheCompraGovernoController() : super(repository: null) {
    dbColumns = NfeDetalheCompraGovernoModel.dbColumns;
    aliasColumns = NfeDetalheCompraGovernoModel.aliasColumns;
    functionName = "nfe_detalhe_compra_governo";
    screenTitle = "Compra Governamental";
  }

	String? mandatoryMessage;

  final _nfeDetalheCompraGovernoModel = NfeDetalheCompraGovernoModel().obs;
  NfeDetalheCompraGovernoModel get nfeDetalheCompraGovernoModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheCompraGovernoModel ?? NfeDetalheCompraGovernoModel();
  set nfeDetalheCompraGovernoModel(value) => _nfeDetalheCompraGovernoModel.value = value ?? NfeDetalheCompraGovernoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheCompraGovernoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheCompraGovernoFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheCompraGovernoModel createNewModel() => NfeDetalheCompraGovernoModel();

  @override
  final standardFieldForFilter = "";

  final aliquotaIbsUfController = MoneyMaskedTextController();
  final valorIbsUfController = MoneyMaskedTextController();
  final aliquotaIbsMunController = MoneyMaskedTextController();
  final valorIbsMunController = MoneyMaskedTextController();
  final aliquotaCbsController = MoneyMaskedTextController();
  final valorCbsController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheCompraGoverno) => nfeDetalheCompraGoverno.toJson).toList();
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
    aliquotaIbsUfController.updateValue(0);
    valorIbsUfController.updateValue(0);
    aliquotaIbsMunController.updateValue(0);
    valorIbsMunController.updateValue(0);
    aliquotaCbsController.updateValue(0);
    valorCbsController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    aliquotaIbsUfController.updateValue(nfeDetalheCompraGovernoModel.aliquotaIbsUf ?? 0);
    valorIbsUfController.updateValue(nfeDetalheCompraGovernoModel.valorIbsUf ?? 0);
    aliquotaIbsMunController.updateValue(nfeDetalheCompraGovernoModel.aliquotaIbsMun ?? 0);
    valorIbsMunController.updateValue(nfeDetalheCompraGovernoModel.valorIbsMun ?? 0);
    aliquotaCbsController.updateValue(nfeDetalheCompraGovernoModel.aliquotaCbs ?? 0);
    valorCbsController.updateValue(nfeDetalheCompraGovernoModel.valorCbs ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    aliquotaIbsUfController.dispose();
    valorIbsUfController.dispose();
    aliquotaIbsMunController.dispose();
    valorIbsMunController.dispose();
    aliquotaCbsController.dispose();
    valorCbsController.dispose();
  }

}