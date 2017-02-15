 #controla a caixa de ideias

var iniciouCliques = false

onready var vibrarCaixaIdeias = false setget vibraCaixaIdeias, getVibrarCaixaIdeias #determina se a caixa de ideias deve vibrar, isso inicia o processo para abrir
onready var estadoCaixaIdeias = "fechada"

func vibraCaixaIdeias(boolValor):
	
	vibrarCaixaIdeias = boolValor

func getVibrarCaixaIdeias():
	
	return vibrarCaixaIdeias
	
func abreCaixaIdeias():
	
	if(controleFluxoHistoria.getIndiceParte() == 65): #sinaliza que a caixa de ideias foi aberta
		
		controleFluxoHistoria.acrescentaIndiceParte(get_name())
	
	#estadoCaixaIdeias = "abrindo" #quando existir animação de abrir
	estadoCaixaIdeias = "aberta"
	if(controleFluxoHistoria.getParte() != "prologo"):
		
		if(iniciouCliques == false):
			
			contaCliquesIdeias.iniciaCliques()
			iniciouCliques = true
	
func fechaCaixaIdeias():
	
	if(controleFluxoHistoria.getIndiceParte() == 58): #sinaliza que a caixa de ideias foi fechada
		
		controleFluxoHistoria.acrescentaIndiceParte(get_name())
	
	#estadoCaixaIdeias = "fechando" #quando existir animação de fechar
	estadoCaixaIdeias = "fechando"
	iniciouCliques = false
	
func setEstado(stringEstado):
	
	estadoCaixaIdeias = stringEstado
	
func getEstado():
	
	return estadoCaixaIdeias