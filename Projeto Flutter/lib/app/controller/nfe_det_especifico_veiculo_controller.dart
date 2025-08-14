import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetEspecificoVeiculoController extends ControllerBase<NfeDetEspecificoVeiculoModel, void> {

  NfeDetEspecificoVeiculoController() : super(repository: null) {
    dbColumns = NfeDetEspecificoVeiculoModel.dbColumns;
    aliasColumns = NfeDetEspecificoVeiculoModel.aliasColumns;
    functionName = "nfe_det_especifico_veiculo";
    screenTitle = "Veículo";
  }

	String? mandatoryMessage;

  final _nfeDetEspecificoVeiculoModel = NfeDetEspecificoVeiculoModel().obs;
  NfeDetEspecificoVeiculoModel get nfeDetEspecificoVeiculoModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetEspecificoVeiculoModel ?? NfeDetEspecificoVeiculoModel();
  set nfeDetEspecificoVeiculoModel(value) => _nfeDetEspecificoVeiculoModel.value = value ?? NfeDetEspecificoVeiculoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetEspecificoVeiculoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetEspecificoVeiculoFormKey = GlobalKey<FormState>();

  @override
  NfeDetEspecificoVeiculoModel createNewModel() => NfeDetEspecificoVeiculoModel();

  @override
  final standardFieldForFilter = "";

  final chassiController = TextEditingController();
  final corController = TextEditingController();
  final descricaoCorController = TextEditingController();
  final potenciaMotorController = TextEditingController();
  final cilindradasController = TextEditingController();
  final pesoLiquidoController = TextEditingController();
  final pesoBrutoController = TextEditingController();
  final numeroSerieController = TextEditingController();
  final numeroMotorController = TextEditingController();
  final capacidadeMaximaTracaoController = TextEditingController();
  final distanciaEixosController = TextEditingController();
  final anoModeloController = TextEditingController();
  final anoFabricacaoController = TextEditingController();
  final tipoPinturaController = TextEditingController();
  final codigoMarcaModeloController = TextEditingController();
  final lotacaoMaximaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
	final tipoOperacaoController = CustomDropdownButtonController('1=Venda concessionária');
	final tipoCombustivelController = CustomDropdownButtonController('01=Álcool');
	final tipoVeiculoController = CustomDropdownButtonController('02=CICLOMOTO');
	final especieVeiculoController = CustomDropdownButtonController('1=PASSAGEIRO');
	final condicaoVinController = CustomDropdownButtonController('R=Remarcado');
	final condicaoVeiculoController = CustomDropdownButtonController('1=Acabado');
	final codigoCorDenatranController = CustomDropdownButtonController('01=AMARELO');
	final restricaoController = CustomDropdownButtonController('0=Não há');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetEspecificoVeiculo) => nfeDetEspecificoVeiculo.toJson).toList();
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
    chassiController.text = '';
    corController.text = '';
    descricaoCorController.text = '';
    potenciaMotorController.text = '';
    cilindradasController.text = '';
    pesoLiquidoController.text = '';
    pesoBrutoController.text = '';
    numeroSerieController.text = '';
    numeroMotorController.text = '';
    capacidadeMaximaTracaoController.text = '';
    distanciaEixosController.text = '';
    anoModeloController.text = '';
    anoFabricacaoController.text = '';
    tipoPinturaController.text = '';
    codigoMarcaModeloController.text = '';
    lotacaoMaximaController.updateValue(0);
    tipoOperacaoController.selected = '1=Venda concessionária';
    tipoCombustivelController.selected = '01=Álcool';
    tipoVeiculoController.selected = '02=CICLOMOTO';
    especieVeiculoController.selected = '1=PASSAGEIRO';
    condicaoVinController.selected = 'R=Remarcado';
    condicaoVeiculoController.selected = '1=Acabado';
    codigoCorDenatranController.selected = '01=AMARELO';
    restricaoController.selected = '0=Não há';
  }

  void updateControllersFromModel() {
		_resetForm();
    chassiController.text = nfeDetEspecificoVeiculoModel.chassi ?? '';
    corController.text = nfeDetEspecificoVeiculoModel.cor ?? '';
    descricaoCorController.text = nfeDetEspecificoVeiculoModel.descricaoCor ?? '';
    potenciaMotorController.text = nfeDetEspecificoVeiculoModel.potenciaMotor ?? '';
    cilindradasController.text = nfeDetEspecificoVeiculoModel.cilindradas ?? '';
    pesoLiquidoController.text = nfeDetEspecificoVeiculoModel.pesoLiquido ?? '';
    pesoBrutoController.text = nfeDetEspecificoVeiculoModel.pesoBruto ?? '';
    numeroSerieController.text = nfeDetEspecificoVeiculoModel.numeroSerie ?? '';
    numeroMotorController.text = nfeDetEspecificoVeiculoModel.numeroMotor ?? '';
    capacidadeMaximaTracaoController.text = nfeDetEspecificoVeiculoModel.capacidadeMaximaTracao ?? '';
    distanciaEixosController.text = nfeDetEspecificoVeiculoModel.distanciaEixos ?? '';
    anoModeloController.text = nfeDetEspecificoVeiculoModel.anoModelo ?? '';
    anoFabricacaoController.text = nfeDetEspecificoVeiculoModel.anoFabricacao ?? '';
    tipoPinturaController.text = nfeDetEspecificoVeiculoModel.tipoPintura ?? '';
    codigoMarcaModeloController.text = nfeDetEspecificoVeiculoModel.codigoMarcaModelo ?? '';
    lotacaoMaximaController.updateValue((nfeDetEspecificoVeiculoModel.lotacaoMaxima ?? 0).toDouble());
    tipoOperacaoController.selected = currentModel.tipoOperacao ?? '1=Venda concessionária';
    tipoCombustivelController.selected = currentModel.tipoCombustivel ?? '01=Álcool';
    tipoVeiculoController.selected = currentModel.tipoVeiculo ?? '02=CICLOMOTO';
    especieVeiculoController.selected = currentModel.especieVeiculo ?? '1=PASSAGEIRO';
    condicaoVinController.selected = currentModel.condicaoVin ?? 'R=Remarcado';
    condicaoVeiculoController.selected = currentModel.condicaoVeiculo ?? '1=Acabado';
    codigoCorDenatranController.selected = currentModel.codigoCorDenatran ?? '01=AMARELO';
    restricaoController.selected = currentModel.restricao ?? '0=Não há';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    chassiController.dispose();
    corController.dispose();
    descricaoCorController.dispose();
    potenciaMotorController.dispose();
    cilindradasController.dispose();
    pesoLiquidoController.dispose();
    pesoBrutoController.dispose();
    numeroSerieController.dispose();
    numeroMotorController.dispose();
    capacidadeMaximaTracaoController.dispose();
    distanciaEixosController.dispose();
    anoModeloController.dispose();
    anoFabricacaoController.dispose();
    tipoPinturaController.dispose();
    codigoMarcaModeloController.dispose();
    lotacaoMaximaController.dispose();
    tipoOperacaoController.dispose();
    tipoCombustivelController.dispose();
    tipoVeiculoController.dispose();
    especieVeiculoController.dispose();
    condicaoVinController.dispose();
    condicaoVeiculoController.dispose();
    codigoCorDenatranController.dispose();
    restricaoController.dispose();
  }

}