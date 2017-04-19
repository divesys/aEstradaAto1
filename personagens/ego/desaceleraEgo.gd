 #desaceleraEgo após a sobrecarga e inicia a exaustao

extends Node2D

var limiteIdeiasSobrecarga = 30
var extensaoSobrecarga = 8
var limiteIdeiasExaustao = limiteIdeiasSobrecarga + extensaoSobrecarga
onready var ego = get_parent().get_sprite_frames()
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
		
			controleFluxoHistoria.mudarParte("exaustao")
			print(controleFluxoHistoria.getParte())
		
		elif(totalIdeias >= limiteIdeiasSobrecarga):
			
			ego.set_animation_speed("egoAndandoDireita",velocidadeEgo - ((velocidadeEgo/extensaoSobrecarga)*(totalIdeias - limiteIdeiasSobrecarga)))
			print("velocidade = " + str(ego.get_animation_speed("egoAndandoDireita")))
	