import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeDetalheImpostoIcmsUfdestController extends ControllerBase<NfeDetalheImpostoIcmsUfdestModel, void> {

  NfeDetalheImpostoIcmsUfdestController() : super(repository: null) {
    dbColumns = NfeDetalheImpostoIcmsUfdestModel.dbColumns;
    aliasColumns = NfeDetalheImpostoIcmsUfdestModel.aliasColumns;
    functionName = "nfe_detalhe_imposto_icms_ufdest";
    screenTitle = "ICMS UF Destinatário";
  }

	String? mandatoryMessage;

  final _nfeDetalheImpostoIcmsUfdestModel = NfeDetalheImpostoIcmsUfdestModel().obs;
  NfeDetalheImpostoIcmsUfdestModel get nfeDetalheImpostoIcmsUfdestModel => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDetalheImpostoIcmsUfdestModel ?? NfeDetalheImpostoIcmsUfdestModel();
  set nfeDetalheImpostoIcmsUfdestModel(value) => _nfeDetalheImpostoIcmsUfdestModel.value = value ?? NfeDetalheImpostoIcmsUfdestModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  final nfeDetalheImpostoIcmsUfdestScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDetalheImpostoIcmsUfdestFormKey = GlobalKey<FormState>();

  @override
  NfeDetalheImpostoIcmsUfdestModel createNewModel() => NfeDetalheImpostoIcmsUfdestModel();

  @override
  final standardFieldForFilter = "";

  final valorBcIcmsUfDestinoController = MoneyMaskedTextController();
  final valorBcFcpUfDestinoController = MoneyMaskedTextController();
  final percentualFcpUfDestinoController = MoneyMaskedTextController();
  final aliquotaInternaUfDestinoController = MoneyMaskedTextController();
  final aliquotaInteresdatualUfEnvolvidasController = MoneyMaskedTextController();
  final percentualProvisorioPartilhaIcmsController = MoneyMaskedTextController();
  final valorIcmsFcpUfDestinoController = MoneyMaskedTextController();
  final valorInterestadualUfDestinoController = MoneyMaskedTextController();
  final valorInterestadualUfRemetenteController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDetalheImpostoIcmsUfdest) => nfeDetalheImpostoIcmsUfdest.toJson).toList();
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
    valorBcIcmsUfDestinoController.updateValue(0);
    valorBcFcpUfDestinoController.updateValue(0);
    percentualFcpUfDestinoController.updateValue(0);
    aliquotaInternaUfDestinoController.updateValue(0);
    aliquotaInteresdatualUfEnvolvidasController.updateValue(0);
    percentualProvisorioPartilhaIcmsController.updateValue(0);
    valorIcmsFcpUfDestinoController.updateValue(0);
    valorInterestadualUfDestinoController.updateValue(0);
    valorInterestadualUfRemetenteController.updateValue(0);
  }

  void updateControllersFromModel() {
		_resetForm();
    valorBcIcmsUfDestinoController.updateValue(nfeDetalheImpostoIcmsUfdestModel.valorBcIcmsUfDestino ?? 0);
    valorBcFcpUfDestinoController.updateValue(nfeDetalheImpostoIcmsUfdestModel.valorBcFcpUfDestino ?? 0);
    percentualFcpUfDestinoController.updateValue(nfeDetalheImpostoIcmsUfdestModel.percentualFcpUfDestino ?? 0);
    aliquotaInternaUfDestinoController.updateValue(nfeDetalheImpostoIcmsUfdestModel.aliquotaInternaUfDestino ?? 0);
    aliquotaInteresdatualUfEnvolvidasController.updateValue(nfeDetalheImpostoIcmsUfdestModel.aliquotaInteresdatualUfEnvolvidas ?? 0);
    percentualProvisorioPartilhaIcmsController.updateValue(nfeDetalheImpostoIcmsUfdestModel.percentualProvisorioPartilhaIcms ?? 0);
    valorIcmsFcpUfDestinoController.updateValue(nfeDetalheImpostoIcmsUfdestModel.valorIcmsFcpUfDestino ?? 0);
    valorInterestadualUfDestinoController.updateValue(nfeDetalheImpostoIcmsUfdestModel.valorInterestadualUfDestino ?? 0);
    valorInterestadualUfRemetenteController.updateValue(nfeDetalheImpostoIcmsUfdestModel.valorInterestadualUfRemetente ?? 0);
  }

  @override
  Future<void> save() async {}

	bool validateForm() {
    return true;
	}


  @override
  void onClose() {
    valorBcIcmsUfDestinoController.dispose();
    valorBcFcpUfDestinoController.dispose();
    percentualFcpUfDestinoController.dispose();
    aliquotaInternaUfDestinoController.dispose();
    aliquotaInteresdatualUfEnvolvidasController.dispose();
    percentualProvisorioPartilhaIcmsController.dispose();
    valorIcmsFcpUfDestinoController.dispose();
    valorInterestadualUfDestinoController.dispose();
    valorInterestadualUfRemetenteController.dispose();
  }

}