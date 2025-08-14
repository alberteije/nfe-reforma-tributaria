class NfeDetalheCreditoPresumidoCbsDomain {
	NfeDetalheCreditoPresumidoCbsDomain._();

	static getCodigoClassificacao(String? codigoClassificacao) { 
		switch (codigoClassificacao) { 
			case '': 
			case '1': 
				return '1-Aquisição de Produtor Rural não contribuinte'; 
			case '2': 
				return '2-Tomador de serviço de transporte de TAC PF não contrib'; 
			case '3': 
				return '3-Aquisição de pessoa física com destino a reciclagem'; 
			case '4': 
				return '4-Aquisição de bens móveis de PF não contrib. para revenda (veículos / brechó)'; 
			case '5': 
				return '5-Regime opcional para cooperativa'; 
			default: 
				return null; 
		} 
	} 

	static setCodigoClassificacao(String? codigoClassificacao) { 
		switch (codigoClassificacao) { 
			case '1-Aquisição de Produtor Rural não contribuinte': 
				return '1'; 
			case '2-Tomador de serviço de transporte de TAC PF não contrib': 
				return '2'; 
			case '3-Aquisição de pessoa física com destino a reciclagem': 
				return '3'; 
			case '4-Aquisição de bens móveis de PF não contrib. para revenda (veículos / brechó)': 
				return '4'; 
			case '5-Regime opcional para cooperativa': 
				return '5'; 
			default: 
				return null; 
		} 
	}

}