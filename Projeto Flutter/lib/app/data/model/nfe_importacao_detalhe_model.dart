import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';


class NfeImportacaoDetalheModel extends ModelBase {
  int? id;
  int? idNfeDeclaracaoImportacao;
  int? numeroAdicao;
  int? numeroSequencial;
  String? codigoFabricanteEstrangeiro;
  double? valorDesconto;
  String? drawback;
  NfeDeclaracaoImportacaoModel? nfeDeclaracaoImportacaoModel;

  NfeImportacaoDetalheModel({
    this.id,
    this.idNfeDeclaracaoImportacao,
    this.numeroAdicao,
    this.numeroSequencial,
    this.codigoFabricanteEstrangeiro,
    this.valorDesconto,
    this.drawback,
    NfeDeclaracaoImportacaoModel? nfeDeclaracaoImportacaoModel,
  }) {
    this.nfeDeclaracaoImportacaoModel = nfeDeclaracaoImportacaoModel ?? NfeDeclaracaoImportacaoModel();
  }

  static List<String> dbColumns = <String>[
    'id',
    'numero_adicao',
    'numero_sequencial',
    'codigo_fabricante_estrangeiro',
    'valor_desconto',
    'drawback',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero Adicao',
    'Numero Sequencial',
    'Codigo Fabricante Estrangeiro',
    'Valor Desconto',
    'Drawback',
  ];

  NfeImportacaoDetalheModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDeclaracaoImportacao = jsonData['idNfeDeclaracaoImportacao'];
    numeroAdicao = jsonData['numeroAdicao'];
    numeroSequencial = jsonData['numeroSequencial'];
    codigoFabricanteEstrangeiro = jsonData['codigoFabricanteEstrangeiro'];
    valorDesconto = jsonData['valorDesconto']?.toDouble();
    drawback = jsonData['drawback'];
    nfeDeclaracaoImportacaoModel = jsonData['nfeDeclaracaoImportacaoModel'] == null ? NfeDeclaracaoImportacaoModel() : NfeDeclaracaoImportacaoModel.fromJson(jsonData['nfeDeclaracaoImportacaoModel']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDeclaracaoImportacao'] = idNfeDeclaracaoImportacao != 0 ? idNfeDeclaracaoImportacao : null;
    jsonData['numeroAdicao'] = numeroAdicao;
    jsonData['numeroSequencial'] = numeroSequencial;
    jsonData['codigoFabricanteEstrangeiro'] = codigoFabricanteEstrangeiro;
    jsonData['valorDesconto'] = valorDesconto;
    jsonData['drawback'] = drawback;
    jsonData['nfeDeclaracaoImportacaoModel'] = nfeDeclaracaoImportacaoModel?.toJson;
    jsonData['nfeDeclaracaoImportacao'] = nfeDeclaracaoImportacaoModel?.numeroDocumento ?? '';

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeImportacaoDetalheModel fromPlutoRow(PlutoRow row) {
    return NfeImportacaoDetalheModel(
      id: row.cells['id']?.value,
      idNfeDeclaracaoImportacao: row.cells['idNfeDeclaracaoImportacao']?.value,
      numeroAdicao: row.cells['numeroAdicao']?.value,
      numeroSequencial: row.cells['numeroSequencial']?.value,
      codigoFabricanteEstrangeiro: row.cells['codigoFabricanteEstrangeiro']?.value,
      valorDesconto: row.cells['valorDesconto']?.value,
      drawback: row.cells['drawback']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDeclaracaoImportacao': PlutoCell(value: idNfeDeclaracaoImportacao ?? 0),
        'numeroAdicao': PlutoCell(value: numeroAdicao ?? 0),
        'numeroSequencial': PlutoCell(value: numeroSequencial ?? 0),
        'codigoFabricanteEstrangeiro': PlutoCell(value: codigoFabricanteEstrangeiro ?? ''),
        'valorDesconto': PlutoCell(value: valorDesconto ?? 0.0),
        'drawback': PlutoCell(value: drawback ?? ''),
        'nfeDeclaracaoImportacao': PlutoCell(value: nfeDeclaracaoImportacaoModel?.numeroDocumento ?? ''),
      },
    );
  }

  NfeImportacaoDetalheModel clone() {
    return NfeImportacaoDetalheModel(
      id: id,
      idNfeDeclaracaoImportacao: idNfeDeclaracaoImportacao,
      numeroAdicao: numeroAdicao,
      numeroSequencial: numeroSequencial,
      codigoFabricanteEstrangeiro: codigoFabricanteEstrangeiro,
      valorDesconto: valorDesconto,
      drawback: drawback,
      nfeDeclaracaoImportacaoModel: nfeDeclaracaoImportacaoModel?.clone(),
    );
  }

}