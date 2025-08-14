class NfeDetCombustivelOrigemDomain {
	NfeDetCombustivelOrigemDomain._();

	static getIndicadorImportacao(String? indicadorImportacao) { 
		switch (indicadorImportacao) { 
			case '': 
			case '0': 
				return '0=Nacional'; 
			case '1': 
				return '1=Importado'; 
			default: 
				return null; 
		} 
	} 

	static setIndicadorImportacao(String? indicadorImportacao) { 
		switch (indicadorImportacao) { 
			case '0=Nacional': 
				return '0'; 
			case '1=Importado': 
				return '1'; 
			default: 
				return null; 
		} 
	}

}