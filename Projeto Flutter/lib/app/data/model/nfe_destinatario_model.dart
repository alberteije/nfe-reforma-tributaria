import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDestinatarioModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? cnpj;
  String? cpf;
  String? estrangeiroIdentificacao;
  String? nome;
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
  String? indicadorIe;
  String? inscricaoEstadual;
  int? suframa;
  String? inscricaoMunicipal;
  String? email;

  NfeDestinatarioModel({
    this.id,
    this.idNfeCabecalho,
    this.cnpj,
    this.cpf,
    this.estrangeiroIdentificacao,
    this.nome,
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
    this.indicadorIe = '1=Contribuinte ICMS (informar a IE do destinatário)',
    this.inscricaoEstadual,
    this.suframa,
    this.inscricaoMunicipal,
    this.email,
  });

  static List<String> dbColumns = <String>[
    'id',
    'cnpj',
    'cpf',
    'estrangeiro_identificacao',
    'nome',
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
    'indicador_ie',
    'inscricao_estadual',
    'suframa',
    'inscricao_municipal',
    'email',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cnpj',
    'Cpf',
    'Estrangeiro Identificacao',
    'Nome',
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
    'Indicador Ie',
    'Inscricao Estadual',
    'Suframa',
    'Inscricao Municipal',
    'Email',
  ];

  NfeDestinatarioModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
    estrangeiroIdentificacao = jsonData['estrangeiroIdentificacao'];
    nome = jsonData['nome'];
    logradouro = jsonData['logradouro'];
    numero = jsonData['numero'];
    complemento = jsonData['complemento'];
    bairro = jsonData['bairro'];
    codigoMunicipio = jsonData['codigoMunicipio'];
    nomeMunicipio = jsonData['nomeMunicipio'];
    uf = NfeDestinatarioDomain.getUf(jsonData['uf']);
    cep = jsonData['cep'];
    codigoPais = jsonData['codigoPais'];
    nomePais = jsonData['nomePais'];
    telefone = jsonData['telefone'];
    indicadorIe = NfeDestinatarioDomain.getIndicadorIe(jsonData['indicadorIe']);
    inscricaoEstadual = jsonData['inscricaoEstadual'];
    suframa = jsonData['suframa'];
    inscricaoMunicipal = jsonData['inscricaoMunicipal'];
    email = jsonData['email'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = Util.removeMask(cpf);
    jsonData['estrangeiroIdentificacao'] = estrangeiroIdentificacao;
    jsonData['nome'] = nome;
    jsonData['logradouro'] = logradouro;
    jsonData['numero'] = numero;
    jsonData['complemento'] = complemento;
    jsonData['bairro'] = bairro;
    jsonData['codigoMunicipio'] = codigoMunicipio;
    jsonData['nomeMunicipio'] = nomeMunicipio;
    jsonData['uf'] = NfeDestinatarioDomain.setUf(uf);
    jsonData['cep'] = Util.removeMask(cep);
    jsonData['codigoPais'] = codigoPais;
    jsonData['nomePais'] = nomePais;
    jsonData['telefone'] = telefone;
    jsonData['indicadorIe'] = NfeDestinatarioDomain.setIndicadorIe(indicadorIe);
    jsonData['inscricaoEstadual'] = inscricaoEstadual;
    jsonData['suframa'] = suframa;
    jsonData['inscricaoMunicipal'] = inscricaoMunicipal;
    jsonData['email'] = email;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDestinatarioModel fromPlutoRow(PlutoRow row) {
    return NfeDestinatarioModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
      estrangeiroIdentificacao: row.cells['estrangeiroIdentificacao']?.value,
      nome: row.cells['nome']?.value,
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
      indicadorIe: row.cells['indicadorIe']?.value,
      inscricaoEstadual: row.cells['inscricaoEstadual']?.value,
      suframa: row.cells['suframa']?.value,
      inscricaoMunicipal: row.cells['inscricaoMunicipal']?.value,
      email: row.cells['email']?.value,
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
        'estrangeiroIdentificacao': PlutoCell(value: estrangeiroIdentificacao ?? ''),
        'nome': PlutoCell(value: nome ?? ''),
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
        'indicadorIe': PlutoCell(value: indicadorIe ?? ''),
        'inscricaoEstadual': PlutoCell(value: inscricaoEstadual ?? ''),
        'suframa': PlutoCell(value: suframa ?? 0),
        'inscricaoMunicipal': PlutoCell(value: inscricaoMunicipal ?? ''),
        'email': PlutoCell(value: email ?? ''),
      },
    );
  }

  NfeDestinatarioModel clone() {
    return NfeDestinatarioModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      cnpj: cnpj,
      cpf: cpf,
      estrangeiroIdentificacao: estrangeiroIdentificacao,
      nome: nome,
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
      indicadorIe: indicadorIe,
      inscricaoEstadual: inscricaoEstadual,
      suframa: suframa,
      inscricaoMunicipal: inscricaoMunicipal,
      email: email,
    );
  }

}