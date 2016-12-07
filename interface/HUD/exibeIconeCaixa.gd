 #controla quando o icone deve aparecer

extends Control

onready var anim = get_node("anim")
onready var exibiuIcone = false

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	if(controlaCaixaIdeias.getVibrarCaixaIdeias() == true):
		
		if(exibiuIcone == false):
			
			anim.play("vibraCaixa") #inicia a animação de virbrar
			show() #mostra a caixa
			exibiuIcone = true
		
		if(Input.is_action_pressed("abrirCaixa") and controleFluxoHistoria.getExclusivoTexto() == false):
			
			hide()
			anim.stop(true)
			controlaCaixaIdeias.vibraCaixaIdeias(false)
			exibiuIcone = false