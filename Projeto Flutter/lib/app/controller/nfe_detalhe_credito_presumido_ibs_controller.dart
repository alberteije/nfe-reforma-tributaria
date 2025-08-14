import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheCreditoPresumidoIbsController extends ControllerBase<NfeDetalheCreditoPresumidoIbsModel, void> {

  NfeDetalheCreditoPresumidoIbsController() : super(repository: null) {
    dbColumns = NfeDetalheCreditoPresumidoIbsModel.dbColumns;
    aliasColumns = NfeDetalheCreditoPresumidoIbsModel.aliasColumns;
    functionName = "nfe_detalhe_credito_presumido_ibs";
    screenTitle = "Credito Presumido - IBS";
  }

	String? mandatoryMessage;

  final _nfeDetalheCreditoPresumidoIbsModel = NfeDetalheCreditoPresumidoIbsModel().obs;
  NfeDetalheCreditoPresumidoIbsModel get nfeDetalheCreditoPresumidoIbsModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheCreditoPresumidoIbsModel ?? NfeDetalheCreditoPresumidoIbsModel();
  set nfeDetalheCreditoPresumidoIbsModel(value) => _nfeDetalheCreditoPresumidoIbsModel.value = value ?? NfeDetalheCreditoPresumidoIbsModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheCreditoPresumidoIbsScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheCreditoPresumidoIbsFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheCreditoPresumidoIbsModel createNewModel() => NfeDetalheCreditoPresumidoIbsModel();

  @override
  final standardFieldForFilter = "";

  final codigoClassificacaoController = CustomDropdownButtonController('1-Aquisição de Produtor Rural não contribuinte');
  final percentualController = MoneyMaskedTextController();
  final valorController = MoneyMaskedTextController();
  final valorSuspensivoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheCreditoPresumidoIbs) => nfeDetalheCreditoPresumidoIbs.toJson).toList();
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
    codigoClassificacaoController.selected = nfeDetalheCreditoPresumidoIbsModel.codigoClassificacao ?? '1-Aquisição de Produtor Rural não contribuinte';
    percentualController.updateValue(nfeDetalheCreditoPresumidoIbsModel.percentual ?? 0);
    valorController.updateValue(nfeDetalheCreditoPresumidoIbsModel.valor ?? 0);
    valorSuspensivoController.updateValue(nfeDetalheCreditoPresumidoIbsModel.valorSuspensivo ?? 0);
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