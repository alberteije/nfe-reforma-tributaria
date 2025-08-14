class NfeCupomFiscalReferenciadoDomain {
	NfeCupomFiscalReferenciadoDomain._();

	static getModeloDocumentoFiscal(String? modeloDocumentoFiscal) { 
		switch (modeloDocumentoFiscal) { 
			case '': 
			case '0': 
				return '2B=Cupom Fiscal emitido por máquina registradora (não ECF)'; 
			case '1': 
				return '2C=Cupom Fiscal PDV'; 
			case '2': 
				return '2D=Cupom Fiscal (emitido por ECF)'; 
			default: 
				return null; 
		} 
	} 

	static setModeloDocumentoFiscal(String? modeloDocumentoFiscal) { 
		switch (modeloDocumentoFiscal) { 
			case '2B=Cupom Fiscal emitido por máquina registradora (não ECF)': 
				return '0'; 
			case '2C=Cupom Fiscal PDV': 
				return '1'; 
			case '2D=Cupom Fiscal (emitido por ECF)': 
				return '2'; 
			default: 
				return null; 
		} 
	}

}