import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeLocalEntregaModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? cnpj;
  String? cpf;
  String? nomeRecebedor;
  String? logradouro;
  String? numero;
  String? complemento;
  String? bairro;
  int? codigoMunicipio;
  String? nomeMunicipio;
  String? uf;
  String? cep;
  int? codigoPais;
  String? nomePais;
  String? telefone;
  String? email;
  String? inscricaoEstadual;

  NfeLocalEntregaModel({
    this.id,
    this.idNfeCabecalho,
    this.cnpj,
    this.cpf,
    this.nomeRecebedor,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.codigoMunicipio,
    this.nomeMunicipio,
    this.uf = 'AC',
    this.cep,
    this.codigoPais,
    this.nomePais,
    this.telefone,
    this.email,
    this.inscricaoEstadual,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cnpj',
    'cpf',
    'nome_recebedor',
    'logradouro',
    'numero',
    'complemento',
    'bairro',
    'codigo_municipio',
    'nome_municipio',
    'uf',
    'cep',
    'codigo_pais',
    'nome_pais',
    'telefone',
    'email',
    'inscricao_estadual',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cnpj',
    'Cpf',
    'Nome Recebedor',
    'Logradouro',
    'Numero',
    'Complemento',
    'Bairro',
    'Codigo Municipio',
    'Nome Municipio',
    'Uf',
    'Cep',
    'Codigo Pais',
    'Nome Pais',
    'Telefone',
    'Email',
    'Inscricao Estadual',
  ];

  NfeLocalEntregaModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
    nomeRecebedor = jsonData['nomeRecebedor'];
    logradouro = jsonData['logradouro'];
    numero = jsonData['numero'];
    complemento = jsonData['complemento'];
    bairro = jsonData['bairro'];
    codigoMunicipio = jsonData['codigoMunicipio'];
    nomeMunicipio = jsonData['nomeMunicipio'];
    uf = NfeLocalEntregaDomain.getUf(jsonData['uf']);
    cep = jsonData['cep'];
    codigoPais = jsonData['codigoPais'];
    nomePais = jsonData['nomePais'];
    telefone = jsonData['telefone'];
    email = jsonData['email'];
    inscricaoEstadual = jsonData['inscricaoEstadual'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = Util.removeMask(cpf);
    jsonData['nomeRecebedor'] = nomeRecebedor;
    jsonData['logradouro'] = logradouro;
    jsonData['numero'] = numero;
    jsonData['complemento'] = complemento;
    jsonData['bairro'] = bairro;
    jsonData['codigoMunicipio'] = codigoMunicipio;
    jsonData['nomeMunicipio'] = nomeMunicipio;
    jsonData['uf'] = NfeLocalEntregaDomain.setUf(uf);
    jsonData['cep'] = Util.removeMask(cep);
    jsonData['codigoPais'] = codigoPais;
    jsonData['nomePais'] = nomePais;
    jsonData['telefone'] = telefone;
    jsonData['email'] = email;
    jsonData['inscricaoEstadual'] = inscricaoEstadual;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeLocalEntregaModel fromPlutoRow(PlutoRow row) {
    return NfeLocalEntregaModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
      nomeRecebedor: row.cells['nomeRecebedor']?.value,
      logradouro: row.cells['logradouro']?.value,
      numero: row.cells['numero']?.value,
      complemento: row.cells['complemento']?.value,
      bairro: row.cells['bairro']?.value,
      codigoMunicipio: row.cells['codigoMunicipio']?.value,
      nomeMunicipio: row.cells['nomeMunicipio']?.value,
      uf: row.cells['uf']?.value,
      cep: row.cells['cep']?.value,
      codigoPais: row.cells['codigoPais']?.value,
      nomePais: row.cells['nomePais']?.value,
      telefone: row.cells['telefone']?.value,
      email: row.cells['email']?.value,
      inscricaoEstadual: row.cells['inscricaoEstadual']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'cnpj': PlutoCell(value: cnpj ?? ''),
        'cpf': PlutoCell(value: cpf ?? ''),
        'nomeRecebedor': PlutoCell(value: nomeRecebedor ?? ''),
        'logradouro': PlutoCell(value: logradouro ?? ''),
        'numero': PlutoCell(value: numero ?? ''),
        'complemento': PlutoCell(value: complemento ?? ''),
        'bairro': PlutoCell(value: bairro ?? ''),
        'codigoMunicipio': PlutoCell(value: codigoMunicipio ?? 0),
        'nomeMunicipio': PlutoCell(value: nomeMunicipio ?? ''),
        'uf': PlutoCell(value: uf ?? ''),
        'cep': PlutoCell(value: cep ?? ''),
        'codigoPais': PlutoCell(value: codigoPais ?? 0),
        'nomePais': PlutoCell(value: nomePais ?? ''),
        'telefone': PlutoCell(value: telefone ?? ''),
        'email': PlutoCell(value: email ?? ''),
        'inscricaoEstadual': PlutoCell(value: inscricaoEstadual ?? ''),
      },
    );
  }

  NfeLocalEntregaModel clone() {
    return NfeLocalEntregaModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      cnpj: cnpj,
      cpf: cpf,
      nomeRecebedor: nomeRecebedor,
      logradouro: logradouro,
      numero: numero,
      complemento: complemento,
      bairro: bairro,
      codigoMunicipio: codigoMunicipio,
      nomeMunicipio: nomeMunicipio,
      uf: uf,
      cep: cep,
      codigoPais: codigoPais,
      nomePais: nomePais,
      telefone: telefone,
      email: email,
      inscricaoEstadual: inscricaoEstadual,
    );
  }

}