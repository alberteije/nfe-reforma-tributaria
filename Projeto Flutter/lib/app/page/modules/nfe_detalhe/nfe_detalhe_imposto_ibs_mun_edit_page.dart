import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_ibs_mun_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoIbsMunEditPage extends StatelessWidget {
  NfeDetalheImpostoIbsMunEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoIbsMunController = Get.find<NfeDetalheImpostoIbsMunController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoIbsMunController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoIbsMunController.scrollController,
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
															controller: nfeDetalheImpostoIbsMunController.cstController,
															decoration: inputDecoration(
																hintText: 'Fill with the Cst',
																labelText: 'Cst',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.cst = text;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.codigoClassificacaoTributariaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Codigo Classificacao Tributaria',
																labelText: 'Codigo Classificacao Tributaria',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.codigoClassificacaoTributaria = text;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.valorBaseCalculoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Base Calculo',
																labelText: 'Valor Base Calculo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.valorBaseCalculo = nfeDetalheImpostoIbsMunController.valorBaseCalculoController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.aliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota',
																labelText: 'Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.aliquota = nfeDetalheImpostoIbsMunController.aliquotaController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.percentualDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Diferimento',
																labelText: 'Percentual Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.percentualDiferimento = nfeDetalheImpostoIbsMunController.percentualDiferimentoController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.valorDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Diferimento',
																labelText: 'Valor Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.valorDiferimento = nfeDetalheImpostoIbsMunController.valorDiferimentoController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.valorTributoDevolvidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Tributo Devolvido',
																labelText: 'Valor Tributo Devolvido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.valorTributoDevolvido = nfeDetalheImpostoIbsMunController.valorTributoDevolvidoController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.percentualReducaoAliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Reducao Aliquota',
																labelText: 'Percentual Reducao Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.percentualReducaoAliquota = nfeDetalheImpostoIbsMunController.percentualReducaoAliquotaController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.aliquotaEfetivaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Efetiva',
																labelText: 'Aliquota Efetiva',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.aliquotaEfetiva = nfeDetalheImpostoIbsMunController.aliquotaEfetivaController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIbsMunController.valorController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIbsMunController.nfeDetalheImpostoIbsMunModel.valor = nfeDetalheImpostoIbsMunController.valorController.numberValue;
																nfeDetalheImpostoIbsMunController.formWasChangedDetail = true;
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
