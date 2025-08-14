import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/data/domain/nfe_cabecalho_domain.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_cabecalho_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeCabecalhoEditPage extends StatelessWidget {
	NfeCabecalhoEditPage({Key? key}) : super(key: key);
	final nfeCabecalhoController = Get.find<NfeCabecalhoController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeCabecalhoController.nfeCabecalhoScaffoldKey,
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeCabecalhoController.nfeCabecalhoFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeCabecalhoController.scrollController,
							child: SingleChildScrollView(
								controller: nfeCabecalhoController.scrollController,
								child: BootstrapContainer(
									fluid: true,
									padding: const EdgeInsets.all(10),
									children: <Widget>[
										const Divider(
											color: Colors.transparent,
										),
										BootstrapRow(
											height: 60,
											children: <BootstrapCol>[
												BootstrapCol(
													sizes: 'col-12 col-md-6',
													child: Row(
														children: <Widget>[
															Expanded(
																flex: 1,
																child: SizedBox(
																	child: TextFormField(
																		controller: nfeCabecalhoController.vendaCabecalhoModelController,
																		readOnly: true,
																		decoration: inputDecoration(
																			hintText: 'Informe os dados para o campo Venda',
																			labelText: 'Venda',
																			usePadding: true,
																		),
																		onSaved: (String? value) {},
																		onChanged: (text) {},
																	),
																),
															),
															Expanded(
																flex: 0,
																child: lookupButton(onPressed: nfeCabecalhoController.callVendaCabecalhoLookup),
															),
														],
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-6',
													child: Row(
														children: <Widget>[
															Expanded(
																flex: 1,
																child: SizedBox(
																	child: TextFormField(
																		controller: nfeCabecalhoController.tributOperacaoFiscalModelController,
																		readOnly: true,
																		decoration: inputDecoration(
																			hintText: 'Informe os dados para o campo Operação Fiscal',
																			labelText: 'Operação Fiscal',
																			usePadding: true,
																		),
																		onSaved: (String? value) {},
																		onChanged: (text) {},
																	),
																),
															),
															Expanded(
																flex: 0,
																child: lookupButton(onPressed: nfeCabecalhoController.callTributOperacaoFiscalLookup),
															),
														],
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
													sizes: 'col-12 col-md-4',
													child: Row(
														children: <Widget>[
															Expanded(
																flex: 1,
																child: SizedBox(
																	child: TextFormField(
																		controller: nfeCabecalhoController.viewPessoaClienteModelController,
																		validator: ValidateFormField.validateMandatory,
																		readOnly: true,
																		decoration: inputDecoration(
																			hintText: 'Informe os dados para o campo Cliente',
																			labelText: 'Cliente *',
																			usePadding: true,
																		),
																		onSaved: (String? value) {},
																		onChanged: (text) {},
																	),
																),
															),
															Expanded(
																flex: 0,
																child: lookupButton(onPressed: nfeCabecalhoController.callViewPessoaClienteLookup),
															),
														],
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-4',
													child: Row(
														children: <Widget>[
															Expanded(
																flex: 1,
																child: SizedBox(
																	child: TextFormField(
																		controller: nfeCabecalhoController.viewPessoaColaboradorModelController,
																		validator: ValidateFormField.validateMandatory,
																		readOnly: true,
																		decoration: inputDecoration(
																			hintText: 'Informe os dados para o campo Colaborador',
																			labelText: 'Colaborador *',
																			usePadding: true,
																		),
																		onSaved: (String? value) {},
																		onChanged: (text) {},
																	),
																),
															),
															Expanded(
																flex: 0,
																child: lookupButton(onPressed: nfeCabecalhoController.callViewPessoaColaboradorLookup),
															),
														],
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-4',
													child: Row(
														children: <Widget>[
															Expanded(
																flex: 1,
																child: SizedBox(
																	child: TextFormField(
																		controller: nfeCabecalhoController.viewPessoaFornecedorModelController,
																		validator: ValidateFormField.validateMandatory,
																		readOnly: true,
																		decoration: inputDecoration(
																			hintText: 'Informe os dados para o campo Fornecedor',
																			labelText: 'Fornecedor *',
																			usePadding: true,
																		),
																		onSaved: (String? value) {},
																		onChanged: (text) {},
																	),
																),
															),
															Expanded(
																flex: 0,
																child: lookupButton(onPressed: nfeCabecalhoController.callViewPessoaFornecedorLookup),
															),
														],
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
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.ufEmitenteController,
															labelText: 'UF Emitente',
															hintText: 'Informe os dados para o campo Uf Emitente',
															items: const ['AC','AL','AM','AP','BA','CE','DF','ES','GO','MA','MG','MS','MT','PA','PB','PE','PI','PR','RJ','RN','RO','RR','RS','SC','SE','SP','TO'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.ufEmitente = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 8,
															controller: nfeCabecalhoController.codigoNumericoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Numerico',
																labelText: 'Codigo Numerico',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.codigoNumerico = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-6',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 60,
															controller: nfeCabecalhoController.naturezaOperacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Natureza Operacao',
																labelText: 'Natureza Operacao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.naturezaOperacao = text;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.codigoModeloController,
															labelText: 'Codigo Modelo',
															hintText: 'Informe os dados para o campo Codigo Modelo',
															items: const ['55'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.codigoModelo = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 3,
															controller: nfeCabecalhoController.serieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Serie',
																labelText: 'Serie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.serie = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 9,
															controller: nfeCabecalhoController.numeroController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero',
																labelText: 'Numero',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.numero = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Data Hora Emissao',
																labelText: 'Data Hora Emissao',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
                                controller: nfeCabecalhoController.dataHoraEmissaoController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeCabecalhoController.currentModel.dataHoraEmissao = value;
																	nfeCabecalhoController.formWasChanged = true;
																},
															),
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Data Hora Entrada Saida',
																labelText: 'Data Hora Entrada Saida',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																controller: nfeCabecalhoController.dataHoraEntradaSaidaController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeCabecalhoController.currentModel.dataHoraEntradaSaida = value;
																	nfeCabecalhoController.formWasChanged = true;
																},
															),
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.tipoOperacaoController,
															labelText: 'Tipo Operacao',
															hintText: 'Informe os dados para o campo Tipo Operacao',
															items: const ['0=Entrada','1=Saída'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.tipoOperacao = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.localDestinoController,
															labelText: 'Local Destino',
															hintText: 'Informe os dados para o campo Local Destino',
															items: const ['1=Operação interna','2=Operação interestadual','3=Operação com exterior'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.localDestino = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.codigoMunicipioController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Municipio',
																labelText: 'Codigo Municipio',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.codigoMunicipio = int.tryParse(text);
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.formatoImpressaoDanfeController,
															labelText: 'Formato Impressao Danfe',
															hintText: 'Informe os dados para o campo Formato Impressao Danfe',
															items: const ['0=Sem geração de DANFE','1=DANFE normal','Retrato','2=DANFE normal','Paisagem','3=DANFE Simplificado','5=DANFE NFC-e em mensagem eletrônica'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.formatoImpressaoDanfe = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.tipoEmissaoController,
															labelText: 'Tipo Emissao',
															hintText: 'Informe os dados para o campo Tipo Emissao',
															items: const ['1=Emissão normal','2=Contingência FS-IA','4=Contingência EPEC','5=Contingência FS-DA','6=Contingência SVC-AN','7=Contingência SVC-RS','9=Contingência off-line da NFC-e'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.tipoEmissao = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-9',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 44,
															controller: nfeCabecalhoController.chaveAcessoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Chave Acesso',
																labelText: 'Chave Acesso',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.chaveAcesso = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-3',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 1,
															controller: nfeCabecalhoController.digitoChaveAcessoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Digito Chave Acesso',
																labelText: 'Digito Chave Acesso',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.digitoChaveAcesso = text;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.ambienteController,
															labelText: 'Ambiente',
															hintText: 'Informe os dados para o campo Ambiente',
															items: const ['1=Produção','2=Homologação'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.ambiente = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.finalidadeEmissaoController,
															labelText: 'Finalidade Emissao',
															hintText: 'Informe os dados para o campo Finalidade Emissao',
															items: finalidadeEmissaoListDropdown,
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.finalidadeEmissao = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.consumidorOperacaoController,
															labelText: 'Consumidor Operacao',
															hintText: 'Informe os dados para o campo Consumidor Operacao',
															items: const ['0=Normal','1=Consumidor final'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.consumidorOperacao = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.consumidorPresencaController,
															labelText: 'Consumidor Presenca',
															hintText: 'Informe os dados para o campo Consumidor Presenca',
															items: const ['0=Não se aplica','1=Operação presencial','2=Operação não presencial','pela Internet','3=Operação não presencial','Teleatendimento','4=NFC-e em operação com entrega a domicílio','5=Operação presencial','fora do estabelecimento','9=Operação não presencial','outros'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.consumidorPresenca = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-4',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.processoEmissaoController,
															labelText: 'Processo Emissao',
															hintText: 'Informe os dados para o campo Processo Emissao',
															items: const ['0=Emissão de NF-e com aplicativo do contribuinte','1=Emissão de NF-e avulsa pelo Fisco','2=Emissão de NF-e avulsa','pelo contribuinte com seu certificado digital','através do site do Fisco','3=Emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.processoEmissao = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-6',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 20,
															controller: nfeCabecalhoController.versaoProcessoEmissaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Versao Processo Emissao',
																labelText: 'Versao Processo Emissao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.versaoProcessoEmissao = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-6',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Data Entrada Contingencia',
																labelText: 'Data Entrada Contingencia',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																controller: nfeCabecalhoController.dataHoraEntradaSaidaController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeCabecalhoController.currentModel.dataEntradaContingencia = value;
																	nfeCabecalhoController.formWasChanged = true;
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
															maxLength: 255,
															controller: nfeCabecalhoController.justificativaContingenciaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Justificativa Contingencia',
																labelText: 'Justificativa Contingencia',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.justificativaContingencia = text;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.baseCalculoIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Icms',
																labelText: 'Base Calculo Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.baseCalculoIcms = nfeCabecalhoController.baseCalculoIcmsController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorIcmsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms',
																labelText: 'Valor Icms',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorIcms = nfeCabecalhoController.valorIcmsController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorIcmsDesoneradoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms Desonerado',
																labelText: 'Valor Icms Desonerado',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorIcmsDesonerado = nfeCabecalhoController.valorIcmsDesoneradoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.totalIcmsFcpUfDestinoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Icms Fcp Uf Destino',
																labelText: 'Total Icms Fcp Uf Destino',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalIcmsFcpUfDestino = nfeCabecalhoController.totalIcmsFcpUfDestinoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.totalIcmsInterestadualUfDestinoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Icms Interestadual Uf Destino',
																labelText: 'Total Icms Interestadual Uf Destino',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalIcmsInterestadualUfDestino = nfeCabecalhoController.totalIcmsInterestadualUfDestinoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.totalIcmsInterestadualUfRemetenteController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Icms Interestadual Uf Remetente',
																labelText: 'Total Icms Interestadual Uf Remetente',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalIcmsInterestadualUfRemetente = nfeCabecalhoController.totalIcmsInterestadualUfRemetenteController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalFcpController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Fcp',
																labelText: 'Valor Total Fcp',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotalFcp = nfeCabecalhoController.valorTotalFcpController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.baseCalculoIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Icms St',
																labelText: 'Base Calculo Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.baseCalculoIcmsSt = nfeCabecalhoController.baseCalculoIcmsStController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorIcmsStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Icms St',
																labelText: 'Valor Icms St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorIcmsSt = nfeCabecalhoController.valorIcmsStController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalFcpStController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Fcp St',
																labelText: 'Valor Total Fcp St',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotalFcpSt = nfeCabecalhoController.valorTotalFcpStController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalFcpStRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Fcp St Retido',
																labelText: 'Valor Total Fcp St Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotalFcpStRetido = nfeCabecalhoController.valorTotalFcpStRetidoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalProdutosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Produtos',
																labelText: 'Valor Total Produtos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotalProdutos = nfeCabecalhoController.valorTotalProdutosController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorFreteController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Frete',
																labelText: 'Valor Frete',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorFrete = nfeCabecalhoController.valorFreteController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorSeguroController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Seguro',
																labelText: 'Valor Seguro',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorSeguro = nfeCabecalhoController.valorSeguroController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorDescontoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Desconto',
																labelText: 'Valor Desconto',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorDesconto = nfeCabecalhoController.valorDescontoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorImpostoImportacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Imposto Importacao',
																labelText: 'Valor Imposto Importacao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorImpostoImportacao = nfeCabecalhoController.valorImpostoImportacaoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorIpiController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Ipi',
																labelText: 'Valor Ipi',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorIpi = nfeCabecalhoController.valorIpiController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorIpiDevolvidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Ipi Devolvido',
																labelText: 'Valor Ipi Devolvido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorIpiDevolvido = nfeCabecalhoController.valorIpiDevolvidoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorPisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Pis',
																labelText: 'Valor Pis',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorPis = nfeCabecalhoController.valorPisController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorCofinsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Cofins',
																labelText: 'Valor Cofins',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorCofins = nfeCabecalhoController.valorCofinsController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorDespesasAcessoriasController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Despesas Acessorias',
																labelText: 'Valor Despesas Acessorias',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorDespesasAcessorias = nfeCabecalhoController.valorDespesasAcessoriasController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total',
																labelText: 'Valor Total',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotal = nfeCabecalhoController.valorTotalController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalTributosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Tributos',
																labelText: 'Valor Total Tributos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotalTributos = nfeCabecalhoController.valorTotalTributosController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorServicosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Servicos',
																labelText: 'Valor Servicos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorServicos = nfeCabecalhoController.valorServicosController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.baseCalculoIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Issqn',
																labelText: 'Base Calculo Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.baseCalculoIssqn = nfeCabecalhoController.baseCalculoIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Issqn',
																labelText: 'Valor Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorIssqn = nfeCabecalhoController.valorIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorPisIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Pis Issqn',
																labelText: 'Valor Pis Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorPisIssqn = nfeCabecalhoController.valorPisIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorCofinsIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Cofins Issqn',
																labelText: 'Valor Cofins Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorCofinsIssqn = nfeCabecalhoController.valorCofinsIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: InputDecorator(
															decoration: inputDecoration(
																hintText: 'Data Prestacao Servico',
																labelText: 'Data Prestacao Servico',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																controller: nfeCabecalhoController.dataPrestacaoServicoController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeCabecalhoController.currentModel.dataPrestacaoServico = value;
																	nfeCabecalhoController.formWasChanged = true;
																},
															),
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorDeducaoIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Deducao Issqn',
																labelText: 'Valor Deducao Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorDeducaoIssqn = nfeCabecalhoController.valorDeducaoIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.outrasRetencoesIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Outras Retencoes Issqn',
																labelText: 'Outras Retencoes Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.outrasRetencoesIssqn = nfeCabecalhoController.outrasRetencoesIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.descontoIncondicionadoIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Desconto Incondicionado Issqn',
																labelText: 'Desconto Incondicionado Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.descontoIncondicionadoIssqn = nfeCabecalhoController.descontoIncondicionadoIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.descontoCondicionadoIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Desconto Condicionado Issqn',
																labelText: 'Desconto Condicionado Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.descontoCondicionadoIssqn = nfeCabecalhoController.descontoCondicionadoIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.totalRetencaoIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Retencao Issqn',
																labelText: 'Total Retencao Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalRetencaoIssqn = nfeCabecalhoController.totalRetencaoIssqnController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.regimeEspecialTributacaoController,
															labelText: 'Regime Especial Tributacao',
															hintText: 'Informe os dados para o campo Regime Especial Tributacao',
															items: const ['0=Emissão de NF-e com aplicativo do contribuinte','1=Microempresa Municipal','2=Estimativa','3=Sociedade de Profissionais','4=Cooperativa','5=Microempresário Individual (MEI)','6=Microempresário e Empresa de Pequeno Porte'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.regimeEspecialTributacao = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorRetidoPisController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Retido Pis',
																labelText: 'Valor Retido Pis',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorRetidoPis = nfeCabecalhoController.valorRetidoPisController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorRetidoCofinsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Retido Cofins',
																labelText: 'Valor Retido Cofins',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorRetidoCofins = nfeCabecalhoController.valorRetidoCofinsController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorRetidoCsllController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Retido Csll',
																labelText: 'Valor Retido Csll',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorRetidoCsll = nfeCabecalhoController.valorRetidoCsllController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.baseCalculoIrrfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Irrf',
																labelText: 'Base Calculo Irrf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.baseCalculoIrrf = nfeCabecalhoController.baseCalculoIrrfController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorRetidoIrrfController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Retido Irrf',
																labelText: 'Valor Retido Irrf',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorRetidoIrrf = nfeCabecalhoController.valorRetidoIrrfController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.baseCalculoPrevidenciaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Previdencia',
																labelText: 'Base Calculo Previdencia',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.baseCalculoPrevidencia = nfeCabecalhoController.baseCalculoPrevidenciaController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															controller: nfeCabecalhoController.valorRetidoPrevidenciaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Retido Previdencia',
																labelText: 'Valor Retido Previdencia',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorRetidoPrevidencia = nfeCabecalhoController.valorRetidoPrevidenciaController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.informacoesAddFiscoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Informacoes Add Fisco',
																labelText: 'Informacoes Add Fisco',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.informacoesAddFisco = text;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.informacoesAddContribuinteController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Informacoes Add Contribuinte',
																labelText: 'Informacoes Add Contribuinte',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.informacoesAddContribuinte = text;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-2',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: CustomDropdownButton(
															controller: nfeCabecalhoController.comexUfEmbarqueController,
															labelText: 'Comex Uf Embarque',
															hintText: 'Informe os dados para o campo Comex Uf Embarque',
															items: ufList,
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.comexUfEmbarque = newValue;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-5',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 60,
															controller: nfeCabecalhoController.comexLocalEmbarqueController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Comex Local Embarque',
																labelText: 'Comex Local Embarque',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.comexLocalEmbarque = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-5',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 60,
															controller: nfeCabecalhoController.comexLocalDespachoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Comex Local Despacho',
																labelText: 'Comex Local Despacho',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.comexLocalDespacho = text;
																nfeCabecalhoController.formWasChanged = true;
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
													sizes: 'col-12 col-md-6',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 22,
															controller: nfeCabecalhoController.compraNotaEmpenhoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Compra Nota Empenho',
																labelText: 'Compra Nota Empenho',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.compraNotaEmpenho = text;
																nfeCabecalhoController.formWasChanged = true;
															},
														),
													),
												),
												BootstrapCol(
													sizes: 'col-12 col-md-6',
													child: Padding(
														padding: Util.distanceBetweenColumnsLineBreak(context)!,
														child: TextFormField(
															autofocus: true,
															maxLength: 60,
															controller: nfeCabecalhoController.compraPedidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Compra Pedido',
																labelText: 'Compra Pedido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.compraPedido = text;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.compraContratoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Compra Contrato',
																labelText: 'Compra Contrato',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.compraContrato = text;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.qrcodeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Qrcode',
																labelText: 'Qrcode',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.qrcode = text;
																nfeCabecalhoController.formWasChanged = true;
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
															maxLength: 85,
															controller: nfeCabecalhoController.urlChaveController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Url Chave',
																labelText: 'Url Chave',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.urlChave = text;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.statusNotaController,
															labelText: 'Status Nota',
															hintText: 'Informe os dados para o campo Status Nota',
															items: const ['1-Salva','2-Validada','3-Assinada','4-Autorizada','5-Inutilizada','6-Cancelada'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.statusNota = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.indicadorIntermediarioController,
															labelText: 'Indicador Intermediario',
															hintText: 'Fill with the Indicador Intermediario',
															items: const ['0=Operação sem intermediador (em site ou plataforma própria)','1=Operação em site ou plataforma de terceiros (intermediadores/marketplace)'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.indicadorIntermediario = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.intermediadorCnpjController,
															decoration: inputDecoration(
																hintText: 'Fill with the Intermediador Cnpj',
																labelText: 'Intermediador Cnpj',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.intermediadorCnpj = text;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.tipoNotaDebitoController,
															labelText: 'Tipo Nota Debito',
															hintText: 'Informe os dados para o campo Tipo Nota Debito',
															items: const ['01=Transferência de créditos para Cooperativas','02=Anulação de Crédito por Saídas Imunes/Isentas','03=Débitos de notas fiscais não processadas na apuração','04=Multa e juros','05=Transferência de crédito de sucessão','06=Pagamento antecipado','07=Perda em estoque'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.tipoNotaDebito = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.tipoNotaCreditoController,
															labelText: 'Tipo Nota Credito',
															hintText: 'Informe os dados para o campo Tipo Nota Credito',
															items: const ['01=Multa e juros','02=Apropriação de crédito presumido de IBS sobre o saldo devedor na ZFM','03 = Retorno'],
															onChanged: (dynamic newValue) {
																nfeCabecalhoController.currentModel.tipoNotaCredito = newValue;
																nfeCabecalhoController.formWasChanged = true;
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
															controller: nfeCabecalhoController.intermediadorIdCadastroController,
															decoration: inputDecoration(
																hintText: 'Fill with the Intermediador Id Cadastro',
																labelText: 'Intermediador Id Cadastro',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.intermediadorIdCadastro = text;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.codigoMunicipioFgIbsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Municipio Fg Ibs',
																labelText: 'Codigo Municipio Fg Ibs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.codigoMunicipioFgIbs = int.tryParse(text);
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalQtdeTributadaMonoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Qtde Tributada Mono',
																labelText: 'Total Qtde Tributada Mono',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalQtdeTributadaMono = nfeCabecalhoController.totalQtdeTributadaMonoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalIcmsMonoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Icms Mono',
																labelText: 'Total Icms Mono',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalIcmsMono = nfeCabecalhoController.totalIcmsMonoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalQuantidadeMonoRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Quantidade Mono Retencao',
																labelText: 'Total Quantidade Mono Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalQuantidadeMonoRetencao = nfeCabecalhoController.totalQuantidadeMonoRetencaoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalIcmsMonoRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Icms Mono Retencao',
																labelText: 'Total Icms Mono Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalIcmsMonoRetencao = nfeCabecalhoController.totalIcmsMonoRetencaoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalQuantidadeMonoRetidaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Quantidade Mono Retida',
																labelText: 'Total Quantidade Mono Retida',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalQuantidadeMonoRetida = nfeCabecalhoController.totalQuantidadeMonoRetidaController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalIcmsMonoRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Icms Mono Retido',
																labelText: 'Total Icms Mono Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalIcmsMonoRetido = nfeCabecalhoController.totalIcmsMonoRetidoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalImpostoSeletivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Imposto Seletivo',
																labelText: 'Total Imposto Seletivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalImpostoSeletivo = nfeCabecalhoController.totalImpostoSeletivoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.totalBcIbsCbsController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Total Bc Ibs Cbs',
																labelText: 'Total Bc Ibs Cbs',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.totalBcIbsCbs = nfeCabecalhoController.totalBcIbsCbsController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.ibsUfTotalDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ibs Uf Total Diferimento',
																labelText: 'Ibs Uf Total Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.ibsUfTotalDiferimento = nfeCabecalhoController.ibsUfTotalDiferimentoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.ibsUfTotalDevTributosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ibs Uf Total Dev Tributos',
																labelText: 'Ibs Uf Total Dev Tributos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.ibsUfTotalDevTributos = nfeCabecalhoController.ibsUfTotalDevTributosController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.ibsUfValorTotalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ibs Uf Valor Total',
																labelText: 'Ibs Uf Valor Total',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.ibsUfValorTotal = nfeCabecalhoController.ibsUfValorTotalController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.ibsMunTotalDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ibs Mun Total Diferimento',
																labelText: 'Ibs Mun Total Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.ibsMunTotalDiferimento = nfeCabecalhoController.ibsMunTotalDiferimentoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.ibsMunTotalDevTributosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ibs Mun Total Dev Tributos',
																labelText: 'Ibs Mun Total Dev Tributos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.ibsMunTotalDevTributos = nfeCabecalhoController.ibsMunTotalDevTributosController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.ibsMunValorTotalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ibs Mun Valor Total',
																labelText: 'Ibs Mun Valor Total',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.ibsMunValorTotal = nfeCabecalhoController.ibsMunValorTotalController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.cbsTotalDiferimentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cbs Total Diferimento',
																labelText: 'Cbs Total Diferimento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.cbsTotalDiferimento = nfeCabecalhoController.cbsTotalDiferimentoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.cbsTotalDevTributosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cbs Total Dev Tributos',
																labelText: 'Cbs Total Dev Tributos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.cbsTotalDevTributos = nfeCabecalhoController.cbsTotalDevTributosController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.cbsValorTotalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cbs Valor Total',
																labelText: 'Cbs Valor Total',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.cbsValorTotal = nfeCabecalhoController.cbsValorTotalController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.cbsTotalCreditoPresumidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cbs Total Credito Presumido',
																labelText: 'Cbs Total Credito Presumido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.cbsTotalCreditoPresumido = nfeCabecalhoController.cbsTotalCreditoPresumidoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.cbsTotCrePreSuspensivoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cbs Tot Cre Pre Suspensivo',
																labelText: 'Cbs Tot Cre Pre Suspensivo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.cbsTotCrePreSuspensivo = nfeCabecalhoController.cbsTotCrePreSuspensivoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.monoIbsTotalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Mono Ibs Total',
																labelText: 'Mono Ibs Total',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.monoIbsTotal = nfeCabecalhoController.monoIbsTotalController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.monoCbsTotalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Mono Cbs Total',
																labelText: 'Mono Cbs Total',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.monoCbsTotal = nfeCabecalhoController.monoCbsTotalController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.monoIbsTotalRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Mono Ibs Total Retencao',
																labelText: 'Mono Ibs Total Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.monoIbsTotalRetencao = nfeCabecalhoController.monoIbsTotalRetencaoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.monoCbsTotalRetencaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Mono Cbs Total Retencao',
																labelText: 'Mono Cbs Total Retencao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.monoCbsTotalRetencao = nfeCabecalhoController.monoCbsTotalRetencaoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.monoIbsRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Mono Ibs Retido',
																labelText: 'Mono Ibs Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.monoIbsRetido = nfeCabecalhoController.monoIbsRetidoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.monoCbsRetidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Mono Cbs Retido',
																labelText: 'Mono Cbs Retido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.monoCbsRetido = nfeCabecalhoController.monoCbsRetidoController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
															keyboardType: TextInputType.number,
															autofocus: true,
															controller: nfeCabecalhoController.valorTotalNfeController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Total Nfe',
																labelText: 'Valor Total Nfe',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeCabecalhoController.currentModel.valorTotalNfe = nfeCabecalhoController.valorTotalNfeController.numberValue;
																nfeCabecalhoController.formWasChanged = true;
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
