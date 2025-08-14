import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeCanaModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? safra;
  String? mesAnoReferencia;
  List<NfeCanaFornecimentoDiarioModel>? nfeCanaFornecimentoDiarioModelList;
  List<NfeCanaDeducoesSafraModel>? nfeCanaDeducoesSafraModelList;

  NfeCanaModel({
    this.id,
    this.idNfeCabecalho,
    this.safra,
    this.mesAnoReferencia,
    List<NfeCanaFornecimentoDiarioModel>? nfeCanaFornecimentoDiarioModelList,
    List<NfeCanaDeducoesSafraModel>? nfeCanaDeducoesSafraModelList,
  }) {
    this.nfeCanaFornecimentoDiarioModelList = nfeCanaFornecimentoDiarioModelList?.toList(growable: true) ?? [];
    this.nfeCanaDeducoesSafraModelList = nfeCanaDeducoesSafraModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'safra',
    'mes_ano_referencia',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Safra',
    'Mes Ano Referencia',
  ];

  NfeCanaModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    safra = jsonData['safra'];
    mesAnoReferencia = jsonData['mesAnoReferencia'];
    nfeCanaFornecimentoDiarioModelList = (jsonData['nfeCanaFornecimentoDiarioModelList'] as Iterable?)?.map((m) => NfeCanaFornecimentoDiarioModel.fromJson(m)).toList() ?? [];
    nfeCanaDeducoesSafraModelList = (jsonData['nfeCanaDeducoesSafraModelList'] as Iterable?)?.map((m) => NfeCanaDeducoesSafraModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['safra'] = safra;
    jsonData['mesAnoReferencia'] = mesAnoReferencia;

		var nfeCanaFornecimentoDiarioModelLocalList = [];
		for (NfeCanaFornecimentoDiarioModel object in nfeCanaFornecimentoDiarioModelList ?? []) {
			nfeCanaFornecimentoDiarioModelLocalList.add(object.toJson);
		}
		jsonData['nfeCanaFornecimentoDiarioModelList'] = nfeCanaFornecimentoDiarioModelLocalList;

		var nfeCanaDeducoesSafraModelLocalList = [];
		for (NfeCanaDeducoesSafraModel object in nfeCanaDeducoesSafraModelList ?? []) {
			nfeCanaDeducoesSafraModelLocalList.add(object.toJson);
		}
		jsonData['nfeCanaDeducoesSafraModelList'] = nfeCanaDeducoesSafraModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeCanaModel fromPlutoRow(PlutoRow row) {
    return NfeCanaModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      safra: row.cells['safra']?.value,
      mesAnoReferencia: row.cells['mesAnoReferencia']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'safra': PlutoCell(value: safra ?? ''),
        'mesAnoReferencia': PlutoCell(value: mesAnoReferencia ?? ''),
      },
    );
  }

  NfeCanaModel clone() {
    return NfeCanaModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      safra: safra,
      mesAnoReferencia: mesAnoReferencia,
      nfeCanaFornecimentoDiarioModelList: nfeCanaFornecimentoDiarioModelListClone(nfeCanaFornecimentoDiarioModelList!),
      nfeCanaDeducoesSafraModelList: nfeCanaDeducoesSafraModelListClone(nfeCanaDeducoesSafraModelList!),
    );
  }

  nfeCanaFornecimentoDiarioModelListClone(List<NfeCanaFornecimentoDiarioModel> nfeCanaFornecimentoDiarioModelList) {
		List<NfeCanaFornecimentoDiarioModel> resultList = [];
		for (var nfeCanaFornecimentoDiarioModel in nfeCanaFornecimentoDiarioModelList) {
			resultList.add(nfeCanaFornecimentoDiarioModel.clone());
		}
		return resultList;
	}

  nfeCanaDeducoesSafraModelListClone(List<NfeCanaDeducoesSafraModel> nfeCanaDeducoesSafraModelList) {
		List<NfeCanaDeducoesSafraModel> resultList = [];
		for (var nfeCanaDeducoesSafraModel in nfeCanaDeducoesSafraModelList) {
			resultList.add(nfeCanaDeducoesSafraModel.clone());
		}
		return resultList;
	}

}