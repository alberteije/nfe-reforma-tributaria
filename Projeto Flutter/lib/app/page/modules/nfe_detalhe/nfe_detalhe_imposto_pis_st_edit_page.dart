import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_pis_st_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoPisStEditPage extends StatelessWidget {
  NfeDetalheImpostoPisStEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoPisStController = Get.find<NfeDetalheImpostoPisStController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoPisStController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoPisStController.scrollController,
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
															controller: nfeDetalheImpostoPisStController.valorBaseCalculoPisStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Base Calculo Pis St',
																labelText: 'Valor Base Calculo Pis St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStModel.valorBaseCalculoPisSt = nfeDetalheImpostoPisStController.valorBaseCalculoPisStController.numberValue;
																nfeDetalheImpostoPisStController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisStController.aliquotaPisStPercentualController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Pis St Percentual',
																labelText: 'Aliquota Pis St Percentual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStModel.aliquotaPisStPercentual = nfeDetalheImpostoPisStController.aliquotaPisStPercentualController.numberValue;
																nfeDetalheImpostoPisStController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisStController.quantidadeVendidaPisStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Vendida Pis St',
																labelText: 'Quantidade Vendida Pis St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStModel.quantidadeVendidaPisSt = nfeDetalheImpostoPisStController.quantidadeVendidaPisStController.numberValue;
																nfeDetalheImpostoPisStController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisStController.aliquotaPisStReaisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Pis St Reais',
																labelText: 'Aliquota Pis St Reais',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStModel.aliquotaPisStReais = nfeDetalheImpostoPisStController.aliquotaPisStReaisController.numberValue;
																nfeDetalheImpostoPisStController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisStController.valorPisStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Pis St',
																labelText: 'Valor Pis St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStModel.valorPisSt = nfeDetalheImpostoPisStController.valorPisStController.numberValue;
																nfeDetalheImpostoPisStController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisStController.pisStCompoeValorTotalController,
															labelText: 'Pis St Compoe Valor Total',
															hintText: 'Informe os dados para o campo Pis St Compoe Valor Total',
															items: const ['0=Valor do PISST não compõe o valor total da NF-e','1=Valor do PISST compõe o valor total da NF-e'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoPisStController.nfeDetalheImpostoPisStModel.pisStCompoeValorTotal = newValue;
																nfeDetalheImpostoPisStController.formWasChangedDetail = true;
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
