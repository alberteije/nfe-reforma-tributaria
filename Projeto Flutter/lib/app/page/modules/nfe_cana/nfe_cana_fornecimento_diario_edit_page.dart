import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_cana_fornecimento_diario_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeCanaFornecimentoDiarioEditPage extends StatelessWidget {
	NfeCanaFornecimentoDiarioEditPage({Key? key}) : super(key: key);
	final nfeCanaFornecimentoDiarioController = Get.find<NfeCanaFornecimentoDiarioController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeCanaFornecimentoDiarioController.screenTitle } - ${ nfeCanaFornecimentoDiarioController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeCanaFornecimentoDiarioController.save),
						cancelAndExitButton(onPressed: nfeCanaFornecimentoDiarioController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeCanaFornecimentoDiarioController.scrollController,
							child: SingleChildScrollView(
								controller: nfeCanaFornecimentoDiarioController.scrollController,
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
															maxLength: 2,
															controller: nfeCanaFornecimentoDiarioController.diaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Dia',
																labelText: 'Dia',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioModel.dia = text;
																nfeCanaFornecimentoDiarioController.formWasChangedDetail = true;
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
															controller: nfeCanaFornecimentoDiarioController.quantidadeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade',
																labelText: 'Quantidade',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioModel.quantidade = nfeCanaFornecimentoDiarioController.quantidadeController.numberValue;
																nfeCanaFornecimentoDiarioController.formWasChangedDetail = true;
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
															controller: nfeCanaFornecimentoDiarioController.quantidadeTotalMesController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Total Mes',
																labelText: 'Quantidade Total Mes',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioModel.quantidadeTotalMes = nfeCanaFornecimentoDiarioController.quantidadeTotalMesController.numberValue;
																nfeCanaFornecimentoDiarioController.formWasChangedDetail = true;
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
															controller: nfeCanaFornecimentoDiarioController.quantidadeTotalAnteriorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Total Anterior',
																labelText: 'Quantidade Total Anterior',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioModel.quantidadeTotalAnterior = nfeCanaFornecimentoDiarioController.quantidadeTotalAnteriorController.numberValue;
																nfeCanaFornecimentoDiarioController.formWasChangedDetail = true;
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
															controller: nfeCanaFornecimentoDiarioController.quantidadeTotalGeralController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade Total Geral',
																labelText: 'Quantidade Total Geral',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCanaFornecimentoDiarioController.nfeCanaFornecimentoDiarioModel.quantidadeTotalGeral = nfeCanaFornecimentoDiarioController.quantidadeTotalGeralController.numberValue;
																nfeCanaFornecimentoDiarioController.formWasChangedDetail = true;
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
