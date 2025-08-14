import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheDfeReferenciadoController extends ControllerBase<NfeDetalheDfeReferenciadoModel, void> {

  NfeDetalheDfeReferenciadoController() : super(repository: null) {
    dbColumns = NfeDetalheDfeReferenciadoModel.dbColumns;
    aliasColumns = NfeDetalheDfeReferenciadoModel.aliasColumns;
    functionName = "nfe_detalhe_dfe_referenciado";
    screenTitle = "DFe Referenciado";
  }

	String? mandatoryMessage;

  final _nfeDetalheDfeReferenciadoModel = NfeDetalheDfeReferenciadoModel().obs;
  NfeDetalheDfeReferenciadoModel get nfeDetalheDfeReferenciadoModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheDfeReferenciadoModel ?? NfeDetalheDfeReferenciadoModel();
  set nfeDetalheDfeReferenciadoModel(value) => _nfeDetalheDfeReferenciadoModel.value = value ?? NfeDetalheDfeReferenciadoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheDfeReferenciadoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheDfeReferenciadoFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheDfeReferenciadoModel createNewModel() => NfeDetalheDfeReferenciadoModel();

  @override
  final standardFieldForFilter = "";

  final chaveAcessoController = TextEditingController();
  final numeroItemController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheDfeReferenciado) => nfeDetalheDfeReferenciado.toJson).toList();
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
    chaveAcessoController.text = '';
    numeroItemController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    chaveAcessoController.text = nfeDetalheDfeReferenciadoModel.chaveAcesso ?? '';
    numeroItemController.updateValue((nfeDetalheDfeReferenciadoModel.numeroItem ?? 0).toDouble());
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    chaveAcessoController.dispose();
    numeroItemController.dispose();
  }

}