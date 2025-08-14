import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_compra_governo_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheCompraGovernoEditPage extends StatelessWidget {
  NfeDetalheCompraGovernoEditPage({Key? key}) : super(key: key);
  final nfeDetalheCompraGovernoController = Get.find<NfeDetalheCompraGovernoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheCompraGovernoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheCompraGovernoController.scrollController,
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
															controller: nfeDetalheCompraGovernoController.aliquotaIbsUfController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs Uf',
																labelText: 'Aliquota Ibs Uf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoModel.aliquotaIbsUf = nfeDetalheCompraGovernoController.aliquotaIbsUfController.numberValue;
																nfeDetalheCompraGovernoController.formWasChangedDetail = true;
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
															controller: nfeDetalheCompraGovernoController.valorIbsUfController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs Uf',
																labelText: 'Valor Ibs Uf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoModel.valorIbsUf = nfeDetalheCompraGovernoController.valorIbsUfController.numberValue;
																nfeDetalheCompraGovernoController.formWasChangedDetail = true;
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
															controller: nfeDetalheCompraGovernoController.aliquotaIbsMunController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Ibs Mun',
																labelText: 'Aliquota Ibs Mun',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoModel.aliquotaIbsMun = nfeDetalheCompraGovernoController.aliquotaIbsMunController.numberValue;
																nfeDetalheCompraGovernoController.formWasChangedDetail = true;
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
															controller: nfeDetalheCompraGovernoController.valorIbsMunController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Ibs Mun',
																labelText: 'Valor Ibs Mun',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoModel.valorIbsMun = nfeDetalheCompraGovernoController.valorIbsMunController.numberValue;
																nfeDetalheCompraGovernoController.formWasChangedDetail = true;
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
															controller: nfeDetalheCompraGovernoController.aliquotaCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Aliquota Cbs',
																labelText: 'Aliquota Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoModel.aliquotaCbs = nfeDetalheCompraGovernoController.aliquotaCbsController.numberValue;
																nfeDetalheCompraGovernoController.formWasChangedDetail = true;
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
															controller: nfeDetalheCompraGovernoController.valorCbsController,
															decoration: inputDecoration(
																hintText: 'Fill with the Valor Cbs',
																labelText: 'Valor Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheCompraGovernoController.nfeDetalheCompraGovernoModel.valorCbs = nfeDetalheCompraGovernoController.valorCbsController.numberValue;
																nfeDetalheCompraGovernoController.formWasChangedDetail = true;
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
