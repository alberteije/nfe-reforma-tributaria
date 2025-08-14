import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoCofinsController extends ControllerBase<NfeDetalheImpostoCofinsModel, void> {

  NfeDetalheImpostoCofinsController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoCofinsModel.dbColumns;
    aliasColumns = NfeDetalheImpostoCofinsModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_cofins";
    screenTitle = "COFINS";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoCofinsModel = NfeDetalheImpostoCofinsModel().obs;
  NfeDetalheImpostoCofinsModel get nfeDetalheImpostoCofinsModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoCofinsModel ?? NfeDetalheImpostoCofinsModel();
  set nfeDetalheImpostoCofinsModel(value) => _nfeDetalheImpostoCofinsModel.value = value ?? NfeDetalheImpostoCofinsModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoCofinsScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoCofinsFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoCofinsModel createNewModel() => NfeDetalheImpostoCofinsModel();

  @override
  final standardFieldForFilter = "";

  final cstCofinsController = TextEditingController();
  final baseCalculoCofinsController = MoneyMaskedTextController();
  final aliquotaCofinsPercentualController = MoneyMaskedTextController();
  final quantidadeVendidaController = MoneyMaskedTextController();
  final aliquotaCofinsReaisController = MoneyMaskedTextController();
  final valorCofinsController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoCofins) => nfeDetalheImpostoCofins.toJson).toList();
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
    cstCofinsController.text = '';
    baseCalculoCofinsController.updateValue(0);
    aliquotaCofinsPercentualController.updateValue(0);
    quantidadeVendidaController.updateValue(0);
    aliquotaCofinsReaisController.updateValue(0);
    valorCofinsController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    cstCofinsController.text = nfeDetalheImpostoCofinsModel.cstCofins ?? '';
    baseCalculoCofinsController.updateValue(nfeDetalheImpostoCofinsModel.baseCalculoCofins ?? 0);
    aliquotaCofinsPercentualController.updateValue(nfeDetalheImpostoCofinsModel.aliquotaCofinsPercentual ?? 0);
    quantidadeVendidaController.updateValue(nfeDetalheImpostoCofinsModel.quantidadeVendida ?? 0);
    aliquotaCofinsReaisController.updateValue(nfeDetalheImpostoCofinsModel.aliquotaCofinsReais ?? 0);
    valorCofinsController.updateValue(nfeDetalheImpostoCofinsModel.valorCofins ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    cstCofinsController.dispose();
    baseCalculoCofinsController.dispose();
    aliquotaCofinsPercentualController.dispose();
    quantidadeVendidaController.dispose();
    aliquotaCofinsReaisController.dispose();
    valorCofinsController.dispose();
  }

}