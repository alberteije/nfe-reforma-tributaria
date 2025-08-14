import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeEmitenteController extends ControllerBase<NfeEmitenteModel, void> {

  NfeEmitenteController() : super(repository: null) {
    dbColumns = NfeEmitenteModel.dbColumns;
    aliasColumns = NfeEmitenteModel.aliasColumns;
    functionName = "nfe_emitente";
    screenTitle = "Emitente";
  }

	String? mandatoryMessage;

  final _nfeEmitenteModel = NfeEmitenteModel().obs;
  NfeEmitenteModel get nfeEmitenteModel => Get.find<NfeCabecalhoController>().currentModel.nfeEmitenteModel ?? NfeEmitenteModel();
  set nfeEmitenteModel(value) => _nfeEmitenteModel.value = value ?? NfeEmitenteModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeEmitenteScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeEmitenteFormKey = GlobalKey<FormState>();

  @override
  NfeEmitenteModel createNewModel() => NfeEmitenteModel();

  @override
  final standardFieldForFilter = "";

  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);
  final nomeController = TextEditingController();
  final fantasiaController = TextEditingController();
  final logradouroController = TextEditingController();
  final numeroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final codigoMunicipioController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final nomeMunicipioController = TextEditingController();
  final cepController = MaskedTextController(mask: '00000-000',);
  final codigoPaisController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final nomePaisController = TextEditingController();
  final telefoneController = TextEditingController();
  final inscricaoEstadualController = TextEditingController();
  final inscricaoEstadualStController = TextEditingController();
  final inscricaoMunicipalController = TextEditingController();
  final cnaeController = TextEditingController();
	final ufController = CustomDropdownButtonController('AC');
	final crtController = CustomDropdownButtonController('1=Simples Nacional');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeEmitente) => nfeEmitente.toJson).toList();
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
    cnpjController.text = '';
    cpfController.text = '';
    nomeController.text = '';
    fantasiaController.text = '';
    logradouroController.text = '';
    numeroController.text = '';
    complementoController.text = '';
    bairroController.text = '';
    codigoMunicipioController.updateValue(0);
    nomeMunicipioController.text = '';
    cepController.text = '';
    codigoPaisController.updateValue(0);
    nomePaisController.text = '';
    telefoneController.text = '';
    inscricaoEstadualController.text = '';
    inscricaoEstadualStController.text = '';
    inscricaoMunicipalController.text = '';
    cnaeController.text = '';
    ufController.selected = 'AC';
    crtController.selected = '1=Simples Nacional';
  }

  void updateControllersFromModel() {
		_resetForm();
    cnpjController.text = nfeEmitenteModel.cnpj ?? '';
    cpfController.text = nfeEmitenteModel.cpf ?? '';
    nomeController.text = nfeEmitenteModel.nome ?? '';
    fantasiaController.text = nfeEmitenteModel.fantasia ?? '';
    logradouroController.text = nfeEmitenteModel.logradouro ?? '';
    numeroController.text = nfeEmitenteModel.numero ?? '';
    complementoController.text = nfeEmitenteModel.complemento ?? '';
    bairroController.text = nfeEmitenteModel.bairro ?? '';
    codigoMunicipioController.updateValue((nfeEmitenteModel.codigoMunicipio ?? 0).toDouble());
    nomeMunicipioController.text = nfeEmitenteModel.nomeMunicipio ?? '';
    cepController.text = nfeEmitenteModel.cep ?? '';
    codigoPaisController.updateValue((nfeEmitenteModel.codigoPais ?? 0).toDouble());
    nomePaisController.text = nfeEmitenteModel.nomePais ?? '';
    telefoneController.text = nfeEmitenteModel.telefone ?? '';
    inscricaoEstadualController.text = nfeEmitenteModel.inscricaoEstadual ?? '';
    inscricaoEstadualStController.text = nfeEmitenteModel.inscricaoEstadualSt ?? '';
    inscricaoMunicipalController.text = nfeEmitenteModel.inscricaoMunicipal ?? '';
    cnaeController.text = nfeEmitenteModel.cnae ?? '';
    ufController.selected = currentModel.uf ?? 'AC';
    crtController.selected = currentModel.crt ?? '1=Simples Nacional';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    cnpjController.dispose();
    cpfController.dispose();
    nomeController.dispose();
    fantasiaController.dispose();
    logradouroController.dispose();
    numeroController.dispose();
    complementoController.dispose();
    bairroController.dispose();
    codigoMunicipioController.dispose();
    nomeMunicipioController.dispose();
    cepController.dispose();
    codigoPaisController.dispose();
    nomePaisController.dispose();
    telefoneController.dispose();
    inscricaoEstadualController.dispose();
    inscricaoEstadualStController.dispose();
    inscricaoMunicipalController.dispose();
    cnaeController.dispose();
    ufController.dispose();
    crtController.dispose();
  }

}