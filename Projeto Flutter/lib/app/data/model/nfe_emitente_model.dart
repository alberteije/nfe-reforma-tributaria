import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeEmitenteModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? cnpj;
  String? cpf;
  String? nome;
  String? fantasia;
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
  String? inscricaoEstadual;
  String? inscricaoEstadualSt;
  String? inscricaoMunicipal;
  String? cnae;
  String? crt;

  NfeEmitenteModel({
    this.id,
    this.idNfeCabecalho,
    this.cnpj,
    this.cpf,
    this.nome,
    this.fantasia,
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
    this.inscricaoEstadual,
    this.inscricaoEstadualSt,
    this.inscricaoMunicipal,
    this.cnae,
    this.crt = '1=Simples Nacional',
  });

  static List<String> dbColumns = <String>[
    'id',
    'cnpj',
    'cpf',
    'nome',
    'fantasia',
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
    'inscricao_estadual',
    'inscricao_estadual_st',
    'inscricao_municipal',
    'cnae',
    'crt',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Cnpj',
    'Cpf',
    'Nome',
    'Fantasia',
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
    'Inscricao Estadual',
    'Inscricao Estadual St',
    'Inscricao Municipal',
    'Cnae',
    'Crt',
  ];

  NfeEmitenteModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    cnpj = jsonData['cnpj'];
    cpf = jsonData['cpf'];
    nome = jsonData['nome'];
    fantasia = jsonData['fantasia'];
    logradouro = jsonData['logradouro'];
    numero = jsonData['numero'];
    complemento = jsonData['complemento'];
    bairro = jsonData['bairro'];
    codigoMunicipio = jsonData['codigoMunicipio'];
    nomeMunicipio = jsonData['nomeMunicipio'];
    uf = NfeEmitenteDomain.getUf(jsonData['uf']);
    cep = jsonData['cep'];
    codigoPais = jsonData['codigoPais'];
    nomePais = jsonData['nomePais'];
    telefone = jsonData['telefone'];
    inscricaoEstadual = jsonData['inscricaoEstadual'];
    inscricaoEstadualSt = jsonData['inscricaoEstadualSt'];
    inscricaoMunicipal = jsonData['inscricaoMunicipal'];
    cnae = jsonData['cnae'];
    crt = NfeEmitenteDomain.getCrt(jsonData['crt']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['cnpj'] = Util.removeMask(cnpj);
    jsonData['cpf'] = Util.removeMask(cpf);
    jsonData['nome'] = nome;
    jsonData['fantasia'] = fantasia;
    jsonData['logradouro'] = logradouro;
    jsonData['numero'] = numero;
    jsonData['complemento'] = complemento;
    jsonData['bairro'] = bairro;
    jsonData['codigoMunicipio'] = codigoMunicipio;
    jsonData['nomeMunicipio'] = nomeMunicipio;
    jsonData['uf'] = NfeEmitenteDomain.setUf(uf);
    jsonData['cep'] = Util.removeMask(cep);
    jsonData['codigoPais'] = codigoPais;
    jsonData['nomePais'] = nomePais;
    jsonData['telefone'] = telefone;
    jsonData['inscricaoEstadual'] = inscricaoEstadual;
    jsonData['inscricaoEstadualSt'] = inscricaoEstadualSt;
    jsonData['inscricaoMunicipal'] = inscricaoMunicipal;
    jsonData['cnae'] = cnae;
    jsonData['crt'] = NfeEmitenteDomain.setCrt(crt);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeEmitenteModel fromPlutoRow(PlutoRow row) {
    return NfeEmitenteModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      cnpj: row.cells['cnpj']?.value,
      cpf: row.cells['cpf']?.value,
      nome: row.cells['nome']?.value,
      fantasia: row.cells['fantasia']?.value,
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
      inscricaoEstadual: row.cells['inscricaoEstadual']?.value,
      inscricaoEstadualSt: row.cells['inscricaoEstadualSt']?.value,
      inscricaoMunicipal: row.cells['inscricaoMunicipal']?.value,
      cnae: row.cells['cnae']?.value,
      crt: row.cells['crt']?.value,
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
        'nome': PlutoCell(value: nome ?? ''),
        'fantasia': PlutoCell(value: fantasia ?? ''),
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
        'inscricaoEstadual': PlutoCell(value: inscricaoEstadual ?? ''),
        'inscricaoEstadualSt': PlutoCell(value: inscricaoEstadualSt ?? ''),
        'inscricaoMunicipal': PlutoCell(value: inscricaoMunicipal ?? ''),
        'cnae': PlutoCell(value: cnae ?? ''),
        'crt': PlutoCell(value: crt ?? ''),
      },
    );
  }

  NfeEmitenteModel clone() {
    return NfeEmitenteModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      cnpj: cnpj,
      cpf: cpf,
      nome: nome,
      fantasia: fantasia,
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
      inscricaoEstadual: inscricaoEstadual,
      inscricaoEstadualSt: inscricaoEstadualSt,
      inscricaoMunicipal: inscricaoMunicipal,
      cnae: cnae,
      crt: crt,
    );
  }


}