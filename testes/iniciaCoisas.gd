extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	controleFluxoHistoria.criaEventoEspecial("ideiasSimultaneas", true) #evento que determina se o jogador podera clicar em duas ideias ao mesmo tempo
	controleFluxoHistoria.criaEventoEspecial("andarHabilitado", false)
	#controleFluxoHistoria.setExclusivoTexto(true)
#	controleFluxoHistoria.mudarParte("prologo")
#	controleFluxoHistoria.pularIndiceParte(27)
#	#print(controleFluxoHistoria.getIndiceParte())
	controlaCaixaIdeias.abreCaixaIdeias()