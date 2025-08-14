import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeFaturaController extends ControllerBase<NfeFaturaModel, void> with GetSingleTickerProviderStateMixin {

  NfeFaturaController() : super(repository: null) {
    dbColumns = NfeFaturaModel.dbColumns;
    aliasColumns = NfeFaturaModel.aliasColumns;
    functionName = "nfe_fatura";
    screenTitle = "Fatura";
  }

  final nfeFaturaScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeFaturaTabPageScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeFaturaFormKey = GlobalKey<FormState>();
  late TabController tabController;
  String? mandatoryMessage;

  final _nfeFaturaModel = NfeFaturaModel().obs;
  NfeFaturaModel get nfeFaturaModel => Get.find<NfeCabecalhoController>().currentModel.nfeFaturaModel ?? NfeFaturaModel();
  set nfeFaturaModel(value) => _nfeFaturaModel.value = value ?? NfeFaturaModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  @override
  NfeFaturaModel createNewModel() => NfeFaturaModel();

  @override
  final standardFieldForFilter = "";

  final nfeCabecalhoModelController = TextEditingController();
  final numeroController = TextEditingController();
  final valorOriginalController = MoneyMaskedTextController();
  final valorDescontoController = MoneyMaskedTextController();
  final valorLiquidoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeFatura) => nfeFatura.toJson).toList();
  }

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  Future<void> loadData() async {}

  @override
  void prepareForInsert() {}

  @override
  void selectRowForEditingById(int id) {}

  void updateControllersFromModel() {
		_resetForm();
    numeroController.text = nfeFaturaModel.numero ?? '';
    valorOriginalController.updateValue(nfeFaturaModel.valorOriginal ?? 0);
    valorDescontoController.updateValue(nfeFaturaModel.valorDesconto ?? 0);
    valorLiquidoController.updateValue(nfeFaturaModel.valorLiquido ?? 0);
  }

  void _resetForm() {
    formWasChangedDetail = false;
    nfeCabecalhoModelController.text = '';
    numeroController.text = '';
    valorOriginalController.updateValue(0);
    valorDescontoController.updateValue(0);
    valorLiquidoController.updateValue(0);
  }

  @override
  Future<void> save() async {}

  List<Tab> tabItems = [
    Tab(
			icon: Icon(iconDataList[Random().nextInt(10)]),
			text: 'Principal',
		),
    Tab(
			icon: Icon(iconDataList[Random().nextInt(10)]),
			text: 'Duplicata',
		),
  ];

  List<Widget> tabPages() {
    return [
      NfeFaturaEditPage(),
      const NfeDuplicataListPage(),
    ];
  }

  @override
  void preventDataLoss() {
    if (userMadeChanges()) {
      showQuestionDialog('message_data_loss'.tr, () {
        Get.back();
      });
    } else {
      Get.back();
    }
  }

  bool userMadeChanges() {
    return
    formWasChangedDetail
    ||
		Get.find<NfeDuplicataController>().userMadeChanges
    ;
  }

  void tabChange(int index) {
    validateCurrentForm();
  }

  bool validateCurrentForm() {
    return true;
  }

  bool validateForms() {
    return true;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabItems.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    nfeCabecalhoModelController.dispose();
    numeroController.dispose();
    valorOriginalController.dispose();
    valorDescontoController.dispose();
    valorLiquidoController.dispose();
  }
}