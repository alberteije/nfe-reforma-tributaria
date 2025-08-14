import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_fatura_controller.dart';

class NfeFaturaTabPage extends StatelessWidget {
  NfeFaturaTabPage({Key? key}) : super(key: key);
  final nfeFaturaController = Get.find<NfeFaturaController>();

  @override
  Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
          nfeFaturaController.preventDataLoss();
        }
      },
      child: Scaffold(
        key: nfeFaturaController.nfeFaturaTabPageScaffoldKey,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: nfeFaturaController.tabController,
                  children: nfeFaturaController.tabPages(),
                ),
              ),
              ButtonsTabBar(
                controller: nfeFaturaController.tabController,
                onTap: nfeFaturaController.tabChange,
                height: 40,
                elevation: 2,
                borderWidth: 0,
                backgroundColor: Colors.blueGrey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: nfeFaturaController.tabItems,
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
