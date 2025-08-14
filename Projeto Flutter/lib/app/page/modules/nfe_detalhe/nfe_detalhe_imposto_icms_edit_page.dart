import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_icms_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoIcmsEditPage extends StatelessWidget {
  NfeDetalheImpostoIcmsEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoIcmsController = Get.find<NfeDetalheImpostoIcmsController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoIcmsController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoIcmsController.scrollController,
                child: BootstrapContainer(
                  fluid: true,
                  padding: const EdgeInsets.all(10.0),
                  children: <Widget>[
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.origemMercadoriaController,
															labelText: 'Origem Mercadoria',
															hintText: 'Informe os dados para o campo Origem Mercadoria',
															items: const ['0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.origemMercadoria = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 2,
															controller: nfeDetalheImpostoIcmsController.cstIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cst Icms',
																labelText: 'Cst Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.cstIcms = text;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 3,
															controller: nfeDetalheImpostoIcmsController.csosnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Csosn',
																labelText: 'Csosn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.csosn = text;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.modalidadeBcIcmsController,
															labelText: 'Modalidade Bc Icms',
															hintText: 'Informe os dados para o campo Modalidade Bc Icms',
															items: const ['0=Margem Valor Agregado (%)','1=Pauta (Valor)','2=Preço Tabelado Máx. (valor)','3=Valor da operação'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.modalidadeBcIcms = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualReducaoBcIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Reducao Bc Icms',
																labelText: 'Percentual Reducao Bc Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualReducaoBcIcms = nfeDetalheImpostoIcmsController.percentualReducaoBcIcmsController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorBcIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Bc Icms',
																labelText: 'Valor Bc Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorBcIcms = nfeDetalheImpostoIcmsController.valorBcIcmsController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Icms',
																labelText: 'Aliquota Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaIcms = nfeDetalheImpostoIcmsController.aliquotaIcmsController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsOperacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Operacao',
																labelText: 'Valor Icms Operacao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsOperacao = nfeDetalheImpostoIcmsController.valorIcmsOperacaoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Diferimento',
																labelText: 'Percentual Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualDiferimento = nfeDetalheImpostoIcmsController.percentualDiferimentoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsDiferidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Diferido',
																labelText: 'Valor Icms Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsDiferido = nfeDetalheImpostoIcmsController.valorIcmsDiferidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms',
																labelText: 'Valor Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcms = nfeDetalheImpostoIcmsController.valorIcmsController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.baseCalculoFcpController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Fcp',
																labelText: 'Base Calculo Fcp',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.baseCalculoFcp = nfeDetalheImpostoIcmsController.baseCalculoFcpController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualFcpController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Fcp',
																labelText: 'Percentual Fcp',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualFcp = nfeDetalheImpostoIcmsController.percentualFcpController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorFcpController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Fcp',
																labelText: 'Valor Fcp',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorFcp = nfeDetalheImpostoIcmsController.valorFcpController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.modalidadeBcIcmsStController,
															labelText: 'Modalidade Bc Icms St',
															hintText: 'Informe os dados para o campo Modalidade Bc Icms St',
															items: const ['0=Preço tabelado ou máximo sugerido','1=Lista Negativa (valor)','2=Lista Positiva (valor)','3=Lista Neutra (valor)','4=Margem Valor Agregado (%)','5=Pauta (valor)','6=Valor da operação'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.modalidadeBcIcmsSt = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualMvaIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Mva Icms St',
																labelText: 'Percentual Mva Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualMvaIcmsSt = nfeDetalheImpostoIcmsController.percentualMvaIcmsStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualReducaoBcIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Reducao Bc Icms St',
																labelText: 'Percentual Reducao Bc Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualReducaoBcIcmsSt = nfeDetalheImpostoIcmsController.percentualReducaoBcIcmsStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorBaseCalculoIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Base Calculo Icms St',
																labelText: 'Valor Base Calculo Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorBaseCalculoIcmsSt = nfeDetalheImpostoIcmsController.valorBaseCalculoIcmsStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Icms St',
																labelText: 'Aliquota Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaIcmsSt = nfeDetalheImpostoIcmsController.aliquotaIcmsStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms St',
																labelText: 'Valor Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsSt = nfeDetalheImpostoIcmsController.valorIcmsStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.baseCalculoFcpStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Fcp St',
																labelText: 'Base Calculo Fcp St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.baseCalculoFcpSt = nfeDetalheImpostoIcmsController.baseCalculoFcpStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualFcpStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Fcp St',
																labelText: 'Percentual Fcp St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualFcpSt = nfeDetalheImpostoIcmsController.percentualFcpStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorFcpStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Fcp St',
																labelText: 'Valor Fcp St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorFcpSt = nfeDetalheImpostoIcmsController.valorFcpStController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.ufStController,
															labelText: 'Uf St',
															hintText: 'Informe os dados para o campo Uf St',
															items: ufList,
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.ufSt = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualBcOperacaoPropriaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Bc Operacao Propria',
																labelText: 'Percentual Bc Operacao Propria',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualBcOperacaoPropria = nfeDetalheImpostoIcmsController.percentualBcOperacaoPropriaController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorBcIcmsStRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Bc Icms St Retido',
																labelText: 'Valor Bc Icms St Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorBcIcmsStRetido = nfeDetalheImpostoIcmsController.valorBcIcmsStRetidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaSuportadaConsumidorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Suportada Consumidor',
																labelText: 'Aliquota Suportada Consumidor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaSuportadaConsumidor = nfeDetalheImpostoIcmsController.aliquotaSuportadaConsumidorController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsSubstitutoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Substituto',
																labelText: 'Valor Icms Substituto',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsSubstituto = nfeDetalheImpostoIcmsController.valorIcmsSubstitutoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsStRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms St Retido',
																labelText: 'Valor Icms St Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsStRetido = nfeDetalheImpostoIcmsController.valorIcmsStRetidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.baseCalculoFcpStRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Fcp St Retido',
																labelText: 'Base Calculo Fcp St Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.baseCalculoFcpStRetido = nfeDetalheImpostoIcmsController.baseCalculoFcpStRetidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualFcpStRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Fcp St Retido',
																labelText: 'Percentual Fcp St Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualFcpStRetido = nfeDetalheImpostoIcmsController.percentualFcpStRetidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorFcpStRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Fcp St Retido',
																labelText: 'Valor Fcp St Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorFcpStRetido = nfeDetalheImpostoIcmsController.valorFcpStRetidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 2,
															controller: nfeDetalheImpostoIcmsController.motivoDesoneracaoIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Motivo Desoneracao Icms',
																labelText: 'Motivo Desoneracao Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.motivoDesoneracaoIcms = text;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsDesoneradoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Desonerado',
																labelText: 'Valor Icms Desonerado',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsDesonerado = nfeDetalheImpostoIcmsController.valorIcmsDesoneradoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaCreditoIcmsSnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Credito Icms Sn',
																labelText: 'Aliquota Credito Icms Sn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaCreditoIcmsSn = nfeDetalheImpostoIcmsController.aliquotaCreditoIcmsSnController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorCreditoIcmsSnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Credito Icms Sn',
																labelText: 'Valor Credito Icms Sn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorCreditoIcmsSn = nfeDetalheImpostoIcmsController.valorCreditoIcmsSnController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorBcIcmsStDestinoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Bc Icms St Destino',
																labelText: 'Valor Bc Icms St Destino',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorBcIcmsStDestino = nfeDetalheImpostoIcmsController.valorBcIcmsStDestinoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsStDestinoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms St Destino',
																labelText: 'Valor Icms St Destino',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsStDestino = nfeDetalheImpostoIcmsController.valorIcmsStDestinoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualReducaoBcEfetivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Reducao Bc Efetivo',
																labelText: 'Percentual Reducao Bc Efetivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualReducaoBcEfetivo = nfeDetalheImpostoIcmsController.percentualReducaoBcEfetivoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorBcEfetivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Bc Efetivo',
																labelText: 'Valor Bc Efetivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorBcEfetivo = nfeDetalheImpostoIcmsController.valorBcEfetivoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaIcmsEfetivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Icms Efetivo',
																labelText: 'Aliquota Icms Efetivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaIcmsEfetivo = nfeDetalheImpostoIcmsController.aliquotaIcmsEfetivoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsEfetivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Efetivo',
																labelText: 'Valor Icms Efetivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsEfetivo = nfeDetalheImpostoIcmsController.valorIcmsEfetivoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.taxaFcpDiferidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Taxa Fcp Diferido',
																labelText: 'Taxa Fcp Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.taxaFcpDiferido = nfeDetalheImpostoIcmsController.taxaFcpDiferidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorFcpDiferidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Fcp Diferido',
																labelText: 'Valor Fcp Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorFcpDiferido = nfeDetalheImpostoIcmsController.valorFcpDiferidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorFcpEfetivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Fcp Efetivo',
																labelText: 'Valor Fcp Efetivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorFcpEfetivo = nfeDetalheImpostoIcmsController.valorFcpEfetivoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.desoneradoDeduzController,
															labelText: 'Desonerado Deduz',
															hintText: 'Informe os dados para o campo Desonerado Deduz',
															items: const ['0-Não','1-Sim'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.desoneradoDeduz = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsStDesoneradoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms St Desonerado',
																labelText: 'Valor Icms St Desonerado',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsStDesonerado = nfeDetalheImpostoIcmsController.valorIcmsStDesoneradoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.motivoDesoneracaoIcmsStController,
															labelText: 'Motivo Desoneracao Icms St',
															hintText: 'Informe os dados para o campo Motivo Desoneracao Icms St',
															items: const ['03=Uso na agropecuária','09=Outros','12=Órgão de fomento e desenvolvimento agropecuário '],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.motivoDesoneracaoIcmsSt = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.quantidadeTributadaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Tributada',
																labelText: 'Quantidade Tributada',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.quantidadeTributada = nfeDetalheImpostoIcmsController.quantidadeTributadaController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaAdRemController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Ad Rem',
																labelText: 'Aliquota Ad Rem',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaAdRem = nfeDetalheImpostoIcmsController.aliquotaAdRemController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsMonoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Mono',
																labelText: 'Valor Icms Mono',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsMono = nfeDetalheImpostoIcmsController.valorIcmsMonoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.quantidadeSujeitaRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Sujeita Retencao',
																labelText: 'Quantidade Sujeita Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.quantidadeSujeitaRetencao = nfeDetalheImpostoIcmsController.quantidadeSujeitaRetencaoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaAdRemRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Ad Rem Retencao',
																labelText: 'Aliquota Ad Rem Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaAdRemRetencao = nfeDetalheImpostoIcmsController.aliquotaAdRemRetencaoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsMonoRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Mono Retencao',
																labelText: 'Valor Icms Mono Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsMonoRetencao = nfeDetalheImpostoIcmsController.valorIcmsMonoRetencaoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualReducaoAdRemController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Reducao Ad Rem',
																labelText: 'Percentual Reducao Ad Rem',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualReducaoAdRem = nfeDetalheImpostoIcmsController.percentualReducaoAdRemController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeDetalheImpostoIcmsController.motivoReducaoAdRemController,
															labelText: 'Motivo Reducao Ad Rem',
															hintText: 'Informe os dados para o campo Motivo Reducao Ad Rem',
															items: const ['1= Transporte coletivo de passageiros','9=Outros'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.motivoReducaoAdRem = newValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsMonoOperacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Mono Operacao',
																labelText: 'Valor Icms Mono Operacao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsMonoOperacao = nfeDetalheImpostoIcmsController.valorIcmsMonoOperacaoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.percentualDiferimentoMonoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Diferimento Mono',
																labelText: 'Percentual Diferimento Mono',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.percentualDiferimentoMono = nfeDetalheImpostoIcmsController.percentualDiferimentoMonoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsDiferidoMonoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Diferido Mono',
																labelText: 'Valor Icms Diferido Mono',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsDiferidoMono = nfeDetalheImpostoIcmsController.valorIcmsDiferidoMonoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.quantidadeTributadaRetidaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Tributada Retida',
																labelText: 'Quantidade Tributada Retida',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.quantidadeTributadaRetida = nfeDetalheImpostoIcmsController.quantidadeTributadaRetidaController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.aliquotaAdRemRetidaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Ad Rem Retida',
																labelText: 'Aliquota Ad Rem Retida',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.aliquotaAdRemRetida = nfeDetalheImpostoIcmsController.aliquotaAdRemRetidaController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
                    		BootstrapCol(
													sizes: 'col-12',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoIcmsController.valorIcmsRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Retido',
																labelText: 'Valor Icms Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIcmsController.nfeDetalheImpostoIcmsModel.valorIcmsRetido = nfeDetalheImpostoIcmsController.valorIcmsRetidoController.numberValue;
																nfeDetalheImpostoIcmsController.formWasChangedDetail = true;
															},
														),
													),
												),
                    	],
										),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 2,
                    ),
                    BootstrapRow(
                      height: 60,
                      children: <BootstrapCol>[
                        BootstrapCol(
                          sizes: 'col-12',
                          child: Text(
                            'field_is_mandatory'.tr,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
