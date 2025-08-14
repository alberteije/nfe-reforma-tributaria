import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_configuracao_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeConfiguracaoEditPage extends StatelessWidget {
	NfeConfiguracaoEditPage({Key? key}) : super(key: key);
	final nfeConfiguracaoController = Get.find<NfeConfiguracaoController>();

	@override
	Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
					nfeConfiguracaoController.preventDataLoss();
				}
			},
			child: Scaffold(
				key: nfeConfiguracaoController.scaffoldKey,
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeConfiguracaoController.screenTitle } - ${ nfeConfiguracaoController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeConfiguracaoController.save),
						cancelAndExitButton(onPressed: nfeConfiguracaoController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeConfiguracaoController.formKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeConfiguracaoController.scrollController,
							child: SingleChildScrollView(
								controller: nfeConfiguracaoController.scrollController,
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
															maxLength: 100,
															controller: nfeConfiguracaoController.certificadoDigitalSerieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Certificado Digital Serie',
																labelText: 'Certificado Digital Serie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.certificadoDigitalSerie = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.certificadoDigitalCaminhoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Certificado Digital Caminho',
																labelText: 'Certificado Digital Caminho',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.certificadoDigitalCaminho = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															maxLength: 100,
															controller: nfeConfiguracaoController.certificadoDigitalSenhaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Certificado Digital Senha',
																labelText: 'Certificado Digital Senha',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.certificadoDigitalSenha = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.tipoEmissaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Tipo Emissao',
																labelText: 'Tipo Emissao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.tipoEmissao = int.tryParse(text);
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.formatoImpressaoDanfeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Formato Impressao Danfe',
																labelText: 'Formato Impressao Danfe',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.formatoImpressaoDanfe = int.tryParse(text);
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.processoEmissaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Processo Emissao',
																labelText: 'Processo Emissao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.processoEmissao = int.tryParse(text);
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.versaoProcessoEmissaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Versao Processo Emissao',
																labelText: 'Versao Processo Emissao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.versaoProcessoEmissao = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.caminhoLogomarcaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Caminho Logomarca',
																labelText: 'Caminho Logomarca',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.caminhoLogomarca = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.salvarXmlController,
															labelText: 'Salvar Xml',
															hintText: 'Informe os dados para o campo Salvar Xml',
															items: const ['Sim','Não'],
															onChanged: (dynamic newValue) {
																nfeConfiguracaoController.currentModel.salvarXml = newValue;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.caminhoSalvarXmlController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Caminho Salvar Xml',
																labelText: 'Caminho Salvar Xml',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.caminhoSalvarXml = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.caminhoSchemasController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Caminho Schemas',
																labelText: 'Caminho Schemas',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.caminhoSchemas = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.caminhoArquivoDanfeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Caminho Arquivo Danfe',
																labelText: 'Caminho Arquivo Danfe',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.caminhoArquivoDanfe = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.caminhoSalvarPdfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Caminho Salvar Pdf',
																labelText: 'Caminho Salvar Pdf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.caminhoSalvarPdf = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.webserviceUfController,
															labelText: 'Webservice Uf',
															hintText: 'Informe os dados para o campo Webservice Uf',
															items: ufList,
															onChanged: (dynamic newValue) {
																nfeConfiguracaoController.currentModel.webserviceUf = newValue;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.webserviceAmbienteController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Webservice Ambiente',
																labelText: 'Webservice Ambiente',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.webserviceAmbiente = int.tryParse(text);
																nfeConfiguracaoController.formWasChanged = true;
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
															maxLength: 100,
															controller: nfeConfiguracaoController.webserviceProxyHostController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Webservice Proxy Host',
																labelText: 'Webservice Proxy Host',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.webserviceProxyHost = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.webserviceProxyPortaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Webservice Proxy Porta',
																labelText: 'Webservice Proxy Porta',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.webserviceProxyPorta = int.tryParse(text);
																nfeConfiguracaoController.formWasChanged = true;
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
															maxLength: 100,
															controller: nfeConfiguracaoController.webserviceProxyUsuarioController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Webservice Proxy Usuario',
																labelText: 'Webservice Proxy Usuario',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.webserviceProxyUsuario = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															maxLength: 100,
															controller: nfeConfiguracaoController.webserviceProxySenhaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Webservice Proxy Senha',
																labelText: 'Webservice Proxy Senha',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.webserviceProxySenha = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.webserviceVisualizarController,
															labelText: 'Webservice Visualizar',
															hintText: 'Informe os dados para o campo Webservice Visualizar',
															items: const ['Sim','Não'],
															onChanged: (dynamic newValue) {
																nfeConfiguracaoController.currentModel.webserviceVisualizar = newValue;
																nfeConfiguracaoController.formWasChanged = true;
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
															validator: ValidateFormField.validateEmail,
															maxLength: 100,
															controller: nfeConfiguracaoController.emailServidorSmtpController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email Servidor Smtp',
																labelText: 'Email Servidor Smtp',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.emailServidorSmtp = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.emailPortaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email Porta',
																labelText: 'Email Porta',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.emailPorta = int.tryParse(text);
																nfeConfiguracaoController.formWasChanged = true;
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
															validator: ValidateFormField.validateEmail,
															maxLength: 100,
															controller: nfeConfiguracaoController.emailUsuarioController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email Usuario',
																labelText: 'Email Usuario',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.emailUsuario = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															validator: ValidateFormField.validateEmail,
															maxLength: 100,
															controller: nfeConfiguracaoController.emailSenhaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email Senha',
																labelText: 'Email Senha',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.emailSenha = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															validator: ValidateFormField.validateEmail,
															maxLength: 100,
															controller: nfeConfiguracaoController.emailAssuntoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email Assunto',
																labelText: 'Email Assunto',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.emailAssunto = text;
																nfeConfiguracaoController.formWasChanged = true;
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
															controller: nfeConfiguracaoController.emailAutenticaSslController,
															labelText: 'Email Autentica Ssl',
															hintText: 'Informe os dados para o campo Email Autentica Ssl',
															items: const ['Sim','Não'],
															onChanged: (dynamic newValue) {
																nfeConfiguracaoController.currentModel.emailAutenticaSsl = newValue;
																nfeConfiguracaoController.formWasChanged = true;
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
															validator: ValidateFormField.validateEmail,
															controller: nfeConfiguracaoController.emailTextoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Email Texto',
																labelText: 'Email Texto',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeConfiguracaoController.currentModel.emailTexto = text;
																nfeConfiguracaoController.formWasChanged = true;
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
