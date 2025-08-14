import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_acesso_xml_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeAcessoXmlEditPage extends StatelessWidget {
	NfeAcessoXmlEditPage({Key? key}) : super(key: key);
	final nfeAcessoXmlController = Get.find<NfeAcessoXmlController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeAcessoXmlController.nfeAcessoXmlScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeAcessoXmlController.screenTitle } - ${ nfeAcessoXmlController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeAcessoXmlController.save),
						cancelAndExitButton(onPressed: nfeAcessoXmlController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeAcessoXmlController.nfeAcessoXmlFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeAcessoXmlController.scrollController,
							child: SingleChildScrollView(
								controller: nfeAcessoXmlController.scrollController,
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
															controller: nfeAcessoXmlController.cnpjController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj',
																labelText: 'Cnpj',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeAcessoXmlController.nfeAcessoXmlModel.cnpj = text;
																nfeAcessoXmlController.formWasChangedDetail = true;
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
															controller: nfeAcessoXmlController.cpfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cpf',
																labelText: 'Cpf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeAcessoXmlController.nfeAcessoXmlModel.cpf = text;
																nfeAcessoXmlController.formWasChangedDetail = true;
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
