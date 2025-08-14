import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_nf_referenciada_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeNfReferenciadaEditPage extends StatelessWidget {
	NfeNfReferenciadaEditPage({Key? key}) : super(key: key);
	final nfeNfReferenciadaController = Get.find<NfeNfReferenciadaController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeNfReferenciadaController.nfeNfReferenciadaScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeNfReferenciadaController.screenTitle } - ${ nfeNfReferenciadaController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeNfReferenciadaController.save),
						cancelAndExitButton(onPressed: nfeNfReferenciadaController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeNfReferenciadaController.nfeNfReferenciadaFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeNfReferenciadaController.scrollController,
							child: SingleChildScrollView(
								controller: nfeNfReferenciadaController.scrollController,
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
															controller: nfeNfReferenciadaController.codigoUfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Uf',
																labelText: 'Codigo Uf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeNfReferenciadaController.nfeNfReferenciadaModel.codigoUf = int.tryParse(text);
																nfeNfReferenciadaController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeNfReferenciadaController.anoMesController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ano Mes',
																labelText: 'Ano Mes',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeNfReferenciadaController.nfeNfReferenciadaModel.anoMes = text;
																nfeNfReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeNfReferenciadaController.cnpjController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj',
																labelText: 'Cnpj',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeNfReferenciadaController.nfeNfReferenciadaModel.cnpj = text;
																nfeNfReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeNfReferenciadaController.modeloController,
															labelText: 'Modelo',
															hintText: 'Informe os dados para o campo Modelo',
															items: const ['01','02'],
															onChanged: (dynamic newValue) {
																nfeNfReferenciadaController.nfeNfReferenciadaModel.modelo = newValue;
																nfeNfReferenciadaController.formWasChangedDetail = true;
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
															maxLength: 3,
															controller: nfeNfReferenciadaController.serieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Serie',
																labelText: 'Serie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeNfReferenciadaController.nfeNfReferenciadaModel.serie = text;
																nfeNfReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeNfReferenciadaController.numeroNfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Nf',
																labelText: 'Numero Nf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeNfReferenciadaController.nfeNfReferenciadaModel.numeroNf = int.tryParse(text);
																nfeNfReferenciadaController.formWasChangedDetail = true;
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
