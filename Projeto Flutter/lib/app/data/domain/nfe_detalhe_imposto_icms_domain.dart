class NfeDetalheImpostoIcmsDomain {
	NfeDetalheImpostoIcmsDomain._();

	static getOrigemMercadoria(String? origemMercadoria) { 
		switch (origemMercadoria) { 
			case '': 
			case '0': 
				return '0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8'; 
			case '1': 
				return '1 - Estrangeira - Importação direta exceto a indicada no código 6'; 
			case '2': 
				return '2 - Estrangeira - Adquirida no mercado interno exceto a indicada no código 7'; 
			case '3': 
				return '3 - Nacional - mercadoria ou bem com Conteúdo de Importação superior a 40% e inferior ou igual a 70%'; 
			case '4': 
				return '4 - Nacional - cuja produção tenha sido feita em conformidade com os processos produtivos básicos...'; 
			case '5': 
				return '5 - Nacional - mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%'; 
			case '6': 
				return '6 - Estrangeira - Importação direta sem similar nacional constante em lista da CAMEX e gás natural'; 
			case '7': 
				return '7 - Estrangeira - Adquirida no mercado interno sem similar nacional constante lista CAMEX e gás natural'; 
			case '8': 
				return '8 - Nacional - mercadoria ou bem com Conteúdo de Importação superior a 70%'; 
			default: 
				return null; 
		} 
	} 

	static setOrigemMercadoria(String? origemMercadoria) { 
		switch (origemMercadoria) { 
			case '0 - Nacional - exceto as indicadas nos códigos 3 | 4 | 5 e 8': 
				return '0'; 
			case '1 - Estrangeira - Importação direta exceto a indicada no código 6': 
				return '1'; 
			case '2 - Estrangeira - Adquirida no mercado interno exceto a indicada no código 7': 
				return '2'; 
			case '3 - Nacional - mercadoria ou bem com Conteúdo de Importação superior a 40% e inferior ou igual a 70%': 
				return '3'; 
			case '4 - Nacional - cuja produção tenha sido feita em conformidade com os processos produtivos básicos...': 
				return '4'; 
			case '5 - Nacional - mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%': 
				return '5'; 
			case '6 - Estrangeira - Importação direta sem similar nacional constante em lista da CAMEX e gás natural': 
				return '6'; 
			case '7 - Estrangeira - Adquirida no mercado interno sem similar nacional constante lista CAMEX e gás natural': 
				return '7'; 
			case '8 - Nacional - mercadoria ou bem com Conteúdo de Importação superior a 70%': 
				return '8'; 
			default: 
				return null; 
		} 
	}

	static getModalidadeBcIcms(String? modalidadeBcIcms) { 
		switch (modalidadeBcIcms) { 
			case '': 
			case '0': 
				return '0=Margem Valor Agregado (%)'; 
			case '1': 
				return '1=Pauta (Valor)'; 
			case '2': 
				return '2=Preço Tabelado Máx. (valor)'; 
			case '3': 
				return '3=Valor da operação'; 
			default: 
				return null; 
		} 
	} 

	static setModalidadeBcIcms(String? modalidadeBcIcms) { 
		switch (modalidadeBcIcms) { 
			case '0=Margem Valor Agregado (%)': 
				return '0'; 
			case '1=Pauta (Valor)': 
				return '1'; 
			case '2=Preço Tabelado Máx. (valor)': 
				return '2'; 
			case '3=Valor da operação': 
				return '3'; 
			default: 
				return null; 
		} 
	}

	static getModalidadeBcIcmsSt(String? modalidadeBcIcmsSt) { 
		switch (modalidadeBcIcmsSt) { 
			case '': 
			case '0': 
				return '0=Preço tabelado ou máximo sugerido'; 
			case '1': 
				return '1=Lista Negativa (valor)'; 
			case '2': 
				return '2=Lista Positiva (valor)'; 
			case '3': 
				return '3=Lista Neutra (valor)'; 
			case '4': 
				return '4=Margem Valor Agregado (%)'; 
			case '5': 
				return '5=Pauta (valor)'; 
			case '6': 
				return '6=Valor da operação'; 
			default: 
				return null; 
		} 
	} 

	static setModalidadeBcIcmsSt(String? modalidadeBcIcmsSt) { 
		switch (modalidadeBcIcmsSt) { 
			case '0=Preço tabelado ou máximo sugerido': 
				return '0'; 
			case '1=Lista Negativa (valor)': 
				return '1'; 
			case '2=Lista Positiva (valor)': 
				return '2'; 
			case '3=Lista Neutra (valor)': 
				return '3'; 
			case '4=Margem Valor Agregado (%)': 
				return '4'; 
			case '5=Pauta (valor)': 
				return '5'; 
			case '6=Valor da operação': 
				return '6'; 
			default: 
				return null; 
		} 
	}

	static getUfSt(String? ufSt) { 
		switch (ufSt) { 
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

	static setUfSt(String? ufSt) { 
		switch (ufSt) { 
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

	static getDesoneradoDeduz(String? desoneradoDeduz) { 
		switch (desoneradoDeduz) { 
			case '': 
			case '0': 
				return '0-Não'; 
			case '1': 
				return '1-Sim'; 
			default: 
				return null; 
		} 
	} 

	static setDesoneradoDeduz(String? desoneradoDeduz) { 
		switch (desoneradoDeduz) { 
			case '0-Não': 
				return '0'; 
			case '1-Sim': 
				return '1'; 
			default: 
				return null; 
		} 
	}

	static getMotivoDesoneracaoIcmsSt(String? motivoDesoneracaoIcmsSt) { 
		switch (motivoDesoneracaoIcmsSt) { 
			case '': 
			case '0': 
				return '03=Uso na agropecuária'; 
			case '1': 
				return '09=Outros'; 
			case '2': 
				return '12=Órgão de fomento e desenvolvimento agropecuário '; 
			default: 
				return null; 
		} 
	} 

	static setMotivoDesoneracaoIcmsSt(String? motivoDesoneracaoIcmsSt) { 
		switch (motivoDesoneracaoIcmsSt) { 
			case '03=Uso na agropecuária': 
				return '0'; 
			case '09=Outros': 
				return '1'; 
			case '12=Órgão de fomento e desenvolvimento agropecuário ': 
				return '2'; 
			default: 
				return null; 
		} 
	}

	static getMotivoReducaoAdRem(String? motivoReducaoAdRem) { 
		switch (motivoReducaoAdRem) { 
			case '': 
			case '1': 
				return '1= Transporte coletivo de passageiros'; 
			case '9': 
				return '9=Outros'; 
			default: 
				return null; 
		} 
	} 

	static setMotivoReducaoAdRem(String? motivoReducaoAdRem) { 
		switch (motivoReducaoAdRem) { 
			case '1= Transporte coletivo de passageiros': 
				return '1'; 
			case '9=Outros': 
				return '9'; 
			default: 
				return null; 
		} 
	}

}