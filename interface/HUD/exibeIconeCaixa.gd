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
			
			anim.play("vibraCaixa") #inicia a animação de vibrar
			show() #mostra a caixa
			exibiuIcone = true
		
#		print(controleFluxoHistoria.getExclusivoTexto())
		
		if((Input.is_action_pressed("abrirCaixa") or clicando == true) and controleFluxoHistoria.getExclusivoTexto() == false and controleFluxoHistoria.getEventoEspecial("travaCaixaDeIdeias") == false):
			
			hide()
			anim.stop(true)
			controlaCaixaIdeias.vibraCaixaIdeias(false)
			controlaCaixaIdeias.abreCaixaIdeias()
			exibiuIcone = false
			controleFluxoHistoria.acrescentaIndiceParte(get_name())