import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_transporte_volume_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeTransporteVolumeEditPage extends StatelessWidget {
	NfeTransporteVolumeEditPage({Key? key}) : super(key: key);
	final nfeTransporteVolumeController = Get.find<NfeTransporteVolumeController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeTransporteVolumeController.nfeTransporteVolumeScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeTransporteVolumeController.screenTitle } - ${ nfeTransporteVolumeController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
            IconButton(
              tooltip: 'Lacres',
              icon: const Icon(Icons.badge),
              color: Colors.amber,
              onPressed: nfeTransporteVolumeController.callVolumeLacrePage,
            ),
            const SizedBox(width: 10,),
						saveButton(onPressed: nfeTransporteVolumeController.save),
						cancelAndExitButton(onPressed: nfeTransporteVolumeController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeTransporteVolumeController.nfeTransporteVolumeFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeTransporteVolumeController.scrollController,
							child: SingleChildScrollView(
								controller: nfeTransporteVolumeController.scrollController,
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
															controller: nfeTransporteVolumeController.quantidadeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Quantidade',
																labelText: 'Quantidade',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeController.nfeTransporteVolumeModel.quantidade = int.tryParse(text);
																nfeTransporteVolumeController.formWasChangedDetail = true;
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
															controller: nfeTransporteVolumeController.especieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Especie',
																labelText: 'Especie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeController.nfeTransporteVolumeModel.especie = text;
																nfeTransporteVolumeController.formWasChangedDetail = true;
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
															controller: nfeTransporteVolumeController.marcaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Marca',
																labelText: 'Marca',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeController.nfeTransporteVolumeModel.marca = text;
																nfeTransporteVolumeController.formWasChangedDetail = true;
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
															controller: nfeTransporteVolumeController.numeracaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numeracao',
																labelText: 'Numeracao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeController.nfeTransporteVolumeModel.numeracao = text;
																nfeTransporteVolumeController.formWasChangedDetail = true;
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
															controller: nfeTransporteVolumeController.pesoLiquidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Peso Liquido',
																labelText: 'Peso Liquido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeController.nfeTransporteVolumeModel.pesoLiquido = nfeTransporteVolumeController.pesoLiquidoController.numberValue;
																nfeTransporteVolumeController.formWasChangedDetail = true;
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
															controller: nfeTransporteVolumeController.pesoBrutoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Peso Bruto',
																labelText: 'Peso Bruto',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeController.nfeTransporteVolumeModel.pesoBruto = nfeTransporteVolumeController.pesoBrutoController.numberValue;
																nfeTransporteVolumeController.formWasChangedDetail = true;
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
