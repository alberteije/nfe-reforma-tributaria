import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheTributoRegularController extends ControllerBase<NfeDetalheTributoRegularModel, void> {

  NfeDetalheTributoRegularController() : super(repository: null) {
    dbColumns = NfeDetalheTributoRegularModel.dbColumns;
    aliasColumns = NfeDetalheTributoRegularModel.aliasColumns;
    functionName = "nfe_detalhe_tributo_regular";
    screenTitle = "Tributação Regular";
  }

	String? mandatoryMessage;

  final _nfeDetalheTributoRegularModel = NfeDetalheTributoRegularModel().obs;
  NfeDetalheTributoRegularModel get nfeDetalheTributoRegularModel => Get.find<NfeDetalheController>().currentModel.nfeDetalheTributoRegularModel ?? NfeDetalheTributoRegularModel();
  set nfeDetalheTributoRegularModel(value) => _nfeDetalheTributoRegularModel.value = value ?? NfeDetalheTributoRegularModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheTributoRegularScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheTributoRegularFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheTributoRegularModel createNewModel() => NfeDetalheTributoRegularModel();

  @override
  final standardFieldForFilter = "";

  final cstController = TextEditingController();
  final codigoClassificacaoTributariaController = TextEditingController();
  final aliquotaIbsUfController = MoneyMaskedTextController();
  final valorTributoIbsUfController = MoneyMaskedTextController();
  final aliquotaIbsMunController = MoneyMaskedTextController();
  final valorTributoIbsMunController = MoneyMaskedTextController();
  final alquotaCbsController = MoneyMaskedTextController();
  final valorTributoCbsController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheTributoRegular) => nfeDetalheTributoRegular.toJson).toList();
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
    aliquotaIbsUfController.updateValue(0);
    valorTributoIbsUfController.updateValue(0);
    aliquotaIbsMunController.updateValue(0);
    valorTributoIbsMunController.updateValue(0);
    alquotaCbsController.updateValue(0);
    valorTributoCbsController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    cstController.text = nfeDetalheTributoRegularModel.cst ?? '';
    codigoClassificacaoTributariaController.text = nfeDetalheTributoRegularModel.codigoClassificacaoTributaria ?? '';
    aliquotaIbsUfController.updateValue(nfeDetalheTributoRegularModel.aliquotaIbsUf ?? 0);
    valorTributoIbsUfController.updateValue(nfeDetalheTributoRegularModel.valorTributoIbsUf ?? 0);
    aliquotaIbsMunController.updateValue(nfeDetalheTributoRegularModel.aliquotaIbsMun ?? 0);
    valorTributoIbsMunController.updateValue(nfeDetalheTributoRegularModel.valorTributoIbsMun ?? 0);
    alquotaCbsController.updateValue(nfeDetalheTributoRegularModel.alquotaCbs ?? 0);
    valorTributoCbsController.updateValue(nfeDetalheTributoRegularModel.valorTributoCbs ?? 0);
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
    aliquotaIbsUfController.dispose();
    valorTributoIbsUfController.dispose();
    aliquotaIbsMunController.dispose();
    valorTributoIbsMunController.dispose();
    alquotaCbsController.dispose();
    valorTributoCbsController.dispose();
  }

}