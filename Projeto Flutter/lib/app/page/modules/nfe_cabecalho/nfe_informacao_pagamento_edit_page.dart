import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';
import 'package:nfe/app/controller/nfe_informacao_pagamento_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeInformacaoPagamentoEditPage extends StatelessWidget {
	NfeInformacaoPagamentoEditPage({Key? key}) : super(key: key);
	final nfeInformacaoPagamentoController = Get.find<NfeInformacaoPagamentoController>();

	@override
	Widget build(BuildContext context) {
			return Scaffold(
				key: nfeInformacaoPagamentoController.nfeInformacaoPagamentoScaffoldKey,	
				appBar: AppBar(
					automaticallyImplyLeading: false,
					title: Text('${ nfeInformacaoPagamentoController.screenTitle } - ${ nfeInformacaoPagamentoController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
						saveButton(onPressed: nfeInformacaoPagamentoController.save),
						cancelAndExitButton(onPressed: nfeInformacaoPagamentoController.preventDataLoss),
					]
				),
				body: SafeArea(
					top: false,
					bottom: false,
					child: Form(
						key: nfeInformacaoPagamentoController.nfeInformacaoPagamentoFormKey,
						autovalidateMode: AutovalidateMode.always,
						child: Scrollbar(
							controller: nfeInformacaoPagamentoController.scrollController,
							child: SingleChildScrollView(
								controller: nfeInformacaoPagamentoController.scrollController,
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
														child: CustomDropdownButton(
															controller: nfeInformacaoPagamentoController.indicadorPagamentoController,
															labelText: 'Indicador Pagamento',
															hintText: 'Informe os dados para o campo Indicador Pagamento',
															items: const ['0= Pagamento à Vista','1= Pagamento à Prazo'],
															onChanged: (dynamic newValue) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.indicadorPagamento = newValue;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.meioPagamentoController,
															labelText: 'Meio Pagamento',
															hintText: 'Informe os dados para o campo Meio Pagamento',
															items: const ['01=Dinheiro','02=Cheque','03=Cartão de Crédito','04=Cartão de Débito','05=Crédito Loja','10=Vale Alimentação','11=Vale Refeição','12=Vale Presente','13=Vale Combustível','15=Boleto Bancário','16=Depósito Bancário','17=Pagamento Instantâneo (PIX)','18=Transferência bancária - Carteira Digital','19=Programa de fidelidade - Cashback - Crédito Virtual','90=Sem pagamento','99=Outros'],
															onChanged: (dynamic newValue) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.meioPagamento = newValue;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.valorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor',
																labelText: 'Valor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.valor = nfeInformacaoPagamentoController.valorController.numberValue;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.tipoIntegracaoController,
															labelText: 'Tipo Integracao',
															hintText: 'Informe os dados para o campo Tipo Integracao',
															items: const ['1=Pagamento integrado','2=Pagamento não integrado'],
															onChanged: (dynamic newValue) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.tipoIntegracao = newValue;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.cnpjOperadoraCartaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj Operadora Cartao',
																labelText: 'Cnpj Operadora Cartao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.cnpjOperadoraCartao = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.bandeiraController,
															labelText: 'Bandeira',
															hintText: 'Informe os dados para o campo Bandeira',
															items: const ['01=Visa','02=Mastercard','03=American Express','04=Sorocred','05=Diners Club','06=Elo','07=Hipercard','08=Aura','09=Cabal','99=Outros'],
															onChanged: (dynamic newValue) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.bandeira = newValue;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															maxLength: 128,
															controller: nfeInformacaoPagamentoController.numeroAutorizacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Autorizacao',
																labelText: 'Numero Autorizacao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.numeroAutorizacao = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.trocoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Troco',
																labelText: 'Troco',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.troco = nfeInformacaoPagamentoController.trocoController.numberValue;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.descricaoQuandoOutrosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Descricao Quando Outros',
																labelText: 'Descricao Quando Outros',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.descricaoQuandoOutros = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
																hintText: 'Informe os dados para o campo Data Pagamento',
																labelText: 'Data Pagamento',
																usePadding: true,
															),
															isEmpty: false,
															child: DatePickerItem(
																controller: nfeInformacaoPagamentoController.dataPagamentoController,
																firstDate: DateTime.parse('1000-01-01'),
																lastDate: DateTime.parse('5000-01-01'),
																onChanged: (DateTime? value) {
																	nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.dataPagamento = value;
																	nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															maxLength: 14,
															controller: nfeInformacaoPagamentoController.cnpjTransacionalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj Transacional',
																labelText: 'Cnpj Transacional',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.cnpjTransacional = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.ufCnpjTransacionalController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Uf Cnpj Transacional',
																labelText: 'Uf Cnpj Transacional',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.ufCnpjTransacional = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															controller: nfeInformacaoPagamentoController.cnpjBeneficiarioController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cnpj Beneficiario',
																labelText: 'Cnpj Beneficiario',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.cnpjBeneficiario = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
															maxLength: 40,
															controller: nfeInformacaoPagamentoController.idTerminalPagamentoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Id Terminal Pagamento',
																labelText: 'Id Terminal Pagamento',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeInformacaoPagamentoController.nfeInformacaoPagamentoModel.idTerminalPagamento = text;
																nfeInformacaoPagamentoController.formWasChangedDetail = true;
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
