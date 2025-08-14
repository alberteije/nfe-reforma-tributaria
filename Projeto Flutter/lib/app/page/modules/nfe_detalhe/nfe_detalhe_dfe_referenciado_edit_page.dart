import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_dfe_referenciado_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheDfeReferenciadoEditPage extends StatelessWidget {
  NfeDetalheDfeReferenciadoEditPage({Key? key}) : super(key: key);
  final nfeDetalheDfeReferenciadoController = Get.find<NfeDetalheDfeReferenciadoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheDfeReferenciadoController.nfeDetalheDfeReferenciadoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheDfeReferenciadoController.nfeDetalheDfeReferenciadoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheDfeReferenciadoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheDfeReferenciadoController.scrollController,
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
															maxLength: 44,
															controller: nfeDetalheDfeReferenciadoController.chaveAcessoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Chave Acesso',
																labelText: 'Chave Acesso',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheDfeReferenciadoController.nfeDetalheDfeReferenciadoModel.chaveAcesso = text;
																nfeDetalheDfeReferenciadoController.formWasChangedDetail = true;
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
															controller: nfeDetalheDfeReferenciadoController.numeroItemController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Item',
																labelText: 'Numero Item',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheDfeReferenciadoController.nfeDetalheDfeReferenciadoModel.numeroItem = int.tryParse(text);
																nfeDetalheDfeReferenciadoController.formWasChangedDetail = true;
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
