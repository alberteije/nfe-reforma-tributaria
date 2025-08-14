class NfeProcessoReferenciadoDomain {
	NfeProcessoReferenciadoDomain._();

	static getOrigem(String? origem) { 
		switch (origem) { 
			case '': 
			case '0': 
				return '0=SEFAZ'; 
			case '1': 
				return '1=Justiça Federal'; 
			case '2': 
				return '2=Justiça Estadual'; 
			case '3': 
				return '3=Secex/RFB'; 
			case '4': 
				return '4=CONFAZ'; 
			case '9': 
				return '9=Outros'; 
			default: 
				return null; 
		} 
	} 

	static setOrigem(String? origem) { 
		switch (origem) { 
			case '0=SEFAZ': 
				return '0'; 
			case '1=Justiça Federal': 
				return '1'; 
			case '2=Justiça Estadual': 
				return '2'; 
			case '3=Secex/RFB': 
				return '3'; 
			case '4=CONFAZ': 
				return '4'; 
			case '9=Outros': 
				return '9'; 
			default: 
				return null; 
		} 
	}

	static getTipoAtoConcessorio(String? tipoAtoConcessorio) { 
		switch (tipoAtoConcessorio) { 
			case '': 
			case '0': 
				return '08=Termo de Acordo'; 
			case '1': 
				return '10=Regime Especial'; 
			case '2': 
				return '12=Autorização específica'; 
			case '3': 
				return '14=Ajuste SINIEF'; 
			case '4': 
				return '15=Convênio ICMS'; 
			default: 
				return null; 
		} 
	} 

	static setTipoAtoConcessorio(String? tipoAtoConcessorio) { 
		switch (tipoAtoConcessorio) { 
			case '08=Termo de Acordo': 
				return '0'; 
			case '10=Regime Especial': 
				return '1'; 
			case '12=Autorização específica': 
				return '2'; 
			case '14=Ajuste SINIEF': 
				return '3'; 
			case '15=Convênio ICMS': 
				return '4'; 
			default: 
				return null; 
		} 
	}

}