class NfeConfiguracaoDomain {
	NfeConfiguracaoDomain._();

	static getSalvarXml(String? salvarXml) { 
		switch (salvarXml) { 
			case '': 
			case 'S': 
				return 'Sim'; 
			case 'N': 
				return 'Não'; 
			default: 
				return null; 
		} 
	} 

	static setSalvarXml(String? salvarXml) { 
		switch (salvarXml) { 
			case 'Sim': 
				return 'S'; 
			case 'Não': 
				return 'N'; 
			default: 
				return null; 
		} 
	}

	static getWebserviceUf(String? webserviceUf) { 
		switch (webserviceUf) { 
			case '': 
			case 'AC': 
				return 'AC'; 
			case 'AL': 
				return 'AL'; 
			case 'AP': 
				return 'AP'; 
			case 'AM': 
				return 'AM'; 
			case 'BA': 
				return 'BA'; 
			case 'CE': 
				return 'CE'; 
			case 'DF': 
				return 'DF'; 
			case 'ES': 
				return 'ES'; 
			case 'GO': 
				return 'GO'; 
			case 'MA': 
				return 'MA'; 
			case 'MT': 
				return 'MT'; 
			case 'MS': 
				return 'MS'; 
			case 'MG': 
				return 'MG'; 
			case 'PA': 
				return 'PA'; 
			case 'PB': 
				return 'PB'; 
			case 'PR': 
				return 'PR'; 
			case 'PE': 
				return 'PE'; 
			case 'PI': 
				return 'PI'; 
			case 'RJ': 
				return 'RJ'; 
			case 'RN': 
				return 'RN'; 
			case 'RS': 
				return 'RS'; 
			case 'RO': 
				return 'RO'; 
			case 'RR': 
				return 'RR'; 
			case 'SC': 
				return 'SC'; 
			case 'SP': 
				return 'SP'; 
			case 'SE': 
				return 'SE'; 
			case 'TO': 
				return 'TO'; 
			default: 
				return null; 
		} 
	} 

	static setWebserviceUf(String? webserviceUf) { 
		switch (webserviceUf) { 
			case 'AC': 
				return 'AC'; 
			case 'AL': 
				return 'AL'; 
			case 'AP': 
				return 'AP'; 
			case 'AM': 
				return 'AM'; 
			case 'BA': 
				return 'BA'; 
			case 'CE': 
				return 'CE'; 
			case 'DF': 
				return 'DF'; 
			case 'ES': 
				return 'ES'; 
			case 'GO': 
				return 'GO'; 
			case 'MA': 
				return 'MA'; 
			case 'MT': 
				return 'MT'; 
			case 'MS': 
				return 'MS'; 
			case 'MG': 
				return 'MG'; 
			case 'PA': 
				return 'PA'; 
			case 'PB': 
				return 'PB'; 
			case 'PR': 
				return 'PR'; 
			case 'PE': 
				return 'PE'; 
			case 'PI': 
				return 'PI'; 
			case 'RJ': 
				return 'RJ'; 
			case 'RN': 
				return 'RN'; 
			case 'RS': 
				return 'RS'; 
			case 'RO': 
				return 'RO'; 
			case 'RR': 
				return 'RR'; 
			case 'SC': 
				return 'SC'; 
			case 'SP': 
				return 'SP'; 
			case 'SE': 
				return 'SE'; 
			case 'TO': 
				return 'TO'; 
			default: 
				return null; 
		} 
	}

	static getWebserviceVisualizar(String? webserviceVisualizar) { 
		switch (webserviceVisualizar) { 
			case '': 
			case 'S': 
				return 'Sim'; 
			case 'N': 
				return 'Não'; 
			default: 
				return null; 
		} 
	} 

	static setWebserviceVisualizar(String? webserviceVisualizar) { 
		switch (webserviceVisualizar) { 
			case 'Sim': 
				return 'S'; 
			case 'Não': 
				return 'N'; 
			default: 
				return null; 
		} 
	}

	static getEmailAutenticaSsl(String? emailAutenticaSsl) { 
		switch (emailAutenticaSsl) { 
			case '': 
			case 'S': 
				return 'Sim'; 
			case 'N': 
				return 'Não'; 
			default: 
				return null; 
		} 
	} 

	static setEmailAutenticaSsl(String? emailAutenticaSsl) { 
		switch (emailAutenticaSsl) { 
			case 'Sim': 
				return 'S'; 
			case 'Não': 
				return 'N'; 
			default: 
				return null; 
		} 
	}

}