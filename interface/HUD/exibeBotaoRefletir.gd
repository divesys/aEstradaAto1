extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func exibeBotaoRefletir():
	
	show()


func _on_refletir_button_up():
	
	controleFluxoHistoria.mudarParte("reflexao") #muda de parte
	self.queue_free() #se destroi, possivel animação aqui
	
	pass # replace with function body
