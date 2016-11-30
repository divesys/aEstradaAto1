 #determina quando o icone devera aparecer

extends Control

var parteAtual = ""
var indiceAtual = 0

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	parteAtual = controleFluxoHistoria.getParte()
	indiceAtual = controleFluxoHistoria.getIndiceParte()
	
	if(parteAtual == "prologo" and indiceAtual == 6):
		
		show()
		controleFluxoHistoria.acrescentaIndiceParte() 