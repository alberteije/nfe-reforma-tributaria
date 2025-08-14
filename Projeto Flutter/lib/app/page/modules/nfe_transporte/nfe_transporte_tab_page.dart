import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_transporte_controller.dart';

class NfeTransporteTabPage extends StatelessWidget {
  NfeTransporteTabPage({Key? key}) : super(key: key);
  final nfeTransporteController = Get.find<NfeTransporteController>();

  @override
  Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
          nfeTransporteController.preventDataLoss();
        }
      },
      child: Scaffold(
        key: nfeTransporteController.nfeTransporteTabPageScaffoldKey,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: nfeTransporteController.tabController,
                  children: nfeTransporteController.tabPages(),
                ),
              ),
              ButtonsTabBar(
                controller: nfeTransporteController.tabController,
                onTap: nfeTransporteController.tabChange,
                height: 40,
                elevation: 2,
                borderWidth: 0,
                backgroundColor: Colors.blueGrey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: nfeTransporteController.tabItems,
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
