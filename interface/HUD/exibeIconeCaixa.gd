 #controla quando o icone deve aparecer

extends Control

onready var anim = get_node("anim")
onready var exibiuIcone = false
onready var interacaoMouse = get_parent().get_node("interacao")
var clicando = false

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	clicando = interacaoMouse.getClicando()
	
	if(controlaCaixaIdeias.getVibrarCaixaIdeias() == true):
		
		if(exibiuIcone == false):
			
			anim.play("vibraCaixa") #inicia a animação de virbrar
			show() #mostra a caixa
			exibiuIcone = true
		
		if((Input.is_action_pressed("abrirCaixa") or clicando == true) and controleFluxoHistoria.getExclusivoTexto() == false):
			
			hide()
			anim.stop(true)
			controlaCaixaIdeias.vibraCaixaIdeias(false)
			controlaCaixaIdeias.abreCaixaIdeias()
			exibiuIcone = false