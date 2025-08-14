import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_ibs_uf_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoIbsUfEditPage extends StatelessWidget {
  NfeDetalheImpostoIbsUfEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoIbsUfController = Get.find<NfeDetalheImpostoIbsUfController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoIbsUfController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoIbsUfController.scrollController,
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
														child: TextFormField(
															autofocus: true,
															maxLength: 3,
															controller: nfeDetalheImpostoIbsUfController.cstController,
															decoration: inputDecoration(
																hintText: 'Fill with the Cst',
																labelText: 'Cst',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.cst = text;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															maxLength: 6,
															controller: nfeDetalheImpostoIbsUfController.codigoClassificacaoTributariaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Codigo Classificacao Tributaria',
																labelText: 'Codigo Classificacao Tributaria',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.codigoClassificacaoTributaria = text;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.valorBaseCalculoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Base Calculo',
																labelText: 'Valor Base Calculo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.valorBaseCalculo = nfeDetalheImpostoIbsUfController.valorBaseCalculoController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.aliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota',
																labelText: 'Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.aliquota = nfeDetalheImpostoIbsUfController.aliquotaController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.percentualDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Diferimento',
																labelText: 'Percentual Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.percentualDiferimento = nfeDetalheImpostoIbsUfController.percentualDiferimentoController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.valorDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Diferimento',
																labelText: 'Valor Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.valorDiferimento = nfeDetalheImpostoIbsUfController.valorDiferimentoController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.valorTributoDevolvidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Tributo Devolvido',
																labelText: 'Valor Tributo Devolvido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.valorTributoDevolvido = nfeDetalheImpostoIbsUfController.valorTributoDevolvidoController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.percentualReducaoAliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Reducao Aliquota',
																labelText: 'Percentual Reducao Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.percentualReducaoAliquota = nfeDetalheImpostoIbsUfController.percentualReducaoAliquotaController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.aliquotaEfetivaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Efetiva',
																labelText: 'Aliquota Efetiva',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.aliquotaEfetiva = nfeDetalheImpostoIbsUfController.aliquotaEfetivaController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsUfController.valorController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsUfController.nfeDetalheImpostoIbsUfModel.valor = nfeDetalheImpostoIbsUfController.valorController.numberValue;
																nfeDetalheImpostoIbsUfController.formWasChangedDetail = true;
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
