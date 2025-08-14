import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDestinatarioController extends ControllerBase<NfeDestinatarioModel, void> {

  NfeDestinatarioController() : super(repository: null) {
    dbColumns = NfeDestinatarioModel.dbColumns;
    aliasColumns = NfeDestinatarioModel.aliasColumns;
    functionName = "nfe_destinatario";
    screenTitle = "Destinatário";
  }

	String? mandatoryMessage;

  final _nfeDestinatarioModel = NfeDestinatarioModel().obs;
  NfeDestinatarioModel get nfeDestinatarioModel => Get.find<NfeCabecalhoController>().currentModel.nfeDestinatarioModel ?? NfeDestinatarioModel();
  set nfeDestinatarioModel(value) => _nfeDestinatarioModel.value = value ?? NfeDestinatarioModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDestinatarioScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDestinatarioFormKey = GlobalKey<FormState>();

  @override
  NfeDestinatarioModel createNewModel() => NfeDestinatarioModel();

  @override
  final standardFieldForFilter = "";

  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);
  final estrangeiroIdentificacaoController = TextEditingController();
  final nomeController = TextEditingController();
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
  final suframaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final inscricaoMunicipalController = TextEditingController();
  final emailController = TextEditingController();
	final ufController = CustomDropdownButtonController('AC');
	final indicadorIeController = CustomDropdownButtonController('1=Contribuinte ICMS (informar a IE do destinatário)');


  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDestinatario) => nfeDestinatario.toJson).toList();
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
    estrangeiroIdentificacaoController.text = '';
    nomeController.text = '';
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
    suframaController.updateValue(0);
    inscricaoMunicipalController.text = '';
    emailController.text = '';
    ufController.selected = 'AC';
    indicadorIeController.selected = '1=Contribuinte ICMS (informar a IE do destinatário)';
  }

  void updateControllersFromModel() {
		_resetForm();
    cnpjController.text = nfeDestinatarioModel.cnpj ?? '';
    cpfController.text = nfeDestinatarioModel.cpf ?? '';
    estrangeiroIdentificacaoController.text = nfeDestinatarioModel.estrangeiroIdentificacao ?? '';
    nomeController.text = nfeDestinatarioModel.nome ?? '';
    logradouroController.text = nfeDestinatarioModel.logradouro ?? '';
    numeroController.text = nfeDestinatarioModel.numero ?? '';
    complementoController.text = nfeDestinatarioModel.complemento ?? '';
    bairroController.text = nfeDestinatarioModel.bairro ?? '';
    codigoMunicipioController.updateValue((nfeDestinatarioModel.codigoMunicipio ?? 0).toDouble());
    nomeMunicipioController.text = nfeDestinatarioModel.nomeMunicipio ?? '';
    cepController.text = nfeDestinatarioModel.cep ?? '';
    codigoPaisController.updateValue((nfeDestinatarioModel.codigoPais ?? 0).toDouble());
    nomePaisController.text = nfeDestinatarioModel.nomePais ?? '';
    telefoneController.text = nfeDestinatarioModel.telefone ?? '';
    inscricaoEstadualController.text = nfeDestinatarioModel.inscricaoEstadual ?? '';
    suframaController.updateValue((nfeDestinatarioModel.suframa ?? 0).toDouble());
    inscricaoMunicipalController.text = nfeDestinatarioModel.inscricaoMunicipal ?? '';
    emailController.text = nfeDestinatarioModel.email ?? '';
    ufController.selected = currentModel.uf ?? 'AC';
    indicadorIeController.selected = currentModel.indicadorIe ?? '1=Contribuinte ICMS (informar a IE do destinatário)';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    final emailValidationMessage = ValidateFormField.validateEmail(nfeDestinatarioModel.email); 
		if (emailValidationMessage != null) { 
			showErrorSnackBar(message: emailValidationMessage); 
			return false; 
		}
    return true;
	}


  @override
  void onClose() {
    cnpjController.dispose();
    cpfController.dispose();
    estrangeiroIdentificacaoController.dispose();
    nomeController.dispose();
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
    suframaController.dispose();
    inscricaoMunicipalController.dispose();
    emailController.dispose();
    ufController.dispose();
    indicadorIeController.dispose();
  }

}