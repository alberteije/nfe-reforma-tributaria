import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/page/grid_columns/grid_columns_imports.dart';
import 'package:nfe/app/routes/app_routes.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/data/repository/nfe_numero_inutilizado_repository.dart';

class NfeNumeroInutilizadoController extends ControllerBase<NfeNumeroInutilizadoModel, NfeNumeroInutilizadoRepository> {

  NfeNumeroInutilizadoController({required super.repository}) {
    dbColumns = NfeNumeroInutilizadoModel.dbColumns;
    aliasColumns = NfeNumeroInutilizadoModel.aliasColumns;
    gridColumns = nfeNumeroInutilizadoGridColumns();
    functionName = "nfe_numero_inutilizado";
    screenTitle = "Números Inutilizados";
  }

  @override
  NfeNumeroInutilizadoModel createNewModel() => NfeNumeroInutilizadoModel();

  @override
  final standardFieldForFilter = NfeNumeroInutilizadoModel.aliasColumns[NfeNumeroInutilizadoModel.dbColumns.indexOf('serie')];

  final serieController = TextEditingController();
  final numeroController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final observacaoController = TextEditingController();
  final dataInutilizacaoController = DatePickerItemController(null);

  final Map<String, dynamic> mobileConfig = {
    'primaryColumns': ['serie'],
    'secondaryColumns': ['numero'],
  };

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeNumeroInutilizado) => nfeNumeroInutilizado.toJson).toList();
  }

  @override
  void prepareForInsert() {
    isNewRecord = true;
    currentModel = createNewModel();
    _resetForm();
    Get.toNamed(Routes.nfeNumeroInutilizadoEditPage);
  }

  void _resetForm() {
    formWasChanged = false;
    serieController.text = '';
    numeroController.updateValue(0);
    observacaoController.text = '';
    dataInutilizacaoController.date = null;
  }

  @override
  void selectRowForEditingById(int id) {
    final model = modelList.firstWhere((m) => m.id == id);
    currentModel = model.clone();
    updateControllersFromModel();
    Get.toNamed(Routes.nfeNumeroInutilizadoEditPage);
  }

  void updateControllersFromModel() {
    serieController.text = currentModel.serie ?? '';
    numeroController.updateValue((currentModel.numero ?? 0).toDouble());
    observacaoController.text = currentModel.observacao ?? '';
    dataInutilizacaoController.date = currentModel.dataInutilizacao;
    formWasChanged = false;
  }

  @override
  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
      return;
    }

    final existingIndex = modelList.indexWhere((m) => m.id == currentModel.id);

    if (existingIndex >= 0) {
      modelList[existingIndex] = currentModel.clone();
    }

    final result = await repository.save(nfeNumeroInutilizadoModel: currentModel);
    if (result == null) return;

    if (existingIndex >= 0) {
      modelList[existingIndex] = result;
    } else {
      modelList.insert(0, result);
    }

    if (!GetPlatform.isMobile) {
      updateGridRow(result);
    }

    Get.back(result: true);
  }


  @override
  void onClose() {
    serieController.dispose();
    numeroController.dispose();
    observacaoController.dispose();
    dataInutilizacaoController.dispose();
    super.onClose();
  }

}