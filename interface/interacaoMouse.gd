 #faz a interação atráves do mouse

extends Control

var clicando = false setget ,getClicando#determina se o jogador está clicando no objeto

func _input_event(event):
	
	if(event.type == InputEvent.MOUSE_BUTTON and event.button_index==BUTTON_LEFT and event.pressed): #verifica se clicou na textbpx
		
		clicando = true
			
	else:
		
		clicando = false
		
	#print(clicando)

func getClicando():
	
	return clicando