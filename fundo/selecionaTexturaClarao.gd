#seleciona a textura baseada na proporção da tela

extends Node2D

#variaveis

export(Texture) var textura16_9 #recebe a textura na proporcao 16:9
export(Texture) var textura16_10 #recebe a textura na proporcao 16:10
var proporcao


func _ready():
	
	proporcao = encontraResolucao.getStringProporcao() #captura a largura padrao
	
	if(proporcao == "16_9"):
		
		get_parent().set_texture(textura16_9)
		
	elif(proporcao == "16_10"):
		
		get_parent().set_texture(textura16_10)
