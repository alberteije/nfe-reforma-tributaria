class NfeDetalheImpostoIssqnDomain {
	NfeDetalheImpostoIssqnDomain._();

	static getIndicadorExigibilidadeIss(String? indicadorExigibilidadeIss) { 
		switch (indicadorExigibilidadeIss) { 
			case '': 
			case '1': 
				return '1=Exigível'; 
			case '2': 
				return '2=Não incidência'; 
			case '3': 
				return '3=Isenção'; 
			case '4': 
				return '4=Exportação'; 
			case '5': 
				return '5=Imunidade'; 
			case '6': 
				return '6=Exigibilidade Suspensa por Decisão Judicial'; 
			case '7': 
				return '7=Exigibilidade Suspensa por Processo Administrativo'; 
			default: 
				return null; 
		} 
	} 

	static setIndicadorExigibilidadeIss(String? indicadorExigibilidadeIss) { 
		switch (indicadorExigibilidadeIss) { 
			case '1=Exigível': 
				return '1'; 
			case '2=Não incidência': 
				return '2'; 
			case '3=Isenção': 
				return '3'; 
			case '4=Exportação': 
				return '4'; 
			case '5=Imunidade': 
				return '5'; 
			case '6=Exigibilidade Suspensa por Decisão Judicial': 
				return '6'; 
			case '7=Exigibilidade Suspensa por Processo Administrativo': 
				return '7'; 
			default: 
				return null; 
		} 
	}

	static getIndicadorIncentivoFiscal(String? indicadorIncentivoFiscal) { 
		switch (indicadorIncentivoFiscal) { 
			case '': 
			case '1': 
				return '1=Sim'; 
			case '2': 
				return '2=Não'; 
			default: 
				return null; 
		} 
	} 

	static setIndicadorIncentivoFiscal(String? indicadorIncentivoFiscal) { 
		switch (indicadorIncentivoFiscal) { 
			case '1=Sim': 
				return '1'; 
			case '2=Não': 
				return '2'; 
			default: 
				return null; 
		} 
	}

}