class NfeDeclaracaoImportacaoDomain {
	NfeDeclaracaoImportacaoDomain._();

	static getUfDesembaraco(String? ufDesembaraco) { 
		switch (ufDesembaraco) { 
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

	static setUfDesembaraco(String? ufDesembaraco) { 
		switch (ufDesembaraco) { 
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

	static getViaTransporte(String? viaTransporte) { 
		switch (viaTransporte) { 
			case '': 
			case '0': 
				return '1=Marítima'; 
			case '1': 
				return '2=Fluvial'; 
			case '2': 
				return '3=Lacustre'; 
			case '3': 
				return '4=Aérea'; 
			case '4': 
				return '5=Postal'; 
			case '5': 
				return '6=Ferroviária'; 
			case '6': 
				return '7=Rodoviária'; 
			case '7': 
				return '8=Conduto/Rede Transmissão'; 
			case '8': 
				return '9=Meios Próprios'; 
			case '9': 
				return '10=Entrada/Saída Ficta'; 
			case '10': 
				return '11=Courier'; 
			case '11': 
				return '12=Em mãos'; 
			case '12': 
				return '13=Por reboque '; 
			default: 
				return null; 
		} 
	} 

	static setViaTransporte(String? viaTransporte) { 
		switch (viaTransporte) { 
			case '1=Marítima': 
				return '0'; 
			case '2=Fluvial': 
				return '1'; 
			case '3=Lacustre': 
				return '2'; 
			case '4=Aérea': 
				return '3'; 
			case '5=Postal': 
				return '4'; 
			case '6=Ferroviária': 
				return '5'; 
			case '7=Rodoviária': 
				return '6'; 
			case '8=Conduto/Rede Transmissão': 
				return '7'; 
			case '9=Meios Próprios': 
				return '8'; 
			case '10=Entrada/Saída Ficta': 
				return '9'; 
			case '11=Courier': 
				return '10'; 
			case '12=Em mãos': 
				return '11'; 
			case '13=Por reboque ': 
				return '12'; 
			default: 
				return null; 
		} 
	}

	static getFormaIntermediacao(String? formaIntermediacao) { 
		switch (formaIntermediacao) { 
			case '': 
			case '1': 
				return '1=Importação por conta própria'; 
			case '2': 
				return '2=Importação por conta e ordem'; 
			case '3': 
				return '3=Importação por encomenda'; 
			default: 
				return null; 
		} 
	} 

	static setFormaIntermediacao(String? formaIntermediacao) { 
		switch (formaIntermediacao) { 
			case '1=Importação por conta própria': 
				return '1'; 
			case '2=Importação por conta e ordem': 
				return '2'; 
			case '3=Importação por encomenda': 
				return '3'; 
			default: 
				return null; 
		} 
	}

	static getUfTerceiro(String? ufTerceiro) { 
		switch (ufTerceiro) { 
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

	static setUfTerceiro(String? ufTerceiro) { 
		switch (ufTerceiro) { 
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

}