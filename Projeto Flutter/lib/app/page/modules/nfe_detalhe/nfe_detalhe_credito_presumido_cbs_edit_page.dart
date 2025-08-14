import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_credito_presumido_cbs_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheCreditoPresumidoCbsEditPage extends StatelessWidget {
  NfeDetalheCreditoPresumidoCbsEditPage({Key? key}) : super(key: key);
  final nfeDetalheCreditoPresumidoCbsController = Get.find<NfeDetalheCreditoPresumidoCbsController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheCreditoPresumidoCbsController.nfeDetalheCreditoPresumidoCbsScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheCreditoPresumidoCbsController.nfeDetalheCreditoPresumidoCbsFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheCreditoPresumidoCbsController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheCreditoPresumidoCbsController.scrollController,
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
															controller: nfeDetalheCreditoPresumidoCbsController.codigoClassificacaoController,
															labelText: 'Codigo Classificacao',
															hintText: 'Fill with the Codigo Classificacao',
															items: const ['1-Aquisição de Produtor Rural não contribuinte','2-Tomador de serviço de transporte de TAC PF não contrib','3-Aquisição de pessoa física com destino a reciclagem','4-Aquisição de bens móveis de PF não contrib. para revenda (veículos / brechó)','5-Regime opcional para cooperativa'],
															onChanged: (dynamic newValue) {
																nfeDetalheCreditoPresumidoCbsController.nfeDetalheCreditoPresumidoCbsModel.codigoClassificacao = newValue;
																nfeDetalheCreditoPresumidoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheCreditoPresumidoCbsController.percentualController,
															decoration: inputDecoration(
																hintText: 'Fill with the Percentual',
																labelText: 'Percentual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCreditoPresumidoCbsController.nfeDetalheCreditoPresumidoCbsModel.percentual = nfeDetalheCreditoPresumidoCbsController.percentualController.numberValue;
																nfeDetalheCreditoPresumidoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheCreditoPresumidoCbsController.valorController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCreditoPresumidoCbsController.nfeDetalheCreditoPresumidoCbsModel.valor = nfeDetalheCreditoPresumidoCbsController.valorController.numberValue;
																nfeDetalheCreditoPresumidoCbsController.formWasChangedDetail = true;
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
															controller: nfeDetalheCreditoPresumidoCbsController.valorSuspensivoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Suspensivo',
																labelText: 'Valor Suspensivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCreditoPresumidoCbsController.nfeDetalheCreditoPresumidoCbsModel.valorSuspensivo = nfeDetalheCreditoPresumidoCbsController.valorSuspensivoController.numberValue;
																nfeDetalheCreditoPresumidoCbsController.formWasChangedDetail = true;
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
