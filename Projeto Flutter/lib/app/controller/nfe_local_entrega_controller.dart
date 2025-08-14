import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeLocalEntregaController extends ControllerBase<NfeLocalEntregaModel, void> {

  NfeLocalEntregaController() : super(repository: null) {
    dbColumns = NfeLocalEntregaModel.dbColumns;
    aliasColumns = NfeLocalEntregaModel.aliasColumns;
    functionName = "nfe_local_entrega";
    screenTitle = "Local Entrega";
  }

	String? mandatoryMessage;

  final _nfeLocalEntregaModel = NfeLocalEntregaModel().obs;
  NfeLocalEntregaModel get nfeLocalEntregaModel => Get.find<NfeCabecalhoController>().currentModel.nfeLocalEntregaModel ?? NfeLocalEntregaModel();
  set nfeLocalEntregaModel(value) => _nfeLocalEntregaModel.value = value ?? NfeLocalEntregaModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeLocalEntregaScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeLocalEntregaFormKey = GlobalKey<FormState>();

  @override
  NfeLocalEntregaModel createNewModel() => NfeLocalEntregaModel();

  @override
  final standardFieldForFilter = "";

  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);
  final nomeRecebedorController = TextEditingController();
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
    return modelList.map((nfeLocalEntrega) => nfeLocalEntrega.toJson).toList();
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
    nomeRecebedorController.text = '';
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
    cnpjController.text = nfeLocalEntregaModel.cnpj ?? '';
    cpfController.text = nfeLocalEntregaModel.cpf ?? '';
    nomeRecebedorController.text = nfeLocalEntregaModel.nomeRecebedor ?? '';
    logradouroController.text = nfeLocalEntregaModel.logradouro ?? '';
    numeroController.text = nfeLocalEntregaModel.numero ?? '';
    complementoController.text = nfeLocalEntregaModel.complemento ?? '';
    bairroController.text = nfeLocalEntregaModel.bairro ?? '';
    codigoMunicipioController.updateValue((nfeLocalEntregaModel.codigoMunicipio ?? 0).toDouble());
    nomeMunicipioController.text = nfeLocalEntregaModel.nomeMunicipio ?? '';
    cepController.text = nfeLocalEntregaModel.cep ?? '';
    codigoPaisController.updateValue((nfeLocalEntregaModel.codigoPais ?? 0).toDouble());
    nomePaisController.text = nfeLocalEntregaModel.nomePais ?? '';
    telefoneController.text = nfeLocalEntregaModel.telefone ?? '';
    emailController.text = nfeLocalEntregaModel.email ?? '';
    inscricaoEstadualController.text = nfeLocalEntregaModel.inscricaoEstadual ?? '';
    ufController.selected = currentModel.uf ?? 'AC';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    final emailValidationMessage = ValidateFormField.validateEmail(nfeLocalEntregaModel.email); 
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
    nomeRecebedorController.dispose();
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