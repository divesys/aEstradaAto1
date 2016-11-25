 #move ego

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	if(Input.is_action_pressed("moveDireita")):
		
		get_parent().set_animation("egoAndandoDireita")
		
	else:
		
		get_parent().set_animation("egoParado")