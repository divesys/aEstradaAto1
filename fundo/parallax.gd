#executa o parallax do fundo ao pressionar moverDireita

extends Node2D

# variaveis

export(int) var velocidadeMedia = 0 #velocidade media do fundo

var velocidadeInstantanea = Vector2()  #velocidade media do fundo


func _ready():
	
	set_process(true)
	
func _process(delta):
	
	#move o fundo ao apertar moveDireita >
	if(controleFluxoHistoria.getEventoEspecial("andarAutomatico") == false and controleFluxoHistoria.getEventoEspecial("andarHabilitado")  == true):
			
		if(Input.is_action_pressed("moveDireita")):
			
			velocidadeInstantanea = Vector2(-velocidadeMedia,0)
			
		else:
			
			velocidadeInstantanea = Vector2(0,0)
		
		set_pos(get_pos() + velocidadeInstantanea * delta)
		
	elif(controleFluxoHistoria.getEventoEspecial("andarAutomatico") == true):
		
		velocidadeInstantanea = Vector2(-velocidadeMedia,0)
		
		set_pos(get_pos() + velocidadeInstantanea * delta)
	
	#move o fundo ao apertar moveDireita <
	
func getVelocidadeMedia():
	
	return velocidadeMedia
	
func setVelocidadeMedia(floatVelocidade):
	
	velocidadeMedia = floatVelocidade
	
	
	
	
	