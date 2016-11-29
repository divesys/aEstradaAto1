 #controla qual textbox devera ser utilizada

extends Control

export var origemTexto = "" setget mudaOrigemTexto, getOrigemTexto#indica quem está pronunciando o texto

var origemTextoAtual = "" #determina a origem atual do texto
var origemTextoAnterior = "" #determina a ultima origem do texto

func _ready():
	
	set_process(true)

func mudaOrigemTexto(strOrigem):
	
	origemTexto = strOrigem
	
func getOrigemTexto():
	
	return origemTexto