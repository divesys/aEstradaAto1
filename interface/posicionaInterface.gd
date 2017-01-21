 #posiciona os itens da interface

extends Control

#nodes
onready var origemTextbox = get_node("textBox")
onready var textBox = origemTextbox #uma variavel de nome alternativo, apenas para clareza do código

#origem do texto
var origemTextoAtual = "" #determina a origem atual do texto
var origemTextoAnterior = "" #determina a ultima origem do texto

#variaveis
var estadoAnteriorCaixaIdeias = ""
var estadoAtualCaixaIdeias = ""
var posTextbox = {} #margens do textbox
var posInicialTextbox = {}

#textbox <

func _ready():
	
	#pega o valor inicial da textbox
	posInicialTextbox = { #margens iniciais do textbox

	"anchorLeft" : textBox.get_anchor(MARGIN_LEFT)
	,"marginLeft" : textBox.get_margin(MARGIN_LEFT)
	,"anchorRight" : textBox.get_anchor(MARGIN_RIGHT)
	,"marginRight" : textBox.get_margin(MARGIN_RIGHT)
	,"anchorTop" : textBox.get_anchor(MARGIN_TOP)
	,"marginTop" : textBox.get_margin(MARGIN_TOP)
	,"anchorBottom" : textBox.get_anchor(MARGIN_BOTTOM)
	,"marginBottom" : textBox.get_margin(MARGIN_BOTTOM)
	
	}
	
	centralizaTextBox()
	estadoAnteriorCaixaIdeias = controlaCaixaIdeias.getEstado()
	set_process(true)

func _process(delta):
	
	estadoAtualCaixaIdeias = controlaCaixaIdeias.getEstado()
	
	if(estadoAnteriorCaixaIdeias != estadoAtualCaixaIdeias):
		
		if(controlaCaixaIdeias.getEstado() == "aberta"):
			
			estadoAnteriorCaixaIdeias = controlaCaixaIdeias.getEstado()
			textBoxDireita()
			
		else:
		
			controlaCaixaIdeias.getEstado()
			centralizaTextBox()

func resetaPosTextBox():
	
	textBox.set_anchor_and_margin(MARGIN_LEFT,posInicialTextbox["anchorLeft"],posInicialTextbox["marginLeft"])
	textBox.set_anchor_and_margin(MARGIN_RIGHT,posInicialTextbox["anchorRight"],posInicialTextbox["marginRight"])
	textBox.set_anchor_and_margin(MARGIN_TOP,posInicialTextbox["anchorTop"],posInicialTextbox["marginTop"])
	textBox.set_anchor_and_margin(MARGIN_BOTTOM,posInicialTextbox["anchorBottom"],posInicialTextbox["marginBottom"])

func centralizaTextBox():
	
	resetaPosTextBox()
	
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
	
	posTextbox = { #margens do textbox

	"anchorLeft" : ANCHOR_CENTER
	,"marginLeft" : (textBox.get_size().x/2)
	,"anchorRight" : ANCHOR_BEGIN
	,"marginRight" : 0
	,"anchorTop" : ANCHOR_BEGIN
	,"marginTop" : 50
	,"anchorBottom" : ANCHOR_BEGIN
	,"marginBottom" : 0
	}
	
	textBox.set_anchor_and_margin(MARGIN_LEFT,posTextbox["anchorLeft"],posTextbox["marginLeft"])
	textBox.set_anchor_and_margin(MARGIN_RIGHT,posTextbox["anchorRight"],posTextbox["marginRight"])
	textBox.set_anchor_and_margin(MARGIN_TOP,posTextbox["anchorTop"],posTextbox["marginTop"])
	textBox.set_anchor_and_margin(MARGIN_BOTTOM,posTextbox["anchorBottom"],posTextbox["marginBottom"])
	
func textBoxDireita():
	
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
	
	posTextbox = { #margens do textbox

	"anchorLeft" : ANCHOR_CENTER
	,"marginLeft" : (textBox.get_size().x/2) - globais.getTamanhoCaixaIdeias().x/2 + 70
	,"anchorRight" : ANCHOR_BEGIN
	,"marginRight" : 0
	,"anchorTop" : ANCHOR_BEGIN
	,"marginTop" : 100
	,"anchorBottom" : ANCHOR_BEGIN
	,"marginBottom" : 0
	}
	
	textBox.set_anchor_and_margin(MARGIN_LEFT,posTextbox["anchorLeft"],posTextbox["marginLeft"])
	textBox.set_anchor_and_margin(MARGIN_RIGHT,posTextbox["anchorRight"],posTextbox["marginRight"])
	textBox.set_anchor_and_margin(MARGIN_TOP,posTextbox["anchorTop"],posTextbox["marginTop"])
	textBox.set_anchor_and_margin(MARGIN_BOTTOM,posTextbox["anchorBottom"],posTextbox["marginBottom"])