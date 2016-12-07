 #controla a caixa de ideias

onready var vibrarCaixaIdeias = false setget vibraCaixaIdeias, getVibrarCaixaIdeias #determina se a caixa de ideias deve vibrar, isso inicia o processo para abrir

func vibraCaixaIdeias(boolValor):
	
	vibrarCaixaIdeias = boolValor

func getVibrarCaixaIdeias():
	
	return vibrarCaixaIdeias
