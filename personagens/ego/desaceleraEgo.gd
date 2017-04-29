 #desaceleraEgo após a sobrecarga e inicia a exaustao

extends Node2D

onready var ego = get_parent().get_sprite_frames()
onready var botaoRefletir = get_parent().get_parent().get_node("interface/HUD/refletir")

var limiteIdeiasSobrecarga = 30
var extensaoSobrecarga = 8
var limiteIdeiasExaustao = limiteIdeiasSobrecarga + extensaoSobrecarga
var velocidadeEgo = 0 #velocidade original da animação do ego
var mudouParte = false

func _ready():
	
	velocidadeEgo = ego.get_animation_speed("egoAndandoDireita") #pega a velocidade inicial
	print("velocidade = " + str(velocidadeEgo))
	
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	
	var totalIdeias = globais.getTotalIdeias()
	
	if(controleFluxoHistoria.getParte() == "estradaPrincipal"):
	
		if(totalIdeias >= limiteIdeiasExaustao):
		
			controleFluxoHistoria.mudarParte("reflexao")
			print(controleFluxoHistoria.getParte())
		
		elif(totalIdeias >= limiteIdeiasSobrecarga):
			
			botaoRefletir.exibeBotaoRefletir()
			ego.set_animation_speed("egoAndandoDireita",velocidadeEgo - ((velocidadeEgo/extensaoSobrecarga)*(totalIdeias - limiteIdeiasSobrecarga)))
			print("velocidade = " + str(ego.get_animation_speed("egoAndandoDireita")))
	