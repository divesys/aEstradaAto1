 #determina quando o icone devera aparecer

extends Control

onready var parteAtual = get_node("Sprite")
onready var indiceAtual = 0
onready var tocouAnimacao = false
onready var icone = get_node("Sprite") #o nó do icone
onready var labelValor = get_node("valor") #o nó da label com o valor
onready var brilho = get_node("brilhoSurgir")
onready var anim = get_node("anim")

func _ready():
	
	set_process(true)
		
	#torna o elemento da interface invisivel
	#controleFluxoHistoria.pularIndiceParte(
	icone.set_opacity(0)
	labelValor.set_opacity(0)
	brilho.set_emitting(false)
	
func _process(delta):
	
	parteAtual = controleFluxoHistoria.getParte()
	indiceAtual = controleFluxoHistoria.getIndiceParte()
	if(parteAtual == "prologo" and indiceAtual == 3):
		
		if(tocouAnimacao == false):
			
			anim.play("aparecer")
			tocouAnimacao = true
			
		if(!anim.is_playing()):
			
			controleFluxoHistoria.acrescentaIndiceParte(get_name()) 