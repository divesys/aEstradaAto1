#seleciona a textura baseada na proporção da tela

extends Node2D

#variaveis

export(Texture) var textura16_9 #recebe a textura na proporcao 16:9
export(Texture) var textura16_10 #recebe a textura na proporcao 16:10



func _ready():
	
	pass
		
func setTexturaDupla(objTextura):
	
	#seta as duas texturas com a mesma textura
	
	textura16_9 = objTextura
	textura16_10 = objTextura
	
func getTextura16_9():
	
	return textura16_9
	
func getTextura16_10():
	
	return textura16_10