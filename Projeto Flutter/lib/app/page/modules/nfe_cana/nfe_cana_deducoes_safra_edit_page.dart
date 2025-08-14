import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_cana_deducoes_safra_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeCanaDeducoesSafraEditPage extends StatelessWidget {
	NfeCanaDeducoesSafraEditPage({Key? key}) : super(key: key);
	final nfeCanaDeducoesSafraController = Get.find<NfeCanaDeducoesSafraController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeCanaDeducoesSafraController.screenTitle } - ${ nfeCanaDeducoesSafraController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeCanaDeducoesSafraController.save),
						cancelAndExitButton(onPressed: nfeCanaDeducoesSafraController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeCanaDeducoesSafraController.scrollController,
							child: SingleChildScrollView(
								controller: nfeCanaDeducoesSafraController.scrollController,
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
															maxLength: 60,
															controller: nfeCanaDeducoesSafraController.decricaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Decricao',
																labelText: 'Decricao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraModel.decricao = text;
																nfeCanaDeducoesSafraController.formWasChangedDetail = true;
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
															controller: nfeCanaDeducoesSafraController.valorDeducaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Deducao',
																labelText: 'Valor Deducao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraModel.valorDeducao = nfeCanaDeducoesSafraController.valorDeducaoController.numberValue;
																nfeCanaDeducoesSafraController.formWasChangedDetail = true;
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
															controller: nfeCanaDeducoesSafraController.valorFornecimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Fornecimento',
																labelText: 'Valor Fornecimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraModel.valorFornecimento = nfeCanaDeducoesSafraController.valorFornecimentoController.numberValue;
																nfeCanaDeducoesSafraController.formWasChangedDetail = true;
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
															controller: nfeCanaDeducoesSafraController.valorTotalDeducaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Deducao',
																labelText: 'Valor Total Deducao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraModel.valorTotalDeducao = nfeCanaDeducoesSafraController.valorTotalDeducaoController.numberValue;
																nfeCanaDeducoesSafraController.formWasChangedDetail = true;
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
															controller: nfeCanaDeducoesSafraController.valorLiquidoFornecimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Liquido Fornecimento',
																labelText: 'Valor Liquido Fornecimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaDeducoesSafraController.nfeCanaDeducoesSafraModel.valorLiquidoFornecimento = nfeCanaDeducoesSafraController.valorLiquidoFornecimentoController.numberValue;
																nfeCanaDeducoesSafraController.formWasChangedDetail = true;
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
