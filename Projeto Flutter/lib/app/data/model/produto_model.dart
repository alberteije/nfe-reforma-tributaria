import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class ProdutoModel extends ModelBase {
  int? id;
  int? idProdutoSubgrupo;
  int? idProdutoMarca;
  int? idProdutoUnidade;
  int? idTributIcmsCustomCab;
  int? idTributGrupoTributario;
  String? nome;
  String? descricao;
  String? gtin;
  String? codigoInterno;
  double? valorCompra;
  double? valorVenda;
  String? codigoNcm;
  double? estoqueMinimo;
  double? estoqueMaximo;
  double? quantidadeEstoque;
  DateTime? dataCadastro;

  ProdutoModel({
    this.id,
    this.idProdutoSubgrupo,
    this.idProdutoMarca,
    this.idProdutoUnidade,
    this.idTributIcmsCustomCab,
    this.idTributGrupoTributario,
    this.nome,
    this.descricao,
    this.gtin,
    this.codigoInterno,
    this.valorCompra,
    this.valorVenda,
    this.codigoNcm,
    this.estoqueMinimo,
    this.estoqueMaximo,
    this.quantidadeEstoque,
    this.dataCadastro,
  });

  static List<String> dbColumns = <String>[
    'id',
    'id_tribut_icms_custom_cab',
    'id_tribut_grupo_tributario',
    'nome',
    'descricao',
    'gtin',
    'codigo_interno',
    'valor_compra',
    'valor_venda',
    'codigo_ncm',
    'estoque_minimo',
    'estoque_maximo',
    'quantidade_estoque',
    'data_cadastro',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Id Tribut Icms Custom Cab',
    'Id Tribut Grupo Tributario',
    'Nome',
    'Descricao',
    'Gtin',
    'Codigo Interno',
    'Valor Compra',
    'Valor Venda',
    'Codigo Ncm',
    'Estoque Minimo',
    'Estoque Maximo',
    'Quantidade Estoque',
    'Data Cadastro',
  ];

  ProdutoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idProdutoSubgrupo = jsonData['idProdutoSubgrupo'];
    idProdutoMarca = jsonData['idProdutoMarca'];
    idProdutoUnidade = jsonData['idProdutoUnidade'];
    idTributIcmsCustomCab = jsonData['idTributIcmsCustomCab'];
    idTributGrupoTributario = jsonData['idTributGrupoTributario'];
    nome = jsonData['nome'];
    descricao = jsonData['descricao'];
    gtin = jsonData['gtin'];
    codigoInterno = jsonData['codigoInterno'];
    valorCompra = jsonData['valorCompra']?.toDouble();
    valorVenda = jsonData['valorVenda']?.toDouble();
    codigoNcm = jsonData['codigoNcm'];
    estoqueMinimo = jsonData['estoqueMinimo']?.toDouble();
    estoqueMaximo = jsonData['estoqueMaximo']?.toDouble();
    quantidadeEstoque = jsonData['quantidadeEstoque']?.toDouble();
    dataCadastro = jsonData['dataCadastro'] != null ? DateTime.tryParse(jsonData['dataCadastro']) : null;
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idProdutoSubgrupo'] = idProdutoSubgrupo != 0 ? idProdutoSubgrupo : null;
    jsonData['idProdutoMarca'] = idProdutoMarca != 0 ? idProdutoMarca : null;
    jsonData['idProdutoUnidade'] = idProdutoUnidade != 0 ? idProdutoUnidade : null;
    jsonData['idTributIcmsCustomCab'] = idTributIcmsCustomCab;
    jsonData['idTributGrupoTributario'] = idTributGrupoTributario;
    jsonData['nome'] = nome;
    jsonData['descricao'] = descricao;
    jsonData['gtin'] = gtin;
    jsonData['codigoInterno'] = codigoInterno;
    jsonData['valorCompra'] = valorCompra;
    jsonData['valorVenda'] = valorVenda;
    jsonData['codigoNcm'] = codigoNcm;
    jsonData['estoqueMinimo'] = estoqueMinimo;
    jsonData['estoqueMaximo'] = estoqueMaximo;
    jsonData['quantidadeEstoque'] = quantidadeEstoque;
    jsonData['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static ProdutoModel fromPlutoRow(PlutoRow row) {
    return ProdutoModel(
      id: row.cells['id']?.value,
      idProdutoSubgrupo: row.cells['idProdutoSubgrupo']?.value,
      idProdutoMarca: row.cells['idProdutoMarca']?.value,
      idProdutoUnidade: row.cells['idProdutoUnidade']?.value,
      idTributIcmsCustomCab: row.cells['idTributIcmsCustomCab']?.value,
      idTributGrupoTributario: row.cells['idTributGrupoTributario']?.value,
      nome: row.cells['nome']?.value,
      descricao: row.cells['descricao']?.value,
      gtin: row.cells['gtin']?.value,
      codigoInterno: row.cells['codigoInterno']?.value,
      valorCompra: row.cells['valorCompra']?.value,
      valorVenda: row.cells['valorVenda']?.value,
      codigoNcm: row.cells['codigoNcm']?.value,
      estoqueMinimo: row.cells['estoqueMinimo']?.value,
      estoqueMaximo: row.cells['estoqueMaximo']?.value,
      quantidadeEstoque: row.cells['quantidadeEstoque']?.value,
      dataCadastro: Util.stringToDate(row.cells['dataCadastro']?.value),
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idProdutoSubgrupo': PlutoCell(value: idProdutoSubgrupo ?? 0),
        'idProdutoMarca': PlutoCell(value: idProdutoMarca ?? 0),
        'idProdutoUnidade': PlutoCell(value: idProdutoUnidade ?? 0),
        'idTributIcmsCustomCab': PlutoCell(value: idTributIcmsCustomCab ?? 0),
        'idTributGrupoTributario': PlutoCell(value: idTributGrupoTributario ?? 0),
        'nome': PlutoCell(value: nome ?? ''),
        'descricao': PlutoCell(value: descricao ?? ''),
        'gtin': PlutoCell(value: gtin ?? ''),
        'codigoInterno': PlutoCell(value: codigoInterno ?? ''),
        'valorCompra': PlutoCell(value: valorCompra ?? 0.0),
        'valorVenda': PlutoCell(value: valorVenda ?? 0.0),
        'codigoNcm': PlutoCell(value: codigoNcm ?? ''),
        'estoqueMinimo': PlutoCell(value: estoqueMinimo ?? 0.0),
        'estoqueMaximo': PlutoCell(value: estoqueMaximo ?? 0.0),
        'quantidadeEstoque': PlutoCell(value: quantidadeEstoque ?? 0.0),
        'dataCadastro': PlutoCell(value: dataCadastro),
      },
    );
  }

  ProdutoModel clone() {
    return ProdutoModel(
      id: id,
      idProdutoSubgrupo: idProdutoSubgrupo,
      idProdutoMarca: idProdutoMarca,
      idProdutoUnidade: idProdutoUnidade,
      idTributIcmsCustomCab: idTributIcmsCustomCab,
      idTributGrupoTributario: idTributGrupoTributario,
      nome: nome,
      descricao: descricao,
      gtin: gtin,
      codigoInterno: codigoInterno,
      valorCompra: valorCompra,
      valorVenda: valorVenda,
      codigoNcm: codigoNcm,
      estoqueMinimo: estoqueMinimo,
      estoqueMaximo: estoqueMaximo,
      quantidadeEstoque: quantidadeEstoque,
      dataCadastro: dataCadastro,
    );
  }

}