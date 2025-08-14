import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_ibs_zfm_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheIbsZfmEditPage extends StatelessWidget {
  NfeDetalheIbsZfmEditPage({Key? key}) : super(key: key);
  final nfeDetalheIbsZfmController = Get.find<NfeDetalheIbsZfmController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheIbsZfmController.nfeDetalheIbsZfmScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheIbsZfmController.nfeDetalheIbsZfmFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheIbsZfmController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheIbsZfmController.scrollController,
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
															controller: nfeDetalheIbsZfmController.tipoCreditoController,
															labelText: 'Tipo Credito',
															hintText: 'Fill with the Tipo Credito',
															items: const ['0 - Sem Crédito Presumido','1 - Bens de consumo final (55%)','2 - Bens de capital (75%)','3 - Bens intermediários (90','25%)','4 - Bens de informática e outros definidos em legislação (100%)'],
															onChanged: (dynamic newValue) {
																nfeDetalheIbsZfmController.nfeDetalheIbsZfmModel.tipoCredito = newValue;
																nfeDetalheIbsZfmController.formWasChangedDetail = true;
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
															controller: nfeDetalheIbsZfmController.valorCreditoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Credito',
																labelText: 'Valor Credito',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheIbsZfmController.nfeDetalheIbsZfmModel.valorCredito = nfeDetalheIbsZfmController.valorCreditoController.numberValue;
																nfeDetalheIbsZfmController.formWasChangedDetail = true;
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
