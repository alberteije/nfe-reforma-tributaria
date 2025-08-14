import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/controller/nfe_importacao_detalhe_controller.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/page/shared_page/list_page_base.dart';
import 'package:nfe/app/page/shared_widget/shared_widget_imports.dart';

class NfeImportacaoDetalheListPage extends ListPageBase<NfeImportacaoDetalheController> {
  const NfeImportacaoDetalheListPage({Key? key}) : super(key: key);

  @override
  List<Map<String, dynamic>> get mobileItems => controller.mobileItems;

  @override
  Map<String, dynamic> get mobileConfig => controller.mobileConfig;

  @override
  String get standardFieldForFilter => controller.standardFieldForFilter;

  @override
  Widget buildMobileView() {
    return buildDesktopView();
  }

  @override
  Widget buildDesktopView() {
    final additionalContentTop = buildAdditionalContentTop();
    final additionalContentBottom = buildAdditionalContentBottom();

    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Scaffold(
        appBar: appBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.canInsert ? controller.prepareForInsert : controller.noPrivilegeMessage,
          child: iconButtonInsert(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black26,
          shape: const CircularNotchedRectangle(),
          child: Row(children: [
            ...standardBottomActions(),
            ...?additionalBottomActions(),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              if (additionalContentTop != null) additionalContentTop,
              Expanded(
                child: PlutoGrid(
                  configuration: gridConfiguration(),
                  noRowsWidget: controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : Text('grid_no_rows'.tr),
                  createFooter: (stateManager) {
                    stateManager.setPageSize(Constants.gridRowsPerPage, notify: false);
                    return PlutoPagination(stateManager);
                  },
                  columns: controller.gridColumns,
                  rows: controller.plutoRows(),
                  onLoaded: (event) {
                    controller.plutoGridStateManager = event.stateManager;
                    controller.plutoGridStateManager.setSelectingMode(PlutoGridSelectingMode.row);
                    controller.keyboardListener = controller.plutoGridStateManager.keyManager!.subject.stream.listen(controller.handleKeyboard);
                    controller.loadData();
                  },
                  mode: PlutoGridMode.selectWithOneTap,
                ),
              ),
              if (additionalContentBottom != null) additionalContentBottom,
            ],
          ),
        ),
      ),
    );
  }

}