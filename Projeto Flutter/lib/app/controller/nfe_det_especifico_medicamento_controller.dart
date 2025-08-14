import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetEspecificoMedicamentoController extends ControllerBase<NfeDetEspecificoMedicamentoModel, void> {

  NfeDetEspecificoMedicamentoController() : super(repository: null) {
    dbColumns = NfeDetEspecificoMedicamentoModel.dbColumns;
    aliasColumns = NfeDetEspecificoMedicamentoModel.aliasColumns;
    functionName = "nfe_det_especifico_medicamento";
    screenTitle = "Medicamento";
  }

	String? mandatoryMessage;

  final _nfeDetEspecificoMedicamentoModel = NfeDetEspecificoMedicamentoModel().obs;
  NfeDetEspecificoMedicamentoModel get nfeDetEspecificoMedicamentoModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetEspecificoMedicamentoModel ?? NfeDetEspecificoMedicamentoModel();
  set nfeDetEspecificoMedicamentoModel(value) => _nfeDetEspecificoMedicamentoModel.value = value ?? NfeDetEspecificoMedicamentoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetEspecificoMedicamentoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetEspecificoMedicamentoFormKey = GlobalKey<FormState>();

  @override
  NfeDetEspecificoMedicamentoModel createNewModel() => NfeDetEspecificoMedicamentoModel();

  @override
  final standardFieldForFilter = "";

  final codigoAnvisaController = TextEditingController();
  final motivoIsencaoController = TextEditingController();
  final precoMaximoConsumidorController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetEspecificoMedicamento) => nfeDetEspecificoMedicamento.toJson).toList();
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
    codigoAnvisaController.text = '';
    motivoIsencaoController.text = '';
    precoMaximoConsumidorController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    codigoAnvisaController.text = nfeDetEspecificoMedicamentoModel.codigoAnvisa ?? '';
    motivoIsencaoController.text = nfeDetEspecificoMedicamentoModel.motivoIsencao ?? '';
    precoMaximoConsumidorController.updateValue(nfeDetEspecificoMedicamentoModel.precoMaximoConsumidor ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    codigoAnvisaController.dispose();
    motivoIsencaoController.dispose();
    precoMaximoConsumidorController.dispose();
  }

}