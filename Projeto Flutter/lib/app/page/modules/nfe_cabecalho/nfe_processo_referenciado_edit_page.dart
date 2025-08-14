import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_processo_referenciado_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeProcessoReferenciadoEditPage extends StatelessWidget {
	NfeProcessoReferenciadoEditPage({Key? key}) : super(key: key);
	final nfeProcessoReferenciadoController = Get.find<NfeProcessoReferenciadoController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeProcessoReferenciadoController.nfeProcessoReferenciadoScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeProcessoReferenciadoController.screenTitle } - ${ nfeProcessoReferenciadoController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeProcessoReferenciadoController.save),
						cancelAndExitButton(onPressed: nfeProcessoReferenciadoController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeProcessoReferenciadoController.nfeProcessoReferenciadoFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeProcessoReferenciadoController.scrollController,
							child: SingleChildScrollView(
								controller: nfeProcessoReferenciadoController.scrollController,
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
															controller: nfeProcessoReferenciadoController.identificadorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Identificador',
																labelText: 'Identificador',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeProcessoReferenciadoController.nfeProcessoReferenciadoModel.identificador = text;
																nfeProcessoReferenciadoController.formWasChangedDetail = true;
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
															controller: nfeProcessoReferenciadoController.origemController,
															labelText: 'Origem',
															hintText: 'Informe os dados para o campo Origem',
															items: const ['0=SEFAZ','1=Justiça Federal','2=Justiça Estadual','3=Secex/RFB','4=CONFAZ','9=Outros'],
															onChanged: (dynamic newValue) {
																nfeProcessoReferenciadoController.nfeProcessoReferenciadoModel.origem = newValue;
																nfeProcessoReferenciadoController.formWasChangedDetail = true;
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
															controller: nfeProcessoReferenciadoController.tipoAtoConcessorioController,
															labelText: 'Tipo Ato Concessorio',
															hintText: 'Informe os dados para o campo Tipo Ato Concessorio',
															items: const ['08=Termo de Acordo','10=Regime Especial','12=Autorização específica','14=Ajuste SINIEF','15=Convênio ICMS'],
															onChanged: (dynamic newValue) {
																nfeProcessoReferenciadoController.nfeProcessoReferenciadoModel.tipoAtoConcessorio = newValue;
																nfeProcessoReferenciadoController.formWasChangedDetail = true;
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
