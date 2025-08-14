import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeCanaDeducoesSafraController extends ControllerBase<NfeCanaDeducoesSafraModel, void> {

  NfeCanaDeducoesSafraController() : super(repository: null) {
    dbColumns = NfeCanaDeducoesSafraModel.dbColumns;
    aliasColumns = NfeCanaDeducoesSafraModel.aliasColumns;
    gridColumns = nfeCanaDeducoesSafraGridColumns();
    functionName = "nfe_cana_deducoes_safra";
    screenTitle = "Deduções Safra";
  }

  final _nfeCanaDeducoesSafraModel = NfeCanaDeducoesSafraModel().obs;
  NfeCanaDeducoesSafraModel get nfeCanaDeducoesSafraModel => _nfeCanaDeducoesSafraModel.value;
  set nfeCanaDeducoesSafraModel(value) => _nfeCanaDeducoesSafraModel.value = value ?? NfeCanaDeducoesSafraModel();

  List<NfeCanaDeducoesSafraModel> get nfeCanaDeducoesSafraModelList => Get.find<NfeCanaController>().nfeCanaModel.nfeCanaDeducoesSafraModelList ?? [];

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

  final nfeCanaDeducoesSafraScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCanaDeducoesSafraFormKey = GlobalKey<FormState>();

  @override
  NfeCanaDeducoesSafraModel createNewModel() => NfeCanaDeducoesSafraModel();

  @override
  final standardFieldForFilter = NfeCanaDeducoesSafraModel.aliasColumns[NfeCanaDeducoesSafraModel.dbColumns.indexOf('decricao')];

  final decricaoController = TextEditingController();
  final valorDeducaoController = MoneyMaskedTextController();
  final valorFornecimentoController = MoneyMaskedTextController();
  final valorTotalDeducaoController = MoneyMaskedTextController();
  final valorLiquidoFornecimentoController = MoneyMaskedTextController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['decricao'],
    'secondaryColumns': ['valor_deducao'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeCanaDeducoesSafra) => nfeCanaDeducoesSafra.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeCanaDeducoesSafraModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeCanaDeducoesSafraModel = createNewModel();
    _resetForm();
    Get.to(() => NfeCanaDeducoesSafraEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    decricaoController.text = '';
    valorDeducaoController.updateValue(0);
    valorFornecimentoController.updateValue(0);
    valorTotalDeducaoController.updateValue(0);
    valorLiquidoFornecimentoController.updateValue(0);
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
    final model = nfeCanaDeducoesSafraModelList.firstWhere((m) => m.tempId == tempId);
    nfeCanaDeducoesSafraModel = model.clone();
		nfeCanaDeducoesSafraModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeCanaDeducoesSafraEditPage());
  }

  void updateControllersFromModel() {
    decricaoController.text = nfeCanaDeducoesSafraModel.decricao ?? '';
    valorDeducaoController.updateValue(nfeCanaDeducoesSafraModel.valorDeducao ?? 0);
    valorFornecimentoController.updateValue(nfeCanaDeducoesSafraModel.valorFornecimento ?? 0);
    valorTotalDeducaoController.updateValue(nfeCanaDeducoesSafraModel.valorTotalDeducao ?? 0);
    valorLiquidoFornecimentoController.updateValue(nfeCanaDeducoesSafraModel.valorLiquidoFornecimento ?? 0);
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeCanaDeducoesSafraFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeCanaDeducoesSafraModelList.insert(0, nfeCanaDeducoesSafraModel.clone());
      } else {
        final index = nfeCanaDeducoesSafraModelList.indexWhere((m) => m.tempId == nfeCanaDeducoesSafraModel.tempId);
        if (index >= 0) {
          nfeCanaDeducoesSafraModelList[index] = nfeCanaDeducoesSafraModel.clone();
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
      nfeCanaDeducoesSafraModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    decricaoController.dispose();
    valorDeducaoController.dispose();
    valorFornecimentoController.dispose();
    valorTotalDeducaoController.dispose();
    valorLiquidoFornecimentoController.dispose();
  }

}