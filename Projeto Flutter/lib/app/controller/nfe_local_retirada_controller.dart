import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeLocalRetiradaController extends ControllerBase<NfeLocalRetiradaModel, void> {

  NfeLocalRetiradaController() : super(repository: null) {
    dbColumns = NfeLocalRetiradaModel.dbColumns;
    aliasColumns = NfeLocalRetiradaModel.aliasColumns;
    functionName = "nfe_local_retirada";
    screenTitle = "Local Retirada";
  }

	String? mandatoryMessage;

  final _nfeLocalRetiradaModel = NfeLocalRetiradaModel().obs;
  NfeLocalRetiradaModel get nfeLocalRetiradaModel => Get.find<NfeCabecalhoController>().currentModel.nfeLocalRetiradaModel ?? NfeLocalRetiradaModel();
  set nfeLocalRetiradaModel(value) => _nfeLocalRetiradaModel.value = value ?? NfeLocalRetiradaModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeLocalRetiradaScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeLocalRetiradaFormKey = GlobalKey<FormState>();

  @override
  NfeLocalRetiradaModel createNewModel() => NfeLocalRetiradaModel();

  @override
  final standardFieldForFilter = "";

  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);
  final nomeExpedidorController = TextEditingController();
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
  final emailController = TextEditingController();
  final inscricaoEstadualController = TextEditingController();
  final ufController = CustomDropdownButtonController('AC');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeLocalRetirada) => nfeLocalRetirada.toJson).toList();
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
    nomeExpedidorController.text = '';
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
    emailController.text = '';
    inscricaoEstadualController.text = '';
    ufController.selected = 'AC';
  }

  void updateControllersFromModel() {
		_resetForm();
    cnpjController.text = nfeLocalRetiradaModel.cnpj ?? '';
    cpfController.text = nfeLocalRetiradaModel.cpf ?? '';
    nomeExpedidorController.text = nfeLocalRetiradaModel.nomeExpedidor ?? '';
    logradouroController.text = nfeLocalRetiradaModel.logradouro ?? '';
    numeroController.text = nfeLocalRetiradaModel.numero ?? '';
    complementoController.text = nfeLocalRetiradaModel.complemento ?? '';
    bairroController.text = nfeLocalRetiradaModel.bairro ?? '';
    codigoMunicipioController.updateValue((nfeLocalRetiradaModel.codigoMunicipio ?? 0).toDouble());
    nomeMunicipioController.text = nfeLocalRetiradaModel.nomeMunicipio ?? '';
    cepController.text = nfeLocalRetiradaModel.cep ?? '';
    codigoPaisController.updateValue((nfeLocalRetiradaModel.codigoPais ?? 0).toDouble());
    nomePaisController.text = nfeLocalRetiradaModel.nomePais ?? '';
    telefoneController.text = nfeLocalRetiradaModel.telefone ?? '';
    emailController.text = nfeLocalRetiradaModel.email ?? '';
    inscricaoEstadualController.text = nfeLocalRetiradaModel.inscricaoEstadual ?? '';
    ufController.selected = currentModel.uf ?? 'AC';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    final emailValidationMessage = ValidateFormField.validateEmail(nfeLocalRetiradaModel.email); 
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
    nomeExpedidorController.dispose();
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
    emailController.dispose();
    inscricaoEstadualController.dispose();
    ufController.dispose();
  }

}