import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class ProdutoSubgrupoModel extends ModelBase {
  int? id;
  int? idProdutoGrupo;
  String? nome;
  String? descricao;
  List<ProdutoModel>? produtoModelList;

  ProdutoSubgrupoModel({
    this.id,
    this.idProdutoGrupo,
    this.nome,
    this.descricao,
    List<ProdutoModel>? produtoModelList,
  }) {
    this.produtoModelList = produtoModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'nome',
    'descricao',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Nome',
    'Descricao',
  ];

  ProdutoSubgrupoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idProdutoGrupo = jsonData['idProdutoGrupo'];
    nome = jsonData['nome'];
    descricao = jsonData['descricao'];
    produtoModelList = (jsonData['produtoModelList'] as Iterable?)?.map((m) => ProdutoModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idProdutoGrupo'] = idProdutoGrupo != 0 ? idProdutoGrupo : null;
    jsonData['nome'] = nome;
    jsonData['descricao'] = descricao;
    
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

  static ProdutoSubgrupoModel fromPlutoRow(PlutoRow row) {
    return ProdutoSubgrupoModel(
      id: row.cells['id']?.value,
      idProdutoGrupo: row.cells['idProdutoGrupo']?.value,
      nome: row.cells['nome']?.value,
      descricao: row.cells['descricao']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idProdutoGrupo': PlutoCell(value: idProdutoGrupo ?? 0),
        'nome': PlutoCell(value: nome ?? ''),
        'descricao': PlutoCell(value: descricao ?? ''),
      },
    );
  }

  ProdutoSubgrupoModel clone() {
    return ProdutoSubgrupoModel(
      id: id,
      idProdutoGrupo: idProdutoGrupo,
      nome: nome,
      descricao: descricao,
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