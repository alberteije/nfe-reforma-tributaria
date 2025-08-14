import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheIbsZfmController extends ControllerBase<NfeDetalheIbsZfmModel, void> {

  NfeDetalheIbsZfmController() : super(repository: null) {
    dbColumns = NfeDetalheIbsZfmModel.dbColumns;
    aliasColumns = NfeDetalheIbsZfmModel.aliasColumns;
    functionName = "nfe_detalhe_ibs_zfm";
    screenTitle = "IBS Zona Franca Manau";
  }

	String? mandatoryMessage;

  final _nfeDetalheIbsZfmModel = NfeDetalheIbsZfmModel().obs;
  NfeDetalheIbsZfmModel get nfeDetalheIbsZfmModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheIbsZfmModel ?? NfeDetalheIbsZfmModel();
  set nfeDetalheIbsZfmModel(value) => _nfeDetalheIbsZfmModel.value = value ?? NfeDetalheIbsZfmModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheIbsZfmScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheIbsZfmFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheIbsZfmModel createNewModel() => NfeDetalheIbsZfmModel();

  @override
  final standardFieldForFilter = "";

  final tipoCreditoController = CustomDropdownButtonController('0 - Sem Crédito Presumido');
  final valorCreditoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheIbsZfm) => nfeDetalheIbsZfm.toJson).toList();
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
    tipoCreditoController.selected = '0 - Sem Crédito Presumido';
    valorCreditoController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    tipoCreditoController.selected = nfeDetalheIbsZfmModel.tipoCredito ?? '0 - Sem Crédito Presumido';
    valorCreditoController.updateValue(nfeDetalheIbsZfmModel.valorCredito ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    tipoCreditoController.dispose();
    valorCreditoController.dispose();
  }

}