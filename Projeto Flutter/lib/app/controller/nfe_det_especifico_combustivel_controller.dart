import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetEspecificoCombustivelController extends ControllerBase<NfeDetEspecificoCombustivelModel, void> {

  NfeDetEspecificoCombustivelController() : super(repository: null) {
    dbColumns = NfeDetEspecificoCombustivelModel.dbColumns;
    aliasColumns = NfeDetEspecificoCombustivelModel.aliasColumns;
    functionName = "nfe_det_especifico_combustivel";
    screenTitle = "Combustível";
  }

	String? mandatoryMessage;

  final _nfeDetEspecificoCombustivelModel = NfeDetEspecificoCombustivelModel().obs;
  NfeDetEspecificoCombustivelModel get nfeDetEspecificoCombustivelModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetEspecificoCombustivelModel ?? NfeDetEspecificoCombustivelModel();
  set nfeDetEspecificoCombustivelModel(value) => _nfeDetEspecificoCombustivelModel.value = value ?? NfeDetEspecificoCombustivelModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetEspecificoCombustivelScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetEspecificoCombustivelFormKey = GlobalKey<FormState>();

  @override
  NfeDetEspecificoCombustivelModel createNewModel() => NfeDetEspecificoCombustivelModel();

  @override
  final standardFieldForFilter = "";

  final codigoAnpController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final descricaoAnpController = TextEditingController();
  final percentualGlpController = MoneyMaskedTextController();
  final percentualGasNacionalController = MoneyMaskedTextController();
  final percentualGasImportadoController = MoneyMaskedTextController();
  final valorPartidaController = MoneyMaskedTextController();
  final codifController = TextEditingController();
  final quantidadeTempAmbienteController = MoneyMaskedTextController();
  final cideBaseCalculoController = MoneyMaskedTextController();
  final cideAliquotaController = MoneyMaskedTextController();
  final cideValorController = MoneyMaskedTextController();
  final encerranteBicoController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final encerranteBombaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final encerranteTanqueController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final encerranteValorInicioController = MoneyMaskedTextController();
  final encerranteValorFimController = MoneyMaskedTextController();
	final ufController = CustomDropdownButtonController('AC');
  final percentualMisturaBiodieselController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetEspecificoCombustivel) => nfeDetEspecificoCombustivel.toJson).toList();
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
    codigoAnpController.updateValue(0);
    descricaoAnpController.text = '';
    percentualGlpController.updateValue(0);
    percentualGasNacionalController.updateValue(0);
    percentualGasImportadoController.updateValue(0);
    valorPartidaController.updateValue(0);
    codifController.text = '';
    quantidadeTempAmbienteController.updateValue(0);
    cideBaseCalculoController.updateValue(0);
    cideAliquotaController.updateValue(0);
    cideValorController.updateValue(0);
    encerranteBicoController.updateValue(0);
    encerranteBombaController.updateValue(0);
    encerranteTanqueController.updateValue(0);
    encerranteValorInicioController.updateValue(0);
    encerranteValorFimController.updateValue(0);
    ufController.selected = 'AC';
    percentualMisturaBiodieselController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    codigoAnpController.updateValue((nfeDetEspecificoCombustivelModel.codigoAnp ?? 0).toDouble());
    descricaoAnpController.text = nfeDetEspecificoCombustivelModel.descricaoAnp ?? '';
    percentualGlpController.updateValue(nfeDetEspecificoCombustivelModel.percentualGlp ?? 0);
    percentualGasNacionalController.updateValue(nfeDetEspecificoCombustivelModel.percentualGasNacional ?? 0);
    percentualGasImportadoController.updateValue(nfeDetEspecificoCombustivelModel.percentualGasImportado ?? 0);
    valorPartidaController.updateValue(nfeDetEspecificoCombustivelModel.valorPartida ?? 0);
    codifController.text = nfeDetEspecificoCombustivelModel.codif ?? '';
    quantidadeTempAmbienteController.updateValue(nfeDetEspecificoCombustivelModel.quantidadeTempAmbiente ?? 0);
    cideBaseCalculoController.updateValue(nfeDetEspecificoCombustivelModel.cideBaseCalculo ?? 0);
    cideAliquotaController.updateValue(nfeDetEspecificoCombustivelModel.cideAliquota ?? 0);
    cideValorController.updateValue(nfeDetEspecificoCombustivelModel.cideValor ?? 0);
    encerranteBicoController.updateValue((nfeDetEspecificoCombustivelModel.encerranteBico ?? 0).toDouble());
    encerranteBombaController.updateValue((nfeDetEspecificoCombustivelModel.encerranteBomba ?? 0).toDouble());
    encerranteTanqueController.updateValue((nfeDetEspecificoCombustivelModel.encerranteTanque ?? 0).toDouble());
    encerranteValorInicioController.updateValue(nfeDetEspecificoCombustivelModel.encerranteValorInicio ?? 0);
    encerranteValorFimController.updateValue(nfeDetEspecificoCombustivelModel.encerranteValorFim ?? 0);
    ufController.selected = currentModel.ufConsumo ?? 'AC';
    percentualMisturaBiodieselController.updateValue(currentModel.percentualMisturaBiodiesel ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    codigoAnpController.dispose();
    descricaoAnpController.dispose();
    percentualGlpController.dispose();
    percentualGasNacionalController.dispose();
    percentualGasImportadoController.dispose();
    valorPartidaController.dispose();
    codifController.dispose();
    quantidadeTempAmbienteController.dispose();
    cideBaseCalculoController.dispose();
    cideAliquotaController.dispose();
    cideValorController.dispose();
    encerranteBicoController.dispose();
    encerranteBombaController.dispose();
    encerranteTanqueController.dispose();
    encerranteValorInicioController.dispose();
    encerranteValorFimController.dispose();
    ufController.dispose();
    percentualMisturaBiodieselController.dispose();
  }

}