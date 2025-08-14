import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_det_especifico_veiculo_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_widget/input/input_imports.dart';

class NfeDetEspecificoVeiculoEditPage extends StatelessWidget {
  NfeDetEspecificoVeiculoEditPage({Key? key}) : super(key: key);
  final nfeDetEspecificoVeiculoController = Get.find<NfeDetEspecificoVeiculoController>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        key: nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoScaffoldKey,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoFormKey,
            autovalidateMode: AutovalidateMode.always,
            child: Scrollbar(
              controller: nfeDetEspecificoVeiculoController.scrollController,
              child: SingleChildScrollView(
                controller: nfeDetEspecificoVeiculoController.scrollController,
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
															controller: nfeDetEspecificoVeiculoController.tipoOperacaoController,
															labelText: 'Tipo Operacao',
															hintText: 'Informe os dados para o campo Tipo Operacao',
															items: const ['1=Venda concessionária','2=Faturamento direto para consumidor final','3=Venda direta para grandes consumidores','0=Outros'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.tipoOperacao = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 17,
															controller: nfeDetEspecificoVeiculoController.chassiController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Chassi',
																labelText: 'Chassi',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.chassi = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeDetEspecificoVeiculoController.corController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cor',
																labelText: 'Cor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.cor = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.descricaoCorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Descricao Cor',
																labelText: 'Descricao Cor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.descricaoCor = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeDetEspecificoVeiculoController.potenciaMotorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Potencia Motor',
																labelText: 'Potencia Motor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.potenciaMotor = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeDetEspecificoVeiculoController.cilindradasController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Cilindradas',
																labelText: 'Cilindradas',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.cilindradas = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.pesoLiquidoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Peso Liquido',
																labelText: 'Peso Liquido',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.pesoLiquido = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.pesoBrutoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Peso Bruto',
																labelText: 'Peso Bruto',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.pesoBruto = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.numeroSerieController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Serie',
																labelText: 'Numero Serie',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.numeroSerie = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.tipoCombustivelController,
															labelText: 'Tipo Combustivel',
															hintText: 'Informe os dados para o campo Tipo Combustivel',
															items: const ['01=Álcool','02=Gasolina','03=Diesel','04=Gasogênio','05=Gás Metano','06=Elétrico/Fonte Interna','07=Elétrico/Fonte Externa','08=Gasolina/Gás Natural Combustível','09=Álcool/Gás Natural Combustível','10=Diesel/Gás Natural Combustível','11=Vide/Campo/Observação','12=Álcool/Gás Natural Veicular','13=Gasolina/Gás Natural Veicular','14=Diesel/Gás Natural Veicular','15=Gás Natural Veicular','16=Álcool/Gasolina','17=Gasolina/Álcool/Gás Natural Veicular','18=Gasolina/Elétrico'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.tipoCombustivel = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 21,
															controller: nfeDetEspecificoVeiculoController.numeroMotorController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Numero Motor',
																labelText: 'Numero Motor',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.numeroMotor = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.capacidadeMaximaTracaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Capacidade Maxima Tracao',
																labelText: 'Capacidade Maxima Tracao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.capacidadeMaximaTracao = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeDetEspecificoVeiculoController.distanciaEixosController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Distancia Eixos',
																labelText: 'Distancia Eixos',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.distanciaEixos = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeDetEspecificoVeiculoController.anoModeloController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ano Modelo',
																labelText: 'Ano Modelo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.anoModelo = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 4,
															controller: nfeDetEspecificoVeiculoController.anoFabricacaoController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Ano Fabricacao',
																labelText: 'Ano Fabricacao',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.anoFabricacao = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 1,
															controller: nfeDetEspecificoVeiculoController.tipoPinturaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Tipo Pintura',
																labelText: 'Tipo Pintura',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.tipoPintura = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.tipoVeiculoController,
															labelText: 'Tipo Veiculo',
															hintText: 'Informe os dados para o campo Tipo Veiculo',
															items: const ['02=CICLOMOTO','03=MOTONETA','04=MOTOCICLO','05=TRICICLO','06=AUTOMÓVEL','07=MICRO-ÔNIBUS','08=ÔNIBUS','10=REBOQUE','11=SEMIRREBOQUE','13=CAMIONETA','14=CAMINHÃO','17=CAMINHÃO TRATOR','18=TRATOR RODAS','19=TRATOR ESTEIRAS','20=TRATOR MISTO','21=QUADRICICLO','22=ESP / ÔNIBUS','23=CAMINHONETE','24=CARGA/CAM','25=UTILITÁRIO','26=MOTOR-CASA '],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.tipoVeiculo = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.especieVeiculoController,
															labelText: 'Especie Veiculo',
															hintText: 'Informe os dados para o campo Especie Veiculo',
															items: const ['1=PASSAGEIRO','2=CARGA','3=MISTO','4=CORRIDA','5=TRAÇÃO','6=ESPECIAL'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.especieVeiculo = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.condicaoVinController,
															labelText: 'Condicao Vin',
															hintText: 'Informe os dados para o campo Condicao Vin',
															items: const ['R=Remarcado','N=Normal'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.condicaoVin = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.condicaoVeiculoController,
															labelText: 'Condicao Veiculo',
															hintText: 'Informe os dados para o campo Condicao Veiculo',
															items: const ['1=Acabado','2=Inacabado','3=Semiacabado'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.condicaoVeiculo = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															maxLength: 6,
															controller: nfeDetEspecificoVeiculoController.codigoMarcaModeloController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Codigo Marca Modelo',
																labelText: 'Codigo Marca Modelo',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.codigoMarcaModelo = text;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.codigoCorDenatranController,
															labelText: 'Codigo Cor Denatran',
															hintText: 'Informe os dados para o campo Codigo Cor Denatran',
															items: const ['01=AMARELO','02=AZUL','03=BEGE','04=BRANCA','05=CINZA','06=DOURADA','07=GRENÁ','08=LARANJA','09=MARROM','10=PRATA','11=PRETA','12=ROSA','13=ROXA','14=VERDE','15=VERMELHA','16=FANTASIA'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.codigoCorDenatran = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.lotacaoMaximaController,
															decoration: inputDecoration(
																hintText: 'Informe os dados para o campo Lotacao Maxima',
																labelText: 'Lotacao Maxima',
																usePadding: true,
															),
															onSaved: (String? value) {},
															onChanged: (text) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.lotacaoMaxima = int.tryParse(text);
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
															controller: nfeDetEspecificoVeiculoController.restricaoController,
															labelText: 'Restricao',
															hintText: 'Informe os dados para o campo Restricao',
															items: const ['0=Não há','1=Alienação Fiduciária','2=Arrendamento Mercantil','3=Reserva de Domínio','4=Penhor de Veículos','9=Outras'],
															onChanged: (dynamic newValue) {
																nfeDetEspecificoVeiculoController.nfeDetEspecificoVeiculoModel.restricao = newValue;
																nfeDetEspecificoVeiculoController.formWasChangedDetail = true;
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
