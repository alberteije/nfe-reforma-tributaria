import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_cbs_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoCbsEditPage extends StatelessWidget {
  NfeDetalheImpostoCbsEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoCbsController = Get.find<NfeDetalheImpostoCbsController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoCbsController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoCbsController.scrollController,
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
															controller: nfeDetalheImpostoCbsController.cstController,
															decoration: inputDecoration(
																hintText: 'Fill with the Cst',
																labelText: 'Cst',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.cst = text;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.codigoClassificacaoTributariaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Codigo Classificacao Tributaria',
																labelText: 'Codigo Classificacao Tributaria',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.codigoClassificacaoTributaria = text;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.valorBaseCalculoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Base Calculo',
																labelText: 'Valor Base Calculo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.valorBaseCalculo = nfeDetalheImpostoCbsController.valorBaseCalculoController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.aliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota',
																labelText: 'Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.aliquota = nfeDetalheImpostoCbsController.aliquotaController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.percentualDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Diferimento',
																labelText: 'Percentual Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.percentualDiferimento = nfeDetalheImpostoCbsController.percentualDiferimentoController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.valorDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Diferimento',
																labelText: 'Valor Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.valorDiferimento = nfeDetalheImpostoCbsController.valorDiferimentoController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.valorTributoDevolvidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Tributo Devolvido',
																labelText: 'Valor Tributo Devolvido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.valorTributoDevolvido = nfeDetalheImpostoCbsController.valorTributoDevolvidoController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.percentualReducaoAliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Reducao Aliquota',
																labelText: 'Percentual Reducao Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.percentualReducaoAliquota = nfeDetalheImpostoCbsController.percentualReducaoAliquotaController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.aliquotaEfetivaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Efetiva',
																labelText: 'Aliquota Efetiva',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.aliquotaEfetiva = nfeDetalheImpostoCbsController.aliquotaEfetivaController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCbsController.valorController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCbsController.nfeDetalheImpostoCbsModel.valor = nfeDetalheImpostoCbsController.valorController.numberValue;
																nfeDetalheImpostoCbsController.formWasChangedDetail = true;
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
