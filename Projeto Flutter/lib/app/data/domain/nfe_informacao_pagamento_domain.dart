class NfeInformacaoPagamentoDomain {
	NfeInformacaoPagamentoDomain._();

	static getIndicadorPagamento(String? indicadorPagamento) { 
		switch (indicadorPagamento) { 
			case '': 
			case '0': 
				return '0= Pagamento à Vista'; 
			case '1': 
				return '1= Pagamento à Prazo'; 
			default: 
				return null; 
		} 
	} 

	static setIndicadorPagamento(String? indicadorPagamento) { 
		switch (indicadorPagamento) { 
			case '0= Pagamento à Vista': 
				return '0'; 
			case '1= Pagamento à Prazo': 
				return '1'; 
			default: 
				return null; 
		} 
	}

	static getMeioPagamento(String? meioPagamento) { 
		switch (meioPagamento) { 
			case '': 
			case '0': 
				return '01=Dinheiro'; 
			case '1': 
				return '02=Cheque'; 
			case '2': 
				return '03=Cartão de Crédito'; 
			case '3': 
				return '04=Cartão de Débito'; 
			case '4': 
				return '05=Crédito Loja'; 
			case '5': 
				return '10=Vale Alimentação'; 
			case '6': 
				return '11=Vale Refeição'; 
			case '7': 
				return '12=Vale Presente'; 
			case '8': 
				return '13=Vale Combustível'; 
			case '9': 
				return '15=Boleto Bancário'; 
			case '10': 
				return '16=Depósito Bancário'; 
			case '11': 
				return '17=Pagamento Instantâneo (PIX)'; 
			case '12': 
				return '18=Transferência bancária - Carteira Digital'; 
			case '13': 
				return '19=Programa de fidelidade - Cashback - Crédito Virtual'; 
			case '14': 
				return '90=Sem pagamento'; 
			case '15': 
				return '99=Outros'; 
			default: 
				return null; 
		} 
	} 

	static setMeioPagamento(String? meioPagamento) { 
		switch (meioPagamento) { 
			case '01=Dinheiro': 
				return '0'; 
			case '02=Cheque': 
				return '1'; 
			case '03=Cartão de Crédito': 
				return '2'; 
			case '04=Cartão de Débito': 
				return '3'; 
			case '05=Crédito Loja': 
				return '4'; 
			case '10=Vale Alimentação': 
				return '5'; 
			case '11=Vale Refeição': 
				return '6'; 
			case '12=Vale Presente': 
				return '7'; 
			case '13=Vale Combustível': 
				return '8'; 
			case '15=Boleto Bancário': 
				return '9'; 
			case '16=Depósito Bancário': 
				return '10'; 
			case '17=Pagamento Instantâneo (PIX)': 
				return '11'; 
			case '18=Transferência bancária - Carteira Digital': 
				return '12'; 
			case '19=Programa de fidelidade - Cashback - Crédito Virtual': 
				return '13'; 
			case '90=Sem pagamento': 
				return '14'; 
			case '99=Outros': 
				return '15'; 
			default: 
				return null; 
		} 
	}

	static getTipoIntegracao(String? tipoIntegracao) { 
		switch (tipoIntegracao) { 
			case '': 
			case '1': 
				return '1=Pagamento integrado'; 
			case '2': 
				return '2=Pagamento não integrado'; 
			default: 
				return null; 
		} 
	} 

	static setTipoIntegracao(String? tipoIntegracao) { 
		switch (tipoIntegracao) { 
			case '1=Pagamento integrado': 
				return '1'; 
			case '2=Pagamento não integrado': 
				return '2'; 
			default: 
				return null; 
		} 
	}

	static getBandeira(String? bandeira) { 
		switch (bandeira) { 
			case '': 
			case '0': 
				return '01=Visa'; 
			case '1': 
				return '02=Mastercard'; 
			case '2': 
				return '03=American Express'; 
			case '3': 
				return '04=Sorocred'; 
			case '4': 
				return '05=Diners Club'; 
			case '5': 
				return '06=Elo'; 
			case '6': 
				return '07=Hipercard'; 
			case '7': 
				return '08=Aura'; 
			case '8': 
				return '09=Cabal'; 
			case '9': 
				return '99=Outros'; 
			default: 
				return null; 
		} 
	} 

	static setBandeira(String? bandeira) { 
		switch (bandeira) { 
			case '01=Visa': 
				return '0'; 
			case '02=Mastercard': 
				return '1'; 
			case '03=American Express': 
				return '2'; 
			case '04=Sorocred': 
				return '3'; 
			case '05=Diners Club': 
				return '4'; 
			case '06=Elo': 
				return '5'; 
			case '07=Hipercard': 
				return '6'; 
			case '08=Aura': 
				return '7'; 
			case '09=Cabal': 
				return '8'; 
			case '99=Outros': 
				return '9'; 
			default: 
				return null; 
		} 
	}

}