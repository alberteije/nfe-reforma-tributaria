import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeProdRuralReferenciadaController extends ControllerBase<NfeProdRuralReferenciadaModel, void> {

  NfeProdRuralReferenciadaController() : super(repository: null) {
    dbColumns = NfeProdRuralReferenciadaModel.dbColumns;
    aliasColumns = NfeProdRuralReferenciadaModel.aliasColumns;
    gridColumns = nfeProdRuralReferenciadaGridColumns();
    functionName = "nfe_prod_rural_referenciada";
    screenTitle = "NFe Produtor Rural";
  }

  final _nfeProdRuralReferenciadaModel = NfeProdRuralReferenciadaModel().obs;
  NfeProdRuralReferenciadaModel get nfeProdRuralReferenciadaModel => _nfeProdRuralReferenciadaModel.value;
  set nfeProdRuralReferenciadaModel(value) => _nfeProdRuralReferenciadaModel.value = value ?? NfeProdRuralReferenciadaModel();

  List<NfeProdRuralReferenciadaModel> get nfeProdRuralReferenciadaModelList => Get.find<NfeCabecalhoController>().currentModel.nfeProdRuralReferenciadaModelList ?? [];

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

  final nfeProdRuralReferenciadaScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeProdRuralReferenciadaFormKey = GlobalKey<FormState>();

  @override
  NfeProdRuralReferenciadaModel createNewModel() => NfeProdRuralReferenciadaModel();

  @override
  final standardFieldForFilter = NfeProdRuralReferenciadaModel.aliasColumns[NfeProdRuralReferenciadaModel.dbColumns.indexOf('codigo_uf')];

  final codigoUfController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final anoMesController = TextEditingController();
  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);
  final inscricaoEstadualController = TextEditingController();
  final serieController = TextEditingController();
  final numeroNfController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final cteController = TextEditingController();
	final modeloController = CustomDropdownButtonController('04');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['codigo_uf'],
    'secondaryColumns': ['ano_mes'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeProdRuralReferenciada) => nfeProdRuralReferenciada.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeProdRuralReferenciadaModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeProdRuralReferenciadaModel = createNewModel();
    _resetForm();
    Get.to(() => NfeProdRuralReferenciadaEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    codigoUfController.updateValue(0);
    anoMesController.text = '';
    cnpjController.text = '';
    cpfController.text = '';
    inscricaoEstadualController.text = '';
    serieController.text = '';
    numeroNfController.updateValue(0);
    cteController.text = '';
    modeloController.selected = '04';
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
    final model = nfeProdRuralReferenciadaModelList.firstWhere((m) => m.tempId == tempId);
    nfeProdRuralReferenciadaModel = model.clone();
		nfeProdRuralReferenciadaModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeProdRuralReferenciadaEditPage());
  }

  void updateControllersFromModel() {
    codigoUfController.updateValue((nfeProdRuralReferenciadaModel.codigoUf ?? 0).toDouble());
    anoMesController.text = nfeProdRuralReferenciadaModel.anoMes ?? '';
    cnpjController.text = nfeProdRuralReferenciadaModel.cnpj ?? '';
    cpfController.text = nfeProdRuralReferenciadaModel.cpf ?? '';
    inscricaoEstadualController.text = nfeProdRuralReferenciadaModel.inscricaoEstadual ?? '';
    serieController.text = nfeProdRuralReferenciadaModel.serie ?? '';
    numeroNfController.updateValue((nfeProdRuralReferenciadaModel.numeroNf ?? 0).toDouble());
    cteController.text = nfeProdRuralReferenciadaModel.cte ?? '';
    modeloController.selected = currentModel.modelo ?? '04';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeProdRuralReferenciadaFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeProdRuralReferenciadaModelList.insert(0, nfeProdRuralReferenciadaModel.clone());
      } else {
        final index = nfeProdRuralReferenciadaModelList.indexWhere((m) => m.tempId == nfeProdRuralReferenciadaModel.tempId);
        if (index >= 0) {
          nfeProdRuralReferenciadaModelList[index] = nfeProdRuralReferenciadaModel.clone();
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
      nfeProdRuralReferenciadaModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    codigoUfController.dispose();
    anoMesController.dispose();
    cnpjController.dispose();
    cpfController.dispose();
    inscricaoEstadualController.dispose();
    serieController.dispose();
    numeroNfController.dispose();
    cteController.dispose();
    modeloController.dispose();
  }

}