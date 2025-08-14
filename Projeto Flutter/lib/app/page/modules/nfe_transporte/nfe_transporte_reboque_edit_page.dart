import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_transporte_reboque_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeTransporteReboqueEditPage extends StatelessWidget {
	NfeTransporteReboqueEditPage({Key? key}) : super(key: key);
	final nfeTransporteReboqueController = Get.find<NfeTransporteReboqueController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeTransporteReboqueController.nfeTransporteReboqueScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeTransporteReboqueController.screenTitle } - ${ nfeTransporteReboqueController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeTransporteReboqueController.save),
						cancelAndExitButton(onPressed: nfeTransporteReboqueController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeTransporteReboqueController.nfeTransporteReboqueFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeTransporteReboqueController.scrollController,
							child: SingleChildScrollView(
								controller: nfeTransporteReboqueController.scrollController,
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
															maxLength: 8,
															controller: nfeTransporteReboqueController.placaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Placa',
																labelText: 'Placa',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteReboqueController.nfeTransporteReboqueModel.placa = text;
																nfeTransporteReboqueController.formWasChangedDetail = true;
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
															controller: nfeTransporteReboqueController.ufController,
															labelText: 'Uf',
															hintText: 'Informe os dados para o campo Uf',
															items: ufList,
															onChanged: (dynamic newValue) {
																nfeTransporteReboqueController.nfeTransporteReboqueModel.uf = newValue;
																nfeTransporteReboqueController.formWasChangedDetail = true;
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
															maxLength: 20,
															controller: nfeTransporteReboqueController.rntcController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Rntc',
																labelText: 'Rntc',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteReboqueController.nfeTransporteReboqueModel.rntc = text;
																nfeTransporteReboqueController.formWasChangedDetail = true;
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
															maxLength: 20,
															controller: nfeTransporteReboqueController.vagaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Vagao',
																labelText: 'Vagao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteReboqueController.nfeTransporteReboqueModel.vagao = text;
																nfeTransporteReboqueController.formWasChangedDetail = true;
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
															maxLength: 20,
															controller: nfeTransporteReboqueController.balsaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Balsa',
																labelText: 'Balsa',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteReboqueController.nfeTransporteReboqueModel.balsa = text;
																nfeTransporteReboqueController.formWasChangedDetail = true;
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
