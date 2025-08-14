class NfeCompraGovernamentalDomain {
	NfeCompraGovernamentalDomain._();

	static getTipoEnte(String? tipoEnte) { 
		switch (tipoEnte) { 
			case '': 
			case '1': 
				return '1=União'; 
			case '2': 
				return '2=Estado'; 
			case '3': 
				return '3=Distrito Federal'; 
			case '4': 
				return '4=Município'; 
			default: 
				return null; 
		} 
	} 

	static setTipoEnte(String? tipoEnte) { 
		switch (tipoEnte) { 
			case '1=União': 
				return '1'; 
			case '2=Estado': 
				return '2'; 
			case '3=Distrito Federal': 
				return '3'; 
			case '4=Município': 
				return '4'; 
			default: 
				return null; 
		} 
	}

	static getTipoOperacao(String? tipoOperacao) { 
		switch (tipoOperacao) { 
			case '': 
			case '1': 
				return '1=Fornecimento'; 
			case '2': 
				return '2=Recebimento do pagamento'; 
			case 'c': 
				return 'conforme fato gerador do IBS/CBS definido no Art. 10 § 2º'; 
			default: 
				return null; 
		} 
	} 

	static setTipoOperacao(String? tipoOperacao) { 
		switch (tipoOperacao) { 
			case '1=Fornecimento': 
				return '1'; 
			case '2=Recebimento do pagamento': 
				return '2'; 
			case 'conforme fato gerador do IBS/CBS definido no Art. 10 § 2º': 
				return 'c'; 
			default: 
				return null; 
		} 
	}

}