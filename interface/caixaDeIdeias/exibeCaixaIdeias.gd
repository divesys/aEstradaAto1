 #exibe oue esconde a caixa de ideias

extends Control

onready var adicionouIdeia = "" #determina se as ideias foram adicionadas
onready var areaDeIdeias = get_node("areaDeIdeias")

func _ready():

	set_process(true)
	
func _process(delta):
	
	if(controlaCaixaIdeias.getEstado() == "abrindo" or controlaCaixaIdeias.getEstado() == "aberta"):
		
		show()
		
		if((adicionouIdeia == false) and controleFluxoHistoria.getParte() != "prologo"):
			
			areaDeIdeias.adicionaIdeias()
			adicionouIdeia = true
			
		elif((adicionouIdeia == false) and controleFluxoHistoria.getParte() == "prologo"):
			
			if(controleFluxoHistoria.getIndiceParte() == 17):
				
				areaDeIdeias.adicionaNIdeias(3)
				controleFluxoHistoria.acrescentaIndiceParte()
		
	elif(controlaCaixaIdeias.getEstado() == "fechando" or controlaCaixaIdeias.getEstado() == "fechada"):
		
		hide()
		adicionouIdeia = false