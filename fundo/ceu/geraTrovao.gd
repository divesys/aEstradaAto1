extends Node2D

var gerarTrovao = false #determina se deve gerar trovâo

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func setGerarTrovao(boolValor):
	
	gerarTrovao = boolValor
	
func getGerarTrovao():
	
	return gerarTrovao