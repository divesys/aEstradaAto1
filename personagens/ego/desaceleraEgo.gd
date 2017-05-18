 #desaceleraEgo após a sobrecarga e inicia a exaustao

extends Node2D

onready var ego = get_parent().get_sprite_frames()
onready var botaoRefletir = get_parent().get_parent().get_node("interface/HUD/refletir")
onready var fundoCeu = get_parent().get_parent().get_node("Fundo/camadas/ceu")
onready var fundoMontanhas = get_parent().get_parent().get_node("Fundo/camadas/montanhas")
onready var fundoEstrada = get_parent().get_parent().get_node("Fundo/camadas/estrada")

var limiteIdeiasSobrecarga = 30.0
var extensaoSobrecarga = 8.0
var limiteIdeiasExaustao = limiteIdeiasSobrecarga + extensaoSobrecarga
var velocidadeEgo = 0.0 #velocidade original da animação do ego
var velocidadeFundoCeu = 0.0
var velocidadeFundoMontanhas = 0.0
var velocidadeFundoEstrada = 0.0
var mudouParte = false
var totalIdeias = 0

func _ready():
	
	#pega as velocidades iniciais
	velocidadeEgo = ego.get_animation_speed("egoAndandoDireita") 
	velocidadeFundoCeu = fundoCeu.getVelocidadeMedia()
	velocidadeFundoMontanhas = fundoMontanhas.getVelocidadeMedia()
	velocidadeFundoEstrada = fundoEstrada.getVelocidadeMedia()
	#print("velocidade = " + str(velocidadeEgo))
	
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	
	totalIdeias = globais.getTotalIdeias()
	
	print(ego.get_animation_speed("egoAndandoDireita"))
	print(fundoCeu.getVelocidadeMedia())
	print(fundoMontanhas.getVelocidadeMedia())
	#print(velocidadeFundoMontanhas - ((velocidadeFundoMontanhas/limiteIdeiasExaustao)*(totalIdeias)))
	#print(velocidadeFundoMontanhas/11.0)
	
	
	#desacelera o ego
	ego.set_animation_speed("egoAndandoDireita",velocidadeEgo - ((velocidadeEgo/limiteIdeiasExaustao)*(totalIdeias)))
	
	#garante que a velocidade não fique negativa
	if(ego.get_animation_speed("egoAndandoDireita") < 0):
		ego.set_animation_speed("egoAndandoDireita",0)
	
	#desacelera o fundo
	if(velocidadeFundoCeu > 0):
		fundoCeu.setVelocidadeMedia(velocidadeFundoCeu - ((velocidadeFundoCeu/limiteIdeiasExaustao)*(totalIdeias)))
		
		if(fundoCeu.getVelocidadeMedia() < 0):
			fundoCeu.setVelocidadeMedia(0)
		
	if(velocidadeFundoMontanhas > 0):
		fundoMontanhas.setVelocidadeMedia(velocidadeFundoMontanhas - ((velocidadeFundoMontanhas/limiteIdeiasExaustao)*(totalIdeias)))
		
		if(fundoMontanhas.getVelocidadeMedia() < 0):
			fundoMontanhas.setVelocidadeMedia(0)
	
	if(velocidadeFundoEstrada > 0):
		fundoEstrada.setVelocidadeMedia(velocidadeFundoEstrada - ((velocidadeFundoEstrada/limiteIdeiasExaustao)*(totalIdeias)))
	
		if(fundoEstrada.getVelocidadeMedia() < 0):
			fundoEstrada.setVelocidadeMedia(0)
			
	
	
	#muda de parte
	if(controleFluxoHistoria.getParte() == "estradaPrincipal"):
		
		if(totalIdeias >= limiteIdeiasSobrecarga):
			
			botaoRefletir.exibeBotaoRefletir()
		
		elif(totalIdeias >= limiteIdeiasExaustao):
		
			controleFluxoHistoria.mudarParte("exaustao")
	