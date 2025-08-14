import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeCompraGovernamentalController extends ControllerBase<NfeCompraGovernamentalModel, void> {

  NfeCompraGovernamentalController() : super(repository: null) {
    dbColumns = NfeCompraGovernamentalModel.dbColumns;
    aliasColumns = NfeCompraGovernamentalModel.aliasColumns;
    functionName = "nfe_compra_governamental";
    screenTitle = "Compra Governamental";
  }

	String? mandatoryMessage;

  final _nfeCompraGovernamentalModel = NfeCompraGovernamentalModel().obs;
  NfeCompraGovernamentalModel get nfeCompraGovernamentalModel => Get.find<NfeCabecalhoController>().currentModel.nfeCompraGovernamentalModel ?? NfeCompraGovernamentalModel();
  set nfeCompraGovernamentalModel(value) => _nfeCompraGovernamentalModel.value = value ?? NfeCompraGovernamentalModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeCompraGovernamentalScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCompraGovernamentalFormKey = GlobalKey<FormState>();

  @override
  NfeCompraGovernamentalModel createNewModel() => NfeCompraGovernamentalModel();

  @override
  final standardFieldForFilter = "";

  final tipoEnteController = CustomDropdownButtonController('1=União');
  final percentualReducaoController = MoneyMaskedTextController();
  final tipoOperacaoController = CustomDropdownButtonController('1=Fornecimento');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeCompraGovernamental) => nfeCompraGovernamental.toJson).toList();
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
    tipoEnteController.selected = '1=União';
    percentualReducaoController.updateValue(0);
    tipoOperacaoController.selected = '1=Fornecimento';
  }

  void updateControllersFromModel() {
		_resetForm();
    tipoEnteController.selected = nfeCompraGovernamentalModel.tipoEnte ?? '1=União';
    percentualReducaoController.updateValue(nfeCompraGovernamentalModel.percentualReducao ?? 0);
    tipoOperacaoController.selected = nfeCompraGovernamentalModel.tipoOperacao ?? '1=Fornecimento';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    tipoEnteController.dispose();
    percentualReducaoController.dispose();
    tipoOperacaoController.dispose();
  }

}