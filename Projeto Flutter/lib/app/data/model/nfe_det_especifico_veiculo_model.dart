import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetEspecificoVeiculoModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  String? tipoOperacao;
  String? chassi;
  String? cor;
  String? descricaoCor;
  String? potenciaMotor;
  String? cilindradas;
  String? pesoLiquido;
  String? pesoBruto;
  String? numeroSerie;
  String? tipoCombustivel;
  String? numeroMotor;
  String? capacidadeMaximaTracao;
  String? distanciaEixos;
  String? anoModelo;
  String? anoFabricacao;
  String? tipoPintura;
  String? tipoVeiculo;
  String? especieVeiculo;
  String? condicaoVin;
  String? condicaoVeiculo;
  String? codigoMarcaModelo;
  String? codigoCorDenatran;
  int? lotacaoMaxima;
  String? restricao;

  NfeDetEspecificoVeiculoModel({
    this.id,
    this.idNfeDetalhe,
    this.tipoOperacao = '1=Venda concessionária',
    this.chassi,
    this.cor,
    this.descricaoCor,
    this.potenciaMotor,
    this.cilindradas,
    this.pesoLiquido,
    this.pesoBruto,
    this.numeroSerie,
    this.tipoCombustivel = '01=Álcool',
    this.numeroMotor,
    this.capacidadeMaximaTracao,
    this.distanciaEixos,
    this.anoModelo,
    this.anoFabricacao,
    this.tipoPintura,
    this.tipoVeiculo = '02=CICLOMOTO',
    this.especieVeiculo = '1=PASSAGEIRO',
    this.condicaoVin = 'R=Remarcado',
    this.condicaoVeiculo = '1=Acabado',
    this.codigoMarcaModelo,
    this.codigoCorDenatran = '01=AMARELO',
    this.lotacaoMaxima,
    this.restricao = '0=Não há',
  });

  static List<String> dbColumns = <String>[
    'id',
    'tipo_operacao',
    'chassi',
    'cor',
    'descricao_cor',
    'potencia_motor',
    'cilindradas',
    'peso_liquido',
    'peso_bruto',
    'numero_serie',
    'tipo_combustivel',
    'numero_motor',
    'capacidade_maxima_tracao',
    'distancia_eixos',
    'ano_modelo',
    'ano_fabricacao',
    'tipo_pintura',
    'tipo_veiculo',
    'especie_veiculo',
    'condicao_vin',
    'condicao_veiculo',
    'codigo_marca_modelo',
    'codigo_cor_denatran',
    'lotacao_maxima',
    'restricao',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Tipo Operacao',
    'Chassi',
    'Cor',
    'Descricao Cor',
    'Potencia Motor',
    'Cilindradas',
    'Peso Liquido',
    'Peso Bruto',
    'Numero Serie',
    'Tipo Combustivel',
    'Numero Motor',
    'Capacidade Maxima Tracao',
    'Distancia Eixos',
    'Ano Modelo',
    'Ano Fabricacao',
    'Tipo Pintura',
    'Tipo Veiculo',
    'Especie Veiculo',
    'Condicao Vin',
    'Condicao Veiculo',
    'Codigo Marca Modelo',
    'Codigo Cor Denatran',
    'Lotacao Maxima',
    'Restricao',
  ];

  NfeDetEspecificoVeiculoModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    tipoOperacao = NfeDetEspecificoVeiculoDomain.getTipoOperacao(jsonData['tipoOperacao']);
    chassi = jsonData['chassi'];
    cor = jsonData['cor'];
    descricaoCor = jsonData['descricaoCor'];
    potenciaMotor = jsonData['potenciaMotor'];
    cilindradas = jsonData['cilindradas'];
    pesoLiquido = jsonData['pesoLiquido'];
    pesoBruto = jsonData['pesoBruto'];
    numeroSerie = jsonData['numeroSerie'];
    tipoCombustivel = NfeDetEspecificoVeiculoDomain.getTipoCombustivel(jsonData['tipoCombustivel']);
    numeroMotor = jsonData['numeroMotor'];
    capacidadeMaximaTracao = jsonData['capacidadeMaximaTracao'];
    distanciaEixos = jsonData['distanciaEixos'];
    anoModelo = jsonData['anoModelo'];
    anoFabricacao = jsonData['anoFabricacao'];
    tipoPintura = jsonData['tipoPintura'];
    tipoVeiculo = NfeDetEspecificoVeiculoDomain.getTipoVeiculo(jsonData['tipoVeiculo']);
    especieVeiculo = NfeDetEspecificoVeiculoDomain.getEspecieVeiculo(jsonData['especieVeiculo']);
    condicaoVin = NfeDetEspecificoVeiculoDomain.getCondicaoVin(jsonData['condicaoVin']);
    condicaoVeiculo = NfeDetEspecificoVeiculoDomain.getCondicaoVeiculo(jsonData['condicaoVeiculo']);
    codigoMarcaModelo = jsonData['codigoMarcaModelo'];
    codigoCorDenatran = NfeDetEspecificoVeiculoDomain.getCodigoCorDenatran(jsonData['codigoCorDenatran']);
    lotacaoMaxima = jsonData['lotacaoMaxima'];
    restricao = NfeDetEspecificoVeiculoDomain.getRestricao(jsonData['restricao']);
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['tipoOperacao'] = NfeDetEspecificoVeiculoDomain.setTipoOperacao(tipoOperacao);
    jsonData['chassi'] = chassi;
    jsonData['cor'] = cor;
    jsonData['descricaoCor'] = descricaoCor;
    jsonData['potenciaMotor'] = potenciaMotor;
    jsonData['cilindradas'] = cilindradas;
    jsonData['pesoLiquido'] = pesoLiquido;
    jsonData['pesoBruto'] = pesoBruto;
    jsonData['numeroSerie'] = numeroSerie;
    jsonData['tipoCombustivel'] = NfeDetEspecificoVeiculoDomain.setTipoCombustivel(tipoCombustivel);
    jsonData['numeroMotor'] = numeroMotor;
    jsonData['capacidadeMaximaTracao'] = capacidadeMaximaTracao;
    jsonData['distanciaEixos'] = distanciaEixos;
    jsonData['anoModelo'] = anoModelo;
    jsonData['anoFabricacao'] = anoFabricacao;
    jsonData['tipoPintura'] = tipoPintura;
    jsonData['tipoVeiculo'] = NfeDetEspecificoVeiculoDomain.setTipoVeiculo(tipoVeiculo);
    jsonData['especieVeiculo'] = NfeDetEspecificoVeiculoDomain.setEspecieVeiculo(especieVeiculo);
    jsonData['condicaoVin'] = NfeDetEspecificoVeiculoDomain.setCondicaoVin(condicaoVin);
    jsonData['condicaoVeiculo'] = NfeDetEspecificoVeiculoDomain.setCondicaoVeiculo(condicaoVeiculo);
    jsonData['codigoMarcaModelo'] = codigoMarcaModelo;
    jsonData['codigoCorDenatran'] = NfeDetEspecificoVeiculoDomain.setCodigoCorDenatran(codigoCorDenatran);
    jsonData['lotacaoMaxima'] = lotacaoMaxima;
    jsonData['restricao'] = NfeDetEspecificoVeiculoDomain.setRestricao(restricao);

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetEspecificoVeiculoModel fromPlutoRow(PlutoRow row) {
    return NfeDetEspecificoVeiculoModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      tipoOperacao: row.cells['tipoOperacao']?.value,
      chassi: row.cells['chassi']?.value,
      cor: row.cells['cor']?.value,
      descricaoCor: row.cells['descricaoCor']?.value,
      potenciaMotor: row.cells['potenciaMotor']?.value,
      cilindradas: row.cells['cilindradas']?.value,
      pesoLiquido: row.cells['pesoLiquido']?.value,
      pesoBruto: row.cells['pesoBruto']?.value,
      numeroSerie: row.cells['numeroSerie']?.value,
      tipoCombustivel: row.cells['tipoCombustivel']?.value,
      numeroMotor: row.cells['numeroMotor']?.value,
      capacidadeMaximaTracao: row.cells['capacidadeMaximaTracao']?.value,
      distanciaEixos: row.cells['distanciaEixos']?.value,
      anoModelo: row.cells['anoModelo']?.value,
      anoFabricacao: row.cells['anoFabricacao']?.value,
      tipoPintura: row.cells['tipoPintura']?.value,
      tipoVeiculo: row.cells['tipoVeiculo']?.value,
      especieVeiculo: row.cells['especieVeiculo']?.value,
      condicaoVin: row.cells['condicaoVin']?.value,
      condicaoVeiculo: row.cells['condicaoVeiculo']?.value,
      codigoMarcaModelo: row.cells['codigoMarcaModelo']?.value,
      codigoCorDenatran: row.cells['codigoCorDenatran']?.value,
      lotacaoMaxima: row.cells['lotacaoMaxima']?.value,
      restricao: row.cells['restricao']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'tipoOperacao': PlutoCell(value: tipoOperacao ?? ''),
        'chassi': PlutoCell(value: chassi ?? ''),
        'cor': PlutoCell(value: cor ?? ''),
        'descricaoCor': PlutoCell(value: descricaoCor ?? ''),
        'potenciaMotor': PlutoCell(value: potenciaMotor ?? ''),
        'cilindradas': PlutoCell(value: cilindradas ?? ''),
        'pesoLiquido': PlutoCell(value: pesoLiquido ?? ''),
        'pesoBruto': PlutoCell(value: pesoBruto ?? ''),
        'numeroSerie': PlutoCell(value: numeroSerie ?? ''),
        'tipoCombustivel': PlutoCell(value: tipoCombustivel ?? ''),
        'numeroMotor': PlutoCell(value: numeroMotor ?? ''),
        'capacidadeMaximaTracao': PlutoCell(value: capacidadeMaximaTracao ?? ''),
        'distanciaEixos': PlutoCell(value: distanciaEixos ?? ''),
        'anoModelo': PlutoCell(value: anoModelo ?? ''),
        'anoFabricacao': PlutoCell(value: anoFabricacao ?? ''),
        'tipoPintura': PlutoCell(value: tipoPintura ?? ''),
        'tipoVeiculo': PlutoCell(value: tipoVeiculo ?? ''),
        'especieVeiculo': PlutoCell(value: especieVeiculo ?? ''),
        'condicaoVin': PlutoCell(value: condicaoVin ?? ''),
        'condicaoVeiculo': PlutoCell(value: condicaoVeiculo ?? ''),
        'codigoMarcaModelo': PlutoCell(value: codigoMarcaModelo ?? ''),
        'codigoCorDenatran': PlutoCell(value: codigoCorDenatran ?? ''),
        'lotacaoMaxima': PlutoCell(value: lotacaoMaxima ?? 0),
        'restricao': PlutoCell(value: restricao ?? ''),
      },
    );
  }

  NfeDetEspecificoVeiculoModel clone() {
    return NfeDetEspecificoVeiculoModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      tipoOperacao: tipoOperacao,
      chassi: chassi,
      cor: cor,
      descricaoCor: descricaoCor,
      potenciaMotor: potenciaMotor,
      cilindradas: cilindradas,
      pesoLiquido: pesoLiquido,
      pesoBruto: pesoBruto,
      numeroSerie: numeroSerie,
      tipoCombustivel: tipoCombustivel,
      numeroMotor: numeroMotor,
      capacidadeMaximaTracao: capacidadeMaximaTracao,
      distanciaEixos: distanciaEixos,
      anoModelo: anoModelo,
      anoFabricacao: anoFabricacao,
      tipoPintura: tipoPintura,
      tipoVeiculo: tipoVeiculo,
      especieVeiculo: especieVeiculo,
      condicaoVin: condicaoVin,
      condicaoVeiculo: condicaoVeiculo,
      codigoMarcaModelo: codigoMarcaModelo,
      codigoCorDenatran: codigoCorDenatran,
      lotacaoMaxima: lotacaoMaxima,
      restricao: restricao,
    );
  }

}