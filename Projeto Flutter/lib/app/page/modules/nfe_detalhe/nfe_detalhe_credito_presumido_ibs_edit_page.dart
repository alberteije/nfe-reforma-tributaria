import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_credito_presumido_ibs_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheCreditoPresumidoIbsEditPage extends StatelessWidget {
  NfeDetalheCreditoPresumidoIbsEditPage({Key? key}) : super(key: key);
  final nfeDetalheCreditoPresumidoIbsController = Get.find<NfeDetalheCreditoPresumidoIbsController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheCreditoPresumidoIbsController.nfeDetalheCreditoPresumidoIbsScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheCreditoPresumidoIbsController.nfeDetalheCreditoPresumidoIbsFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheCreditoPresumidoIbsController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheCreditoPresumidoIbsController.scrollController,
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
															controller: nfeDetalheCreditoPresumidoIbsController.codigoClassificacaoController,
															labelText: 'Codigo Classificacao',
															hintText: 'Fill with the Codigo Classificacao',
															items: const ['1-Aquisição de Produtor Rural não contribuinte','2-Tomador de serviço de transporte de TAC PF não contrib','3-Aquisição de pessoa física com destino a reciclagem','4-Aquisição de bens móveis de PF não contrib. para revenda (veículos / brechó)','5-Regime opcional para cooperativa'],
															onChanged: (dynamic newValue) {
																nfeDetalheCreditoPresumidoIbsController.nfeDetalheCreditoPresumidoIbsModel.codigoClassificacao = newValue;
																nfeDetalheCreditoPresumidoIbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheCreditoPresumidoIbsController.percentualController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual',
																labelText: 'Percentual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCreditoPresumidoIbsController.nfeDetalheCreditoPresumidoIbsModel.percentual = nfeDetalheCreditoPresumidoIbsController.percentualController.numberValue;
																nfeDetalheCreditoPresumidoIbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheCreditoPresumidoIbsController.valorController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCreditoPresumidoIbsController.nfeDetalheCreditoPresumidoIbsModel.valor = nfeDetalheCreditoPresumidoIbsController.valorController.numberValue;
																nfeDetalheCreditoPresumidoIbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheCreditoPresumidoIbsController.valorSuspensivoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Suspensivo',
																labelText: 'Valor Suspensivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCreditoPresumidoIbsController.nfeDetalheCreditoPresumidoIbsModel.valorSuspensivo = nfeDetalheCreditoPresumidoIbsController.valorSuspensivoController.numberValue;
																nfeDetalheCreditoPresumidoIbsController.formWasChangedDetail = true;
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
