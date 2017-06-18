extends Node2D

export(Texture) var ceuCorrompido
export(Texture) var montanhasCorrompidas
export(Texture) var estradaCorrompida

onready var ceu = get_node("camadas/ceu")
onready var montanhas = get_node("camadas/montanhas")
onready var estrada = get_node("camadas/estrada") 
onready var chuva = get_node("camadas/chuva")
onready var trovao = ceu.get_node("ceuUnidade/geraTrovao")

func _ready():
	
	pass
	
func estradaCorrompida():
	
	ceu.get_node("determinaTextura").setTexturaDupla(ceuCorrompido)
	montanhas.get_node("determinaTextura").setTexturaDupla(montanhasCorrompidas)
	estrada.get_node("determinaTextura").setTexturaDupla(estradaCorrompida)
	chuva.comecaChuva()
	ceu.get_node("ceuUnidade/geraTrovao").setGerarTrovao(true)