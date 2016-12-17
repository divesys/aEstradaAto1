 #move ego

extends Node2D

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	if(controleFluxoHistoria.getEventoEspecial("andarAutomatico") == false and controleFluxoHistoria.getEventoEspecial("andarHabilitado") == true):
		
		if(Input.is_action_pressed("moveDireita")):
			
			get_parent().set_animation("egoAndandoDireita")
			
	elif(controleFluxoHistoria.getEventoEspecial("andarAutomatico") == true):
		
		get_parent().set_animation("egoAndandoDireita")
		
	else:
			
			get_parent().set_animation("egoParado")