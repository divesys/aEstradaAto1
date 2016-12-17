 #controla a caixa de ideias

onready var vibrarCaixaIdeias = false setget vibraCaixaIdeias, getVibrarCaixaIdeias #determina se a caixa de ideias deve vibrar, isso inicia o processo para abrir
onready var estadoCaixaIdeias = "fechada"

func vibraCaixaIdeias(boolValor):
	
	vibrarCaixaIdeias = boolValor

func getVibrarCaixaIdeias():
	
	return vibrarCaixaIdeias
	
func abreCaixaIdeias():
	
	#estadoCaixaIdeias = "abrindo" #quando existir animação de abrir
	estadoCaixaIdeias = "aberta"
	
func fechaCaixaIdeias():
	
	#estadoCaixaIdeias = "fechando" #quando existir animação de fechar
	estadoCaixaIdeias = "fechada"
	
func getEstado():
	
	return estadoCaixaIdeias