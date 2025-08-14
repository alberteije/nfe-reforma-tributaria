import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_seletivo_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoSeletivoEditPage extends StatelessWidget {
  NfeDetalheImpostoSeletivoEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoSeletivoController = Get.find<NfeDetalheImpostoSeletivoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoSeletivoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoSeletivoController.scrollController,
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
															maxLength: 3,
															controller: nfeDetalheImpostoSeletivoController.cstController,
															decoration: inputDecoration(
																hintText: 'Fill with the Cst',
																labelText: 'CST',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.cst = text;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															maxLength: 6,
															controller: nfeDetalheImpostoSeletivoController.codigoClassificacaoTributariaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Codigo Classificacao Tributaria',
																labelText: 'Codigo Classificacao Tributaria',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.codigoClassificacaoTributaria = text;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoSeletivoController.valorBaseCalculoController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Base Calculo',
																labelText: 'Valor Base Calculo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.valorBaseCalculo = nfeDetalheImpostoSeletivoController.valorBaseCalculoController.numberValue;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoSeletivoController.aliquotaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota',
																labelText: 'Aliquota',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.aliquota = nfeDetalheImpostoSeletivoController.aliquotaController.numberValue;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoSeletivoController.aliquotaEspecificaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Especifica',
																labelText: 'Aliquota Especifica',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.aliquotaEspecifica = nfeDetalheImpostoSeletivoController.aliquotaEspecificaController.numberValue;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															maxLength: 6,
															controller: nfeDetalheImpostoSeletivoController.unidadeTributavelController,
															decoration: inputDecoration(
																hintText: 'Fill with the Unidade Tributavel',
																labelText: 'Unidade Tributavel',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.unidadeTributavel = text;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoSeletivoController.quantidadeTributavelController,
															decoration: inputDecoration(
																hintText: 'Fill with the Quantidade Tributavel',
																labelText: 'Quantidade Tributavel',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.quantidadeTributavel = nfeDetalheImpostoSeletivoController.quantidadeTributavelController.numberValue;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoSeletivoController.valorController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoSeletivoController.nfeDetalheImpostoSeletivoModel.valor = nfeDetalheImpostoSeletivoController.valorController.numberValue;
																nfeDetalheImpostoSeletivoController.formWasChangedDetail = true;
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
