class NfeProdRuralReferenciadaDomain {
	NfeProdRuralReferenciadaDomain._();

	static getModelo(String? modelo) { 
		switch (modelo) { 
			case '': 
			case '04': 
				return '04'; 
			default: 
				return null; 
		} 
	} 

	static setModelo(String? modelo) { 
		switch (modelo) { 
			case '04': 
				return '04'; 
			default: 
				return null; 
		} 
	}

}