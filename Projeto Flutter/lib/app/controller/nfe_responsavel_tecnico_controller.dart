import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeResponsavelTecnicoController extends ControllerBase<NfeResponsavelTecnicoModel, void> {

  NfeResponsavelTecnicoController() : super(repository: null) {
    dbColumns = NfeResponsavelTecnicoModel.dbColumns;
    aliasColumns = NfeResponsavelTecnicoModel.aliasColumns;
    functionName = "nfe_responsavel_tecnico";
    screenTitle = "Responsável Técnico";
  }

	String? mandatoryMessage;

  final _nfeResponsavelTecnicoModel = NfeResponsavelTecnicoModel().obs;
  NfeResponsavelTecnicoModel get nfeResponsavelTecnicoModel => Get.find<NfeCabecalhoController>().currentModel.nfeResponsavelTecnicoModel ?? NfeResponsavelTecnicoModel();
  set nfeResponsavelTecnicoModel(value) => _nfeResponsavelTecnicoModel.value = value ?? NfeResponsavelTecnicoModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeResponsavelTecnicoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeResponsavelTecnicoFormKey = GlobalKey<FormState>();

  @override
  NfeResponsavelTecnicoModel createNewModel() => NfeResponsavelTecnicoModel();

  @override
  final standardFieldForFilter = "";

  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final contatoController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final identificadorCsrtController = TextEditingController();
  final hashCsrtController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeResponsavelTecnico) => nfeResponsavelTecnico.toJson).toList();
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
    contatoController.text = '';
    emailController.text = '';
    telefoneController.text = '';
    identificadorCsrtController.text = '';
    hashCsrtController.text = '';
  }

  void updateControllersFromModel() {
		_resetForm();
    cnpjController.text = nfeResponsavelTecnicoModel.cnpj ?? '';
    contatoController.text = nfeResponsavelTecnicoModel.contato ?? '';
    emailController.text = nfeResponsavelTecnicoModel.email ?? '';
    telefoneController.text = nfeResponsavelTecnicoModel.telefone ?? '';
    identificadorCsrtController.text = nfeResponsavelTecnicoModel.identificadorCsrt ?? '';
    hashCsrtController.text = nfeResponsavelTecnicoModel.hashCsrt ?? '';
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    final emailValidationMessage = ValidateFormField.validateEmail(nfeResponsavelTecnicoModel.email); 
		if (emailValidationMessage != null) { 
			showErrorSnackBar(message: emailValidationMessage); 
			return false; 
		}
    return true;
	}


  @override
  void onClose() {
    cnpjController.dispose();
    contatoController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    identificadorCsrtController.dispose();
    hashCsrtController.dispose();
  }

}