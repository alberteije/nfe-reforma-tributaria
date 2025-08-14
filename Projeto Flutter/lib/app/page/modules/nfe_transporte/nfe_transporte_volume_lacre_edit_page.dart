import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_transporte_volume_lacre_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeTransporteVolumeLacreEditPage extends StatelessWidget {
	NfeTransporteVolumeLacreEditPage({Key? key}) : super(key: key);
	final nfeTransporteVolumeLacreController = Get.find<NfeTransporteVolumeLacreController>();

	@override
	Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
					nfeTransporteVolumeLacreController.preventDataLoss();
				}
			},
			child: Scaffold(
				key: nfeTransporteVolumeLacreController.nfeTransporteVolumeLacreScaffoldKey,
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeTransporteVolumeLacreController.screenTitle } - ${ nfeTransporteVolumeLacreController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeTransporteVolumeLacreController.save),
						cancelAndExitButton(onPressed: nfeTransporteVolumeLacreController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeTransporteVolumeLacreController.nfeTransporteVolumeLacreFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeTransporteVolumeLacreController.scrollController,
							child: SingleChildScrollView(
								controller: nfeTransporteVolumeLacreController.scrollController,
								child: BootstrapContainer(
									fluid: true,
									padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
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
															controller: nfeTransporteVolumeLacreController.numeroController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero',
																labelText: 'Numero',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeTransporteVolumeLacreController.nfeTransporteVolumeLacreModel.numero = text;
																nfeTransporteVolumeLacreController.formWasChangedDetail = true;
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
			),
		);
	}
}
