 #posiciona os itens da interface

extends Control

#nodes
onready var origemTextbox = get_node("textBox")
onready var textBox = origemTextbox #uma variavel de nome alternativo, apenas para clareza do código

#origem do texto
var origemTextoAtual = "" #determina a origem atual do texto
var origemTextoAnterior = "" #determina a ultima origem do texto

#variaveis vazias
	#textbox >
	
	#textbox narrador
var posTextboxNarrador = {} #margens do textbox

#textbox <

func _ready():

	#variaveis que determinam a área utilizavel da tela
	var alturaPadrao = encontraResolucao.getAlturaPadrao() #captura a altura padrao
	var larguraArea = encontraResolucao.getLarguraPadrao()
	var porcentagemTela = 0.65 #o quanto a área visivel do jogo ocupa a tela
	var alturaArea = alturaPadrao * porcentagemTela
	var diferencaAltura = alturaPadrao - alturaArea #calcula a diferença
	var parent = get_parent()
	
	#ajusta a a área utilizavel da tela
	set_size(Vector2(larguraArea,alturaArea))
	set_pos(Vector2(0,(diferencaAltura/2)))
	
	posTextboxNarrador = { #margens do textbox

	"anchorLeft" : ANCHOR_CENTER
	,"marginLeft" : (textBox.get_size().x/2)
	,"anchorRight" : ANCHOR_BEGIN
	,"marginRight" : 0
	,"anchorTop" : ANCHOR_BEGIN
	,"marginTop" : 50
	,"anchorBottom" : ANCHOR_BEGIN
	,"marginBottom" : 0
	}
	
	textBox.set_anchor_and_margin(MARGIN_LEFT,posTextboxNarrador["anchorLeft"],posTextboxNarrador["marginLeft"])
	textBox.set_anchor_and_margin(MARGIN_RIGHT,posTextboxNarrador["anchorRight"],posTextboxNarrador["marginRight"])
	textBox.set_anchor_and_margin(MARGIN_TOP,posTextboxNarrador["anchorTop"],posTextboxNarrador["marginTop"])
	textBox.set_anchor_and_margin(MARGIN_BOTTOM,posTextboxNarrador["anchorBottom"],posTextboxNarrador["marginBottom"])
	
	set_process(true)

func _process(delta):
	
	#posiciona a textbox, baseado na resolução e na origem da textbox
	
	#origemTextoAtual = origemTextbox.getOrigemTexto()
	
	#if(origemTextoAtual == "narrador" and origemTextoAtual != origemTextoAnterior):
		
		#textBox.set_anchor_and_margin(MARGIN_LEFT,posTextboxNarrador["anchorLeft"],posTextboxNarrador["marginLeft"])
		#textBox.set_anchor_and_margin(MARGIN_RIGHT,posTextboxNarrador["anchorRight"],posTextboxNarrador["marginRight"])
		#textBox.set_anchor_and_margin(MARGIN_TOP,posTextboxNarrador["anchorTop"],posTextboxNarrador["marginTop"])
		#textBox.set_anchor_and_margin(MARGIN_BOTTOM,posTextboxNarrador["anchorBottom"],posTextboxNarrador["marginBottom"])
		
		#pass