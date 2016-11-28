 #cria o texto da narrativa, como é um texto único tudo pode ser iniciado com a função desse script

extends Control

onready var tie = get_node("fundo/text_interface_engine")

func _ready():
	
	escreveNarrativa()


func escreveNarrativa(): #ao ser chamado esse texto escreve automaticamente a narrativa
	
	tie.reset()
	
	tie.set_color(Color(1,1,1))
	tie.buff_text("Numa estrada, como em muitas outras, caminha um Viajante.",0.05)
	tie.buff_text("Seu nome é Ego.",0.05)
	tie.set_state(tie.STATE_OUTPUT)
	tie.clear_text()
	#tie.set_state(tie.STATE_WAITING)
	