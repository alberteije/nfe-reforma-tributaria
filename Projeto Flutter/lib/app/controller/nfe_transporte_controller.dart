import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/page_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';
import 'package:nfe/app/page/shared_widget/message_dialog.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeTransporteController extends ControllerBase<NfeTransporteModel, void> with GetSingleTickerProviderStateMixin {

  NfeTransporteController() : super(repository: null) {
    dbColumns = NfeTransporteModel.dbColumns;
    aliasColumns = NfeTransporteModel.aliasColumns;
    functionName = "nfe_transporte";
    screenTitle = "Transporte";
  }

  final nfeTransporteScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeTransporteTabPageScaffoldKey = GlobalKey<ScaffoldState>();
  final nfeTransporteFormKey = GlobalKey<FormState>();
  late TabController tabController;
  String? mandatoryMessage;  

  final _nfeTransporteModel = NfeTransporteModel().obs;
  NfeTransporteModel get nfeTransporteModel => Get.find<NfeCabecalhoController>().currentModel.nfeTransporteModel ?? NfeTransporteModel();
  set nfeTransporteModel(value) => _nfeTransporteModel.value = value ?? NfeTransporteModel();

  final _formWasChangedDetail = false.obs;
  bool get formWasChangedDetail => _formWasChangedDetail.value;
  set formWasChangedDetail(value) => _formWasChangedDetail.value = value;

  @override
  NfeTransporteModel createNewModel() => NfeTransporteModel();

  @override
  final standardFieldForFilter = "";

  final nfeCabecalhoModelController = TextEditingController();
  final idTransportadoraController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final cnpjController = MaskedTextController(mask: '00.000.000/0000-00',);
  final cpfController = MaskedTextController(mask: '000.000.000-00',);
  final nomeController = TextEditingController();
  final inscricaoEstadualController = TextEditingController();
  final enderecoController = TextEditingController();
  final nomeMunicipioController = TextEditingController();
  final valorServicoController = MoneyMaskedTextController();
  final valorBcRetencaoIcmsController = MoneyMaskedTextController();
  final aliquotaRetencaoIcmsController = MoneyMaskedTextController();
  final valorIcmsRetidoController = MoneyMaskedTextController();
  final cfopController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final municipioController = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: '');
  final placaVeiculoController = TextEditingController();
  final rntcVeiculoController = TextEditingController();
	final modalidadeFreteController = CustomDropdownButtonController('0=Contratação do Frete por conta do Remetente (CIF)');
	final ufController = CustomDropdownButtonController('AC');
	final ufVeiculoController = CustomDropdownButtonController('AC');

  final Map<String, dynamic> mobileConfig = {};

  List<Map<String, dynamic>> get mobileItems {
    return modelList.map((nfeTransporte) => nfeTransporte.toJson).toList();
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
    idTransportadoraController.updateValue((nfeTransporteModel.idTransportadora ?? 0).toDouble());
    cnpjController.text = nfeTransporteModel.cnpj ?? '';
    cpfController.text = nfeTransporteModel.cpf ?? '';
    nomeController.text = nfeTransporteModel.nome ?? '';
    inscricaoEstadualController.text = nfeTransporteModel.inscricaoEstadual ?? '';
    enderecoController.text = nfeTransporteModel.endereco ?? '';
    nomeMunicipioController.text = nfeTransporteModel.nomeMunicipio ?? '';
    valorServicoController.updateValue(nfeTransporteModel.valorServico ?? 0);
    valorBcRetencaoIcmsController.updateValue(nfeTransporteModel.valorBcRetencaoIcms ?? 0);
    aliquotaRetencaoIcmsController.updateValue(nfeTransporteModel.aliquotaRetencaoIcms ?? 0);
    valorIcmsRetidoController.updateValue(nfeTransporteModel.valorIcmsRetido ?? 0);
    cfopController.updateValue((nfeTransporteModel.cfop ?? 0).toDouble());
    municipioController.updateValue((nfeTransporteModel.municipio ?? 0).toDouble());
    placaVeiculoController.text = nfeTransporteModel.placaVeiculo ?? '';
    rntcVeiculoController.text = nfeTransporteModel.rntcVeiculo ?? '';
    modalidadeFreteController.selected = '0=Contratação do Frete por conta do Remetente (CIF)';
    ufController.selected = 'AC';
    ufVeiculoController.selected = 'AC';
  }

  void _resetForm() {
    formWasChangedDetail = false;
    nfeCabecalhoModelController.text = '';
    idTransportadoraController.updateValue(0);
    cnpjController.text = '';
    cpfController.text = '';
    nomeController.text = '';
    inscricaoEstadualController.text = '';
    enderecoController.text = '';
    nomeMunicipioController.text = '';
    valorServicoController.updateValue(0);
    valorBcRetencaoIcmsController.updateValue(0);
    aliquotaRetencaoIcmsController.updateValue(0);
    valorIcmsRetidoController.updateValue(0);
    cfopController.updateValue(0);
    municipioController.updateValue(0);
    placaVeiculoController.text = '';
    rntcVeiculoController.text = '';
    modalidadeFreteController.selected = currentModel.modalidadeFrete ?? '0=Contratação do Frete por conta do Remetente (CIF)';
    ufController.selected = currentModel.uf ?? 'AC';
    ufVeiculoController.selected = currentModel.ufVeiculo ?? 'AC';
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
			text: 'Reboque', 
		),
    Tab( 
			icon: Icon(iconDataList[Random().nextInt(10)]), 
			text: 'Volumes', 
		),
  ];

  List<Widget> tabPages() {
    return [
      NfeTransporteEditPage(),
      const NfeTransporteReboqueListPage(),
      const NfeTransporteVolumeListPage(),
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
		Get.find<NfeTransporteReboqueController>().userMadeChanges
    ||
		Get.find<NfeTransporteVolumeController>().userMadeChanges
    ||
		Get.find<NfeTransporteVolumeLacreController>().userMadeChanges
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
    idTransportadoraController.dispose();
    cnpjController.dispose();
    cpfController.dispose();
    nomeController.dispose();
    inscricaoEstadualController.dispose();
    enderecoController.dispose();
    nomeMunicipioController.dispose();
    valorServicoController.dispose();
    valorBcRetencaoIcmsController.dispose();
    aliquotaRetencaoIcmsController.dispose();
    valorIcmsRetidoController.dispose();
    cfopController.dispose();
    municipioController.dispose();
    placaVeiculoController.dispose();
    rntcVeiculoController.dispose();
    modalidadeFreteController.dispose();
    ufController.dispose();
    ufVeiculoController.dispose();
  }
}