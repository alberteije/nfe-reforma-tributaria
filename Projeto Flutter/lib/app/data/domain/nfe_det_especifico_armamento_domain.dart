class NfeDetEspecificoArmamentoDomain {
	NfeDetEspecificoArmamentoDomain._();

	static getTipoArma(String? tipoArma) { 
		switch (tipoArma) { 
			case '': 
			case '0': 
				return '0=Uso permitido'; 
			case '1': 
				return '1=Uso restrito'; 
			default: 
				return null; 
		} 
	} 

	static setTipoArma(String? tipoArma) { 
		switch (tipoArma) { 
			case '0=Uso permitido': 
				return '0'; 
			case '1=Uso restrito': 
				return '1'; 
			default: 
				return null; 
		} 
	}

}