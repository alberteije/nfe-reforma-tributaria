import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_monofasico_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoMonofasicoEditPage extends StatelessWidget {
  NfeDetalheImpostoMonofasicoEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoMonofasicoController = Get.find<NfeDetalheImpostoMonofasicoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoMonofasicoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoMonofasicoController.scrollController,
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeDetalheImpostoMonofasicoController.quantidadeTributadaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Quantidade Tributada',
																labelText: 'Quantidade Tributada',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.quantidadeTributada = nfeDetalheImpostoMonofasicoController.quantidadeTributadaController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.aliquotaIbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs',
																labelText: 'Aliquota Ibs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.aliquotaIbs = nfeDetalheImpostoMonofasicoController.aliquotaIbsController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.aliquotaCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Cbs',
																labelText: 'Aliquota Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.aliquotaCbs = nfeDetalheImpostoMonofasicoController.aliquotaCbsController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorIbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs',
																labelText: 'Valor Ibs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorIbs = nfeDetalheImpostoMonofasicoController.valorIbsController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Cbs',
																labelText: 'Valor Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorCbs = nfeDetalheImpostoMonofasicoController.valorCbsController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.quantidadeTributadaRetencaoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Quantidade Tributada Retencao',
																labelText: 'Quantidade Tributada Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.quantidadeTributadaRetencao = nfeDetalheImpostoMonofasicoController.quantidadeTributadaRetencaoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.aliquotaIbsRetencaoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs Retencao',
																labelText: 'Aliquota Ibs Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.aliquotaIbsRetencao = nfeDetalheImpostoMonofasicoController.aliquotaIbsRetencaoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorIbsRetencaoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs Retencao',
																labelText: 'Valor Ibs Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorIbsRetencao = nfeDetalheImpostoMonofasicoController.valorIbsRetencaoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.aliquotaCbsRetencaoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Cbs Retencao',
																labelText: 'Aliquota Cbs Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.aliquotaCbsRetencao = nfeDetalheImpostoMonofasicoController.aliquotaCbsRetencaoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorCbsRetencaoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Cbs Retencao',
																labelText: 'Valor Cbs Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorCbsRetencao = nfeDetalheImpostoMonofasicoController.valorCbsRetencaoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.quantidadeTributadaRetidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Quantidade Tributada Retido',
																labelText: 'Quantidade Tributada Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.quantidadeTributadaRetido = nfeDetalheImpostoMonofasicoController.quantidadeTributadaRetidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.aliquotaIbsRetidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs Retido',
																labelText: 'Aliquota Ibs Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.aliquotaIbsRetido = nfeDetalheImpostoMonofasicoController.aliquotaIbsRetidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorIbsRetidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs Retido',
																labelText: 'Valor Ibs Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorIbsRetido = nfeDetalheImpostoMonofasicoController.valorIbsRetidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.aliquotaCbsRetidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Cbs Retido',
																labelText: 'Aliquota Cbs Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.aliquotaCbsRetido = nfeDetalheImpostoMonofasicoController.aliquotaCbsRetidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorCbsRetidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Cbs Retido',
																labelText: 'Valor Cbs Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorCbsRetido = nfeDetalheImpostoMonofasicoController.valorCbsRetidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.percentualIbsDiferidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Ibs Diferido',
																labelText: 'Percentual Ibs Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.percentualIbsDiferido = nfeDetalheImpostoMonofasicoController.percentualIbsDiferidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorIbsDiferidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs Diferido',
																labelText: 'Valor Ibs Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorIbsDiferido = nfeDetalheImpostoMonofasicoController.valorIbsDiferidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.percentualCbsDiferidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual Cbs Diferido',
																labelText: 'Percentual Cbs Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.percentualCbsDiferido = nfeDetalheImpostoMonofasicoController.percentualCbsDiferidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.valorCbsDiferidoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Cbs Diferido',
																labelText: 'Valor Cbs Diferido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.valorCbsDiferido = nfeDetalheImpostoMonofasicoController.valorCbsDiferidoController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.totalIbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Total Ibs',
																labelText: 'Total Ibs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.totalIbs = nfeDetalheImpostoMonofasicoController.totalIbsController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoMonofasicoController.totalCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Total Cbs',
																labelText: 'Total Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoMonofasicoController.nfeDetalheImpostoMonofasicoModel.totalCbs = nfeDetalheImpostoMonofasicoController.totalCbsController.numberValue;
																nfeDetalheImpostoMonofasicoController.formWasChangedDetail = true;
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
