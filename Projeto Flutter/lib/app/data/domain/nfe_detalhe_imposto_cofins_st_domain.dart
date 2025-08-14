class NfeDetalheImpostoCofinsStDomain {
	NfeDetalheImpostoCofinsStDomain._();

	static getCofinsStCompoeValorTotal(String? cofinsStCompoeValorTotal) { 
		switch (cofinsStCompoeValorTotal) { 
			case '': 
			case '0': 
				return '0=Valor da COFINSST não compõe o valor total da NF-e'; 
			case '1': 
				return '1=Valor da COFINSST compõe o valor total da NF-e '; 
			default: 
				return null; 
		} 
	} 

	static setCofinsStCompoeValorTotal(String? cofinsStCompoeValorTotal) { 
		switch (cofinsStCompoeValorTotal) { 
			case '0=Valor da COFINSST não compõe o valor total da NF-e': 
				return '0'; 
			case '1=Valor da COFINSST compõe o valor total da NF-e ': 
				return '1'; 
			default: 
				return null; 
		} 
	}

}