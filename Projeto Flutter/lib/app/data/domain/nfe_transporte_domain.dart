class NfeTransporteDomain {
	NfeTransporteDomain._();

	static getModalidadeFrete(String? modalidadeFrete) { 
		switch (modalidadeFrete) { 
			case '': 
			case '0': 
				return '0=Contratação do Frete por conta do Remetente (CIF)'; 
			case '1': 
				return '1=Contratação do Frete por conta do Destinatário (FOB)'; 
			case '2': 
				return '2=Contratação do Frete por conta de Terceiros'; 
			case '3': 
				return '3=Transporte Próprio por conta do Remetente'; 
			case '4': 
				return '4=Transporte Próprio por conta do Destinatário'; 
			case '9': 
				return '9=Sem Ocorrência de Transporte'; 
			default: 
				return null; 
		} 
	} 

	static setModalidadeFrete(String? modalidadeFrete) { 
		switch (modalidadeFrete) { 
			case '0=Contratação do Frete por conta do Remetente (CIF)': 
				return '0'; 
			case '1=Contratação do Frete por conta do Destinatário (FOB)': 
				return '1'; 
			case '2=Contratação do Frete por conta de Terceiros': 
				return '2'; 
			case '3=Transporte Próprio por conta do Remetente': 
				return '3'; 
			case '4=Transporte Próprio por conta do Destinatário': 
				return '4'; 
			case '9=Sem Ocorrência de Transporte': 
				return '9'; 
			default: 
				return null; 
		} 
	}

	static getUf(String? uf) { 
		switch (uf) { 
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

	static setUf(String? uf) { 
		switch (uf) { 
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

	static getUfVeiculo(String? ufVeiculo) { 
		switch (ufVeiculo) { 
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

	static setUfVeiculo(String? ufVeiculo) { 
		switch (ufVeiculo) { 
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