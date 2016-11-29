 #controla qual textbox devera ser utilizada

extends Control

export var origemTexto = "" setget mudaOrigemTexto, getOrigemTexto#indica quem está pronunciando o texto

var origemTextoAtual = "" #determina a origem atual do texto
var origemTextoAnterior = "" #determina a ultima origem do texto

#var posTextboxNarrador = { #margens do textbox
#
#	"anchorLeft" : ANCHOR_CENTER
#	,"marginLeft" : get_size()/2
#	,"anchorRight" : ANCHOR_CENTER
#	,"marginRight" : get_size()/2
#	,"anchorTop" : ANCHOR_CENTER
#	,"marginTop" : get_size()/2
#	,"anchorBottom" : ANCHOR_CENTER
#	,"marginBottom" : get_size()/2
#
#}

#textbox <

func _ready():
	
	set_process(true)

func _process(delta):
	
	#posiciona a textbox, baseado na resolução e na origem da textbox
	
#	origemTextoAtual = origemTexto
#	
#	if(origemTextoAtual == "NARRADOR" and origemTextoAtual != origemTextoAnterior):
#		
#		#textBox.set_pos(posTextboxNarrador)
#		self.set_anchor_and_margin(MARGIN_LEFT,posTextboxNarrador["anchorLeft"],posTextboxNarrador["marginLeft"])
#		self.set_anchor_and_margin(MARGIN_RIGHT,posTextboxNarrador["anchorRight"],posTextboxNarrador["marginRight"])
#		self.set_anchor_and_margin(MARGIN_TOP,posTextboxNarrador["anchorTop"],posTextboxNarrador["marginTop"])
#		self.set_anchor_and_margin(MARGIN_BOTTOM,posTextboxNarrador["anchorBottom"],posTextboxNarrador["marginBottom"])
#		
#		origemTextoAnterior = origemTextoAtual
#		
		pass	
		

func mudaOrigemTexto(strOrigem):
	
	origemTexto = strOrigem
	
func getOrigemTexto():
	
	return origemTexto