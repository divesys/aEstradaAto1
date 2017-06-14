 #controla as musicas do jogo

extends StreamPlayer

onready var egoConfiante = preload("res://recursos de base/musicas/egoConfiante.ogg")
onready var egoRaiva = preload("res://recursos de base/musicas/egoRaiva.ogg")
onready var egoReflexao = preload("res://recursos de base/musicas/egoReflexao.ogg")
onready var egoTriste = preload("res://recursos de base/musicas/egoTriste.ogg")
onready var melancolia = preload("res://recursos de base/musicas/melancolia.ogg")

var mudou = false
var indiceAnterior = -1
var indiceTextoEstradaPrincipal = 0

func _ready():

	set_volume(0.1) #só para não me incomodar, depois colocar 1
	set_stream(egoConfiante) #musica do prologo
	play(0)
	set_process(true)
	
func _process(delta):
	
	
	indiceTextoEstradaPrincipal = globais.getIndiceTextoEstradaPrincipal()
	
	if(controleFluxoHistoria.getParte() == "estradaPrincipal"):
	
		if(indiceAnterior != indiceTextoEstradaPrincipal):
			
			mudou = false
	
		if(indiceTextoEstradaPrincipal == 7 and mudou == false):
			
			stop()
			set_stream(egoTriste)
			play()
			mudou = true
			indiceAnterior = indiceTextoEstradaPrincipal
			
		elif(get_stream() == egoTriste and indiceTextoEstradaPrincipal == 14):
			
			stop()
			set_stream(egoRaiva)
			play()
			mudou = true
			indiceAnterior = indiceTextoEstradaPrincipal
			
		elif(get_stream() == egoRaiva and indiceTextoEstradaPrincipal == 19):
			
			stop()
			set_stream(egoTriste)
			play()
			mudou = true
			indiceAnterior = indiceTextoEstradaPrincipal
			
	elif(controleFluxoHistoria.getParte() == "reflexao"):
		
		if(get_stream() == egoTriste and controleFluxoHistoria.getIndiceParte() == 6):
			
			stop()
			set_stream(egoTriste)
			play()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())