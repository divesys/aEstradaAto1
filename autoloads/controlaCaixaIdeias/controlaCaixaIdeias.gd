 #controla a caixa de ideias

var iniciouCliques = false

onready var vibrarCaixaIdeias = false setget vibraCaixaIdeias, getVibrarCaixaIdeias #determina se a caixa de ideias deve vibrar, isso inicia o processo para abrir
onready var estadoCaixaIdeias = "fechada"

func vibraCaixaIdeias(boolValor):
	
	vibrarCaixaIdeias = boolValor

func getVibrarCaixaIdeias():
	
	return vibrarCaixaIdeias
	
func abreCaixaIdeias():
	
#	if(controleFluxoHistoria.getIndiceParte() == 66): #sinaliza que a caixa de ideias foi aberta
#		
#		controleFluxoHistoria.acrescentaIndiceParte(get_name())
	
	#estadoCaixaIdeias = "abrindo" #quando existir animação de abrir
	estadoCaixaIdeias = "aberta"
	if(controleFluxoHistoria.getParte() != "prologo" or (controleFluxoHistoria.getParte() == "prologo" and controleFluxoHistoria.getIndiceParte() > 62)):
		
		if(iniciouCliques == false):
			
			contaCliquesIdeias.iniciaCliques()
			iniciouCliques = true
	
func fechaCaixaIdeias():
	
	if(controleFluxoHistoria.getParte() == "prologo"):
		
		if(controleFluxoHistoria.getIndiceParte() == 58 or controleFluxoHistoria.getIndiceParte() == 77): #sinaliza que a caixa de ideias foi fechada
		
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
	
	#estadoCaixaIdeias = "fechando" #quando existir animação de fechar
	estadoCaixaIdeias = "fechando"
	iniciouCliques = false
	
func setEstado(stringEstado):
	
	estadoCaixaIdeias = stringEstado
	
func getEstado():
	
	return estadoCaixaIdeias