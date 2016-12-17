 #gerencia um sinal especial que pode ser usado para comunicação entre nós distantes, que permite ele esperar aguardar

extends Node2D

var tipo = "generico" setget setTipo, getTipo #motivo da espera 
var estado = "normal" #estado da espera

func _ready():
	
	pass

func aguardarPorTempo(floatSegundos): #aguarda um tempo x antes de liberar o evento

	pass #no momento não precisa implementar
	
func aguardar(): #aguarda receber o sinal de liberação

	estado = "aguardando"
	
func liberar(): #libera o evento

	estado = "liberado"
	
func normaliza(): #volta ao estado normal

	estado = "normal"
	
func setTipo(stringTipo):
	
	tipo = stringTipo
	
func getTipo():
	
	return tipo
	
func getEstado(): #retorna o estado

	return estado