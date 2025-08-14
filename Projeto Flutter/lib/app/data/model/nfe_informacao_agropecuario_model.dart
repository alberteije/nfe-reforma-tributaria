import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:nfe/app/data/model/model_imports.dart';

import 'package:nfe/app/data/domain/domain_imports.dart';

class NfeInformacaoAgropecuarioModel extends ModelBase {
  int? id;
  int? idNfeCabecalho;
  String? numeroReceituario;
  String? cpfResponsavelTecnico;
  String? guiaTipo;
  String? guiaUfEmissao;
  String? guiaSerie;
  String? guiaNumero;

  NfeInformacaoAgropecuarioModel({
    this.id,
    this.idNfeCabecalho,
    this.numeroReceituario,
    this.cpfResponsavelTecnico,
    this.guiaTipo = '1 - GTA - Guia de Trânsito Animal',
    this.guiaUfEmissao,
    this.guiaSerie,
    this.guiaNumero,
  });

  static List<String> dbColumns = <String>[
    'id',
    'numero_receituario',
    'cpf_responsavel_tecnico',
    'guia_tipo',
    'guia_uf_emissao',
    'guia_serie',
    'guia_numero',
  ];

  static List<String> aliasColumns = <String>[
    'Id',
    'Numero Receituario',
    'Cpf Responsavel Tecnico',
    'Guia Tipo',
    'Guia Uf Emissao',
    'Guia Serie',
    'Guia Numero',
  ];

  NfeInformacaoAgropecuarioModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    idNfeCabecalho = jsonData['idNfeCabecalho'];
    numeroReceituario = jsonData['numeroReceituario'];
    cpfResponsavelTecnico = jsonData['cpfResponsavelTecnico'];
    guiaTipo = NfeInformacaoAgropecuarioDomain.getGuiaTipo(jsonData['guiaTipo']);
    guiaUfEmissao = jsonData['guiaUfEmissao'];
    guiaSerie = jsonData['guiaSerie'];
    guiaNumero = jsonData['guiaNumero'];
  }

  Map<String, dynamic> get toJson {
    Map<String, dynamic> jsonData = <String, dynamic>{};

    jsonData['id'] = id != 0 ? id : null;
    jsonData['idNfeCabecalho'] = idNfeCabecalho != 0 ? idNfeCabecalho : null;
    jsonData['numeroReceituario'] = numeroReceituario;
    jsonData['cpfResponsavelTecnico'] = cpfResponsavelTecnico;
    jsonData['guiaTipo'] = NfeInformacaoAgropecuarioDomain.setGuiaTipo(guiaTipo);
    jsonData['guiaUfEmissao'] = guiaUfEmissao;
    jsonData['guiaSerie'] = guiaSerie;
    jsonData['guiaNumero'] = guiaNumero;

    return jsonData;
  }

  String objectEncodeJson() {
    final jsonData = toJson;
    return json.encode(jsonData);
  }

  static NfeInformacaoAgropecuarioModel fromPlutoRow(PlutoRow row) {
    return NfeInformacaoAgropecuarioModel(
      id: row.cells['id']?.value,
      idNfeCabecalho: row.cells['idNfeCabecalho']?.value,
      numeroReceituario: row.cells['numeroReceituario']?.value,
      cpfResponsavelTecnico: row.cells['cpfResponsavelTecnico']?.value,
      guiaTipo: row.cells['guiaTipo']?.value,
      guiaUfEmissao: row.cells['guiaUfEmissao']?.value,
      guiaSerie: row.cells['guiaSerie']?.value,
      guiaNumero: row.cells['guiaNumero']?.value,
    );
  }

  PlutoRow toPlutoRow() {
    return PlutoRow(
      cells: {
        'tempId': PlutoCell(value: tempId),
        'id': PlutoCell(value: id ?? 0),
        'idNfeCabecalho': PlutoCell(value: idNfeCabecalho ?? 0),
        'numeroReceituario': PlutoCell(value: numeroReceituario ?? ''),
        'cpfResponsavelTecnico': PlutoCell(value: cpfResponsavelTecnico ?? ''),
        'guiaTipo': PlutoCell(value: guiaTipo ?? ''),
        'guiaUfEmissao': PlutoCell(value: guiaUfEmissao ?? ''),
        'guiaSerie': PlutoCell(value: guiaSerie ?? ''),
        'guiaNumero': PlutoCell(value: guiaNumero ?? ''),
      },
    );
  }

  NfeInformacaoAgropecuarioModel clone() {
    return NfeInformacaoAgropecuarioModel(
      id: id,
      idNfeCabecalho: idNfeCabecalho,
      numeroReceituario: numeroReceituario,
      cpfResponsavelTecnico: cpfResponsavelTecnico,
      guiaTipo: guiaTipo,
      guiaUfEmissao: guiaUfEmissao,
      guiaSerie: guiaSerie,
      guiaNumero: guiaNumero,
    );
  }


}