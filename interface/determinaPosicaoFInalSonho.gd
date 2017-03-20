 #reposiciona a posição final do sonho em relação ao ego

extends Node2D

#dertemina a area da tela
onready var alturaPadrao = encontraResolucao.getAlturaPadrao()
onready var alturaUtilizada = encontraResolucao.getAlturaUtilizada()
onready var larguraUtilizada = encontraResolucao.getLarguraPadrao()
onready var diferencaAltura = alturaPadrao - alturaUtilizada #calcula a diferença
onready var posicaoAreaUtil = Vector2(0,(diferencaAltura/2))
var posYEgo = 0
var posXEgo = 0
var ajusteX = -80
var ajusteY = -50

func _ready():	
	
	pass
	
func determinaPosicaoFinalSonho():
	
	#captura posicao do ego
	posYEgo = globais.getPosicaoEgo().y
	posXEgo = globais.getPosicaoEgo().x
	
	#determina a posição do sonho baseada na posicao do ego
	set_pos(Vector2(posXEgo + larguraUtilizada + ajusteX,posYEgo + ajusteY))