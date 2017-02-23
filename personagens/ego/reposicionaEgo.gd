 #reposiciona o Ego com relação ao fundo

extends Node2D

export(String,"superior","inferior") var ancoraVertical = "superior" #onde se origina a contagem da posição
export(String,"relativo","absoluto") var formaMedida = "relativo" #relativo será escrito por porcentagem e absoluto por pixels
export var valorPosicao = Vector2(0.00,0.00)

func _ready():	
	
	#dertemina a area da tela
	var alturaPadrao = encontraResolucao.getAlturaPadrao()
	var alturaUtilizada = encontraResolucao.getAlturaUtilizada()
	var larguraUtilizada = encontraResolucao.getLarguraPadrao()
	var diferencaAltura = alturaPadrao - alturaUtilizada #calcula a diferença
	var posicaoAreaUtil = Vector2(0,(diferencaAltura/2))
	var parent = get_parent()
	var alturaEgo = parent.get_sprite_frames().get_frame(parent.get_animation(),parent.get_frame()).get_height()
	var larguraEgo = parent.get_sprite_frames().get_frame(parent.get_animation(),parent.get_frame()).get_width()
	
	#determina a posição do ego baseado na área util
	if(formaMedida == "relativo"):
		
		if(ancoraVertical == "superior"):
			
			parent.set_pos(Vector2((larguraUtilizada * valorPosicao.x),posicaoAreaUtil.y + (alturaUtilizada * valorPosicao.y)))
			
		elif(ancoraVertical == "inferior"):
			
			parent.set_pos(Vector2((larguraUtilizada * valorPosicao.x),(posicaoAreaUtil.y + alturaUtilizada) - ((alturaUtilizada * valorPosicao.y)+ alturaEgo)))
			
	elif(formaMedida == "absoluta"):
	
		if(ancoraVertical == "superior"):
			
			parent.set_pos(Vector2((valorPosicao.x),posicaoAreaUtil.y + (valorPosicao.y)))
			
		elif(ancoraVertical == "inferior"):
			
			parent.set_pos(Vector2((valorPosicao.x),(posicaoAreaUtil.y + alturaUtilizada) - ((valorPosicao.y)+larguraEgo)))
			
	globais.setPosicaoEgo(parent.get_pos())