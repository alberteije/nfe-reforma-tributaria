import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/infra/util.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

List<PlutoColumn> nfeItemRastreadoGridColumns({bool isForLookup = false}) {
	return <PlutoColumn>[
		PlutoColumn(
			title: "Id",
			field: "id",
			type: PlutoColumnType.number(format: '##########',),
			enableFilterMenuItem: true,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.center,
			width: 100,
			hide: true,
		),
		PlutoColumn(
			title: "Numero Lote",
			field: "numeroLote",
			type: PlutoColumnType.text(),
			formatter: Util.stringFormat,
			enableFilterMenuItem: true,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.left,
			width: 200,
		),
		PlutoColumn(
			title: "Quantidade Itens",
			field: "quantidadeItens",
			type: PlutoColumnType.currency(format: '###,###.##', decimalDigits: 2, locale: Get.locale.toString(),),
			enableFilterMenuItem: true,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.right,
			width: 200,
		),
		PlutoColumn(
			title: "Data Fabricacao",
			field: "dataFabricacao",
			type: PlutoColumnType.date(format: "dd/MM/yyyy"),
			enableFilterMenuItem: true,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.center,
			width: 200,
			formatter: (value) {
				if (value is DateTime) {
					return DateFormat('dd/MM/yyyy').format(value);
				}
				return value?.toString() ?? '';
			},
		),
		PlutoColumn(
			title: "Data Validade",
			field: "dataValidade",
			type: PlutoColumnType.date(format: "dd/MM/yyyy"),
			enableFilterMenuItem: true,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.center,
			width: 200,
			formatter: (value) {
				if (value is DateTime) {
					return DateFormat('dd/MM/yyyy').format(value);
				}
				return value?.toString() ?? '';
			},
		),
		PlutoColumn(
			title: "Codigo Agregacao",
			field: "codigoAgregacao",
			type: PlutoColumnType.text(),
			formatter: Util.stringFormat,
			enableFilterMenuItem: true,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.left,
			width: 200,
		),
		PlutoColumn(
			title: "Id Temporário",
			field: "tempId",
			type: PlutoColumnType.text(),
			enableFilterMenuItem: false,
			enableSetColumnsMenuItem: false,
			enableHideColumnMenuItem: false,
			titleTextAlign: PlutoColumnTextAlign.center,
			textAlign: PlutoColumnTextAlign.center,
			width: 200,
			hide: true,
		),
		
	];
}
