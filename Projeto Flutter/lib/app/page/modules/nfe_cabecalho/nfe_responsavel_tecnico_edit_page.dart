import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_responsavel_tecnico_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeResponsavelTecnicoEditPage extends StatelessWidget {
  NfeResponsavelTecnicoEditPage({Key? key}) : super(key: key);
  final nfeResponsavelTecnicoController = Get.find<NfeResponsavelTecnicoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeResponsavelTecnicoController.nfeResponsavelTecnicoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeResponsavelTecnicoController.nfeResponsavelTecnicoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeResponsavelTecnicoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeResponsavelTecnicoController.scrollController,
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
															controller: nfeResponsavelTecnicoController.cnpjController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj',
																labelText: 'Cnpj',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeResponsavelTecnicoController.nfeResponsavelTecnicoModel.cnpj = text;
																nfeResponsavelTecnicoController.formWasChangedDetail = true;
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
															maxLength: 60,
															controller: nfeResponsavelTecnicoController.contatoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Contato',
																labelText: 'Contato',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeResponsavelTecnicoController.nfeResponsavelTecnicoModel.contato = text;
																nfeResponsavelTecnicoController.formWasChangedDetail = true;
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
															validator: ValidateFormField.validateEmail,
															maxLength: 60,
															controller: nfeResponsavelTecnicoController.emailController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email',
																labelText: 'Email',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeResponsavelTecnicoController.nfeResponsavelTecnicoModel.email = text;
																nfeResponsavelTecnicoController.formWasChangedDetail = true;
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
															maxLength: 14,
															controller: nfeResponsavelTecnicoController.telefoneController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Telefone',
																labelText: 'Telefone',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeResponsavelTecnicoController.nfeResponsavelTecnicoModel.telefone = text;
																nfeResponsavelTecnicoController.formWasChangedDetail = true;
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
															maxLength: 2,
															controller: nfeResponsavelTecnicoController.identificadorCsrtController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Identificador Csrt',
																labelText: 'Identificador Csrt',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeResponsavelTecnicoController.nfeResponsavelTecnicoModel.identificadorCsrt = text;
																nfeResponsavelTecnicoController.formWasChangedDetail = true;
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
															maxLength: 28,
															controller: nfeResponsavelTecnicoController.hashCsrtController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Hash Csrt',
																labelText: 'Hash Csrt',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeResponsavelTecnicoController.nfeResponsavelTecnicoModel.hashCsrt = text;
																nfeResponsavelTecnicoController.formWasChangedDetail = true;
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
