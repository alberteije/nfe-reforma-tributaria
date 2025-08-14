import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeTransporteVolumeModel extends ModelBase {
  int? id;
  int? idNfeTransporte;
  int? quantidade;
  String? especie;
  String? marca;
  String? numeracao;
  double? pesoLiquido;
  double? pesoBruto;
  List<NfeTransporteVolumeLacreModel>? nfeTransporteVolumeLacreModelList;

  NfeTransporteVolumeModel({
    this.id,
    this.idNfeTransporte,
    this.quantidade,
    this.especie,
    this.marca,
    this.numeracao,
    this.pesoLiquido,
    this.pesoBruto,
    List<NfeTransporteVolumeLacreModel>? nfeTransporteVolumeLacreModelList,
  }) {
    this.nfeTransporteVolumeLacreModelList = nfeTransporteVolumeLacreModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'quantidade',
    'especie',
    'marca',
    'numeracao',
    'peso_liquido',
    'peso_bruto',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Quantidade',
    'Especie',
    'Marca',
    'Numeracao',
    'Peso Liquido',
    'Peso Bruto',
  ];

  NfeTransporteVolumeModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeTransporte = jsonData['idNfeTransporte'];
    quantidade = jsonData['quantidade'];
    especie = jsonData['especie'];
    marca = jsonData['marca'];
    numeracao = jsonData['numeracao'];
    pesoLiquido = jsonData['pesoLiquido']?.toDouble();
    pesoBruto = jsonData['pesoBruto']?.toDouble();
    nfeTransporteVolumeLacreModelList = (jsonData['nfeTransporteVolumeLacreModelList'] as Iterable?)?.map((m) => NfeTransporteVolumeLacreModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeTransporte'] = idNfeTransporte != 0 ? idNfeTransporte : null;
    jsonData['quantidade'] = quantidade;
    jsonData['especie'] = especie;
    jsonData['marca'] = marca;
    jsonData['numeracao'] = numeracao;
    jsonData['pesoLiquido'] = pesoLiquido;
    jsonData['pesoBruto'] = pesoBruto;

		var nfeTransporteVolumeLacreModelLocalList = []; 
		for (NfeTransporteVolumeLacreModel object in nfeTransporteVolumeLacreModelList ?? []) { 
			nfeTransporteVolumeLacreModelLocalList.add(object.toJson); 
		}
		jsonData['nfeTransporteVolumeLacreModelList'] = nfeTransporteVolumeLacreModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeTransporteVolumeModel fromPlutoRow(PlutoRow row) {
    return NfeTransporteVolumeModel(
      id: row.cells['id']?.value,
      idNfeTransporte: row.cells['idNfeTransporte']?.value,
      quantidade: row.cells['quantidade']?.value,
      especie: row.cells['especie']?.value,
      marca: row.cells['marca']?.value,
      numeracao: row.cells['numeracao']?.value,
      pesoLiquido: row.cells['pesoLiquido']?.value,
      pesoBruto: row.cells['pesoBruto']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeTransporte': PlutoCell(value: idNfeTransporte ?? 0),
        'quantidade': PlutoCell(value: quantidade ?? 0),
        'especie': PlutoCell(value: especie ?? ''),
        'marca': PlutoCell(value: marca ?? ''),
        'numeracao': PlutoCell(value: numeracao ?? ''),
        'pesoLiquido': PlutoCell(value: pesoLiquido ?? 0.0),
        'pesoBruto': PlutoCell(value: pesoBruto ?? 0.0),
      },
    );
  }

  NfeTransporteVolumeModel clone() {
    return NfeTransporteVolumeModel(
      id: id,
      idNfeTransporte: idNfeTransporte,
      quantidade: quantidade,
      especie: especie,
      marca: marca,
      numeracao: numeracao,
      pesoLiquido: pesoLiquido,
      pesoBruto: pesoBruto,
      nfeTransporteVolumeLacreModelList: nfeTransporteVolumeLacreModelListClone(nfeTransporteVolumeLacreModelList!),
    );
  }

  nfeTransporteVolumeLacreModelListClone(List<NfeTransporteVolumeLacreModel> nfeTransporteVolumeLacreModelList) { 
		List<NfeTransporteVolumeLacreModel> resultList = [];
		for (var nfeTransporteVolumeLacreModel in nfeTransporteVolumeLacreModelList) {
			resultList.add(nfeTransporteVolumeLacreModel.clone());
		}
		return resultList;
	}


}