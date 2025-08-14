import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class ViewPessoaTransportadoraModel extends ModelBase {
  int? id;
  String? nome;
  String? tipo;
  String? email;
  String? site;
  String? cpfCnpj;
  String? rgIe;
  DateTime? dataCadastro;
  String? observacao;
  int? idPessoa;

  ViewPessoaTransportadoraModel({
    this.id,
    this.nome,
    this.tipo,
    this.email,
    this.site,
    this.cpfCnpj,
    this.rgIe,
    this.dataCadastro,
    this.observacao,
    this.idPessoa,
  });

  static List<String> dbColumns = <String>[
    'id',
    'nome',
    'tipo',
    'email',
    'site',
    'cpf_cnpj',
    'rg_ie',
    'data_cadastro',
    'observacao',
    'id_pessoa',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Nome',
    'Tipo',
    'Email',
    'Site',
    'Cpf Cnpj',
    'Rg Ie',
    'Data Cadastro',
    'Observacao',
    'Id Pessoa',
  ];

  ViewPessoaTransportadoraModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    nome = jsonData['nome'];
    tipo = jsonData['tipo'];
    email = jsonData['email'];
    site = jsonData['site'];
    cpfCnpj = jsonData['cpfCnpj'];
    rgIe = jsonData['rgIe'];
    dataCadastro = jsonData['dataCadastro'] != null ? DateTime.tryParse(jsonData['dataCadastro']) : null;
    observacao = jsonData['observacao'];
    idPessoa = jsonData['idPessoa'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['nome'] = nome;
    jsonData['tipo'] = tipo;
    jsonData['email'] = email;
    jsonData['site'] = site;
    jsonData['cpfCnpj'] = Util.removeMask(cpfCnpj);
    jsonData['rgIe'] = rgIe;
    jsonData['dataCadastro'] = dataCadastro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataCadastro!) : null;
    jsonData['observacao'] = observacao;
    jsonData['idPessoa'] = idPessoa;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static ViewPessoaTransportadoraModel fromPlutoRow(PlutoRow row) {
    return ViewPessoaTransportadoraModel(
      id: row.cells['id']?.value,
      nome: row.cells['nome']?.value,
      tipo: row.cells['tipo']?.value,
      email: row.cells['email']?.value,
      site: row.cells['site']?.value,
      cpfCnpj: row.cells['cpfCnpj']?.value,
      rgIe: row.cells['rgIe']?.value,
      dataCadastro: Util.stringToDate(row.cells['dataCadastro']?.value),
      observacao: row.cells['observacao']?.value,
      idPessoa: row.cells['idPessoa']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'nome': PlutoCell(value: nome ?? ''),
        'tipo': PlutoCell(value: tipo ?? ''),
        'email': PlutoCell(value: email ?? ''),
        'site': PlutoCell(value: site ?? ''),
        'cpfCnpj': PlutoCell(value: cpfCnpj ?? ''),
        'rgIe': PlutoCell(value: rgIe ?? ''),
        'dataCadastro': PlutoCell(value: dataCadastro),
        'observacao': PlutoCell(value: observacao ?? ''),
        'idPessoa': PlutoCell(value: idPessoa ?? 0),
      },
    );
  }

  ViewPessoaTransportadoraModel clone() {
    return ViewPessoaTransportadoraModel(
      id: id,
      nome: nome,
      tipo: tipo,
      email: email,
      site: site,
      cpfCnpj: cpfCnpj,
      rgIe: rgIe,
      dataCadastro: dataCadastro,
      observacao: observacao,
      idPessoa: idPessoa,
    );
  }


}