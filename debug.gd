extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	
	set_text(str(controleFluxoHistoria.getParte()) + " - " + str(controleFluxoHistoria.getIndiceParte()))