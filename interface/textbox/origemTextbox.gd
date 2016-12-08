 #controla qual textbox devera ser utilizada

extends Control

export var origemTexto = "" setget mudaOrigemTexto, getOrigemTexto #indica quem está pronunciando o texto
export var tipoTexto = "" setget mudaTipoTexto, getTipoTexto #indica a forma que está sendo pronunciada a menssagem (fala,pensamento)
export var emocaoTexto = "" setget mudaEmocaoTexto, getEmocaoTexto #indica a emoção de quem está pronunciando (caso só tenha uma emoção, usar normal)
export var variacaoTexto = "" setget mudaVariacaoTexto, getVariacaoTexto #recurso opicional que indica uma variação do texto, caso a origem,tipo e emoção sejam iguais

var origemTextoAtual = "" #determina a origem atual do texto
var origemTextoAnterior = "" #determina a ultima origem do texto

onready var fundoTextBox = get_node("fundo")
onready var simboloNome = get_node("areaSimbolo/nome")
onready var simboloFundo = get_node("areaSimbolo/fundo")
onready var face = get_node("areaFace/Sprite")
onready var fonteConteudo = get_node("Conteudo/text_interface_engine")

func _ready():
	
	set_process(true)

func mudaOrigemTexto(strOrigem):
	
	origemTexto = strOrigem
	
func getOrigemTexto():
	
	return origemTexto
	
func mudaTipoTexto(strTipo):
	
	tipoTexto = strTipo
	
func getTipoTexto():
	
	return tipoTexto
	
func mudaEmocaoTexto(strEmocao):
	
	emocaoTexto = strEmocao
	
func getEmocaoTexto():
	
	return emocaoTexto
	
func mudaVariacaoTexto(strVariacao):
	
	variacaoTexto = strVariacao
	
func getVariacaoTexto():
	
	return variacaoTexto
	
func _process(delta):
	
	#altera dinamicamente a aparencia da textbox >
	
	#origem >>
	
	#print(getOrigemTexto())
	
	if(getOrigemTexto() == "narrador"):
		
		simboloNome.add_font_override("font",preload("res://interface/textbox/Narrador/fonteNarrador.fnt"))
		simboloNome.set_text("Narrador")
		
		if(getTipoTexto() == "fala"):
			
			fundoTextBox.set_texture(preload("res://recursos de base/narradorTextBoxV1.png")) #aplica o fundo da textbox
			fonteConteudo.set_font_bypath("res://interface/textbox/Narrador/fonteNarrador.fnt")
			
			if(getEmocaoTexto() == "normal"):
				
				face.set_texture(preload("res://personagens/narrador/rostoNarrador.png"))
			
				if(getVariacaoTexto() == ""):
				
					simboloFundo.set_texture(null)
				
	elif(origemTexto == "ego"):
		
		simboloNome.add_font_override("font",preload("res://interface/textbox/Narrador/fonteNarrador.fnt"))
		simboloNome.set_text("Ego")
		
		if(getTipoTexto() == "pensamento"):
			
			fundoTextBox.set_texture(preload("res://recursos de base/egoTextBoxV1.png")) #aplica o fundo da textbox
			fonteConteudo.set_font_bypath("res://interface/textbox/Narrador/fonteNarrador.fnt")
			
			if(getEmocaoTexto() == "pensativo"):
				
				face.set_texture(load("res://personagens/ego/rostoEgoPensativo.png"))
				
			elif(getEmocaoTexto() == "confiante"):
				
				face.set_texture(load("res://personagens/ego/rostoEgoConfiante.png"))
		
	
	#origem <<
	
	#altera dinamicamente a aparencia da textbox <
	
	pass