 #reposiciona o sprite tomando como base a diferença entre o tamanho do sprite e altura da tela

extends Node2D

#inicializa variaveis
#var alturaSprite = 0 #determina a altura do sprite

export(float,0,1,0.01) var porcentagemTela = 0.65 #o quanto a área visivel do jogo ocupa a tela, vai de 0 a 1

func _ready():
	
	#variaveis
	var alturaPadrao = encontraResolucao.getAlturaPadrao() #captura a altura padrao
	
	#var alturaSprite = get_parent().get_texture().get_height() #captura a altura do sprite
	var alturaSprite = alturaPadrao * porcentagemTela
	var diferencaAltura = alturaPadrao - alturaSprite #calcula a diferença
	var parent = get_parent()
	
	#ajusta a posição do sprite
	parent.set_pos(Vector2(get_pos().x,get_pos().y + (diferencaAltura/2)))
	