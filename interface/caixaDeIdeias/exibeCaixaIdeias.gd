 #exibe oue esconde a caixa de ideias

extends Control

onready var adicionouIdeia = "" #determina se as ideias foram adicionadas

func _ready():

	set_process(true)
	
func _process(delta):
	
	if(controlaCaixaIdeias.getEstado() == "abrindo" or controlaCaixaIdeias.getEstado() == "aberta"):
		
		show()
		if(adicionouIdeia == false):
			
			get_node("areaDeIdeias").adicionaIdeias()
			adicionouIdeia = true
		
	elif(controlaCaixaIdeias.getEstado() == "fechando" or controlaCaixaIdeias.getEstado() == "fechada"):
		
		hide()
		adicionouIdeia = false
