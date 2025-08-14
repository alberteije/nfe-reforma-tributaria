class NfeNfReferenciadaDomain {
	NfeNfReferenciadaDomain._();

	static getModelo(String? modelo) { 
		switch (modelo) { 
			case '': 
			case '01': 
				return '01'; 
			case '02': 
				return '02'; 
			default: 
				return null; 
		} 
	} 

	static setModelo(String? modelo) { 
		switch (modelo) { 
			case '01': 
				return '01'; 
			case '02': 
				return '02'; 
			default: 
				return null; 
		} 
	}

}