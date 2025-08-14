import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_compra_governamental_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeCompraGovernamentalEditPage extends StatelessWidget {
  NfeCompraGovernamentalEditPage({Key? key}) : super(key: key);
  final nfeCompraGovernamentalController = Get.find<NfeCompraGovernamentalController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeCompraGovernamentalController.nfeCompraGovernamentalScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeCompraGovernamentalController.nfeCompraGovernamentalFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeCompraGovernamentalController.scrollController,
              child: SingleChildScrollView(
                controller: nfeCompraGovernamentalController.scrollController,
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
															controller: nfeCompraGovernamentalController.tipoEnteController,
															labelText: 'Tipo Ente',
															hintText: 'Informe os dados para o campo Tipo Ente',
															items: const ['1=União','2=Estado','3=Distrito Federal','4=Município'],
															onChanged: (dynamic newValue) {
																nfeCompraGovernamentalController.nfeCompraGovernamentalModel.tipoEnte = newValue;
																nfeCompraGovernamentalController.formWasChangedDetail = true;
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
															controller: nfeCompraGovernamentalController.percentualReducaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Percentual Reducao',
																labelText: 'Percentual Reducao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCompraGovernamentalController.nfeCompraGovernamentalModel.percentualReducao = nfeCompraGovernamentalController.percentualReducaoController.numberValue;
																nfeCompraGovernamentalController.formWasChangedDetail = true;
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
															controller: nfeCompraGovernamentalController.tipoOperacaoController,
															labelText: 'Tipo Operacao',
															hintText: 'Informe os dados para o campo Tipo Operacao',
															items: const ['1=Fornecimento','2=Recebimento do pagamento','conforme fato gerador do IBS/CBS definido no Art. 10 § 2º'],
															onChanged: (dynamic newValue) {
																nfeCompraGovernamentalController.nfeCompraGovernamentalModel.tipoOperacao = newValue;
																nfeCompraGovernamentalController.formWasChangedDetail = true;
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
