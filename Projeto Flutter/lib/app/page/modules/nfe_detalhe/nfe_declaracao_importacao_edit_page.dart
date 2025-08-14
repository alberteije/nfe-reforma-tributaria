import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_declaracao_importacao_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDeclaracaoImportacaoEditPage extends StatelessWidget {
	NfeDeclaracaoImportacaoEditPage({Key? key}) : super(key: key);
	final nfeDeclaracaoImportacaoController = Get.find<NfeDeclaracaoImportacaoController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeDeclaracaoImportacaoController.screenTitle } - ${ nfeDeclaracaoImportacaoController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
            IconButton(
              tooltip: 'Adições',
              icon: const Icon(Icons.insert_comment_sharp),
              color: Colors.amber,
              onPressed: nfeDeclaracaoImportacaoController.callAdicoesPage,
            ),
            const SizedBox(width: 20,),
						saveButton(onPressed: nfeDeclaracaoImportacaoController.save),
						cancelAndExitButton(onPressed: nfeDeclaracaoImportacaoController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeDeclaracaoImportacaoController.scrollController,
							child: SingleChildScrollView(
								controller: nfeDeclaracaoImportacaoController.scrollController,
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
															maxLength: 15,
															controller: nfeDeclaracaoImportacaoController.numeroDocumentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Documento',
																labelText: 'Numero Documento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.numeroDocumento = text;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Data Registro',
																labelText: 'Data Registro',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																controller: nfeDeclaracaoImportacaoController.dataRegistroController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.dataRegistro = value;
																	nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
																},
															),
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
															maxLength: 60,
															controller: nfeDeclaracaoImportacaoController.localDesembaracoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Local Desembaraco',
																labelText: 'Local Desembaraco',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.localDesembaraco = text;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															controller: nfeDeclaracaoImportacaoController.ufDesembaracoController,
															labelText: 'Uf Desembaraco',
															hintText: 'Informe os dados para o campo Uf Desembaraco',
															items: ufList,
															onChanged: (dynamic newValue) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.ufDesembaraco = newValue;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Data Desembaraco',
																labelText: 'Data Desembaraco',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																controller: nfeDeclaracaoImportacaoController.dataDesembaracoController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.dataDesembaraco = value;
																	nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
																},
															),
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
															controller: nfeDeclaracaoImportacaoController.viaTransporteController,
															labelText: 'Via Transporte',
															hintText: 'Informe os dados para o campo Via Transporte',
															items: const ['1=Marítima','2=Fluvial','3=Lacustre','4=Aérea','5=Postal','6=Ferroviária','7=Rodoviária','8=Conduto/Rede Transmissão','9=Meios Próprios','10=Entrada/Saída Ficta','11=Courier','12=Em mãos','13=Por reboque '],
															onChanged: (dynamic newValue) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.viaTransporte = newValue;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															controller: nfeDeclaracaoImportacaoController.valorAfrmmController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Afrmm',
																labelText: 'Valor Afrmm',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.valorAfrmm = nfeDeclaracaoImportacaoController.valorAfrmmController.numberValue;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															controller: nfeDeclaracaoImportacaoController.formaIntermediacaoController,
															labelText: 'Forma Intermediacao',
															hintText: 'Informe os dados para o campo Forma Intermediacao',
															items: const ['1=Importação por conta própria','2=Importação por conta e ordem','3=Importação por encomenda'],
															onChanged: (dynamic newValue) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.formaIntermediacao = newValue;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															controller: nfeDeclaracaoImportacaoController.cnpjController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj',
																labelText: 'Cnpj',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.cnpj = text;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															controller: nfeDeclaracaoImportacaoController.cpfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cpf',
																labelText: 'Cpf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.cpf = text;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															controller: nfeDeclaracaoImportacaoController.ufTerceiroController,
															labelText: 'Uf Terceiro',
															hintText: 'Informe os dados para o campo Uf Terceiro',
															items: ufList,
															onChanged: (dynamic newValue) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.ufTerceiro = newValue;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
															maxLength: 60,
															controller: nfeDeclaracaoImportacaoController.codigoExportadorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Exportador',
																labelText: 'Codigo Exportador',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDeclaracaoImportacaoController.nfeDeclaracaoImportacaoModel.codigoExportador = text;
																nfeDeclaracaoImportacaoController.formWasChangedDetail = true;
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
