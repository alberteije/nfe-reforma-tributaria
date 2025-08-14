import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_transf_credito_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheTransfCreditoEditPage extends StatelessWidget {
  NfeDetalheTransfCreditoEditPage({Key? key}) : super(key: key);
  final nfeDetalheTransfCreditoController = Get.find<NfeDetalheTransfCreditoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheTransfCreditoController.nfeDetalheTransfCreditoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheTransfCreditoController.nfeDetalheTransfCreditoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheTransfCreditoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheTransfCreditoController.scrollController,
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
															controller: nfeDetalheTransfCreditoController.valorIbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs',
																labelText: 'Valor Ibs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTransfCreditoController.nfeDetalheTransfCreditoModel.valorIbs = nfeDetalheTransfCreditoController.valorIbsController.numberValue;
																nfeDetalheTransfCreditoController.formWasChangedDetail = true;
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
															controller: nfeDetalheTransfCreditoController.valorCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Cbs',
																labelText: 'Valor Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTransfCreditoController.nfeDetalheTransfCreditoModel.valorCbs = nfeDetalheTransfCreditoController.valorCbsController.numberValue;
																nfeDetalheTransfCreditoController.formWasChangedDetail = true;
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
