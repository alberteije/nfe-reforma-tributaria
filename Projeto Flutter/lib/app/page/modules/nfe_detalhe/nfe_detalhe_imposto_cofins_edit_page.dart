import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_cofins_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoCofinsEditPage extends StatelessWidget {
  NfeDetalheImpostoCofinsEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoCofinsController = Get.find<NfeDetalheImpostoCofinsController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoCofinsController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoCofinsController.scrollController,
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
															maxLength: 2,
															controller: nfeDetalheImpostoCofinsController.cstCofinsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cst Cofins',
																labelText: 'Cst Cofins',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsModel.cstCofins = text;
																nfeDetalheImpostoCofinsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCofinsController.baseCalculoCofinsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Cofins',
																labelText: 'Base Calculo Cofins',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsModel.baseCalculoCofins = nfeDetalheImpostoCofinsController.baseCalculoCofinsController.numberValue;
																nfeDetalheImpostoCofinsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCofinsController.aliquotaCofinsPercentualController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Cofins Percentual',
																labelText: 'Aliquota Cofins Percentual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsModel.aliquotaCofinsPercentual = nfeDetalheImpostoCofinsController.aliquotaCofinsPercentualController.numberValue;
																nfeDetalheImpostoCofinsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCofinsController.quantidadeVendidaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Vendida',
																labelText: 'Quantidade Vendida',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsModel.quantidadeVendida = nfeDetalheImpostoCofinsController.quantidadeVendidaController.numberValue;
																nfeDetalheImpostoCofinsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCofinsController.aliquotaCofinsReaisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Cofins Reais',
																labelText: 'Aliquota Cofins Reais',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsModel.aliquotaCofinsReais = nfeDetalheImpostoCofinsController.aliquotaCofinsReaisController.numberValue;
																nfeDetalheImpostoCofinsController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoCofinsController.valorCofinsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Cofins',
																labelText: 'Valor Cofins',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoCofinsController.nfeDetalheImpostoCofinsModel.valorCofins = nfeDetalheImpostoCofinsController.valorCofinsController.numberValue;
																nfeDetalheImpostoCofinsController.formWasChangedDetail = true;
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
