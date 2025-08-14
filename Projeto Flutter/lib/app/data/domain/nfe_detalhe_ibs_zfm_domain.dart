class NfeDetalheIbsZfmDomain {
	NfeDetalheIbsZfmDomain._();

	static getTipoCredito(String? tipoCredito) { 
		switch (tipoCredito) { 
			case '': 
			case '0': 
				return '0 - Sem Crédito Presumido'; 
			case '1': 
				return '1 - Bens de consumo final (55%)'; 
			case '2': 
				return '2 - Bens de capital (75%)'; 
			case '3': 
				return '3 - Bens intermediários (90.25%)'; 
			case '4': 
				return '4 - Bens de informática e outros definidos em legislação (100%)'; 
			default: 
				return null; 
		} 
	} 

	static setTipoCredito(String? tipoCredito) { 
		switch (tipoCredito) { 
			case '0 - Sem Crédito Presumido': 
				return '0'; 
			case '1 - Bens de consumo final (55%)': 
				return '1'; 
			case '2 - Bens de capital (75%)': 
				return '2'; 
			case '3 - Bens intermediários (90.25%)': 
				return '3'; 
			case '4 - Bens de informática e outros definidos em legislação (100%)': 
				return '4'; 
			default: 
				return null; 
		} 
	}

}