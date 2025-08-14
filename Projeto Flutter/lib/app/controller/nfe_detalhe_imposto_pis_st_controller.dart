import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart' show CustomDropdownButtonController;

class NfeDetalheImpostoPisStController extends ControllerBase<NfeDetalheImpostoPisStModel, void> {

  NfeDetalheImpostoPisStController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoPisStModel.dbColumns;
    aliasColumns = NfeDetalheImpostoPisStModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_pis_st";
    screenTitle = "PIS ST";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoPisStModel = NfeDetalheImpostoPisStModel().obs;
  NfeDetalheImpostoPisStModel get nfeDetalheImpostoPisStModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoPisStModel ?? NfeDetalheImpostoPisStModel();
  set nfeDetalheImpostoPisStModel(value) => _nfeDetalheImpostoPisStModel.value = value ?? NfeDetalheImpostoPisStModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoPisStScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoPisStFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoPisStModel createNewModel() => NfeDetalheImpostoPisStModel();

  @override
  final standardFieldForFilter = "";

  final valorBaseCalculoPisStController = MoneyMaskedTextController();
  final aliquotaPisStPercentualController = MoneyMaskedTextController();
  final quantidadeVendidaPisStController = MoneyMaskedTextController();
  final aliquotaPisStReaisController = MoneyMaskedTextController();
  final valorPisStController = MoneyMaskedTextController();
  final pisStCompoeValorTotalController = CustomDropdownButtonController('0=Valor do PISST não compõe o valor total da NF-e');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoPisSt) => nfeDetalheImpostoPisSt.toJson).toList();
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
    valorBaseCalculoPisStController.updateValue(0);
    aliquotaPisStPercentualController.updateValue(0);
    quantidadeVendidaPisStController.updateValue(0);
    aliquotaPisStReaisController.updateValue(0);
    valorPisStController.updateValue(0);
    pisStCompoeValorTotalController.selected = '0=Valor do PISST não compõe o valor total da NF-e';
  }

  void updateControllersFromModel() {
		_resetForm();
    valorBaseCalculoPisStController.updateValue(nfeDetalheImpostoPisStModel.valorBaseCalculoPisSt ?? 0);
    aliquotaPisStPercentualController.updateValue(nfeDetalheImpostoPisStModel.aliquotaPisStPercentual ?? 0);
    quantidadeVendidaPisStController.updateValue(nfeDetalheImpostoPisStModel.quantidadeVendidaPisSt ?? 0);
    aliquotaPisStReaisController.updateValue(nfeDetalheImpostoPisStModel.aliquotaPisStReais ?? 0);
    valorPisStController.updateValue(nfeDetalheImpostoPisStModel.valorPisSt ?? 0);
    pisStCompoeValorTotalController.selected = nfeDetalheImpostoPisStModel.pisStCompoeValorTotal ?? '0=Valor do PISST não compõe o valor total da NF-e';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    valorBaseCalculoPisStController.dispose();
    aliquotaPisStPercentualController.dispose();
    quantidadeVendidaPisStController.dispose();
    aliquotaPisStReaisController.dispose();
    valorPisStController.dispose();
    pisStCompoeValorTotalController.dispose();
  }

}