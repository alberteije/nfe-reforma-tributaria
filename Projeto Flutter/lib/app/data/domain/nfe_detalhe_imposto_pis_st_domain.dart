class NfeDetalheImpostoPisStDomain {
	NfeDetalheImpostoPisStDomain._();

	static getPisStCompoeValorTotal(String? pisStCompoeValorTotal) { 
		switch (pisStCompoeValorTotal) { 
			case '': 
			case '0': 
				return '0=Valor do PISST não compõe o valor total da NF-e'; 
			case '1': 
				return '1=Valor do PISST compõe o valor total da NF-e'; 
			default: 
				return null; 
		} 
	} 

	static setPisStCompoeValorTotal(String? pisStCompoeValorTotal) { 
		switch (pisStCompoeValorTotal) { 
			case '0=Valor do PISST não compõe o valor total da NF-e': 
				return '0'; 
			case '1=Valor do PISST compõe o valor total da NF-e': 
				return '1'; 
			default: 
				return null; 
		} 
	}

}