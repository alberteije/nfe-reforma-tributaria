import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class ProdutoUnidadeModel extends ModelBase {
  int? id;
  String? sigla;
  String? descricao;
  String? podeFracionar;
  List<ProdutoModel>? produtoModelList;

  ProdutoUnidadeModel({
    this.id,
    this.sigla,
    this.descricao,
    this.podeFracionar = 'Sim',
    List<ProdutoModel>? produtoModelList,
  }) {
    this.produtoModelList = produtoModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'sigla',
    'descricao',
    'pode_fracionar',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Sigla',
    'Descricao',
    'Pode Fracionar',
  ];

  ProdutoUnidadeModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    sigla = jsonData['sigla'];
    descricao = jsonData['descricao'];
    podeFracionar = ProdutoUnidadeDomain.getPodeFracionar(jsonData['podeFracionar']);
    produtoModelList = (jsonData['produtoModelList'] as Iterable?)?.map((m) => ProdutoModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['sigla'] = sigla;
    jsonData['descricao'] = descricao;
    jsonData['podeFracionar'] = ProdutoUnidadeDomain.setPodeFracionar(podeFracionar);
    
		var produtoModelLocalList = []; 
		for (ProdutoModel object in produtoModelList ?? []) { 
			produtoModelLocalList.add(object.toJson); 
		}
		jsonData['produtoModelList'] = produtoModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static ProdutoUnidadeModel fromPlutoRow(PlutoRow row) {
    return ProdutoUnidadeModel(
      id: row.cells['id']?.value,
      sigla: row.cells['sigla']?.value,
      descricao: row.cells['descricao']?.value,
      podeFracionar: row.cells['podeFracionar']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'sigla': PlutoCell(value: sigla ?? ''),
        'descricao': PlutoCell(value: descricao ?? ''),
        'podeFracionar': PlutoCell(value: podeFracionar ?? ''),
      },
    );
  }

  ProdutoUnidadeModel clone() {
    return ProdutoUnidadeModel(
      id: id,
      sigla: sigla,
      descricao: descricao,
      podeFracionar: podeFracionar,
      produtoModelList: produtoModelListClone(produtoModelList!),
    );
  }

  produtoModelListClone(List<ProdutoModel> produtoModelList) { 
		List<ProdutoModel> resultList = [];
		for (var produtoModel in produtoModelList) {
			resultList.add(produtoModel.clone());
		}
		return resultList;
	}


}