 #controla as musicas do jogo

extends StreamPlayer

onready var egoConfiante = preload("res://recursos de base/musicas/egoConfiante.ogg")
onready var egoRaiva = preload("res://recursos de base/musicas/egoRaiva.ogg")
onready var egoReflexao = preload("res://recursos de base/musicas/egoReflexao.ogg")
onready var egoTriste = preload("res://recursos de base/musicas/egoTriste.ogg")
onready var melancolia = preload("res://recursos de base/musicas/melancolia.ogg")

var mudou = false
var indiceAnterior = -1

func _ready():

	set_volume(0.1) #só para não me incomodar, depois colocar 1
	set_stream(egoConfiante)
	play(0)
	set_process(true)
	
func _process(delta):
	
	
	if(controleFluxoHistoria.getParte() == "estradaPrincipal"):
	
		if(indiceAnterior != controleFluxoHistoria.getIndiceParte()):
			
			mudou = false
	
		if(controleFluxoHistoria.getIndiceParte() == 6 and mudou == false):
			
			stop()
			set_stream(egoTriste)
			play()
			mudou = true
			indiceAnterior = controleFluxoHistoria.getIndiceParte()
			
		elif(get_stream() == egoTriste and controleFluxoHistoria.getIndiceParte() == 13):
			
			stop()
			set_stream(egoRaiva)
			play()
			mudou = true
			indiceAnterior = controleFluxoHistoria.getIndiceParte()
			
		elif(get_stream() == egoTriste and controleFluxoHistoria.getIndiceParte() == 18):
			
			stop()
			set_stream(egoTriste)
			play()
			mudou = true
			indiceAnterior = controleFluxoHistoria.getIndiceParte()