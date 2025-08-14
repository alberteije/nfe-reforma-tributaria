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

class NfeItemRastreadoController extends ControllerBase<NfeItemRastreadoModel, void> {

  NfeItemRastreadoController() : super(repository: null) {
    dbColumns = NfeItemRastreadoModel.dbColumns;
    aliasColumns = NfeItemRastreadoModel.aliasColumns;
    gridColumns = nfeItemRastreadoGridColumns();
    functionName = "nfe_item_rastreado";
    screenTitle = "Item Rastreado";
  }

  final _nfeItemRastreadoModel = NfeItemRastreadoModel().obs;
  NfeItemRastreadoModel get nfeItemRastreadoModel => _nfeItemRastreadoModel.value;
  set nfeItemRastreadoModel(value) => _nfeItemRastreadoModel.value = value ?? NfeItemRastreadoModel();

  List<NfeItemRastreadoModel> get nfeItemRastreadoModelList => Get.find<NfeDetalheController>().nfeDetalheModel.nfeItemRastreadoModelList ?? [];

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

  final nfeItemRastreadoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeItemRastreadoFormKey = GlobalKey<FormState>();

  @override
  NfeItemRastreadoModel createNewModel() => NfeItemRastreadoModel();

  @override
  final standardFieldForFilter = NfeItemRastreadoModel.aliasColumns[NfeItemRastreadoModel.dbColumns.indexOf('numero_lote')];

  final numeroLoteController = TextEditingController();
  final quantidadeItensController = MoneyMaskedTextController();
  final codigoAgregacaoController = TextEditingController();
  final dataFabricacaoController = DatePickerItemController(null);
  final dataValidadeController = DatePickerItemController(null);

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero_lote'],
    'secondaryColumns': ['quantidade_itens'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeItemRastreado) => nfeItemRastreado.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeItemRastreadoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeItemRastreadoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeItemRastreadoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    numeroLoteController.text = '';
    quantidadeItensController.updateValue(0);
    codigoAgregacaoController.text = '';
    dataFabricacaoController.date = null;
    dataValidadeController.date = null;
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
    final model = nfeItemRastreadoModelList.firstWhere((m) => m.tempId == tempId);
    nfeItemRastreadoModel = model.clone();
		nfeItemRastreadoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeItemRastreadoEditPage());
  }

  void updateControllersFromModel() {
    numeroLoteController.text = nfeItemRastreadoModel.numeroLote ?? '';
    quantidadeItensController.updateValue(nfeItemRastreadoModel.quantidadeItens ?? 0);
    codigoAgregacaoController.text = nfeItemRastreadoModel.codigoAgregacao ?? '';
    dataFabricacaoController.date = nfeItemRastreadoModel.dataFabricacao;
    dataValidadeController.date = nfeItemRastreadoModel.dataValidade;
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeItemRastreadoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeItemRastreadoModelList.insert(0, nfeItemRastreadoModel.clone());
      } else {
        final index = nfeItemRastreadoModelList.indexWhere((m) => m.tempId == nfeItemRastreadoModel.tempId);
        if (index >= 0) {
          nfeItemRastreadoModelList[index] = nfeItemRastreadoModel.clone();
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
      nfeItemRastreadoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    numeroLoteController.dispose();
    quantidadeItensController.dispose();
    codigoAgregacaoController.dispose();
    dataFabricacaoController.dispose();
    dataValidadeController.dispose();
  }

}