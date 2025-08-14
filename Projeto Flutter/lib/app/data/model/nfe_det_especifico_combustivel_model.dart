import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeDetEspecificoCombustivelModel extends ModelBase {
  int? id;
  int? idNfeDetalhe;
  int? codigoAnp;
  String? descricaoAnp;
  double? percentualGlp;
  double? percentualGasNacional;
  double? percentualGasImportado;
  double? valorPartida;
  String? codif;
  double? quantidadeTempAmbiente;
  String? ufConsumo;
  double? cideBaseCalculo;
  double? cideAliquota;
  double? cideValor;
  int? encerranteBico;
  int? encerranteBomba;
  int? encerranteTanque;
  double? encerranteValorInicio;
  double? encerranteValorFim;
  double? percentualMisturaBiodiesel;
  List<NfeDetCombustivelOrigemModel>? nfeDetCombustivelOrigemModelList;

  NfeDetEspecificoCombustivelModel({
    this.id,
    this.idNfeDetalhe,
    this.codigoAnp,
    this.descricaoAnp,
    this.percentualGlp,
    this.percentualGasNacional,
    this.percentualGasImportado,
    this.valorPartida,
    this.codif,
    this.quantidadeTempAmbiente,
    this.ufConsumo = 'AC',
    this.cideBaseCalculo,
    this.cideAliquota,
    this.cideValor,
    this.encerranteBico,
    this.encerranteBomba,
    this.encerranteTanque,
    this.encerranteValorInicio,
    this.encerranteValorFim,
    this.percentualMisturaBiodiesel,
    List<NfeDetCombustivelOrigemModel>? nfeDetCombustivelOrigemModelList,
  }) {
    this.nfeDetCombustivelOrigemModelList = nfeDetCombustivelOrigemModelList?.toList(growable: true) ?? [];
  }

  static List<String> dbColumns = <String>[
    'id',
    'codigo_anp',
    'descricao_anp',
    'percentual_glp',
    'percentual_gas_nacional',
    'percentual_gas_importado',
    'valor_partida',
    'codif',
    'quantidade_temp_ambiente',
    'uf_consumo',
    'cide_base_calculo',
    'cide_aliquota',
    'cide_valor',
    'encerrante_bico',
    'encerrante_bomba',
    'encerrante_tanque',
    'encerrante_valor_inicio',
    'encerrante_valor_fim',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Codigo Anp',
    'Descricao Anp',
    'Percentual Glp',
    'Percentual Gas Nacional',
    'Percentual Gas Importado',
    'Valor Partida',
    'Codif',
    'Quantidade Temp Ambiente',
    'Uf Consumo',
    'Cide Base Calculo',
    'Cide Aliquota',
    'Cide Valor',
    'Encerrante Bico',
    'Encerrante Bomba',
    'Encerrante Tanque',
    'Encerrante Valor Inicio',
    'Encerrante Valor Fim',
  ];

  NfeDetEspecificoCombustivelModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeDetalhe = jsonData['idNfeDetalhe'];
    codigoAnp = jsonData['codigoAnp'];
    descricaoAnp = jsonData['descricaoAnp'];
    percentualGlp = jsonData['percentualGlp']?.toDouble();
    percentualGasNacional = jsonData['percentualGasNacional']?.toDouble();
    percentualGasImportado = jsonData['percentualGasImportado']?.toDouble();
    valorPartida = jsonData['valorPartida']?.toDouble();
    codif = jsonData['codif'];
    quantidadeTempAmbiente = jsonData['quantidadeTempAmbiente']?.toDouble();
    ufConsumo = NfeDetEspecificoCombustivelDomain.getUfConsumo(jsonData['ufConsumo']);
    cideBaseCalculo = jsonData['cideBaseCalculo']?.toDouble();
    cideAliquota = jsonData['cideAliquota']?.toDouble();
    cideValor = jsonData['cideValor']?.toDouble();
    encerranteBico = jsonData['encerranteBico'];
    encerranteBomba = jsonData['encerranteBomba'];
    encerranteTanque = jsonData['encerranteTanque'];
    encerranteValorInicio = jsonData['encerranteValorInicio']?.toDouble();
    encerranteValorFim = jsonData['encerranteValorFim']?.toDouble();
    percentualMisturaBiodiesel = jsonData['percentualMisturaBiodiesel']?.toDouble();
    nfeDetCombustivelOrigemModelList = (jsonData['nfeDetCombustivelOrigemModelList'] as Iterable?)?.map((m) => NfeDetCombustivelOrigemModel.fromJson(m)).toList() ?? [];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeDetalhe'] = idNfeDetalhe != 0 ? idNfeDetalhe : null;
    jsonData['codigoAnp'] = codigoAnp;
    jsonData['descricaoAnp'] = descricaoAnp;
    jsonData['percentualGlp'] = percentualGlp;
    jsonData['percentualGasNacional'] = percentualGasNacional;
    jsonData['percentualGasImportado'] = percentualGasImportado;
    jsonData['valorPartida'] = valorPartida;
    jsonData['codif'] = codif;
    jsonData['quantidadeTempAmbiente'] = quantidadeTempAmbiente;
    jsonData['ufConsumo'] = NfeDetEspecificoCombustivelDomain.setUfConsumo(ufConsumo);
    jsonData['cideBaseCalculo'] = cideBaseCalculo;
    jsonData['cideAliquota'] = cideAliquota;
    jsonData['cideValor'] = cideValor;
    jsonData['encerranteBico'] = encerranteBico;
    jsonData['encerranteBomba'] = encerranteBomba;
    jsonData['encerranteTanque'] = encerranteTanque;
    jsonData['encerranteValorInicio'] = encerranteValorInicio;
    jsonData['encerranteValorFim'] = encerranteValorFim;
    jsonData['percentualMisturaBiodiesel'] = percentualMisturaBiodiesel;

		var nfeDetCombustivelOrigemModelLocalList = []; 
		for (NfeDetCombustivelOrigemModel object in nfeDetCombustivelOrigemModelList ?? []) { 
			nfeDetCombustivelOrigemModelLocalList.add(object.toJson); 
		}
		jsonData['nfeDetCombustivelOrigemModelList'] = nfeDetCombustivelOrigemModelLocalList;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeDetEspecificoCombustivelModel fromPlutoRow(PlutoRow row) {
    return NfeDetEspecificoCombustivelModel(
      id: row.cells['id']?.value,
      idNfeDetalhe: row.cells['idNfeDetalhe']?.value,
      codigoAnp: row.cells['codigoAnp']?.value,
      descricaoAnp: row.cells['descricaoAnp']?.value,
      percentualGlp: row.cells['percentualGlp']?.value,
      percentualGasNacional: row.cells['percentualGasNacional']?.value,
      percentualGasImportado: row.cells['percentualGasImportado']?.value,
      valorPartida: row.cells['valorPartida']?.value,
      codif: row.cells['codif']?.value,
      quantidadeTempAmbiente: row.cells['quantidadeTempAmbiente']?.value,
      ufConsumo: row.cells['ufConsumo']?.value,
      cideBaseCalculo: row.cells['cideBaseCalculo']?.value,
      cideAliquota: row.cells['cideAliquota']?.value,
      cideValor: row.cells['cideValor']?.value,
      encerranteBico: row.cells['encerranteBico']?.value,
      encerranteBomba: row.cells['encerranteBomba']?.value,
      encerranteTanque: row.cells['encerranteTanque']?.value,
      encerranteValorInicio: row.cells['encerranteValorInicio']?.value,
      encerranteValorFim: row.cells['encerranteValorFim']?.value,
      percentualMisturaBiodiesel: row.cells['percentualMisturaBiodiesel']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeDetalhe': PlutoCell(value: idNfeDetalhe ?? 0),
        'codigoAnp': PlutoCell(value: codigoAnp ?? 0),
        'descricaoAnp': PlutoCell(value: descricaoAnp ?? ''),
        'percentualGlp': PlutoCell(value: percentualGlp ?? 0.0),
        'percentualGasNacional': PlutoCell(value: percentualGasNacional ?? 0.0),
        'percentualGasImportado': PlutoCell(value: percentualGasImportado ?? 0.0),
        'valorPartida': PlutoCell(value: valorPartida ?? 0.0),
        'codif': PlutoCell(value: codif ?? ''),
        'quantidadeTempAmbiente': PlutoCell(value: quantidadeTempAmbiente ?? 0.0),
        'ufConsumo': PlutoCell(value: ufConsumo ?? ''),
        'cideBaseCalculo': PlutoCell(value: cideBaseCalculo ?? 0.0),
        'cideAliquota': PlutoCell(value: cideAliquota ?? 0.0),
        'cideValor': PlutoCell(value: cideValor ?? 0.0),
        'encerranteBico': PlutoCell(value: encerranteBico ?? 0),
        'encerranteBomba': PlutoCell(value: encerranteBomba ?? 0),
        'encerranteTanque': PlutoCell(value: encerranteTanque ?? 0),
        'encerranteValorInicio': PlutoCell(value: encerranteValorInicio ?? 0.0),
        'encerranteValorFim': PlutoCell(value: encerranteValorFim ?? 0.0),
        'percentualMisturaBiodiesel': PlutoCell(value: percentualMisturaBiodiesel ?? 0.0),
      },
    );
  }

  NfeDetEspecificoCombustivelModel clone() {
    return NfeDetEspecificoCombustivelModel(
      id: id,
      idNfeDetalhe: idNfeDetalhe,
      codigoAnp: codigoAnp,
      descricaoAnp: descricaoAnp,
      percentualGlp: percentualGlp,
      percentualGasNacional: percentualGasNacional,
      percentualGasImportado: percentualGasImportado,
      valorPartida: valorPartida,
      codif: codif,
      quantidadeTempAmbiente: quantidadeTempAmbiente,
      ufConsumo: ufConsumo,
      cideBaseCalculo: cideBaseCalculo,
      cideAliquota: cideAliquota,
      cideValor: cideValor,
      encerranteBico: encerranteBico,
      encerranteBomba: encerranteBomba,
      encerranteTanque: encerranteTanque,
      encerranteValorInicio: encerranteValorInicio,
      encerranteValorFim: encerranteValorFim,
      percentualMisturaBiodiesel: percentualMisturaBiodiesel,
      nfeDetCombustivelOrigemModelList: nfeDetCombustivelOrigemModelListClone(nfeDetCombustivelOrigemModelList!),
    );
  }

  nfeDetCombustivelOrigemModelListClone(List<NfeDetCombustivelOrigemModel> nfeDetCombustivelOrigemModelList) { 
		List<NfeDetCombustivelOrigemModel> resultList = [];
		for (var nfeDetCombustivelOrigemModel in nfeDetCombustivelOrigemModelList) {
			resultList.add(nfeDetCombustivelOrigemModel.clone());
		}
		return resultList;
	}

}