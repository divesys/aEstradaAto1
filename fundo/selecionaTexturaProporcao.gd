#seleciona a textura baseada na proporção da tela

extends Node2D

#variaveis

var textura16_9 #recebe a textura na proporcao 16:9
var textura16_10 #recebe a textura na proporcao 16:10
var proporcao


func _ready():
	
	textura16_9 = get_parent().get_parent().get_node("determinaTextura").getTextura16_9()
	textura16_10 = get_parent().get_parent().get_node("determinaTextura").getTextura16_10()
	
	proporcao = encontraResolucao.getStringProporcao() #captura a largura padrao
	
	if(proporcao == "16_9"):
		
		#print("16_9")
		get_parent().set_texture(textura16_9)
		
	elif(proporcao == "16_10"):
		
		#print("16_10")
		get_parent().set_texture(textura16_10)
		
	set_process(true)
	
func _process(delta):
	
	textura16_9 = get_parent().get_parent().get_node("determinaTextura").getTextura16_9()
	textura16_10 = get_parent().get_parent().get_node("determinaTextura").getTextura16_10()
	
	if(get_parent().get_texture() != textura16_9 and get_parent().get_texture() != textura16_10):
		
		if(proporcao == "16_9"):
		
			get_parent().set_texture(textura16_9)
		
		elif(proporcao == "16_10"):
			
			get_parent().set_texture(textura16_10) 