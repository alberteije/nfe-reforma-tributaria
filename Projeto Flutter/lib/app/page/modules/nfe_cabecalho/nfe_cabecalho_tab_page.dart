import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_cabecalho_controller.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';

class NfeCabecalhoTabPage extends StatelessWidget {
  NfeCabecalhoTabPage({Key? key}) : super(key: key);
  final nfeCabecalhoController = Get.find<NfeCabecalhoController>();

  @override
  Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
          nfeCabecalhoController.preventDataLoss();
        }
      },
      child: Scaffold(
        key: nfeCabecalhoController.nfeCabecalhoTabPageScaffoldKey,
        appBar: AppBar(
					automaticallyImplyLeading: false, 
					title: Text('${ nfeCabecalhoController.screenTitle } - ${ nfeCabecalhoController.isNewRecord ? 'inserting'.tr : 'editing'.tr }',),
					actions: [
            IconButton(
              tooltip: 'Gerar e Transmitir NF-e',
              icon: const Icon(Icons.upload),
              color: Colors.yellow,
              onPressed: nfeCabecalhoController.gerarETransmitirNota,
            ),
            IconButton(
              tooltip: 'Imprimir DANFE',
              icon: const Icon(Icons.print_outlined),
              color: Colors.yellow,
              onPressed: nfeCabecalhoController.imprimirDanfe,
            ),
            const SizedBox(width: 10,),
            IconButton(
              tooltip: 'Importar XML',
              icon: const Icon(Icons.download),
              color: Colors.lightGreenAccent,
              onPressed: nfeCabecalhoController.importXml,
            ),
            IconButton(
              tooltip: 'Itens da Nota',
              icon: const Icon(Icons.integration_instructions),
              color: Colors.amber,
              onPressed: nfeCabecalhoController.callNfeDetalhePage,
            ),
            const SizedBox(width: 10,),
						saveButton(onPressed: nfeCabecalhoController.save),
						cancelAndExitButton(onPressed: nfeCabecalhoController.preventDataLoss),
					]
				),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: nfeCabecalhoController.tabController,
                  children: nfeCabecalhoController.tabPages(),
                ),
              ),
              ButtonsTabBar(
                controller: nfeCabecalhoController.tabController,
                onTap: nfeCabecalhoController.tabChange,
                height: 40,
                elevation: 2,
                borderWidth: 0,
                backgroundColor: Colors.blueGrey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: nfeCabecalhoController.tabItems,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
