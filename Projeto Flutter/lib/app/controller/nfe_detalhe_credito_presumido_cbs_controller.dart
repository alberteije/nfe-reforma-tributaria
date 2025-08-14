import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheCreditoPresumidoCbsController extends ControllerBase<NfeDetalheCreditoPresumidoCbsModel, void> {

  NfeDetalheCreditoPresumidoCbsController() : super(repository: null) {
    dbColumns = NfeDetalheCreditoPresumidoCbsModel.dbColumns;
    aliasColumns = NfeDetalheCreditoPresumidoCbsModel.aliasColumns;
    functionName = "nfe_detalhe_credito_presumido_cbs";
    screenTitle = "Credito Presumido - CBS";
  }

	String? mandatoryMessage;

  final _nfeDetalheCreditoPresumidoCbsModel = NfeDetalheCreditoPresumidoCbsModel().obs;
  NfeDetalheCreditoPresumidoCbsModel get nfeDetalheCreditoPresumidoCbsModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheCreditoPresumidoCbsModel ?? NfeDetalheCreditoPresumidoCbsModel();
  set nfeDetalheCreditoPresumidoCbsModel(value) => _nfeDetalheCreditoPresumidoCbsModel.value = value ?? NfeDetalheCreditoPresumidoCbsModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheCreditoPresumidoCbsScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheCreditoPresumidoCbsFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheCreditoPresumidoCbsModel createNewModel() => NfeDetalheCreditoPresumidoCbsModel();

  @override
  final standardFieldForFilter = "";

  final codigoClassificacaoController = CustomDropdownButtonController('1-Aquisição de Produtor Rural não contribuinte');
  final percentualController = MoneyMaskedTextController();
  final valorController = MoneyMaskedTextController();
  final valorSuspensivoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheCreditoPresumidoCbs) => nfeDetalheCreditoPresumidoCbs.toJson).toList();
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
    codigoClassificacaoController.selected = '1-Aquisição de Produtor Rural não contribuinte';
    percentualController.updateValue(0);
    valorController.updateValue(0);
    valorSuspensivoController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    codigoClassificacaoController.selected = nfeDetalheCreditoPresumidoCbsModel.codigoClassificacao ?? '1-Aquisição de Produtor Rural não contribuinte';
    percentualController.updateValue(nfeDetalheCreditoPresumidoCbsModel.percentual ?? 0);
    valorController.updateValue(nfeDetalheCreditoPresumidoCbsModel.valor ?? 0);
    valorSuspensivoController.updateValue(nfeDetalheCreditoPresumidoCbsModel.valorSuspensivo ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    codigoClassificacaoController.dispose();
    percentualController.dispose();
    valorController.dispose();
    valorSuspensivoController.dispose();
  }

}