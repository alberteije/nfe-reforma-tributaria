class NfeDetEspecificoVeiculoDomain {
	NfeDetEspecificoVeiculoDomain._();

	static getTipoOperacao(String? tipoOperacao) { 
		switch (tipoOperacao) { 
			case '': 
			case '1': 
				return '1=Venda concessionária'; 
			case '2': 
				return '2=Faturamento direto para consumidor final'; 
			case '3': 
				return '3=Venda direta para grandes consumidores'; 
			case '0': 
				return '0=Outros'; 
			default: 
				return null; 
		} 
	} 

	static setTipoOperacao(String? tipoOperacao) { 
		switch (tipoOperacao) { 
			case '1=Venda concessionária': 
				return '1'; 
			case '2=Faturamento direto para consumidor final': 
				return '2'; 
			case '3=Venda direta para grandes consumidores': 
				return '3'; 
			case '0=Outros': 
				return '0'; 
			default: 
				return null; 
		} 
	}

	static getTipoCombustivel(String? tipoCombustivel) { 
		switch (tipoCombustivel) { 
			case '': 
			case '0': 
				return '01=Álcool'; 
			case '1': 
				return '02=Gasolina'; 
			case '2': 
				return '03=Diesel'; 
			case '3': 
				return '04=Gasogênio'; 
			case '4': 
				return '05=Gás Metano'; 
			case '5': 
				return '06=Elétrico/Fonte Interna'; 
			case '6': 
				return '07=Elétrico/Fonte Externa'; 
			case '7': 
				return '08=Gasolina/Gás Natural Combustível'; 
			case '8': 
				return '09=Álcool/Gás Natural Combustível'; 
			case '9': 
				return '10=Diesel/Gás Natural Combustível'; 
			case '10': 
				return '11=Vide/Campo/Observação'; 
			case '11': 
				return '12=Álcool/Gás Natural Veicular'; 
			case '12': 
				return '13=Gasolina/Gás Natural Veicular'; 
			case '13': 
				return '14=Diesel/Gás Natural Veicular'; 
			case '14': 
				return '15=Gás Natural Veicular'; 
			case '15': 
				return '16=Álcool/Gasolina'; 
			case '16': 
				return '17=Gasolina/Álcool/Gás Natural Veicular'; 
			case '17': 
				return '18=Gasolina/Elétrico'; 
			default: 
				return null; 
		} 
	} 

	static setTipoCombustivel(String? tipoCombustivel) { 
		switch (tipoCombustivel) { 
			case '01=Álcool': 
				return '0'; 
			case '02=Gasolina': 
				return '1'; 
			case '03=Diesel': 
				return '2'; 
			case '04=Gasogênio': 
				return '3'; 
			case '05=Gás Metano': 
				return '4'; 
			case '06=Elétrico/Fonte Interna': 
				return '5'; 
			case '07=Elétrico/Fonte Externa': 
				return '6'; 
			case '08=Gasolina/Gás Natural Combustível': 
				return '7'; 
			case '09=Álcool/Gás Natural Combustível': 
				return '8'; 
			case '10=Diesel/Gás Natural Combustível': 
				return '9'; 
			case '11=Vide/Campo/Observação': 
				return '10'; 
			case '12=Álcool/Gás Natural Veicular': 
				return '11'; 
			case '13=Gasolina/Gás Natural Veicular': 
				return '12'; 
			case '14=Diesel/Gás Natural Veicular': 
				return '13'; 
			case '15=Gás Natural Veicular': 
				return '14'; 
			case '16=Álcool/Gasolina': 
				return '15'; 
			case '17=Gasolina/Álcool/Gás Natural Veicular': 
				return '16'; 
			case '18=Gasolina/Elétrico': 
				return '17'; 
			default: 
				return null; 
		} 
	}

	static getTipoVeiculo(String? tipoVeiculo) { 
		switch (tipoVeiculo) { 
			case '': 
			case '0': 
				return '02=CICLOMOTO'; 
			case '1': 
				return '03=MOTONETA'; 
			case '2': 
				return '04=MOTOCICLO'; 
			case '3': 
				return '05=TRICICLO'; 
			case '4': 
				return '06=AUTOMÓVEL'; 
			case '5': 
				return '07=MICRO-ÔNIBUS'; 
			case '6': 
				return '08=ÔNIBUS'; 
			case '7': 
				return '10=REBOQUE'; 
			case '8': 
				return '11=SEMIRREBOQUE'; 
			case '9': 
				return '13=CAMIONETA'; 
			case '10': 
				return '14=CAMINHÃO'; 
			case '11': 
				return '17=CAMINHÃO TRATOR'; 
			case '12': 
				return '18=TRATOR RODAS'; 
			case '13': 
				return '19=TRATOR ESTEIRAS'; 
			case '14': 
				return '20=TRATOR MISTO'; 
			case '15': 
				return '21=QUADRICICLO'; 
			case '16': 
				return '22=ESP / ÔNIBUS'; 
			case '17': 
				return '23=CAMINHONETE'; 
			case '18': 
				return '24=CARGA/CAM'; 
			case '19': 
				return '25=UTILITÁRIO'; 
			case '20': 
				return '26=MOTOR-CASA '; 
			default: 
				return null; 
		} 
	} 

	static setTipoVeiculo(String? tipoVeiculo) { 
		switch (tipoVeiculo) { 
			case '02=CICLOMOTO': 
				return '0'; 
			case '03=MOTONETA': 
				return '1'; 
			case '04=MOTOCICLO': 
				return '2'; 
			case '05=TRICICLO': 
				return '3'; 
			case '06=AUTOMÓVEL': 
				return '4'; 
			case '07=MICRO-ÔNIBUS': 
				return '5'; 
			case '08=ÔNIBUS': 
				return '6'; 
			case '10=REBOQUE': 
				return '7'; 
			case '11=SEMIRREBOQUE': 
				return '8'; 
			case '13=CAMIONETA': 
				return '9'; 
			case '14=CAMINHÃO': 
				return '10'; 
			case '17=CAMINHÃO TRATOR': 
				return '11'; 
			case '18=TRATOR RODAS': 
				return '12'; 
			case '19=TRATOR ESTEIRAS': 
				return '13'; 
			case '20=TRATOR MISTO': 
				return '14'; 
			case '21=QUADRICICLO': 
				return '15'; 
			case '22=ESP / ÔNIBUS': 
				return '16'; 
			case '23=CAMINHONETE': 
				return '17'; 
			case '24=CARGA/CAM': 
				return '18'; 
			case '25=UTILITÁRIO': 
				return '19'; 
			case '26=MOTOR-CASA ': 
				return '20'; 
			default: 
				return null; 
		} 
	}

	static getEspecieVeiculo(String? especieVeiculo) { 
		switch (especieVeiculo) { 
			case '': 
			case '1': 
				return '1=PASSAGEIRO'; 
			case '2': 
				return '2=CARGA'; 
			case '3': 
				return '3=MISTO'; 
			case '4': 
				return '4=CORRIDA'; 
			case '5': 
				return '5=TRAÇÃO'; 
			case '6': 
				return '6=ESPECIAL'; 
			default: 
				return null; 
		} 
	} 

	static setEspecieVeiculo(String? especieVeiculo) { 
		switch (especieVeiculo) { 
			case '1=PASSAGEIRO': 
				return '1'; 
			case '2=CARGA': 
				return '2'; 
			case '3=MISTO': 
				return '3'; 
			case '4=CORRIDA': 
				return '4'; 
			case '5=TRAÇÃO': 
				return '5'; 
			case '6=ESPECIAL': 
				return '6'; 
			default: 
				return null; 
		} 
	}

	static getCondicaoVin(String? condicaoVin) { 
		switch (condicaoVin) { 
			case '': 
			case 'R': 
				return 'R=Remarcado'; 
			case 'N': 
				return 'N=Normal'; 
			default: 
				return null; 
		} 
	} 

	static setCondicaoVin(String? condicaoVin) { 
		switch (condicaoVin) { 
			case 'R=Remarcado': 
				return 'R'; 
			case 'N=Normal': 
				return 'N'; 
			default: 
				return null; 
		} 
	}

	static getCondicaoVeiculo(String? condicaoVeiculo) { 
		switch (condicaoVeiculo) { 
			case '': 
			case '1': 
				return '1=Acabado'; 
			case '2': 
				return '2=Inacabado'; 
			case '3': 
				return '3=Semiacabado'; 
			default: 
				return null; 
		} 
	} 

	static setCondicaoVeiculo(String? condicaoVeiculo) { 
		switch (condicaoVeiculo) { 
			case '1=Acabado': 
				return '1'; 
			case '2=Inacabado': 
				return '2'; 
			case '3=Semiacabado': 
				return '3'; 
			default: 
				return null; 
		} 
	}

	static getCodigoCorDenatran(String? codigoCorDenatran) { 
		switch (codigoCorDenatran) { 
			case '': 
			case '0': 
				return '01=AMARELO'; 
			case '1': 
				return '02=AZUL'; 
			case '2': 
				return '03=BEGE'; 
			case '3': 
				return '04=BRANCA'; 
			case '4': 
				return '05=CINZA'; 
			case '5': 
				return '06=DOURADA'; 
			case '6': 
				return '07=GRENÁ'; 
			case '7': 
				return '08=LARANJA'; 
			case '8': 
				return '09=MARROM'; 
			case '9': 
				return '10=PRATA'; 
			case '10': 
				return '11=PRETA'; 
			case '11': 
				return '12=ROSA'; 
			case '12': 
				return '13=ROXA'; 
			case '13': 
				return '14=VERDE'; 
			case '14': 
				return '15=VERMELHA'; 
			case '15': 
				return '16=FANTASIA'; 
			default: 
				return null; 
		} 
	} 

	static setCodigoCorDenatran(String? codigoCorDenatran) { 
		switch (codigoCorDenatran) { 
			case '01=AMARELO': 
				return '0'; 
			case '02=AZUL': 
				return '1'; 
			case '03=BEGE': 
				return '2'; 
			case '04=BRANCA': 
				return '3'; 
			case '05=CINZA': 
				return '4'; 
			case '06=DOURADA': 
				return '5'; 
			case '07=GRENÁ': 
				return '6'; 
			case '08=LARANJA': 
				return '7'; 
			case '09=MARROM': 
				return '8'; 
			case '10=PRATA': 
				return '9'; 
			case '11=PRETA': 
				return '10'; 
			case '12=ROSA': 
				return '11'; 
			case '13=ROXA': 
				return '12'; 
			case '14=VERDE': 
				return '13'; 
			case '15=VERMELHA': 
				return '14'; 
			case '16=FANTASIA': 
				return '15'; 
			default: 
				return null; 
		} 
	}

	static getRestricao(String? restricao) { 
		switch (restricao) { 
			case '': 
			case '0': 
				return '0=Não há'; 
			case '1': 
				return '1=Alienação Fiduciária'; 
			case '2': 
				return '2=Arrendamento Mercantil'; 
			case '3': 
				return '3=Reserva de Domínio'; 
			case '4': 
				return '4=Penhor de Veículos'; 
			case '9': 
				return '9=Outras'; 
			default: 
				return null; 
		} 
	} 

	static setRestricao(String? restricao) { 
		switch (restricao) { 
			case '0=Não há': 
				return '0'; 
			case '1=Alienação Fiduciária': 
				return '1'; 
			case '2=Arrendamento Mercantil': 
				return '2'; 
			case '3=Reserva de Domínio': 
				return '3'; 
			case '4=Penhor de Veículos': 
				return '4'; 
			case '9=Outras': 
				return '9'; 
			default: 
				return null; 
		} 
	}

}