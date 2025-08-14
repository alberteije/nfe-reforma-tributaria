import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_detalhe_imposto_issqn_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetalheImpostoIssqnEditPage extends StatelessWidget {
  NfeDetalheImpostoIssqnEditPage({Key? key}) : super(key: key);
  final nfeDetalheImpostoIssqnController = Get.find<NfeDetalheImpostoIssqnController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetalheImpostoIssqnController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetalheImpostoIssqnController.scrollController,
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
															controller: nfeDetalheImpostoIssqnController.baseCalculoIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Base Calculo Issqn',
																labelText: 'Base Calculo Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.baseCalculoIssqn = nfeDetalheImpostoIssqnController.baseCalculoIssqnController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.aliquotaIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Aliquota Issqn',
																labelText: 'Aliquota Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.aliquotaIssqn = nfeDetalheImpostoIssqnController.aliquotaIssqnController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.valorIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Issqn',
																labelText: 'Valor Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.valorIssqn = nfeDetalheImpostoIssqnController.valorIssqnController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.municipioIssqnController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Municipio Issqn',
																labelText: 'Municipio Issqn',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.municipioIssqn = int.tryParse(text);
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.itemListaServicosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Item Lista Servicos',
																labelText: 'Item Lista Servicos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.itemListaServicos = int.tryParse(text);
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.valorDeducaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Deducao',
																labelText: 'Valor Deducao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.valorDeducao = nfeDetalheImpostoIssqnController.valorDeducaoController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.valorOutrasRetencoesController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Outras Retencoes',
																labelText: 'Valor Outras Retencoes',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.valorOutrasRetencoes = nfeDetalheImpostoIssqnController.valorOutrasRetencoesController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.valorDescontoIncondicionadoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Desconto Incondicionado',
																labelText: 'Valor Desconto Incondicionado',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.valorDescontoIncondicionado = nfeDetalheImpostoIssqnController.valorDescontoIncondicionadoController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.valorDescontoCondicionadoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Desconto Condicionado',
																labelText: 'Valor Desconto Condicionado',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.valorDescontoCondicionado = nfeDetalheImpostoIssqnController.valorDescontoCondicionadoController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.valorRetencaoIssController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Valor Retencao Iss',
																labelText: 'Valor Retencao Iss',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.valorRetencaoIss = nfeDetalheImpostoIssqnController.valorRetencaoIssController.numberValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.indicadorExigibilidadeIssController,
															labelText: 'Indicador Exigibilidade Iss',
															hintText: 'Informe os dados para o campo Indicador Exigibilidade Iss',
															items: const ['1=Exigível','2=Não incidência','3=Isenção','4=Exportação','5=Imunidade','6=Exigibilidade Suspensa por Decisão Judicial','7=Exigibilidade Suspensa por Processo Administrativo'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.indicadorExigibilidadeIss = newValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.codigoServicoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Servico',
																labelText: 'Codigo Servico',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.codigoServico = text;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.municipioIncidenciaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Municipio Incidencia',
																labelText: 'Municipio Incidencia',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.municipioIncidencia = int.tryParse(text);
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.paisSevicoPrestadoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Pais Sevico Prestado',
																labelText: 'Pais Sevico Prestado',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.paisSevicoPrestado = int.tryParse(text);
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															maxLength: 30,
															controller: nfeDetalheImpostoIssqnController.numeroProcessoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Processo',
																labelText: 'Numero Processo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.numeroProcesso = text;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
															controller: nfeDetalheImpostoIssqnController.indicadorIncentivoFiscalController,
															labelText: 'Indicador Incentivo Fiscal',
															hintText: 'Informe os dados para o campo Indicador Incentivo Fiscal',
															items: const ['1=Sim','2=Não'],
															onChanged: (dynamic newValue) {
																nfeDetalheImpostoIssqnController.nfeDetalheImpostoIssqnModel.indicadorIncentivoFiscal = newValue;
																nfeDetalheImpostoIssqnController.formWasChangedDetail = true;
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
