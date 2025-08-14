import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoCbsController extends ControllerBase<NfeDetalheImpostoCbsModel, void> {

  NfeDetalheImpostoCbsController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoCbsModel.dbColumns;
    aliasColumns = NfeDetalheImpostoCbsModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_cbs";
    screenTitle = "CBS";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoCbsModel = NfeDetalheImpostoCbsModel().obs;
  NfeDetalheImpostoCbsModel get nfeDetalheImpostoCbsModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheImpostoCbsModel ?? NfeDetalheImpostoCbsModel();
  set nfeDetalheImpostoCbsModel(value) => _nfeDetalheImpostoCbsModel.value = value ?? NfeDetalheImpostoCbsModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoCbsScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoCbsFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoCbsModel createNewModel() => NfeDetalheImpostoCbsModel();

  @override
  final standardFieldForFilter = "";

  final cstController = TextEditingController();
  final codigoClassificacaoTributariaController = TextEditingController();
  final valorBaseCalculoController = MoneyMaskedTextController();
  final aliquotaController = MoneyMaskedTextController();
  final percentualDiferimentoController = MoneyMaskedTextController();
  final valorDiferimentoController = MoneyMaskedTextController();
  final valorTributoDevolvidoController = MoneyMaskedTextController();
  final percentualReducaoAliquotaController = MoneyMaskedTextController();
  final aliquotaEfetivaController = MoneyMaskedTextController();
  final valorController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoCbs) => nfeDetalheImpostoCbs.toJson).toList();
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
    cstController.text = '';
    codigoClassificacaoTributariaController.text = '';
    valorBaseCalculoController.updateValue(0);
    aliquotaController.updateValue(0);
    percentualDiferimentoController.updateValue(0);
    valorDiferimentoController.updateValue(0);
    valorTributoDevolvidoController.updateValue(0);
    percentualReducaoAliquotaController.updateValue(0);
    aliquotaEfetivaController.updateValue(0);
    valorController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    cstController.text = nfeDetalheImpostoCbsModel.cst ?? '';
    codigoClassificacaoTributariaController.text = nfeDetalheImpostoCbsModel.codigoClassificacaoTributaria ?? '';
    valorBaseCalculoController.updateValue(nfeDetalheImpostoCbsModel.valorBaseCalculo ?? 0);
    aliquotaController.updateValue(nfeDetalheImpostoCbsModel.aliquota ?? 0);
    percentualDiferimentoController.updateValue(nfeDetalheImpostoCbsModel.percentualDiferimento ?? 0);
    valorDiferimentoController.updateValue(nfeDetalheImpostoCbsModel.valorDiferimento ?? 0);
    valorTributoDevolvidoController.updateValue(nfeDetalheImpostoCbsModel.valorTributoDevolvido ?? 0);
    percentualReducaoAliquotaController.updateValue(nfeDetalheImpostoCbsModel.percentualReducaoAliquota ?? 0);
    aliquotaEfetivaController.updateValue(nfeDetalheImpostoCbsModel.aliquotaEfetiva ?? 0);
    valorController.updateValue(nfeDetalheImpostoCbsModel.valor ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    cstController.dispose();
    codigoClassificacaoTributariaController.dispose();
    valorBaseCalculoController.dispose();
    aliquotaController.dispose();
    percentualDiferimentoController.dispose();
    valorDiferimentoController.dispose();
    valorTributoDevolvidoController.dispose();
    percentualReducaoAliquotaController.dispose();
    aliquotaEfetivaController.dispose();
    valorController.dispose();
  }

}