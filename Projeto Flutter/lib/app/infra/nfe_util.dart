import 'package:nfe/app/data/domain/domain_imports.dart';
import 'package:xml/xml.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeUtil {
  static NfeCabecalhoModel parseNfe(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final infNFe = document.findAllElements('infNFe').first;
    final cabecalho = NfeCabecalhoModel();

    _parseIdentificacao(infNFe, cabecalho);
    _parseTotais(infNFe, cabecalho);
    _parseNfeReferenciada(infNFe, cabecalho);
    _parseNfeNfReferenciada(infNFe, cabecalho);
    _parseNfeProdRuralReferenciada(infNFe, cabecalho);
    _parseNfeCupomFiscalReferenciado(infNFe, cabecalho);
    _parseCteReferenciado(infNFe, cabecalho);
    _parseEmitente(infNFe, cabecalho);
    _parseDestinatario(infNFe, cabecalho);
    _parseRetirada(infNFe, cabecalho);
    _parseEntrega(infNFe, cabecalho);
    _parseAutXML(infNFe, cabecalho);
    _parseDetalhes(infNFe, cabecalho);
    _parseTransporte(infNFe, cabecalho);
    _parseFatura(infNFe, cabecalho);
    _parseCana(infNFe, cabecalho);
    _parseResponsavelTecnico(infNFe, cabecalho);
    _parseProcessoReferenciado(infNFe, cabecalho);
    _parseInformacaoPagamento(infNFe, cabecalho);

    return cabecalho;
  }

  static void _parseIdentificacao(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final ide = infNFe.getElement('ide');

    cabecalho
      ..ufEmitente = retornarUfIbgeCodigo(ide?.getElement('cUF')?.innerText) // B02
      ..codigoNumerico = ide?.getElement('cNF')?.innerText // B03
      ..naturezaOperacao = ide?.getElement('natOp')?.innerText // B04
      ..codigoModelo = NfeCabecalhoDomain.getCodigoModelo(ide?.getElement('mod')?.innerText) // B06
      ..serie = ide?.getElement('serie')?.innerText // B07
      ..numero = ide?.getElement('nNF')?.innerText // B08
      ..dataHoraEmissao = _parseDateTime(ide?.getElement('dhEmi')?.innerText) // B09
      ..dataHoraEntradaSaida = _parseDateTime(ide?.getElement('dhSaiEnt')?.innerText) // B10
      ..tipoOperacao = NfeCabecalhoDomain.getTipoOperacao(ide?.getElement('tpNF')?.innerText) // B11
      ..localDestino = NfeCabecalhoDomain.getLocalDestino(ide?.getElement('idDest')?.innerText) // B11a
      ..codigoMunicipio = int.tryParse(ide?.getElement('cMunFG')?.innerText ?? '') // B12
      ..formatoImpressaoDanfe = NfeCabecalhoDomain.getFormatoImpressaoDanfe(ide?.getElement('tpImp')?.innerText) // B21
      ..tipoEmissao = NfeCabecalhoDomain.getTipoEmissao(ide?.getElement('tpEmis')?.innerText) // B22
      ..digitoChaveAcesso = ide?.getElement('cDV')?.innerText // B23
      ..ambiente = NfeCabecalhoDomain.getAmbiente(ide?.getElement('tpAmb')?.innerText) // B24
      ..finalidadeEmissao = NfeCabecalhoDomain.getFinalidadeEmissao(ide?.getElement('finNFe')?.innerText) // B25
      ..consumidorOperacao = NfeCabecalhoDomain.getConsumidorOperacao(ide?.getElement('indFinal')?.innerText) // B25a
      ..consumidorPresenca = NfeCabecalhoDomain.getConsumidorPresenca(ide?.getElement('indPres')?.innerText) // B25b
      ..processoEmissao = NfeCabecalhoDomain.getProcessoEmissao(ide?.getElement('procEmi')?.innerText) // B26
      ..versaoProcessoEmissao = ide?.getElement('verProc')?.innerText // B27
      ..dataEntradaContingencia = _parseDateTime(ide?.getElement('dhCont')?.innerText) // B28
      ..justificativaContingencia = ide?.getElement('xJust')?.innerText; // B29
  }

  static void _parseTotais(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final total = infNFe.getElement('total');
    final icmsTot = total?.getElement('ICMSTot');

    cabecalho
      ..baseCalculoIcms = _parseDouble(icmsTot?.getElement('vBC')?.innerText)
      ..valorIcms = _parseDouble(icmsTot?.getElement('vICMS')?.innerText)
      ..valorIcmsDesonerado = _parseDouble(icmsTot?.getElement('vICMSDeson')?.innerText)
      ..valorTotalFcp = _parseDouble(icmsTot?.getElement('vFCP')?.innerText)
      ..valorTotalProdutos = _parseDouble(icmsTot?.getElement('vProd')?.innerText)
      ..valorFrete = _parseDouble(icmsTot?.getElement('vFrete')?.innerText)
      ..valorSeguro = _parseDouble(icmsTot?.getElement('vSeg')?.innerText)
      ..valorDesconto = _parseDouble(icmsTot?.getElement('vDesc')?.innerText)
      ..valorImpostoImportacao = _parseDouble(icmsTot?.getElement('vII')?.innerText)
      ..valorIpi = _parseDouble(icmsTot?.getElement('vIPI')?.innerText)
      ..valorPis = _parseDouble(icmsTot?.getElement('vPIS')?.innerText)
      ..valorCofins = _parseDouble(icmsTot?.getElement('vCOFINS')?.innerText)
      ..valorDespesasAcessorias = _parseDouble(icmsTot?.getElement('vOutro')?.innerText)
      ..valorTotal = _parseDouble(icmsTot?.getElement('vNF')?.innerText)
      ..valorTotalTributos = _parseDouble(icmsTot?.getElement('vTotTrib')?.innerText);
  }

  static void _parseNfeReferenciada(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final ide = infNFe.getElement('ide');
    if (ide == null) return;

    final referencias = <NfeReferenciadaModel>[];

    for (final nfref in ide.findElements('NFref')) {
      final chave = nfref.getElement('refNFe')?.innerText;
      if (chave != null && chave.isNotEmpty) {
        referencias.add(NfeReferenciadaModel(chaveAcesso: chave));
      }
    }

    if (referencias.isNotEmpty) {
      cabecalho.nfeReferenciadaModelList = referencias;
    }
  }

  static void _parseNfeNfReferenciada(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final ide = infNFe.getElement('ide');
    if (ide == null) return;

    final referencias = <NfeNfReferenciadaModel>[];

    for (final nfref in ide.findElements('NFref')) {
      final refNF = nfref.getElement('refNF');
      if (refNF == null) continue;

      final model = NfeNfReferenciadaModel(
        codigoUf: int.tryParse(refNF.getElement('cUF')?.innerText ?? ''),
        anoMes: refNF.getElement('AAMM')?.innerText,
        cnpj: refNF.getElement('CNPJ')?.innerText,
        modelo: NfeNfReferenciadaDomain.getModelo(refNF.getElement('mod')?.innerText),
        serie: refNF.getElement('serie')?.innerText,
        numeroNf: int.tryParse(refNF.getElement('nNF')?.innerText ?? ''),
      );

      referencias.add(model);
    }

    if (referencias.isNotEmpty) {
      cabecalho.nfeNfReferenciadaModelList = referencias;
    }
  }

  static void _parseNfeProdRuralReferenciada(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final ide = infNFe.getElement('ide');
    if (ide == null) return;

    final referencias = <NfeProdRuralReferenciadaModel>[];

    for (final nfref in ide.findElements('NFref')) {
      final refNFP = nfref.getElement('refNFP');
      if (refNFP == null) continue;

      final model = NfeProdRuralReferenciadaModel(
        codigoUf: int.tryParse(refNFP.getElement('cUF')?.innerText ?? ''),
        anoMes: refNFP.getElement('AAMM')?.innerText,
        cnpj: refNFP.getElement('CNPJ')?.innerText,
        cpf: refNFP.getElement('CPF')?.innerText,
        inscricaoEstadual: refNFP.getElement('IE')?.innerText,
        modelo: NfeProdRuralReferenciadaDomain.getModelo(refNFP.getElement('mod')?.innerText),
        serie: refNFP.getElement('serie')?.innerText,
        numeroNf: int.tryParse(refNFP.getElement('nNF')?.innerText ?? ''),
      );

      referencias.add(model);
    }

    if (referencias.isNotEmpty) {
      cabecalho.nfeProdRuralReferenciadaModelList = referencias;
    }
  }

  static void _parseNfeCupomFiscalReferenciado(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final ide = infNFe.getElement('ide');
    if (ide == null) return;

    final cupomList = <NfeCupomFiscalReferenciadoModel>[];

    for (final nfref in ide.findElements('NFref')) {
      final refECF = nfref.getElement('refECF');
      if (refECF == null) continue;

      final modeloDocumentoFiscal = NfeCupomFiscalReferenciadoDomain.getModeloDocumentoFiscal(refECF.getElement('mod')?.innerText);
      final numeroOrdemEcf = int.tryParse(refECF.getElement('nECF')?.innerText ?? '');
      final coo = int.tryParse(refECF.getElement('nCOO')?.innerText ?? '');
      final dataEmissaoCupom = _parseDateTime(refECF.getElement('dEmi')?.innerText);
      final numeroCaixa = int.tryParse(refECF.getElement('nCaixa')?.innerText ?? '');
      final numeroSerieEcf = refECF.getElement('nSerie')?.innerText;

      cupomList.add(NfeCupomFiscalReferenciadoModel(
        modeloDocumentoFiscal: modeloDocumentoFiscal,
        numeroOrdemEcf: numeroOrdemEcf,
        coo: coo,
        dataEmissaoCupom: dataEmissaoCupom,
        numeroCaixa: numeroCaixa,
        numeroSerieEcf: numeroSerieEcf,
      ));
    }

    if (cupomList.isNotEmpty) {
      cabecalho.nfeCupomFiscalReferenciadoModelList = cupomList;
    }
  }

  static void _parseCteReferenciado(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final ide = infNFe.getElement('ide');
    if (ide == null) return;

    final listaCte = ide.findElements('refCTe');
    if (listaCte.isEmpty) return;

    cabecalho.nfeCteReferenciadoModelList = listaCte.map((cte) {
      return NfeCteReferenciadoModel()
        ..chaveAcesso = cte.innerText;
    }).toList();
  }

  static void _parseEmitente(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final emit = infNFe.getElement('emit');
    if (emit == null) return;

    final enderEmit = emit.getElement('enderEmit');

    final emitente = NfeEmitenteModel()
      ..cnpj = emit.getElement('CNPJ')?.innerText
      ..cpf = emit.getElement('CPF')?.innerText
      ..nome = emit.getElement('xNome')?.innerText
      ..fantasia = emit.getElement('xFant')?.innerText
      ..logradouro = enderEmit?.getElement('xLgr')?.innerText
      ..numero = enderEmit?.getElement('nro')?.innerText
      ..complemento = enderEmit?.getElement('xCpl')?.innerText
      ..bairro = enderEmit?.getElement('xBairro')?.innerText
      ..codigoMunicipio = int.tryParse(enderEmit?.getElement('cMun')?.innerText ?? '')
      ..nomeMunicipio = enderEmit?.getElement('xMun')?.innerText
      ..uf = enderEmit?.getElement('UF')?.innerText
      ..cep = enderEmit?.getElement('CEP')?.innerText
      ..codigoPais = int.tryParse(enderEmit?.getElement('cPais')?.innerText ?? '')
      ..nomePais = enderEmit?.getElement('xPais')?.innerText
      ..telefone = enderEmit?.getElement('fone')?.innerText
      ..inscricaoEstadual = emit.getElement('IE')?.innerText
      ..inscricaoEstadualSt = emit.getElement('IEST')?.innerText
      ..inscricaoMunicipal = emit.getElement('IM')?.innerText
      ..cnae = emit.getElement('CNAE')?.innerText
      ..crt = NfeEmitenteDomain.getCrt(emit.getElement('CRT')?.innerText);

    cabecalho.nfeEmitenteModel = emitente;
  }

  static void _parseDestinatario(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final dest = infNFe.getElement('dest');
    if (dest == null) return;

    final enderDest = dest.getElement('enderDest');

    final destinatario = NfeDestinatarioModel()
      ..cnpj = dest.getElement('CNPJ')?.innerText
      ..cpf = dest.getElement('CPF')?.innerText
      ..estrangeiroIdentificacao = dest.getElement('idEstrangeiro')?.innerText
      ..nome = dest.getElement('xNome')?.innerText
      ..logradouro = enderDest?.getElement('xLgr')?.innerText
      ..numero = enderDest?.getElement('nro')?.innerText
      ..complemento = enderDest?.getElement('xCpl')?.innerText
      ..bairro = enderDest?.getElement('xBairro')?.innerText
      ..codigoMunicipio = int.tryParse(enderDest?.getElement('cMun')?.innerText ?? '')
      ..nomeMunicipio = enderDest?.getElement('xMun')?.innerText
      ..uf = enderDest?.getElement('UF')?.innerText
      ..cep = enderDest?.getElement('CEP')?.innerText
      ..codigoPais = int.tryParse(enderDest?.getElement('cPais')?.innerText ?? '')
      ..nomePais = enderDest?.getElement('xPais')?.innerText
      ..telefone = enderDest?.getElement('fone')?.innerText
      ..indicadorIe = NfeDestinatarioDomain.getIndicadorIe(dest.getElement('indIEDest')?.innerText)
      ..inscricaoEstadual = dest.getElement('IE')?.innerText
      ..suframa = int.tryParse(dest.getElement('ISUF')?.innerText ?? '')
      ..inscricaoMunicipal = dest.getElement('IM')?.innerText
      ..email = dest.getElement('email')?.innerText;

    cabecalho.nfeDestinatarioModel = destinatario;
  }

  static void _parseRetirada(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final retirada = infNFe.getElement('retirada');
    if (retirada == null) return;

    final local = NfeLocalRetiradaModel()
      ..cnpj = retirada.getElement('CNPJ')?.innerText
      ..cpf = retirada.getElement('CPF')?.innerText
      ..nomeExpedidor = retirada.getElement('xNome')?.innerText
      ..logradouro = retirada.getElement('xLgr')?.innerText
      ..numero = retirada.getElement('nro')?.innerText
      ..complemento = retirada.getElement('xCpl')?.innerText
      ..bairro = retirada.getElement('xBairro')?.innerText
      ..codigoMunicipio = int.tryParse(retirada.getElement('cMun')?.innerText ?? '')
      ..nomeMunicipio = retirada.getElement('xMun')?.innerText
      ..uf = retirada.getElement('UF')?.innerText
      ..cep = retirada.getElement('CEP')?.innerText
      ..codigoPais = int.tryParse(retirada.getElement('cPais')?.innerText ?? '')
      ..nomePais = retirada.getElement('xPais')?.innerText
      ..telefone = retirada.getElement('fone')?.innerText
      ..email = retirada.getElement('email')?.innerText
      ..inscricaoEstadual = retirada.getElement('IE')?.innerText;

    cabecalho.nfeLocalRetiradaModel = local;
  }

  static void _parseEntrega(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final entrega = infNFe.getElement('entrega');
    if (entrega == null) return;

    final local = NfeLocalEntregaModel()
      ..cnpj = entrega.getElement('CNPJ')?.innerText
      ..cpf = entrega.getElement('CPF')?.innerText
      ..nomeRecebedor = entrega.getElement('xNome')?.innerText
      ..logradouro = entrega.getElement('xLgr')?.innerText
      ..numero = entrega.getElement('nro')?.innerText
      ..complemento = entrega.getElement('xCpl')?.innerText
      ..bairro = entrega.getElement('xBairro')?.innerText
      ..codigoMunicipio = int.tryParse(entrega.getElement('cMun')?.innerText ?? '')
      ..nomeMunicipio = entrega.getElement('xMun')?.innerText
      ..uf = entrega.getElement('UF')?.innerText
      ..cep = entrega.getElement('CEP')?.innerText
      ..codigoPais = int.tryParse(entrega.getElement('cPais')?.innerText ?? '')
      ..nomePais = entrega.getElement('xPais')?.innerText
      ..telefone = entrega.getElement('fone')?.innerText
      ..email = entrega.getElement('email')?.innerText
      ..inscricaoEstadual = entrega.getElement('IE')?.innerText;

    cabecalho.nfeLocalEntregaModel = local;
  }

  static void _parseAutXML(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final listaAutXml = <NfeAcessoXmlModel>[];

    for (final autXml in infNFe.findElements('autXML')) {
      final model = NfeAcessoXmlModel()
        ..cnpj = autXml.getElement('CNPJ')?.innerText
        ..cpf = autXml.getElement('CPF')?.innerText;
      listaAutXml.add(model);
    }

    cabecalho.nfeAcessoXmlModelList = listaAutXml.isNotEmpty ? listaAutXml : null;
  }

  static void _parseDetalhes(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final detList = <NfeDetalheModel>[];

    for (final det in infNFe.findElements('det')) {
      final prod = det.getElement('prod');
      if (prod == null) continue;

      final detalhe = NfeDetalheModel()
        ..numeroItem = int.tryParse(det.getAttribute('nItem') ?? '')
        ..codigoProduto = prod.getElement('cProd')?.innerText
        ..gtin = prod.getElement('cEAN')?.innerText
        ..nomeProduto = prod.getElement('xProd')?.innerText
        ..ncm = prod.getElement('NCM')?.innerText
        ..cest = prod.getElement('CEST')?.innerText
        ..indicadorEscalaRelevante = NfeDetalheDomain.getIndicadorEscalaRelevante(prod.getElement('indEscala')?.innerText)
        ..cnpjFabricante = prod.getElement('CNPJFab')?.innerText
        ..codigoBeneficioFiscal = prod.getElement('cBenef')?.innerText
        ..exTipi = int.tryParse(prod.getElement('extIPI')?.innerText ?? '')
        ..cfop = int.tryParse(prod.getElement('CFOP')?.innerText ?? '')
        ..unidadeComercial = prod.getElement('uCom')?.innerText
        ..quantidadeComercial = double.tryParse(prod.getElement('qCom')?.innerText ?? '')
        ..numeroPedidoCompra = prod.getElement('xPed')?.innerText
        ..itemPedidoCompra = int.tryParse(prod.getElement('nItemPed')?.innerText ?? '')
        ..valorUnitarioComercial = double.tryParse(prod.getElement('vUnCom')?.innerText ?? '')
        ..valorBrutoProduto = double.tryParse(prod.getElement('vProd')?.innerText ?? '')
        ..unidadeTributavel = prod.getElement('uTrib')?.innerText
        ..quantidadeTributavel = double.tryParse(prod.getElement('qTrib')?.innerText ?? '')
        ..valorUnitarioTributavel = double.tryParse(prod.getElement('vUnTrib')?.innerText ?? '')
        ..valorFrete = double.tryParse(prod.getElement('vFrete')?.innerText ?? '')
        ..valorSeguro = double.tryParse(prod.getElement('vSeg')?.innerText ?? '')
        ..valorDesconto = double.tryParse(prod.getElement('vDesc')?.innerText ?? '')
        ..valorOutrasDespesas = double.tryParse(prod.getElement('vOutro')?.innerText ?? '')
        ..entraTotal = NfeDetalheDomain.getEntraTotal(prod.getElement('indTot')?.innerText)
        ..valorSubtotal = double.tryParse(prod.getElement('vTotTrib')?.innerText ?? '');

      // Impostos
      final imposto = det.getElement('imposto');
      if (imposto != null) {
        _parseImpostoIcms(imposto, detalhe);
        _parseImpostoIpi(imposto, detalhe);
        _parseImpostoPis(imposto, detalhe);
        _parseImpostoPisSt(imposto, detalhe);
        _parseImpostoCofins(imposto, detalhe);
        _parseImpostoCofinsSt(imposto, detalhe);
        _parseImpostoIi(imposto, detalhe);
        _parseImpostoIssqn(imposto, detalhe);
        _parseImpostoIcmsUfdest(imposto, detalhe);
      }

      // Detalhe específico
      _parseDetEspecificoVeiculo(det, detalhe);
      _parseDetEspecificoMedicamento(det, detalhe);
      _parseDetEspecificoCombustivel(det, detalhe);
      _parseDetEspecificoArmamento(det, detalhe);

      _parseDeclaracaoImportacao(det, detalhe);
      _parseExportacao(det, detalhe);
      _parseItemRastreado(det, detalhe);

      detList.add(detalhe);
    }

    if (detList.isNotEmpty) {
      cabecalho.nfeDetalheModelList = detList;
    }
  }

  static void _parseImpostoIcms(XmlElement imposto, NfeDetalheModel detalhe) {
    final icmsElement = imposto.getElement('ICMS');
    if (icmsElement == null) return;

    final icms = NfeDetalheImpostoIcmsModel();

    final icmsSubGroup = icmsElement.children
        .whereType<XmlElement>()
        .firstWhere(
          (e) => e.name.toString().startsWith('ICMS'),
          orElse: () => XmlElement(XmlName('')),
        );

    if (icmsSubGroup.name.toString().isEmpty) return;

    icms.origemMercadoria = NfeDetalheImpostoIcmsDomain.getOrigemMercadoria(icmsSubGroup.getElement('orig')?.innerText);
    icms.cstIcms = icmsSubGroup.getElement('CST')?.innerText;
    icms.csosn = icmsSubGroup.getElement('CSOSN')?.innerText;
    icms.modalidadeBcIcms = NfeDetalheImpostoIcmsDomain.getModalidadeBcIcms(icmsSubGroup.getElement('modBC')?.innerText);
    icms.percentualReducaoBcIcms = _parseDouble(icmsSubGroup.getElement('pRedBC')?.innerText);
    icms.valorBcIcms = _parseDouble(icmsSubGroup.getElement('vBC')?.innerText);
    icms.aliquotaIcms = _parseDouble(icmsSubGroup.getElement('pICMS')?.innerText);
    icms.valorIcmsOperacao = _parseDouble(icmsSubGroup.getElement('vICMSOp')?.innerText);
    icms.percentualDiferimento = _parseDouble(icmsSubGroup.getElement('pDif')?.innerText);
    icms.valorIcmsDiferido = _parseDouble(icmsSubGroup.getElement('vICMSDif')?.innerText);
    icms.valorIcms = _parseDouble(icmsSubGroup.getElement('vICMS')?.innerText);
    icms.baseCalculoFcp = _parseDouble(icmsSubGroup.getElement('vBCFCP')?.innerText);
    icms.percentualFcp = _parseDouble(icmsSubGroup.getElement('pFCP')?.innerText);
    icms.valorFcp = _parseDouble(icmsSubGroup.getElement('vFCP')?.innerText);

    icms.modalidadeBcIcmsSt = NfeDetalheImpostoIcmsDomain.getModalidadeBcIcmsSt(icmsSubGroup.getElement('modBCST')?.innerText);
    icms.percentualMvaIcmsSt = _parseDouble(icmsSubGroup.getElement('pMVAST')?.innerText);
    icms.percentualReducaoBcIcmsSt = _parseDouble(icmsSubGroup.getElement('pRedBCST')?.innerText);
    icms.valorBaseCalculoIcmsSt = _parseDouble(icmsSubGroup.getElement('vBCST')?.innerText);
    icms.aliquotaIcmsSt = _parseDouble(icmsSubGroup.getElement('pICMSST')?.innerText);
    icms.valorIcmsSt = _parseDouble(icmsSubGroup.getElement('vICMSST')?.innerText);
    icms.baseCalculoFcpSt = _parseDouble(icmsSubGroup.getElement('vBCFCPST')?.innerText);
    icms.percentualFcpSt = _parseDouble(icmsSubGroup.getElement('pFCPST')?.innerText);
    icms.valorFcpSt = _parseDouble(icmsSubGroup.getElement('vFCPST')?.innerText);
    icms.ufSt = icmsSubGroup.getElement('UFST')?.innerText;
    icms.percentualBcOperacaoPropria = _parseDouble(icmsSubGroup.getElement('pBCOp')?.innerText);
    icms.valorBcIcmsStRetido = _parseDouble(icmsSubGroup.getElement('vBCSTRet')?.innerText);
    icms.aliquotaSuportadaConsumidor = _parseDouble(icmsSubGroup.getElement('pST')?.innerText);
    icms.valorIcmsSubstituto = _parseDouble(icmsSubGroup.getElement('vICMSSubstituto')?.innerText);
    icms.valorIcmsStRetido = _parseDouble(icmsSubGroup.getElement('vICMSSTRet')?.innerText);
    icms.baseCalculoFcpStRetido = _parseDouble(icmsSubGroup.getElement('vBCFCPSTRet')?.innerText);
    icms.percentualFcpStRetido = _parseDouble(icmsSubGroup.getElement('pFCPSTRet')?.innerText);
    icms.valorFcpStRetido = _parseDouble(icmsSubGroup.getElement('vFCPSTRet')?.innerText);
    icms.motivoDesoneracaoIcms = icmsSubGroup.getElement('motDesICMS')?.innerText;
    icms.valorIcmsDesonerado = _parseDouble(icmsSubGroup.getElement('vICMSDeson')?.innerText);
    icms.aliquotaCreditoIcmsSn = _parseDouble(icmsSubGroup.getElement('pCredSN')?.innerText);
    icms.valorCreditoIcmsSn = _parseDouble(icmsSubGroup.getElement('vCredICMSSN')?.innerText);
    icms.valorBcIcmsStDestino = _parseDouble(icmsSubGroup.getElement('vBCSTDest')?.innerText);
    icms.valorIcmsStDestino = _parseDouble(icmsSubGroup.getElement('vICMSSTDest')?.innerText);
    icms.percentualReducaoBcEfetivo = _parseDouble(icmsSubGroup.getElement('pRedBCEfet')?.innerText);
    icms.valorBcEfetivo = _parseDouble(icmsSubGroup.getElement('vBCEfet')?.innerText);
    icms.aliquotaIcmsEfetivo = _parseDouble(icmsSubGroup.getElement('pICMSEfet')?.innerText);
    icms.valorIcmsEfetivo = _parseDouble(icmsSubGroup.getElement('vICMSEfet')?.innerText);

    detalhe.nfeDetalheImpostoIcmsModel = icms;
  }

  static void _parseImpostoIpi(XmlElement imposto, NfeDetalheModel detalhe) {
    final ipiElement = imposto.getElement('IPI');
    if (ipiElement == null) return;

    final ipi = NfeDetalheImpostoIpiModel();

    ipi.cnpjProdutor = ipiElement.getElement('CNPJProd')?.innerText;
    ipi.codigoSeloIpi = ipiElement.getElement('cSelo')?.innerText;
    final qSeloText = ipiElement.getElement('qSelo')?.innerText;
    ipi.quantidadeSeloIpi = qSeloText != null ? int.tryParse(qSeloText) : null;
    ipi.enquadramentoLegalIpi = ipiElement.getElement('cEnq')?.innerText;
    ipi.cstIpi = ipiElement.getElement('CST')?.innerText;
    ipi.valorBaseCalculoIpi = _parseDouble(ipiElement.getElement('vBC')?.innerText);
    ipi.quantidadeUnidadeTributavel = _parseDouble(ipiElement.getElement('qUnid')?.innerText);
    ipi.valorUnidadeTributavel = _parseDouble(ipiElement.getElement('vUnid')?.innerText);
    ipi.aliquotaIpi = _parseDouble(ipiElement.getElement('pIPI')?.innerText);
    ipi.valorIpi = _parseDouble(ipiElement.getElement('vIPI')?.innerText);

    detalhe.nfeDetalheImpostoIpiModel = ipi;
  }

  static void _parseImpostoPis(XmlElement imposto, NfeDetalheModel detalhe) {
    final pisElement = imposto.getElement('PIS');
    if (pisElement == null) return;

    final pis = NfeDetalheImpostoPisModel();

    pis.cstPis = pisElement.getElement('CST')?.innerText;
    pis.valorBaseCalculoPis = _parseDouble(pisElement.getElement('vBC')?.innerText);
    pis.aliquotaPisPercentual = _parseDouble(pisElement.getElement('pPIS')?.innerText);
    pis.valorPis = _parseDouble(pisElement.getElement('vPIS')?.innerText);
    pis.quantidadeVendida = _parseDouble(pisElement.getElement('qBCProd')?.innerText);
    pis.aliquotaPisReais = _parseDouble(pisElement.getElement('vAliqProd')?.innerText);

    detalhe.nfeDetalheImpostoPisModel = pis;
  }

  static void _parseImpostoPisSt(XmlElement imposto, NfeDetalheModel detalhe) {
    final pisStElement = imposto.getElement('PISST');
    if (pisStElement == null) return;

    final pisSt = NfeDetalheImpostoPisStModel();

    pisSt.valorBaseCalculoPisSt = _parseDouble(pisStElement.getElement('vBC')?.innerText);
    pisSt.aliquotaPisStPercentual = _parseDouble(pisStElement.getElement('pPIS')?.innerText);
    pisSt.quantidadeVendidaPisSt = _parseDouble(pisStElement.getElement('qBCProd')?.innerText);
    pisSt.aliquotaPisStReais = _parseDouble(pisStElement.getElement('vAliqProd')?.innerText);
    pisSt.valorPisSt = _parseDouble(pisStElement.getElement('vPIS')?.innerText);

    detalhe.nfeDetalheImpostoPisStModel = pisSt;
  }

  static void _parseImpostoCofins(XmlElement imposto, NfeDetalheModel detalhe) {
    final cofinsElement = imposto.getElement('COFINS');
    if (cofinsElement == null) return;

    final cofins = NfeDetalheImpostoCofinsModel();

    cofins.cstCofins = cofinsElement.getElement('CST')?.innerText;
    cofins.baseCalculoCofins = _parseDouble(cofinsElement.getElement('vBC')?.innerText);
    cofins.aliquotaCofinsPercentual = _parseDouble(cofinsElement.getElement('pCOFINS')?.innerText);
    cofins.valorCofins = _parseDouble(cofinsElement.getElement('vCOFINS')?.innerText);
    cofins.quantidadeVendida = _parseDouble(cofinsElement.getElement('qBCProd')?.innerText);
    cofins.aliquotaCofinsReais = _parseDouble(cofinsElement.getElement('vAliqProd')?.innerText);

    detalhe.nfeDetalheImpostoCofinsModel = cofins;
  }

  static void _parseImpostoCofinsSt(XmlElement imposto, NfeDetalheModel detalhe) {
    final cofinsStElement = imposto.getElement('COFINSST');
    if (cofinsStElement == null) return;

    final cofinsSt = NfeDetalheImpostoCofinsStModel();

    cofinsSt.baseCalculoCofinsSt = _parseDouble(cofinsStElement.getElement('vBC')?.innerText);
    cofinsSt.aliquotaCofinsStPercentual = _parseDouble(cofinsStElement.getElement('pCOFINS')?.innerText);
    cofinsSt.quantidadeVendidaCofinsSt = _parseDouble(cofinsStElement.getElement('qBCProd')?.innerText);
    cofinsSt.aliquotaCofinsStReais = _parseDouble(cofinsStElement.getElement('vAliqProd')?.innerText);
    cofinsSt.valorCofinsSt = _parseDouble(cofinsStElement.getElement('vCOFINS')?.innerText);

    detalhe.nfeDetalheImpostoCofinsStModel = cofinsSt;
  }

  static void _parseImpostoIi(XmlElement imposto, NfeDetalheModel detalhe) {
    final iiElement = imposto.getElement('II');
    if (iiElement == null) return;

    final ii = NfeDetalheImpostoIiModel();

    ii.valorBcIi = _parseDouble(iiElement.getElement('vBC')?.innerText);
    ii.valorDespesasAduaneiras = _parseDouble(iiElement.getElement('vDespAdu')?.innerText);
    ii.valorImpostoImportacao = _parseDouble(iiElement.getElement('vII')?.innerText);
    ii.valorIof = _parseDouble(iiElement.getElement('vIOF')?.innerText);

    detalhe.nfeDetalheImpostoIiModel = ii;
  }

  static void _parseImpostoIssqn(XmlElement imposto, NfeDetalheModel detalhe) {
    final issqnElement = imposto.getElement('ISSQN');
    if (issqnElement == null) return;

    final issqn = NfeDetalheImpostoIssqnModel();

    issqn.baseCalculoIssqn = _parseDouble(issqnElement.getElement('vBC')?.innerText);
    issqn.aliquotaIssqn = _parseDouble(issqnElement.getElement('vAliq')?.innerText);
    issqn.valorIssqn = _parseDouble(issqnElement.getElement('vISSQN')?.innerText);
    issqn.municipioIssqn = int.tryParse(issqnElement.getElement('cMunFG')?.innerText ?? '');
    issqn.itemListaServicos = int.tryParse(issqnElement.getElement('cListServ')?.innerText ?? '');
    issqn.valorDeducao = _parseDouble(issqnElement.getElement('vDeducao')?.innerText);
    issqn.valorOutrasRetencoes = _parseDouble(issqnElement.getElement('vOutro')?.innerText);
    issqn.valorDescontoIncondicionado = _parseDouble(issqnElement.getElement('vDescIncond')?.innerText);
    issqn.valorDescontoCondicionado = _parseDouble(issqnElement.getElement('vDescCond')?.innerText);
    issqn.valorRetencaoIss = _parseDouble(issqnElement.getElement('vISSRet')?.innerText);
    issqn.indicadorExigibilidadeIss = NfeDetalheImpostoIssqnDomain.getIndicadorExigibilidadeIss(issqnElement.getElement('indISS')?.innerText);
    issqn.codigoServico = issqnElement.getElement('cServico')?.innerText;
    issqn.municipioIncidencia = int.tryParse(issqnElement.getElement('cMun')?.innerText ?? '');
    issqn.paisSevicoPrestado = int.tryParse(issqnElement.getElement('cPais')?.innerText ?? '');
    issqn.numeroProcesso = issqnElement.getElement('nProcesso')?.innerText;
    issqn.indicadorIncentivoFiscal = NfeDetalheImpostoIssqnDomain.getIndicadorIncentivoFiscal(issqnElement.getElement('indIncentivo')?.innerText);

    detalhe.nfeDetalheImpostoIssqnModel = issqn;
  }

  static void _parseImpostoIcmsUfdest(XmlElement imposto, NfeDetalheModel detalhe) {
    final icmsUfdestElement = imposto.getElement('ICMSUFDest');
    if (icmsUfdestElement == null) return;
    final icmsUfdest = NfeDetalheImpostoIcmsUfdestModel();
    icmsUfdest.valorBcIcmsUfDestino = _parseDouble(icmsUfdestElement.getElement('vBCUFDest')?.innerText);
    icmsUfdest.valorBcFcpUfDestino = _parseDouble(icmsUfdestElement.getElement('vBCFCPUFDest')?.innerText);
    icmsUfdest.percentualFcpUfDestino = _parseDouble(icmsUfdestElement.getElement('pFCPUFDest')?.innerText);
    icmsUfdest.aliquotaInternaUfDestino = _parseDouble(icmsUfdestElement.getElement('pICMSUFDest')?.innerText);
    icmsUfdest.aliquotaInteresdatualUfEnvolvidas = _parseDouble(icmsUfdestElement.getElement('pICMSInter')?.innerText);
    icmsUfdest.percentualProvisorioPartilhaIcms = _parseDouble(icmsUfdestElement.getElement('pICMSInterPart')?.innerText);
    icmsUfdest.valorIcmsFcpUfDestino = _parseDouble(icmsUfdestElement.getElement('vFCPUFDest')?.innerText);
    icmsUfdest.valorInterestadualUfDestino = _parseDouble(icmsUfdestElement.getElement('vICMSUFDest')?.innerText);
    icmsUfdest.valorInterestadualUfRemetente = _parseDouble(icmsUfdestElement.getElement('vICMSUFRemet')?.innerText);
    detalhe.nfeDetalheImpostoIcmsUfdestModel = icmsUfdest;
  }

  static void _parseDetEspecificoVeiculo(XmlElement det, NfeDetalheModel detalhe) {
    final veicProdElement = det.getElement('veicProd');
    if (veicProdElement == null) return;
    final veiculo = NfeDetEspecificoVeiculoModel();
    veiculo.tipoOperacao = NfeDetEspecificoVeiculoDomain.getTipoOperacao(veicProdElement.getElement('tpOp')?.innerText);
    veiculo.chassi = veicProdElement.getElement('chassi')?.innerText;
    veiculo.cor = veicProdElement.getElement('cCor')?.innerText;
    veiculo.descricaoCor = veicProdElement.getElement('xCor')?.innerText;
    veiculo.potenciaMotor = veicProdElement.getElement('pot')?.innerText;
    veiculo.cilindradas = veicProdElement.getElement('cilin')?.innerText;
    veiculo.pesoLiquido = veicProdElement.getElement('pesoL')?.innerText;
    veiculo.pesoBruto = veicProdElement.getElement('pesoB')?.innerText;
    veiculo.numeroSerie = veicProdElement.getElement('nSerie')?.innerText;
    veiculo.tipoCombustivel = NfeDetEspecificoVeiculoDomain.getTipoCombustivel(veicProdElement.getElement('tpComb')?.innerText);
    veiculo.numeroMotor = veicProdElement.getElement('nMotor')?.innerText;
    veiculo.capacidadeMaximaTracao = veicProdElement.getElement('CMT')?.innerText;
    veiculo.distanciaEixos = veicProdElement.getElement('dist')?.innerText;
    veiculo.anoModelo = veicProdElement.getElement('anoMod')?.innerText;
    veiculo.anoFabricacao = veicProdElement.getElement('anoFab')?.innerText;
    veiculo.tipoPintura = veicProdElement.getElement('tpPint')?.innerText;
    veiculo.tipoVeiculo = NfeDetEspecificoVeiculoDomain.getTipoVeiculo(veicProdElement.getElement('tpVeic')?.innerText);
    veiculo.especieVeiculo = NfeDetEspecificoVeiculoDomain.getEspecieVeiculo(veicProdElement.getElement('espVeic')?.innerText);
    veiculo.condicaoVin = NfeDetEspecificoVeiculoDomain.getCondicaoVin(veicProdElement.getElement('VIN')?.innerText);
    veiculo.condicaoVeiculo = NfeDetEspecificoVeiculoDomain.getCondicaoVeiculo(veicProdElement.getElement('condVeic')?.innerText);
    veiculo.codigoMarcaModelo = veicProdElement.getElement('cMod')?.innerText;
    veiculo.codigoCorDenatran = NfeDetEspecificoVeiculoDomain.getCodigoCorDenatran(veicProdElement.getElement('cCorDENATRAN')?.innerText);
    veiculo.lotacaoMaxima = _parseInt(veicProdElement.getElement('lota')?.innerText);
    veiculo.restricao = NfeDetEspecificoVeiculoDomain.getRestricao(veicProdElement.getElement('tpRest')?.innerText);
    detalhe.nfeDetEspecificoVeiculoModel = veiculo;
  }

  static void _parseDetEspecificoMedicamento(XmlElement det, NfeDetalheModel detalhe) {
    final medElement = det.getElement('med');
    if (medElement == null) return;
    final medicamento = NfeDetEspecificoMedicamentoModel();
    medicamento.codigoAnvisa = medElement.getElement('cProdANVISA')?.innerText;
    medicamento.motivoIsencao = medElement.getElement('xMotivoIsencao')?.innerText;
    medicamento.precoMaximoConsumidor = _parseDouble(medElement.getElement('vPMC')?.innerText);
    detalhe.nfeDetEspecificoMedicamentoModel = medicamento;
  }

  static void _parseDetEspecificoCombustivel(XmlElement det, NfeDetalheModel detalhe) {
    final combElement = det.getElement('comb');
    if (combElement == null) return;
    final combustivel = NfeDetEspecificoCombustivelModel();
    combustivel.codigoAnp = _parseInt(combElement.getElement('cProdANP')?.innerText);
    combustivel.descricaoAnp = combElement.getElement('descANP')?.innerText;
    combustivel.percentualGlp = _parseDouble(combElement.getElement('pGLP')?.innerText);
    combustivel.percentualGasNacional = _parseDouble(combElement.getElement('pGNn')?.innerText);
    combustivel.percentualGasImportado = _parseDouble(combElement.getElement('pGNi')?.innerText);
    combustivel.valorPartida = _parseDouble(combElement.getElement('vPart')?.innerText);
    combustivel.codif = combElement.getElement('CODIF')?.innerText;
    combustivel.quantidadeTempAmbiente = _parseDouble(combElement.getElement('qTemp')?.innerText);
    combustivel.ufConsumo = combElement.getElement('UFCons')?.innerText;
    combustivel.cideBaseCalculo = _parseDouble(combElement.getElement('qBCProd')?.innerText);
    combustivel.cideAliquota = _parseDouble(combElement.getElement('vAliqProd')?.innerText);
    combustivel.cideValor = _parseDouble(combElement.getElement('vCIDE')?.innerText);
    combustivel.encerranteBico = _parseInt(combElement.getElement('nBico')?.innerText);
    combustivel.encerranteBomba = _parseInt(combElement.getElement('nBomba')?.innerText);
    combustivel.encerranteTanque = _parseInt(combElement.getElement('nTanque')?.innerText);
    combustivel.encerranteValorInicio = _parseDouble(combElement.getElement('vEncIni')?.innerText);
    combustivel.encerranteValorFim = _parseDouble(combElement.getElement('vEncFin')?.innerText);
    detalhe.nfeDetEspecificoCombustivelModel = combustivel;
  }

  static void _parseDetEspecificoArmamento(XmlElement det, NfeDetalheModel detalhe) {
    final armasElement = det.findElements('arma');
    if (armasElement.isEmpty) return;
    detalhe.nfeDetEspecificoArmamentoModelList = armasElement.map((arma) {
      final modelo = NfeDetEspecificoArmamentoModel();
      modelo.tipoArma = NfeDetEspecificoArmamentoDomain.getTipoArma(arma.getElement('tpArma')?.innerText);
      modelo.numeroSerieArma = arma.getElement('nSerie')?.innerText;
      modelo.numeroSerieCano = arma.getElement('nCano')?.innerText;
      modelo.descricao = arma.getElement('descr')?.innerText;
      return modelo;
    }).toList();
  }

  static void _parseDeclaracaoImportacao(XmlElement det, NfeDetalheModel detalhe) {
    final declaracoes = det.findElements('DI');
    if (declaracoes.isEmpty) return;
    detalhe.nfeDeclaracaoImportacaoModelList = declaracoes.map((di) {
      final modelo = NfeDeclaracaoImportacaoModel();
      modelo.numeroDocumento = di.getElement('nDI')?.innerText;
      modelo.dataRegistro = _parseDateTime(di.getElement('dDI')?.innerText);
      modelo.localDesembaraco = di.getElement('xLocDesemb')?.innerText;
      modelo.ufDesembaraco = di.getElement('UFDesemb')?.innerText;
      modelo.dataDesembaraco = _parseDateTime(di.getElement('dDesemb')?.innerText);
      modelo.viaTransporte = NfeDeclaracaoImportacaoDomain.getViaTransporte(di.getElement('tpViaTransp')?.innerText);
      modelo.valorAfrmm = _parseDouble(di.getElement('vAFRMM')?.innerText);
      modelo.formaIntermediacao = NfeDeclaracaoImportacaoDomain.getFormaIntermediacao(di.getElement('tpIntermedio')?.innerText);
      modelo.cnpj = di.getElement('CNPJ')?.innerText;
      modelo.ufTerceiro = di.getElement('UFTerceiro')?.innerText;
      modelo.codigoExportador = di.getElement('cExportador')?.innerText;
      return modelo;
    }).toList();
  }

  static void _parseExportacao(XmlElement det, NfeDetalheModel detalhe) {
    final exportacoes = det.findElements('exporta');
    if (exportacoes.isEmpty) return;
    detalhe.nfeExportacaoModelList = exportacoes.map((exp) {
      final modelo = NfeExportacaoModel();
      modelo.drawback = _parseInt(exp.getElement('nDraw')?.innerText);
      modelo.numeroRegistro = _parseInt(exp.getElement('nRE')?.innerText);
      modelo.chaveAcesso = exp.getElement('chNFe')?.innerText;
      modelo.quantidade = _parseDouble(exp.getElement('qExport')?.innerText);
      return modelo;
    }).toList();
  }

  static void _parseItemRastreado(XmlElement det, NfeDetalheModel detalhe) {
    final rastros = det.findElements('rastro');
    if (rastros.isEmpty) return;
    detalhe.nfeItemRastreadoModelList = rastros.map((rastro) {
      final modelo = NfeItemRastreadoModel();
      modelo.numeroLote = rastro.getElement('nLote')?.innerText;
      modelo.quantidadeItens = _parseDouble(rastro.getElement('qLote')?.innerText);
      modelo.dataFabricacao = _parseDateTime(rastro.getElement('dFab')?.innerText);
      modelo.dataValidade = _parseDateTime(rastro.getElement('dVal')?.innerText);
      modelo.codigoAgregacao = rastro.getElement('cAgreg')?.innerText;
      return modelo;
    }).toList();
  }

  static void _parseTransporte(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final transp = infNFe.getElement('transp');
    if (transp == null) return;

    final transporteModel = NfeTransporteModel()
      ..modalidadeFrete = NfeTransporteDomain.getModalidadeFrete(transp.getElement('modFrete')?.innerText);

    final transporta = transp.getElement('transporta');
    if (transporta != null) {
      transporteModel
        ..cnpj = transporta.getElement('CNPJ')?.innerText
        ..cpf = transporta.getElement('CPF')?.innerText
        ..nome = transporta.getElement('xNome')?.innerText
        ..inscricaoEstadual = transporta.getElement('IE')?.innerText
        ..endereco = transporta.getElement('xEnder')?.innerText
        ..nomeMunicipio = transporta.getElement('xMun')?.innerText
        ..uf = transporta.getElement('UF')?.innerText;
    }

    final retTransp = transp.getElement('retTransp');
    if (retTransp != null) {
      transporteModel
        ..valorServico = _parseDouble(retTransp.getElement('vServ')?.innerText)
        ..valorBcRetencaoIcms = _parseDouble(retTransp.getElement('vBCRet')?.innerText)
        ..aliquotaRetencaoIcms = _parseDouble(retTransp.getElement('pICMSRet')?.innerText)
        ..valorIcmsRetido = _parseDouble(retTransp.getElement('vICMSRet')?.innerText)
        ..cfop = int.tryParse(retTransp.getElement('CFOP')?.innerText ?? '')
        ..municipio = int.tryParse(retTransp.getElement('cMunFG')?.innerText ?? '');
    }

    final veicTransp = transp.getElement('veicTransp');
    if (veicTransp != null) {
      transporteModel
        ..placaVeiculo = veicTransp.getElement('placa')?.innerText
        ..ufVeiculo = veicTransp.getElement('UF')?.innerText
        ..rntcVeiculo = veicTransp.getElement('RNTC')?.innerText;
    }

    // Reboques
    transporteModel.nfeTransporteReboqueModelList = transp.findElements('reboque').map((reboque) {
      return NfeTransporteReboqueModel()
        ..placa = reboque.getElement('placa')?.innerText
        ..uf = reboque.getElement('UF')?.innerText
        ..rntc = reboque.getElement('RNTC')?.innerText
        ..vagao = reboque.getElement('vagao')?.innerText
        ..balsa = reboque.getElement('balsa')?.innerText;
    }).toList();

    // Volumes
    transporteModel.nfeTransporteVolumeModelList = transp.findElements('vol').map((vol) {
      final volume = NfeTransporteVolumeModel()
        ..quantidade = int.tryParse(vol.getElement('qVol')?.innerText ?? '')
        ..especie = vol.getElement('esp')?.innerText
        ..marca = vol.getElement('marca')?.innerText
        ..numeracao = vol.getElement('nVol')?.innerText
        ..pesoLiquido = _parseDouble(vol.getElement('pesoL')?.innerText)
        ..pesoBruto = _parseDouble(vol.getElement('pesoB')?.innerText);

      // Lacres
      volume.nfeTransporteVolumeLacreModelList = vol.findElements('lacres').map((lacre) {
        return NfeTransporteVolumeLacreModel()
          ..numero = lacre.getElement('nLacre')?.innerText;
      }).toList();

      return volume;
    }).toList();

    cabecalho.nfeTransporteModel = transporteModel;
  }

  static void _parseFatura(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final cobr = infNFe.getElement('cobr');
    if (cobr == null) return;

    final fatura = cobr.getElement('fat');
    if (fatura == null) return;

    final faturaModel = NfeFaturaModel()
      ..numero = fatura.getElement('nFat')?.innerText
      ..valorOriginal = _parseDouble(fatura.getElement('vOrig')?.innerText)
      ..valorDesconto = _parseDouble(fatura.getElement('vDesc')?.innerText)
      ..valorLiquido = _parseDouble(fatura.getElement('vLiq')?.innerText);

    final duplicatas = <NfeDuplicataModel>[];
    for (final dup in cobr.findAllElements('dup')) {
      final duplicata = NfeDuplicataModel()
        ..numero = dup.getElement('nDup')?.innerText
        ..dataVencimento = _parseDateTime(dup.getElement('dVenc')?.innerText)
        ..valor = _parseDouble(dup.getElement('vDup')?.innerText);
      duplicatas.add(duplicata);
    }

    faturaModel.nfeDuplicataModelList = duplicatas;
    cabecalho.nfeFaturaModel = faturaModel;
  }

  static void _parseCana(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final cana = infNFe.getElement('cana');
    if (cana == null) return;

    final model = NfeCanaModel()
      ..safra = cana.getElement('safra')?.innerText
      ..mesAnoReferencia = cana.getElement('ref')?.innerText;

    // Fornecimento diário
    final fornecimentoDiarioList = <NfeCanaFornecimentoDiarioModel>[];
    for (final forDia in cana.findAllElements('forDia')) {
      final fornecimento = NfeCanaFornecimentoDiarioModel()
        ..dia = forDia.getElement('dia')?.innerText
        ..quantidade = _parseDouble(forDia.getElement('qtde')?.innerText);
      fornecimentoDiarioList.add(fornecimento);
    }

    final qTotMes = _parseDouble(cana.getElement('qTotMes')?.innerText);
    final qTotAnt = _parseDouble(cana.getElement('qTotAnt')?.innerText);
    final qTotGer = _parseDouble(cana.getElement('qTotGer')?.innerText);

    // Atribui totais a cada item (se necessário)
    for (final item in fornecimentoDiarioList) {
      item
        ..quantidadeTotalMes = qTotMes
        ..quantidadeTotalAnterior = qTotAnt
        ..quantidadeTotalGeral = qTotGer;
    }

    model.nfeCanaFornecimentoDiarioModelList = fornecimentoDiarioList;

    // Deduções da safra
    final deducoesList = <NfeCanaDeducoesSafraModel>[];
    final deducoes = cana.getElement('deduc');
    if (deducoes != null) {
      for (final ded in deducoes.findAllElements('deduc')) {
        final d = NfeCanaDeducoesSafraModel()
          ..decricao = ded.getElement('xDed')?.innerText
          ..valorDeducao = _parseDouble(ded.getElement('vDed')?.innerText)
          ..valorFornecimento = _parseDouble(ded.getElement('vFor')?.innerText)
          ..valorTotalDeducao = _parseDouble(ded.getElement('vTotDed')?.innerText)
          ..valorLiquidoFornecimento = _parseDouble(ded.getElement('vLiqFor')?.innerText);
        deducoesList.add(d);
      }
    }

    model.nfeCanaDeducoesSafraModelList = deducoesList;

    cabecalho.nfeCanaModel = model;
  }

  static void _parseResponsavelTecnico(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final respTecnico = infNFe.getElement('respTec');
    if (respTecnico == null) return;

    final model = NfeResponsavelTecnicoModel()
      ..cnpj = respTecnico.getElement('CNPJ')?.innerText
      ..contato = respTecnico.getElement('xContato')?.innerText
      ..email = respTecnico.getElement('email')?.innerText
      ..telefone = respTecnico.getElement('fone')?.innerText
      ..identificadorCsrt = respTecnico.getElement('idCSRT')?.innerText
      ..hashCsrt = respTecnico.getElement('hashCSRT')?.innerText;

    cabecalho.nfeResponsavelTecnicoModel = model;
  }

  static void _parseProcessoReferenciado(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final processList = infNFe.findElements('procRef');
    if (processList.isEmpty) return;

    final lista = <NfeProcessoReferenciadoModel>[];

    for (final proc in processList) {
      final model = NfeProcessoReferenciadoModel()
        ..identificador = proc.getElement('nProc')?.innerText
        ..origem = NfeProcessoReferenciadoDomain.getOrigem(proc.getElement('indProc')?.innerText);

      lista.add(model);
    }

    cabecalho.nfeProcessoReferenciadoModelList = lista;
  }

  static void _parseInformacaoPagamento(XmlElement infNFe, NfeCabecalhoModel cabecalho) {
    final pagList = infNFe.findAllElements('pag');
    if (pagList.isEmpty) return;

    final lista = <NfeInformacaoPagamentoModel>[];

    for (final pag in pagList) {
      final model = NfeInformacaoPagamentoModel()
        ..indicadorPagamento = NfeInformacaoPagamentoDomain.getIndicadorPagamento(pag.getElement('indPag')?.innerText)
        ..meioPagamento = NfeInformacaoPagamentoDomain.getMeioPagamento(pag.getElement('tPag')?.innerText)
        ..valor = _parseDouble(pag.getElement('vPag')?.innerText)
        ..tipoIntegracao = NfeInformacaoPagamentoDomain.getTipoIntegracao(pag.getElement('tpIntegra')?.innerText)
        ..cnpjOperadoraCartao = pag.getElement('CNPJ')?.innerText
        ..bandeira = NfeInformacaoPagamentoDomain.getBandeira(pag.getElement('tBand')?.innerText)
        ..numeroAutorizacao = pag.getElement('cAut')?.innerText
        ..troco = _parseDouble(pag.getElement('vTroco')?.innerText);

      lista.add(model);
    }

    cabecalho.nfeInformacaoPagamentoModelList = lista;
  }





  static double? _parseDouble(String? value) {
    return value != null ? double.tryParse(value.replaceAll(',', '.')) : null;
  }

  static int? _parseInt(String? value) {
    return value != null ? int.tryParse(value.replaceAll(',', '.')) : null;
  }

  static DateTime? _parseDateTime(String? value) {
    return value != null ? DateTime.tryParse(value) : null;
  }

  static String retornarCodigoIbgeUf(String? uf) {
    switch (uf) {
      case 'AC': return '12';
      case 'AL': return '27';
      case 'AP': return '16';
      case 'AM': return '13';
      case 'BA': return '29';
      case 'CE': return '23';
      case 'DF': return '53';
      case 'ES': return '32';
      case 'GO': return '52';
      case 'MA': return '21';
      case 'MT': return '51';
      case 'MS': return '50';
      case 'MG': return '31';
      case 'PA': return '15';
      case 'PB': return '25';
      case 'PR': return '41';
      case 'PE': return '26';
      case 'PI': return '22';
      case 'RJ': return '33';
      case 'RN': return '24';
      case 'RS': return '43';
      case 'RO': return '11';
      case 'RR': return '14';
      case 'SC': return '42';
      case 'SP': return '35';
      case 'SE': return '28';
      case 'TO': return '17';
      default: return '0'; // ou '' se preferir retornar vazio para inválido
    }
  }

  static String retornarUfIbgeCodigo(String? codigo) {
    switch (codigo) {
      case '12': return 'AC';
      case '27': return 'AL';
      case '16': return 'AP';
      case '13': return 'AM';
      case '29': return 'BA';
      case '23': return 'CE';
      case '53': return 'DF';
      case '32': return 'ES';
      case '52': return 'GO';
      case '21': return 'MA';
      case '51': return 'MT';
      case '50': return 'MS';
      case '31': return 'MG';
      case '15': return 'PA';
      case '25': return 'PB';
      case '41': return 'PR';
      case '26': return 'PE';
      case '22': return 'PI';
      case '33': return 'RJ';
      case '24': return 'RN';
      case '43': return 'RS';
      case '11': return 'RO';
      case '14': return 'RR';
      case '42': return 'SC';
      case '35': return 'SP';
      case '28': return 'SE';
      case '17': return 'TO';
      default: return ''; // Retorna vazio para códigos inválidos
    }
  }
}