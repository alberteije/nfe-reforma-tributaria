import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:nfe/app/controller/nfe_cana_controller.dart';

class NfeCanaTabPage extends StatelessWidget {
  NfeCanaTabPage({Key? key}) : super(key: key);
  final nfeCanaController = Get.find<NfeCanaController>();

  @override
  Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
          nfeCanaController.preventDataLoss();
        }
      },
      child: Scaffold(
        key: nfeCanaController.nfeCanaTabPageScaffoldKey,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: nfeCanaController.tabController,
                  children: nfeCanaController.tabPages(),
                ),
              ),
              ButtonsTabBar(
                controller: nfeCanaController.tabController,
                onTap: nfeCanaController.tabChange,
                height: 40,
                elevation: 2,
                borderWidth: 0,
                backgroundColor: Colors.blueGrey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: nfeCanaController.tabItems,
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
