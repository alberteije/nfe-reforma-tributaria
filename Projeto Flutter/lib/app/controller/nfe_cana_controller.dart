import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeCanaController extends ControllerBase<NfeCanaModel, void> with GetSingleTickerProviderStateMixin {

  NfeCanaController() : super(repository: null) {
    dbColumns = NfeCanaModel.dbColumns;
    aliasColumns = NfeCanaModel.aliasColumns;
    functionName = "nfe_cana";
    screenTitle = "Cana";
  }

  final nfeCanaScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCanaTabPageScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCanaFormKey = GlobalKey<FormState>();
  late TabController tabController;
  String? mandatoryMessage;

  final _nfeCanaModel = NfeCanaModel().obs;
  NfeCanaModel get nfeCanaModel => Get.find<NfeCabecalhoController>().currentModel.nfeCanaModel ?? NfeCanaModel();
  set nfeCanaModel(value) => _nfeCanaModel.value = value ?? NfeCanaModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  @override
  NfeCanaModel createNewModel() => NfeCanaModel();

  @override
  final standardFieldForFilter = "";

  final nfeCabecalhoModelController = TextEditingController();
  final safraController = TextEditingController();
  final mesAnoReferenciaController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeCana) => nfeCana.toJson).toList();
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
    safraController.text = nfeCanaModel.safra ?? '';
    mesAnoReferenciaController.text = nfeCanaModel.mesAnoReferencia ?? '';
  }

  void _resetForm() {
    formWasChangedDetail = false;
    nfeCabecalhoModelController.text = '';
    safraController.text = '';
    mesAnoReferenciaController.text = '';
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
			text: 'Fornecimento Diário',
		),
    Tab(
			icon: Icon(iconDataList[Random().nextInt(10)]),
			text: 'Deduções',
		),
  ];

  List<Widget> tabPages() {
    return [
      NfeCanaEditPage(),
      const NfeCanaFornecimentoDiarioListPage(),
      const NfeCanaDeducoesSafraListPage(),
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
		Get.find<NfeCanaFornecimentoDiarioController>().userMadeChanges
    ||
		Get.find<NfeCanaDeducoesSafraController>().userMadeChanges
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
    safraController.dispose();
    mesAnoReferenciaController.dispose();
  }
}