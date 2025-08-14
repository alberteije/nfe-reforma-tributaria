import 'package:flutter/material.dart';
import 'package:nfe/app/controller/nfe_configuracao_controller.dart';
import 'package:nfe/app/page/shared_page/list_page_base.dart';

class NfeConfiguracaoListPage extends ListPageBase<NfeConfiguracaoController> {
  const NfeConfiguracaoListPage({Key? key}) : super(key: key);

  @override
  List<Map<String, dynamic>> get mobileItems => controller.mobileItems;

  @override
  Map<String, dynamic> get mobileConfig => controller.mobileConfig;

  @override
  String get standardFieldForFilter => controller.standardFieldForFilter;
}