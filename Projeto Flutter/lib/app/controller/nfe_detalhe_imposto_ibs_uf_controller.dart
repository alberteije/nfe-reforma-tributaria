import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoIbsUfController extends ControllerBase<NfeDetalheImpostoIbsUfModel, void> {

  NfeDetalheImpostoIbsUfController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIbsUfModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIbsUfModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_ibs_uf";
    screenTitle = "IBS UF";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIbsUfModel = NfeDetalheImpostoIbsUfModel().obs;
  NfeDetalheImpostoIbsUfModel get nfeDetalheImpostoIbsUfModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheImpostoIbsUfModel ?? NfeDetalheImpostoIbsUfModel();
  set nfeDetalheImpostoIbsUfModel(value) => _nfeDetalheImpostoIbsUfModel.value = value ?? NfeDetalheImpostoIbsUfModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIbsUfScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIbsUfFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIbsUfModel createNewModel() => NfeDetalheImpostoIbsUfModel();

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
    return modelList.map((nfeDetalheImpostoIbsUf) => nfeDetalheImpostoIbsUf.toJson).toList();
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
    cstController.text = nfeDetalheImpostoIbsUfModel.cst ?? '';
    codigoClassificacaoTributariaController.text = nfeDetalheImpostoIbsUfModel.codigoClassificacaoTributaria ?? '';
    valorBaseCalculoController.updateValue(nfeDetalheImpostoIbsUfModel.valorBaseCalculo ?? 0);
    aliquotaController.updateValue(nfeDetalheImpostoIbsUfModel.aliquota ?? 0);
    percentualDiferimentoController.updateValue(nfeDetalheImpostoIbsUfModel.percentualDiferimento ?? 0);
    valorDiferimentoController.updateValue(nfeDetalheImpostoIbsUfModel.valorDiferimento ?? 0);
    valorTributoDevolvidoController.updateValue(nfeDetalheImpostoIbsUfModel.valorTributoDevolvido ?? 0);
    percentualReducaoAliquotaController.updateValue(nfeDetalheImpostoIbsUfModel.percentualReducaoAliquota ?? 0);
    aliquotaEfetivaController.updateValue(nfeDetalheImpostoIbsUfModel.aliquotaEfetiva ?? 0);
    valorController.updateValue(nfeDetalheImpostoIbsUfModel.valor ?? 0);
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