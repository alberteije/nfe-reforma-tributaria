import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeAcessoXmlController extends ControllerBase<NfeAcessoXmlModel, void> {

  NfeAcessoXmlController() : super(repository: null) {
    dbColumns = NfeAcessoXmlModel.dbColumns;
    aliasColumns = NfeAcessoXmlModel.aliasColumns;
    gridColumns = nfeAcessoXmlGridColumns();
    functionName = "nfe_acesso_xml";
    screenTitle = "Acesso XML";
  }

  final _nfeAcessoXmlModel = NfeAcessoXmlModel().obs;
  NfeAcessoXmlModel get nfeAcessoXmlModel => _nfeAcessoXmlModel.value;
  set nfeAcessoXmlModel(value) => _nfeAcessoXmlModel.value = value ?? NfeAcessoXmlModel();

  List<NfeAcessoXmlModel> get nfeAcessoXmlModelList => Get.find<NfeCabecalhoController>().currentModel.nfeAcessoXmlModelList ?? [];

  final _userMadeChanges = false.obs;
  get userMadeChanges => _userMadeChanges.value;
  set userMadeChanges(value) => _userMadeChanges.value = value;

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  late PlutoGridStateManager _plutoGridStateManager;
  @override
  PlutoGridStateManager get plutoGridStateManager => _plutoGridStateManager;
  @override
  set plutoGridStateManager(value) => _plutoGridStateManager = value;

  final nfeAcessoXmlScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeAcessoXmlFormKey = GlobalKey<FormState>();

  @override
  NfeAcessoXmlModel createNewModel() => NfeAcessoXmlModel();

  @override
  final standardFieldForFilter = NfeAcessoXmlModel.aliasColumns[NfeAcessoXmlModel.dbColumns.indexOf('cnpj')];

  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['cnpj'],
    'secondaryColumns': ['cpf'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeAcessoXml) => nfeAcessoXml.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeAcessoXmlModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeAcessoXmlModel = createNewModel();
    _resetForm();
    Get.to(() => NfeAcessoXmlEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    cnpjController.text = '';
    cpfController.text = '';
  }

  @override
  void selectRowForEditing(PlutoRow? row) async {
    if (row == null) {
      showInfoSnackBar(message: 'message_select_one_to_edited'.tr);
      return;
    }

    selectRowForEditingByTempId(row.cells['tempId']?.value);
  }

  @override
  void selectRowForEditingById(int id) {}

  void selectRowForEditingByTempId(String tempId) {
		isNewRecord = false;
    final model = nfeAcessoXmlModelList.firstWhere((m) => m.tempId == tempId);
    nfeAcessoXmlModel = model.clone();
		nfeAcessoXmlModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeAcessoXmlEditPage());
  }

  void updateControllersFromModel() {
    cnpjController.text = nfeAcessoXmlModel.cnpj ?? '';
    cpfController.text = nfeAcessoXmlModel.cpf ?? '';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeAcessoXmlFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeAcessoXmlModelList.insert(0, nfeAcessoXmlModel.clone());
      } else {
        final index = nfeAcessoXmlModelList.indexWhere((m) => m.tempId == nfeAcessoXmlModel.tempId);
        if (index >= 0) {
          nfeAcessoXmlModelList[index] = nfeAcessoXmlModel.clone();
        }
      }

      userMadeChanges = true;
      loadData();
      Get.back(result: true);
    } else {
      Get.back();
    }
  }


  @override
  Future deleteSelected() async {
    final currentRow = plutoGridStateManager.currentRow;
    if (currentRow == null) {
      showInfoSnackBar(message: 'message_select_one_to_delete'.tr);
      return null;
    }
    showDeleteDialog(() async {
      final id = currentRow.cells['id']?.value;
      final tempId = currentRow.cells['tempId']?.value;
      nfeAcessoXmlModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
      plutoGridStateManager.removeCurrentRow();
      userMadeChanges = true;
    });
  }

  @override
  void preventDataLoss() {
    if (formWasChangedDetail) {
      showQuestionDialog('message_data_loss'.tr, () => Get.back());
    } else {
      formWasChangedDetail = false;
      Get.back();
    }
  }

  @override
  void onClose() {
    cnpjController.dispose();
    cpfController.dispose();
  }

}