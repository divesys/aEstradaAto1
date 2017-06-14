extends Node2D

export(Texture) var ceuCorrompido
export(Texture) var montanhasCorrompidas
export(Texture) var estradaCorrompida

onready var ceu = get_node("camadas/ceu")
onready var montanhas = get_node("camadas/montanhas")
onready var estrada = get_node("camadas/estrada") 

func _ready():
	
	pass
	
func estradaCorrompida():
	
	ceu.get_node("determinaTextura").setTexturaDupla(ceuCorrompido)
	montanhas.get_node("determinaTextura").setTexturaDupla(montanhasCorrompidas)
	estrada.get_node("determinaTextura").setTexturaDupla(estradaCorrompida)