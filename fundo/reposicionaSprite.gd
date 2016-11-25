 #reposiciona o sprite tomando como base a diferença entre o tamanho do fundo e altura da tela

#inicializa variaveis
#var alturaSprite = 0 #determina a altura do sprite

func _ready():
	
	#variaveis
	var alturaPadrao = encontraResolucao.getAlturaPadrao() #captura a altura padrao
	var alturaSprite = get_parent().get_texture().get_height() #captura a altura do sprite
	var diferencaAltura = alturaPadrao - alturaSprite #calcula a diferença
	var parent = get_parent()
	
	#ajusta a posição do sprite
	parent.set_pos(Vector2(get_pos().x,get_pos().y + (diferencaAltura/2)))
	
	print(parent.get_pos())
	