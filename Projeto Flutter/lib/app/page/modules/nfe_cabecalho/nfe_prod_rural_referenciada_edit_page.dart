import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_prod_rural_referenciada_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeProdRuralReferenciadaEditPage extends StatelessWidget {
	NfeProdRuralReferenciadaEditPage({Key? key}) : super(key: key);
	final nfeProdRuralReferenciadaController = Get.find<NfeProdRuralReferenciadaController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeProdRuralReferenciadaController.screenTitle } - ${ nfeProdRuralReferenciadaController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeProdRuralReferenciadaController.save),
						cancelAndExitButton(onPressed: nfeProdRuralReferenciadaController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeProdRuralReferenciadaController.scrollController,
							child: SingleChildScrollView(
								controller: nfeProdRuralReferenciadaController.scrollController,
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
															controller: nfeProdRuralReferenciadaController.codigoUfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Uf',
																labelText: 'Codigo Uf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.codigoUf = int.tryParse(text);
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.anoMesController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ano Mes',
																labelText: 'Ano Mes',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.anoMes = text;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.cnpjController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj',
																labelText: 'Cnpj',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.cnpj = text;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.cpfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cpf',
																labelText: 'Cpf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.cpf = text;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.inscricaoEstadualController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Inscricao Estadual',
																labelText: 'Inscricao Estadual',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.inscricaoEstadual = text;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.modeloController,
															labelText: 'Modelo',
															hintText: 'Informe os dados para o campo Modelo',
															items: const ['04'],
															onChanged: (dynamic newValue) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.modelo = newValue;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.serieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Serie',
																labelText: 'Serie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.serie = text;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															controller: nfeProdRuralReferenciadaController.numeroNfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Nf',
																labelText: 'Numero Nf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.numeroNf = int.tryParse(text);
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
															maxLength: 44,
															controller: nfeProdRuralReferenciadaController.cteController,
															decoration: inputDecoration(
																hintText: 'Fill with the Cte',
																labelText: 'Cte',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProdRuralReferenciadaController.nfeProdRuralReferenciadaModel.cte = text;
																nfeProdRuralReferenciadaController.formWasChangedDetail = true;
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
