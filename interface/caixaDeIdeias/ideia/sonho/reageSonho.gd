 #faz a "reação" ao tentar interagir com o sonho

extends Sprite

onready var animacao = get_node("anim")

var adicionouIndice = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_interacao_button_down():
	
	if(controleFluxoHistoria.getExclusivoTexto() == false and (controleFluxoHistoria.getParte() == "prologo" and controleFluxoHistoria.getIndiceParte() == 74)): #evita que se ative com o texto
		
		animacao.play("reageSonho")
		
		if(adicionouIndice == false):
			
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			adicionouIndice = true
