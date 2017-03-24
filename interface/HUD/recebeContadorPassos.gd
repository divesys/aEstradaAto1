 #recebe o valor do contador de passos

extends Label

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	if(controleFluxoHistoria.getParte() == "prologo"):
		
		set_text(str(globais.getPassosPrologo()))
		
	else:
		
		set_text(str(globais.getPassosPrologo() + globais.getPassosSupostos()))