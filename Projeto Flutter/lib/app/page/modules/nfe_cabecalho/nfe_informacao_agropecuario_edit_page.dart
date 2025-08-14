import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_informacao_agropecuario_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeInformacaoAgropecuarioEditPage extends StatelessWidget {
	NfeInformacaoAgropecuarioEditPage({Key? key}) : super(key: key);
	final nfeInformacaoAgropecuarioController = Get.find<NfeInformacaoAgropecuarioController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeInformacaoAgropecuarioController.screenTitle } - ${ nfeInformacaoAgropecuarioController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeInformacaoAgropecuarioController.save),
						cancelAndExitButton(onPressed: nfeInformacaoAgropecuarioController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeInformacaoAgropecuarioController.scrollController,
							child: SingleChildScrollView(
								controller: nfeInformacaoAgropecuarioController.scrollController,
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
															maxLength: 30,
															controller: nfeInformacaoAgropecuarioController.numeroReceituarioController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Receituario',
																labelText: 'Numero Receituario',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioModel.numeroReceituario = text;
																nfeInformacaoAgropecuarioController.formWasChangedDetail = true;
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
															maxLength: 11,
															controller: nfeInformacaoAgropecuarioController.cpfResponsavelTecnicoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cpf Responsavel Tecnico',
																labelText: 'Cpf Responsavel Tecnico',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioModel.cpfResponsavelTecnico = text;
																nfeInformacaoAgropecuarioController.formWasChangedDetail = true;
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
															controller: nfeInformacaoAgropecuarioController.guiaTipoController,
															labelText: 'Guia Tipo',
															hintText: 'Informe os dados para o campo Guia Tipo',
															items: const ['1 - GTA - Guia de Trânsito Animal','2 - TTA - Termo de Trânsito Animal','3 - DTA - Documento de Transferência Animal','4 - ATV - Autorização de Trânsito Vegetal','5 - PTV - Permissão de Trânsito Vegetal','6 - GTV - Guia de Trânsito Vegetal','7 - Guia Florestal (DOF','SisFlora - PA e MT ou SIAM - MG)'],
															onChanged: (dynamic newValue) {
																nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioModel.guiaTipo = newValue;
																nfeInformacaoAgropecuarioController.formWasChangedDetail = true;
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
															controller: nfeInformacaoAgropecuarioController.guiaUfEmissaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Guia Uf Emissao',
																labelText: 'Guia Uf Emissao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioModel.guiaUfEmissao = text;
																nfeInformacaoAgropecuarioController.formWasChangedDetail = true;
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
															maxLength: 9,
															controller: nfeInformacaoAgropecuarioController.guiaSerieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Guia Serie',
																labelText: 'Guia Serie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioModel.guiaSerie = text;
																nfeInformacaoAgropecuarioController.formWasChangedDetail = true;
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
															maxLength: 9,
															controller: nfeInformacaoAgropecuarioController.guiaNumeroController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Guia Numero',
																labelText: 'Guia Numero',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoAgropecuarioController.nfeInformacaoAgropecuarioModel.guiaNumero = text;
																nfeInformacaoAgropecuarioController.formWasChangedDetail = true;
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
