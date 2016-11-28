 #controla o fluxo da textbox: guardando as menssagens num vetor, limpando e passando a próxima menssagem ao apertar enter e acelerando caso seja segurada a teclada de skip

extends Control

onready var tie = get_parent().get_node("text_interface_engine")

var velocidadeNormal = 0
var velocidadeAcelerada = 0.2

func _ready():

	set_process(true)
	
func _process(delta):
	
	#mantem a velocidade normal atualizada
	velocidadeNormal = tie.get_lastBufferSpeed()
	
	#acelera e desacelera a menssagem
	if(Input.is_action_pressed("passarMenssagem")):
			
		tie.set_buff_speed(0.2)
		
	elif(tie.get_text() == ""):
		
		tie.set_buff_speed(velocidadeNormal)
		
	
	
	
	
