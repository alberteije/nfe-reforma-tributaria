class NfeInformacaoAgropecuarioDomain {
	NfeInformacaoAgropecuarioDomain._();

	static getGuiaTipo(String? guiaTipo) { 
		switch (guiaTipo) { 
			case '': 
			case '1': 
				return '1 - GTA - Guia de Trânsito Animal'; 
			case '2': 
				return '2 - TTA - Termo de Trânsito Animal'; 
			case '3': 
				return '3 - DTA - Documento de Transferência Animal'; 
			case '4': 
				return '4 - ATV - Autorização de Trânsito Vegetal'; 
			case '5': 
				return '5 - PTV - Permissão de Trânsito Vegetal'; 
			case '6': 
				return '6 - GTV - Guia de Trânsito Vegetal'; 
			case '7': 
				return '7 - Guia Florestal (DOF'; 
			case 'S': 
				return 'SisFlora - PA e MT ou SIAM - MG)'; 
			default: 
				return null; 
		} 
	} 

	static setGuiaTipo(String? guiaTipo) { 
		switch (guiaTipo) { 
			case '1 - GTA - Guia de Trânsito Animal': 
				return '1'; 
			case '2 - TTA - Termo de Trânsito Animal': 
				return '2'; 
			case '3 - DTA - Documento de Transferência Animal': 
				return '3'; 
			case '4 - ATV - Autorização de Trânsito Vegetal': 
				return '4'; 
			case '5 - PTV - Permissão de Trânsito Vegetal': 
				return '5'; 
			case '6 - GTV - Guia de Trânsito Vegetal': 
				return '6'; 
			case '7 - Guia Florestal (DOF': 
				return '7'; 
			case 'SisFlora - PA e MT ou SIAM - MG)': 
				return 'S'; 
			default: 
				return null; 
		} 
	}

}