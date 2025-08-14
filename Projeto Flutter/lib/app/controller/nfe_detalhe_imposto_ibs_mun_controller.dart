import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoIbsMunController extends ControllerBase<NfeDetalheImpostoIbsMunModel, void> {

  NfeDetalheImpostoIbsMunController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIbsMunModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIbsMunModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_ibs_mun";
    screenTitle = "IBS Município";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIbsMunModel = NfeDetalheImpostoIbsMunModel().obs;
  NfeDetalheImpostoIbsMunModel get nfeDetalheImpostoIbsMunModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheImpostoIbsMunModel ?? NfeDetalheImpostoIbsMunModel();
  set nfeDetalheImpostoIbsMunModel(value) => _nfeDetalheImpostoIbsMunModel.value = value ?? NfeDetalheImpostoIbsMunModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIbsMunScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIbsMunFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIbsMunModel createNewModel() => NfeDetalheImpostoIbsMunModel();

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
    return modelList.map((nfeDetalheImpostoIbsMun) => nfeDetalheImpostoIbsMun.toJson).toList();
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
    cstController.text = nfeDetalheImpostoIbsMunModel.cst ?? '';
    codigoClassificacaoTributariaController.text = nfeDetalheImpostoIbsMunModel.codigoClassificacaoTributaria ?? '';
    valorBaseCalculoController.updateValue(nfeDetalheImpostoIbsMunModel.valorBaseCalculo ?? 0);
    aliquotaController.updateValue(nfeDetalheImpostoIbsMunModel.aliquota ?? 0);
    percentualDiferimentoController.updateValue(nfeDetalheImpostoIbsMunModel.percentualDiferimento ?? 0);
    valorDiferimentoController.updateValue(nfeDetalheImpostoIbsMunModel.valorDiferimento ?? 0);
    valorTributoDevolvidoController.updateValue(nfeDetalheImpostoIbsMunModel.valorTributoDevolvido ?? 0);
    percentualReducaoAliquotaController.updateValue(nfeDetalheImpostoIbsMunModel.percentualReducaoAliquota ?? 0);
    aliquotaEfetivaController.updateValue(nfeDetalheImpostoIbsMunModel.aliquotaEfetiva ?? 0);
    valorController.updateValue(nfeDetalheImpostoIbsMunModel.valor ?? 0);
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