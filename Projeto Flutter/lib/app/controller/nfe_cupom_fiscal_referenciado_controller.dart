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

class NfeCupomFiscalReferenciadoController extends ControllerBase<NfeCupomFiscalReferenciadoModel, void> {

  NfeCupomFiscalReferenciadoController() : super(repository: null) {
    dbColumns = NfeCupomFiscalReferenciadoModel.dbColumns;
    aliasColumns = NfeCupomFiscalReferenciadoModel.aliasColumns;
    gridColumns = nfeCupomFiscalReferenciadoGridColumns();
    functionName = "nfe_cupom_fiscal_referenciado";
    screenTitle = "CF Referenciado";
  }

  final _nfeCupomFiscalReferenciadoModel = NfeCupomFiscalReferenciadoModel().obs;
  NfeCupomFiscalReferenciadoModel get nfeCupomFiscalReferenciadoModel => _nfeCupomFiscalReferenciadoModel.value;
  set nfeCupomFiscalReferenciadoModel(value) => _nfeCupomFiscalReferenciadoModel.value = value ?? NfeCupomFiscalReferenciadoModel();

  List<NfeCupomFiscalReferenciadoModel> get nfeCupomFiscalReferenciadoModelList => Get.find<NfeCabecalhoController>().currentModel.nfeCupomFiscalReferenciadoModelList ?? [];

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

  final nfeCupomFiscalReferenciadoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeCupomFiscalReferenciadoFormKey = GlobalKey<FormState>();

  @override
  NfeCupomFiscalReferenciadoModel createNewModel() => NfeCupomFiscalReferenciadoModel();

  @override
  final standardFieldForFilter = NfeCupomFiscalReferenciadoModel.aliasColumns[NfeCupomFiscalReferenciadoModel.dbColumns.indexOf('modelo_documento_fiscal')];

  final numeroOrdemEcfController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final cooController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final numeroCaixaController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final numeroSerieEcfController = TextEditingController();
  final dataEmissaoCupomController = DatePickerItemController(null);
  final modeloDocumentoFiscalController = CustomDropdownButtonController('2B=Cupom Fiscal emitido por máquina registradora (não ECF)');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['modelo_documento_fiscal'],
    'secondaryColumns': ['numero_ordem_ecf'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeCupomFiscalReferenciado) => nfeCupomFiscalReferenciado.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeCupomFiscalReferenciadoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeCupomFiscalReferenciadoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeCupomFiscalReferenciadoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    numeroOrdemEcfController.updateValue(0);
    cooController.updateValue(0);
    numeroCaixaController.updateValue(0);
    numeroSerieEcfController.text = '';
    dataEmissaoCupomController.date = null;
    modeloDocumentoFiscalController.selected = '2B=Cupom Fiscal emitido por máquina registradora (não ECF)';
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
    final model = nfeCupomFiscalReferenciadoModelList.firstWhere((m) => m.tempId == tempId);
    nfeCupomFiscalReferenciadoModel = model.clone();
		nfeCupomFiscalReferenciadoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeCupomFiscalReferenciadoEditPage());
  }

  void updateControllersFromModel() {
    numeroOrdemEcfController.updateValue((nfeCupomFiscalReferenciadoModel.numeroOrdemEcf ?? 0).toDouble());
    cooController.updateValue((nfeCupomFiscalReferenciadoModel.coo ?? 0).toDouble());
    numeroCaixaController.updateValue((nfeCupomFiscalReferenciadoModel.numeroCaixa ?? 0).toDouble());
    numeroSerieEcfController.text = nfeCupomFiscalReferenciadoModel.numeroSerieEcf ?? '';
    dataEmissaoCupomController.date = currentModel.dataEmissaoCupom;
    modeloDocumentoFiscalController.selected = currentModel.modeloDocumentoFiscal ?? '2B=Cupom Fiscal emitido por máquina registradora (não ECF)';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeCupomFiscalReferenciadoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeCupomFiscalReferenciadoModelList.insert(0, nfeCupomFiscalReferenciadoModel.clone());
      } else {
        final index = nfeCupomFiscalReferenciadoModelList.indexWhere((m) => m.tempId == nfeCupomFiscalReferenciadoModel.tempId);
        if (index >= 0) {
          nfeCupomFiscalReferenciadoModelList[index] = nfeCupomFiscalReferenciadoModel.clone();
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
      nfeCupomFiscalReferenciadoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    numeroOrdemEcfController.dispose();
    cooController.dispose();
    numeroCaixaController.dispose();
    numeroSerieEcfController.dispose();
    dataEmissaoCupomController.dispose();
    modeloDocumentoFiscalController.dispose();
  }

}