import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoSeletivoController extends ControllerBase<NfeDetalheImpostoSeletivoModel, void> {

  NfeDetalheImpostoSeletivoController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoSeletivoModel.dbColumns;
    aliasColumns = NfeDetalheImpostoSeletivoModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_seletivo";
    screenTitle = "Imposto Seletivo";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoSeletivoModel = NfeDetalheImpostoSeletivoModel().obs;
  NfeDetalheImpostoSeletivoModel get nfeDetalheImpostoSeletivoModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheImpostoSeletivoModel ?? NfeDetalheImpostoSeletivoModel();
  set nfeDetalheImpostoSeletivoModel(value) => _nfeDetalheImpostoSeletivoModel.value = value ?? NfeDetalheImpostoSeletivoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoSeletivoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoSeletivoFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoSeletivoModel createNewModel() => NfeDetalheImpostoSeletivoModel();

  @override
  final standardFieldForFilter = "";

  final cstController = TextEditingController();
  final codigoClassificacaoTributariaController = TextEditingController();
  final valorBaseCalculoController = MoneyMaskedTextController();
  final aliquotaController = MoneyMaskedTextController();
  final aliquotaEspecificaController = MoneyMaskedTextController();
  final unidadeTributavelController = TextEditingController();
  final quantidadeTributavelController = MoneyMaskedTextController();
  final valorController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoSeletivo) => nfeDetalheImpostoSeletivo.toJson).toList();
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
    aliquotaEspecificaController.updateValue(0);
    unidadeTributavelController.text = '';
    quantidadeTributavelController.updateValue(0);
    valorController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    cstController.text = nfeDetalheImpostoSeletivoModel.cst ?? '';
    codigoClassificacaoTributariaController.text = nfeDetalheImpostoSeletivoModel.codigoClassificacaoTributaria ?? '';
    valorBaseCalculoController.updateValue(nfeDetalheImpostoSeletivoModel.valorBaseCalculo ?? 0);
    aliquotaController.updateValue(nfeDetalheImpostoSeletivoModel.aliquota ?? 0);
    aliquotaEspecificaController.updateValue(nfeDetalheImpostoSeletivoModel.aliquotaEspecifica ?? 0);
    unidadeTributavelController.text = nfeDetalheImpostoSeletivoModel.unidadeTributavel ?? '';
    quantidadeTributavelController.updateValue(nfeDetalheImpostoSeletivoModel.quantidadeTributavel ?? 0);
    valorController.updateValue(nfeDetalheImpostoSeletivoModel.valor ?? 0);
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
    aliquotaEspecificaController.dispose();
    unidadeTributavelController.dispose();
    quantidadeTributavelController.dispose();
    valorController.dispose();
  }

}