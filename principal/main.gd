 #controla os eventos principais do jogo, como por exemplo o fluxo da historia

extends Node2D

#variaveis de fluxo da historia
var parteAtual = ""
var indiceParteAtual = 0



func _ready():

	#cria eventos especiais
	controleFluxoHistoria.criaEventoEspecial("andarAutomatico" , true) #evento que determina se o ego devera se manter andando
	
	#inicia a primeira parte
	controleFluxoHistoria.mudarParte("prologo")
	
	#inicializa o processo
	set_process(true)
	
func _process(delta):
	
	#verifica qual é a parte atual
	parteAtual = controleFluxoHistoria.getParte()
	indiceParteAtual = controleFluxoHistoria.getIndiceParte()