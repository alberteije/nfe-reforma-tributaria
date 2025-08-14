import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeFaturaModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? numero;
  double? valorOriginal;
  double? valorDesconto;
  double? valorLiquido;
  List<NfeDuplicataModel>? nfeDuplicataModelList;

  NfeFaturaModel({
    this.id,
    this.idNfeCabecalho,
    this.numero,
    this.valorOriginal,
    this.valorDesconto,
    this.valorLiquido,
    List<NfeDuplicataModel>? nfeDuplicataModelList,
  }) {
    this.nfeDuplicataModelList = nfeDuplicataModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'numero',
    'valor_original',
    'valor_desconto',
    'valor_liquido',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero',
    'Valor Original',
    'Valor Desconto',
    'Valor Liquido',
  ];

  NfeFaturaModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    numero = jsonData['numero'];
    valorOriginal = jsonData['valorOriginal']?.toDouble();
    valorDesconto = jsonData['valorDesconto']?.toDouble();
    valorLiquido = jsonData['valorLiquido']?.toDouble();
    nfeDuplicataModelList = (jsonData['nfeDuplicataModelList'] as Iterable?)?.map((m) => NfeDuplicataModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['numero'] = numero;
    jsonData['valorOriginal'] = valorOriginal;
    jsonData['valorDesconto'] = valorDesconto;
    jsonData['valorLiquido'] = valorLiquido;

		var nfeDuplicataModelLocalList = []; 
		for (NfeDuplicataModel object in nfeDuplicataModelList ?? []) { 
			nfeDuplicataModelLocalList.add(object.toJson); 
		}
		jsonData['nfeDuplicataModelList'] = nfeDuplicataModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeFaturaModel fromPlutoRow(PlutoRow row) {
    return NfeFaturaModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      numero: row.cells['numero']?.value,
      valorOriginal: row.cells['valorOriginal']?.value,
      valorDesconto: row.cells['valorDesconto']?.value,
      valorLiquido: row.cells['valorLiquido']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'numero': PlutoCell(value: numero ?? ''),
        'valorOriginal': PlutoCell(value: valorOriginal ?? 0.0),
        'valorDesconto': PlutoCell(value: valorDesconto ?? 0.0),
        'valorLiquido': PlutoCell(value: valorLiquido ?? 0.0),
      },
    );
  }

  NfeFaturaModel clone() {
    return NfeFaturaModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      numero: numero,
      valorOriginal: valorOriginal,
      valorDesconto: valorDesconto,
      valorLiquido: valorLiquido,
      nfeDuplicataModelList: nfeDuplicataModelListClone(nfeDuplicataModelList!),
    );
  }

  nfeDuplicataModelListClone(List<NfeDuplicataModel> nfeDuplicataModelList) { 
		List<NfeDuplicataModel> resultList = [];
		for (var nfeDuplicataModel in nfeDuplicataModelList) {
			resultList.add(nfeDuplicataModel.clone());
		}
		return resultList;
	}


}