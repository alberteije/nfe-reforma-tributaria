import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeInformacaoAgropecuarioController extends ControllerBase<NfeInformacaoAgropecuarioModel, void> {

  NfeInformacaoAgropecuarioController() : super(repository: null) {
    dbColumns = NfeInformacaoAgropecuarioModel.dbColumns;
    aliasColumns = NfeInformacaoAgropecuarioModel.aliasColumns;
    gridColumns = nfeInformacaoAgropecuarioGridColumns();
    functionName = "nfe_informacao_agropecuario";
    screenTitle = "Informação Agropecuário";
  }

  final _nfeInformacaoAgropecuarioModel = NfeInformacaoAgropecuarioModel().obs;
  NfeInformacaoAgropecuarioModel get nfeInformacaoAgropecuarioModel => _nfeInformacaoAgropecuarioModel.value;
  set nfeInformacaoAgropecuarioModel(value) => _nfeInformacaoAgropecuarioModel.value = value ?? NfeInformacaoAgropecuarioModel();

  List<NfeInformacaoAgropecuarioModel> get nfeInformacaoAgropecuarioModelList => Get.find<NfeCabecalhoController>().currentModel.nfeInformacaoAgropecuarioModelList ?? [];

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

  final nfeInformacaoAgropecuarioScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeInformacaoAgropecuarioFormKey = GlobalKey<FormState>();

  @override
  NfeInformacaoAgropecuarioModel createNewModel() => NfeInformacaoAgropecuarioModel();

  @override
  final standardFieldForFilter = NfeInformacaoAgropecuarioModel.aliasColumns[NfeInformacaoAgropecuarioModel.dbColumns.indexOf('numero_receituario')];

  final numeroReceituarioController = TextEditingController();
  final cpfResponsavelTecnicoController = TextEditingController();
  final guiaTipoController = CustomDropdownButtonController('1 - GTA - Guia de Trânsito Animal');
  final guiaUfEmissaoController = TextEditingController();
  final guiaSerieController = TextEditingController();
  final guiaNumeroController = TextEditingController();

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero_receituario'],
    'secondaryColumns': ['cpf_responsavel_tecnico'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeInformacaoAgropecuario) => nfeInformacaoAgropecuario.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeInformacaoAgropecuarioModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeInformacaoAgropecuarioModel = createNewModel();
    _resetForm();
    Get.to(() => NfeInformacaoAgropecuarioEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    numeroReceituarioController.text = '';
    cpfResponsavelTecnicoController.text = '';
    guiaTipoController.selected = '1 - GTA - Guia de Trânsito Animal';
    guiaUfEmissaoController.text = '';
    guiaSerieController.text = '';
    guiaNumeroController.text = '';
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
    final model = nfeInformacaoAgropecuarioModelList.firstWhere((m) => m.tempId == tempId);
    nfeInformacaoAgropecuarioModel = model.clone();
		nfeInformacaoAgropecuarioModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeInformacaoAgropecuarioEditPage());
  }

  void updateControllersFromModel() {
    numeroReceituarioController.text = nfeInformacaoAgropecuarioModel.numeroReceituario ?? '';
    cpfResponsavelTecnicoController.text = nfeInformacaoAgropecuarioModel.cpfResponsavelTecnico ?? '';
    guiaTipoController.selected = nfeInformacaoAgropecuarioModel.guiaTipo ?? '1 - GTA - Guia de Trânsito Animal';
    guiaUfEmissaoController.text = nfeInformacaoAgropecuarioModel.guiaUfEmissao ?? '';
    guiaSerieController.text = nfeInformacaoAgropecuarioModel.guiaSerie ?? '';
    guiaNumeroController.text = nfeInformacaoAgropecuarioModel.guiaNumero ?? '';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeInformacaoAgropecuarioFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeInformacaoAgropecuarioModelList.insert(0, nfeInformacaoAgropecuarioModel.clone());
      } else {
        final index = nfeInformacaoAgropecuarioModelList.indexWhere((m) => m.tempId == nfeInformacaoAgropecuarioModel.tempId);
        if (index >= 0) {
          nfeInformacaoAgropecuarioModelList[index] = nfeInformacaoAgropecuarioModel.clone();
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
      nfeInformacaoAgropecuarioModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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
    numeroReceituarioController.dispose();
    cpfResponsavelTecnicoController.dispose();
    guiaTipoController.dispose();
    guiaUfEmissaoController.dispose();
    guiaSerieController.dispose();
    guiaNumeroController.dispose();
  }

}