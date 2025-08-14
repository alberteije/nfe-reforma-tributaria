import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoCofinsStController extends ControllerBase<NfeDetalheImpostoCofinsStModel, void> {

  NfeDetalheImpostoCofinsStController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoCofinsStModel.dbColumns;
    aliasColumns = NfeDetalheImpostoCofinsStModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_cofins_st";
    screenTitle = "COFINS ST";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoCofinsStModel = NfeDetalheImpostoCofinsStModel().obs;
  NfeDetalheImpostoCofinsStModel get nfeDetalheImpostoCofinsStModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoCofinsStModel ?? NfeDetalheImpostoCofinsStModel();
  set nfeDetalheImpostoCofinsStModel(value) => _nfeDetalheImpostoCofinsStModel.value = value ?? NfeDetalheImpostoCofinsStModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoCofinsStScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoCofinsStFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoCofinsStModel createNewModel() => NfeDetalheImpostoCofinsStModel();

  @override
  final standardFieldForFilter = "";

  final baseCalculoCofinsStController = MoneyMaskedTextController();
  final aliquotaCofinsStPercentualController = MoneyMaskedTextController();
  final quantidadeVendidaCofinsStController = MoneyMaskedTextController();
  final aliquotaCofinsStReaisController = MoneyMaskedTextController();
  final valorCofinsStController = MoneyMaskedTextController();
  final cofinsStCompoeValorTotalController = CustomDropdownButtonController('0=Valor da COFINSST não compõe o valor total da NF-e');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoCofinsSt) => nfeDetalheImpostoCofinsSt.toJson).toList();
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
    baseCalculoCofinsStController.updateValue(0);
    aliquotaCofinsStPercentualController.updateValue(0);
    quantidadeVendidaCofinsStController.updateValue(0);
    aliquotaCofinsStReaisController.updateValue(0);
    valorCofinsStController.updateValue(0);
    cofinsStCompoeValorTotalController.selected = '0=Valor da COFINSST não compõe o valor total da NF-e';
  }

  void updateControllersFromModel() {
		_resetForm();
    baseCalculoCofinsStController.updateValue(nfeDetalheImpostoCofinsStModel.baseCalculoCofinsSt ?? 0);
    aliquotaCofinsStPercentualController.updateValue(nfeDetalheImpostoCofinsStModel.aliquotaCofinsStPercentual ?? 0);
    quantidadeVendidaCofinsStController.updateValue(nfeDetalheImpostoCofinsStModel.quantidadeVendidaCofinsSt ?? 0);
    aliquotaCofinsStReaisController.updateValue(nfeDetalheImpostoCofinsStModel.aliquotaCofinsStReais ?? 0);
    valorCofinsStController.updateValue(nfeDetalheImpostoCofinsStModel.valorCofinsSt ?? 0);
    cofinsStCompoeValorTotalController.selected = nfeDetalheImpostoCofinsStModel.cofinsStCompoeValorTotal ?? '0=Valor da COFINSST não compõe o valor total da NF-e';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    baseCalculoCofinsStController.dispose();
    aliquotaCofinsStPercentualController.dispose();
    quantidadeVendidaCofinsStController.dispose();
    aliquotaCofinsStReaisController.dispose();
    valorCofinsStController.dispose();
    cofinsStCompoeValorTotalController.dispose();
  }

}