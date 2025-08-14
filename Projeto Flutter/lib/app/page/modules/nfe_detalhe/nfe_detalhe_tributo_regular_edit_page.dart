import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_tributo_regular_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheTributoRegularEditPage extends StatelessWidget {
  NfeDetalheTributoRegularEditPage({Key? key}) : super(key: key);
  final nfeDetalheTributoRegularController = Get.find<NfeDetalheTributoRegularController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheTributoRegularController.nfeDetalheTributoRegularScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheTributoRegularController.nfeDetalheTributoRegularFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheTributoRegularController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheTributoRegularController.scrollController,
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
															controller: nfeDetalheTributoRegularController.cstController,
															decoration: inputDecoration(
																hintText: 'Fill with the Cst',
																labelText: 'Cst',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.cst = text;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.codigoClassificacaoTributariaController,
															decoration: inputDecoration(
																hintText: 'Fill with the Codigo Classificacao Tributaria',
																labelText: 'Codigo Classificacao Tributaria',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.codigoClassificacaoTributaria = text;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.aliquotaIbsUfController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs Uf',
																labelText: 'Aliquota Ibs Uf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.aliquotaIbsUf = nfeDetalheTributoRegularController.aliquotaIbsUfController.numberValue;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.valorTributoIbsUfController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Tributo Ibs Uf',
																labelText: 'Valor Tributo Ibs Uf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.valorTributoIbsUf = nfeDetalheTributoRegularController.valorTributoIbsUfController.numberValue;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.aliquotaIbsMunController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs Mun',
																labelText: 'Aliquota Ibs Mun',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.aliquotaIbsMun = nfeDetalheTributoRegularController.aliquotaIbsMunController.numberValue;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.valorTributoIbsMunController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Tributo Ibs Mun',
																labelText: 'Valor Tributo Ibs Mun',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.valorTributoIbsMun = nfeDetalheTributoRegularController.valorTributoIbsMunController.numberValue;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.alquotaCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Alquota Cbs',
																labelText: 'Alquota Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.alquotaCbs = nfeDetalheTributoRegularController.alquotaCbsController.numberValue;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
															controller: nfeDetalheTributoRegularController.valorTributoCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Tributo Cbs',
																labelText: 'Valor Tributo Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheTributoRegularController.nfeDetalheTributoRegularModel.valorTributoCbs = nfeDetalheTributoRegularController.valorTributoCbsController.numberValue;
																nfeDetalheTributoRegularController.formWasChangedDetail = true;
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
