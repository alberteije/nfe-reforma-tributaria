import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoIpiController extends ControllerBase<NfeDetalheImpostoIpiModel, void> {

  NfeDetalheImpostoIpiController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIpiModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIpiModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_ipi";
    screenTitle = "IPI";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIpiModel = NfeDetalheImpostoIpiModel().obs;
  NfeDetalheImpostoIpiModel get nfeDetalheImpostoIpiModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoIpiModel ?? NfeDetalheImpostoIpiModel();
  set nfeDetalheImpostoIpiModel(value) => _nfeDetalheImpostoIpiModel.value = value ?? NfeDetalheImpostoIpiModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIpiScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIpiFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIpiModel createNewModel() => NfeDetalheImpostoIpiModel();

  @override
  final standardFieldForFilter = "";

  final cnpjProdutorController = MaskedTextController(mask: '00.000.000/0000-00',);
  final codigoSeloIpiController = TextEditingController();
  final quantidadeSeloIpiController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final enquadramentoLegalIpiController = TextEditingController();
  final cstIpiController = TextEditingController();
  final valorBaseCalculoIpiController = MoneyMaskedTextController();
  final quantidadeUnidadeTributavelController = MoneyMaskedTextController();
  final valorUnidadeTributavelController = MoneyMaskedTextController();
  final aliquotaIpiController = MoneyMaskedTextController();
  final valorIpiController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoIpi) => nfeDetalheImpostoIpi.toJson).toList();
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
    cnpjProdutorController.text = '';
    codigoSeloIpiController.text = '';
    quantidadeSeloIpiController.updateValue(0);
    enquadramentoLegalIpiController.text = '';
    cstIpiController.text = '';
    valorBaseCalculoIpiController.updateValue(0);
    quantidadeUnidadeTributavelController.updateValue(0);
    valorUnidadeTributavelController.updateValue(0);
    aliquotaIpiController.updateValue(0);
    valorIpiController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    cnpjProdutorController.text = nfeDetalheImpostoIpiModel.cnpjProdutor ?? '';
    codigoSeloIpiController.text = nfeDetalheImpostoIpiModel.codigoSeloIpi ?? '';
    quantidadeSeloIpiController.updateValue((nfeDetalheImpostoIpiModel.quantidadeSeloIpi ?? 0).toDouble());
    enquadramentoLegalIpiController.text = nfeDetalheImpostoIpiModel.enquadramentoLegalIpi ?? '';
    cstIpiController.text = nfeDetalheImpostoIpiModel.cstIpi ?? '';
    valorBaseCalculoIpiController.updateValue(nfeDetalheImpostoIpiModel.valorBaseCalculoIpi ?? 0);
    quantidadeUnidadeTributavelController.updateValue(nfeDetalheImpostoIpiModel.quantidadeUnidadeTributavel ?? 0);
    valorUnidadeTributavelController.updateValue(nfeDetalheImpostoIpiModel.valorUnidadeTributavel ?? 0);
    aliquotaIpiController.updateValue(nfeDetalheImpostoIpiModel.aliquotaIpi ?? 0);
    valorIpiController.updateValue(nfeDetalheImpostoIpiModel.valorIpi ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    cnpjProdutorController.dispose();
    codigoSeloIpiController.dispose();
    quantidadeSeloIpiController.dispose();
    enquadramentoLegalIpiController.dispose();
    cstIpiController.dispose();
    valorBaseCalculoIpiController.dispose();
    quantidadeUnidadeTributavelController.dispose();
    valorUnidadeTributavelController.dispose();
    aliquotaIpiController.dispose();
    valorIpiController.dispose();
  }

}