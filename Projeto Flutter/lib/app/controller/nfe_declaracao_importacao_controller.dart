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

class NfeDeclaracaoImportacaoController extends ControllerBase<NfeDeclaracaoImportacaoModel, void> {

  NfeDeclaracaoImportacaoController() : super(repository: null) {
    dbColumns = NfeDeclaracaoImportacaoModel.dbColumns;
    aliasColumns = NfeDeclaracaoImportacaoModel.aliasColumns;
    gridColumns = nfeDeclaracaoImportacaoGridColumns();
    functionName = "nfe_declaracao_importacao";
    screenTitle = "Declaração Importação";
  }

  final _nfeDeclaracaoImportacaoModel = NfeDeclaracaoImportacaoModel().obs;
  NfeDeclaracaoImportacaoModel get nfeDeclaracaoImportacaoModel => _nfeDeclaracaoImportacaoModel.value;
  set nfeDeclaracaoImportacaoModel(value) => _nfeDeclaracaoImportacaoModel.value = value ?? NfeDeclaracaoImportacaoModel();

  List<NfeDeclaracaoImportacaoModel> get nfeDeclaracaoImportacaoModelList => Get.find<NfeDetalheController>().nfeDetalheModel.nfeDeclaracaoImportacaoModelList ?? [];

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

  final nfeDeclaracaoImportacaoScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeDeclaracaoImportacaoFormKey = GlobalKey<FormState>();

  @override
  NfeDeclaracaoImportacaoModel createNewModel() => NfeDeclaracaoImportacaoModel();

  @override
  final standardFieldForFilter = NfeDeclaracaoImportacaoModel.aliasColumns[NfeDeclaracaoImportacaoModel.dbColumns.indexOf('numero_documento')];

  final numeroDocumentoController = TextEditingController();
  final localDesembaracoController = TextEditingController();
  final valorAfrmmController = MoneyMaskedTextController();
  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = TextEditingController();
  final codigoExportadorController = TextEditingController();
  final dataRegistroController = DatePickerItemController(null);
  final dataDesembaracoController = DatePickerItemController(null);
	final ufDesembaracoController = CustomDropdownButtonController('AC');
	final viaTransporteController = CustomDropdownButtonController('1=Marítima');
	final formaIntermediacaoController = CustomDropdownButtonController('1=Importação por conta própria');
	final ufTerceiroController = CustomDropdownButtonController('AC');

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['numero_documento'],
    'secondaryColumns': ['data_registro'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeDeclaracaoImportacao) => nfeDeclaracaoImportacao.toJson).toList();
  }

  @override
  List<PlutoRow> plutoRows() => List<PlutoRow>.from(nfeDeclaracaoImportacaoModelList.map((model) => model.toPlutoRow()));

  @override
  Future<void> getList({Filter? filter}) async {}

  @override
  void prepareForInsert() {
    isNewRecord = true;
    nfeDeclaracaoImportacaoModel = createNewModel();
    _resetForm();
    Get.to(() => NfeDeclaracaoImportacaoEditPage());
  }

  void _resetForm() {
    formWasChangedDetail = false;
    numeroDocumentoController.text = '';
    localDesembaracoController.text = '';
    valorAfrmmController.updateValue(0);
    cnpjController.text = '';
    cpfController.text = '';
    codigoExportadorController.text = '';
    dataRegistroController.date = null;
    dataDesembaracoController.date = null;
    ufDesembaracoController.selected = 'AC';
    viaTransporteController.selected = '1=Marítima';
    formaIntermediacaoController.selected = '1=Importação por conta própria';
    ufTerceiroController.selected = 'AC';
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
    final model = nfeDeclaracaoImportacaoModelList.firstWhere((m) => m.tempId == tempId);
    nfeDeclaracaoImportacaoModel = model.clone();
		nfeDeclaracaoImportacaoModel.tempId = model.tempId;
    updateControllersFromModel();
    Get.to(() => NfeDeclaracaoImportacaoEditPage());
  }

  void updateControllersFromModel() {
    numeroDocumentoController.text = nfeDeclaracaoImportacaoModel.numeroDocumento ?? '';
    localDesembaracoController.text = nfeDeclaracaoImportacaoModel.localDesembaraco ?? '';
    valorAfrmmController.updateValue(nfeDeclaracaoImportacaoModel.valorAfrmm ?? 0);
    cnpjController.text = nfeDeclaracaoImportacaoModel.cnpj ?? '';
    cpfController.text = nfeDeclaracaoImportacaoModel.cpf ?? '';
    codigoExportadorController.text = nfeDeclaracaoImportacaoModel.codigoExportador ?? '';
    dataRegistroController.date = nfeDeclaracaoImportacaoModel.dataRegistro;
    dataDesembaracoController.date = nfeDeclaracaoImportacaoModel.dataDesembaraco;
    ufDesembaracoController.selected = currentModel.ufDesembaraco ?? 'AC';
    viaTransporteController.selected = currentModel.viaTransporte ?? '1=Marítima';
    formaIntermediacaoController.selected = currentModel.formaIntermediacao ?? '1=Importação por conta própria';
    ufTerceiroController.selected = currentModel.ufTerceiro ?? 'AC';
    formWasChangedDetail = false;
  }

  @override
  Future<void> save() async {
    if (!nfeDeclaracaoImportacaoFormKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    if (formWasChangedDetail) {
      if (isNewRecord) {
        nfeDeclaracaoImportacaoModelList.insert(0, nfeDeclaracaoImportacaoModel.clone());
      } else {
        final index = nfeDeclaracaoImportacaoModelList.indexWhere((m) => m.tempId == nfeDeclaracaoImportacaoModel.tempId);
        if (index >= 0) {
          nfeDeclaracaoImportacaoModelList[index] = nfeDeclaracaoImportacaoModel.clone();
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
      nfeDeclaracaoImportacaoModelList.removeWhere((model) => (id != 0 && model.id == id) || (id == 0 && model.tempId == tempId));
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

  void callAdicoesPage() {
		Get.dialog(
      const AlertDialog(
        content: NfeImportacaoDetalheListPage(
        ),
      ),
    );
  }

  @override
  void onClose() {
    numeroDocumentoController.dispose();
    localDesembaracoController.dispose();
    valorAfrmmController.dispose();
    cnpjController.dispose();
    cpfController.dispose();
    codigoExportadorController.dispose();
    dataRegistroController.dispose();
    dataDesembaracoController.dispose();
    ufDesembaracoController.dispose();
    viaTransporteController.dispose();
    formaIntermediacaoController.dispose();
    ufTerceiroController.dispose();
  }

}