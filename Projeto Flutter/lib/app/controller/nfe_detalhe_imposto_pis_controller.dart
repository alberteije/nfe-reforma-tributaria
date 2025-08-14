import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoPisController extends ControllerBase<NfeDetalheImpostoPisModel, void> {

  NfeDetalheImpostoPisController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoPisModel.dbColumns;
    aliasColumns = NfeDetalheImpostoPisModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_pis";
    screenTitle = "PIS";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoPisModel = NfeDetalheImpostoPisModel().obs;
  NfeDetalheImpostoPisModel get nfeDetalheImpostoPisModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoPisModel ?? NfeDetalheImpostoPisModel();
  set nfeDetalheImpostoPisModel(value) => _nfeDetalheImpostoPisModel.value = value ?? NfeDetalheImpostoPisModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoPisScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoPisFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoPisModel createNewModel() => NfeDetalheImpostoPisModel();

  @override
  final standardFieldForFilter = "";

  final cstPisController = TextEditingController();
  final valorBaseCalculoPisController = MoneyMaskedTextController();
  final aliquotaPisPercentualController = MoneyMaskedTextController();
  final valorPisController = MoneyMaskedTextController();
  final quantidadeVendidaController = MoneyMaskedTextController();
  final aliquotaPisReaisController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoPis) => nfeDetalheImpostoPis.toJson).toList();
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
    cstPisController.text = '';
    valorBaseCalculoPisController.updateValue(0);
    aliquotaPisPercentualController.updateValue(0);
    valorPisController.updateValue(0);
    quantidadeVendidaController.updateValue(0);
    aliquotaPisReaisController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    cstPisController.text = nfeDetalheImpostoPisModel.cstPis ?? '';
    valorBaseCalculoPisController.updateValue(nfeDetalheImpostoPisModel.valorBaseCalculoPis ?? 0);
    aliquotaPisPercentualController.updateValue(nfeDetalheImpostoPisModel.aliquotaPisPercentual ?? 0);
    valorPisController.updateValue(nfeDetalheImpostoPisModel.valorPis ?? 0);
    quantidadeVendidaController.updateValue(nfeDetalheImpostoPisModel.quantidadeVendida ?? 0);
    aliquotaPisReaisController.updateValue(nfeDetalheImpostoPisModel.aliquotaPisReais ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    cstPisController.dispose();
    valorBaseCalculoPisController.dispose();
    aliquotaPisPercentualController.dispose();
    valorPisController.dispose();
    quantidadeVendidaController.dispose();
    aliquotaPisReaisController.dispose();
  }

}