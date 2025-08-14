import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_pis_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoPisEditPage extends StatelessWidget {
  NfeDetalheImpostoPisEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoPisController = Get.find<NfeDetalheImpostoPisController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoPisController.nfeDetalheImpostoPisScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoPisController.nfeDetalheImpostoPisFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoPisController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoPisController.scrollController,
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
															controller: nfeDetalheImpostoPisController.cstPisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cst Pis',
																labelText: 'Cst Pis',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisController.nfeDetalheImpostoPisModel.cstPis = text;
																nfeDetalheImpostoPisController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisController.valorBaseCalculoPisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Base Calculo Pis',
																labelText: 'Valor Base Calculo Pis',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisController.nfeDetalheImpostoPisModel.valorBaseCalculoPis = nfeDetalheImpostoPisController.valorBaseCalculoPisController.numberValue;
																nfeDetalheImpostoPisController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisController.aliquotaPisPercentualController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Pis Percentual',
																labelText: 'Aliquota Pis Percentual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisController.nfeDetalheImpostoPisModel.aliquotaPisPercentual = nfeDetalheImpostoPisController.aliquotaPisPercentualController.numberValue;
																nfeDetalheImpostoPisController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisController.valorPisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Pis',
																labelText: 'Valor Pis',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisController.nfeDetalheImpostoPisModel.valorPis = nfeDetalheImpostoPisController.valorPisController.numberValue;
																nfeDetalheImpostoPisController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisController.quantidadeVendidaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Vendida',
																labelText: 'Quantidade Vendida',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisController.nfeDetalheImpostoPisModel.quantidadeVendida = nfeDetalheImpostoPisController.quantidadeVendidaController.numberValue;
																nfeDetalheImpostoPisController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoPisController.aliquotaPisReaisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Pis Reais',
																labelText: 'Aliquota Pis Reais',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoPisController.nfeDetalheImpostoPisModel.aliquotaPisReais = nfeDetalheImpostoPisController.aliquotaPisReaisController.numberValue;
																nfeDetalheImpostoPisController.formWasChangedDetail = true;
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
