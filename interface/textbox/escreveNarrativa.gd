 #cria o texto da narrativa, como é um texto único tudo pode ser iniciado com a função desse script

extends Control

onready var tie = get_node("fundo/text_interface_engine")
onready var controlaTextbox = get_node("fundo/controlaTextbox")

func _ready():
	
	escreveNarrativa()

func escreveNarrativa(): #ao ser chamado esse texto escreve automaticamente a narrativa
	
	tie.reset()
	
	tie.set_color(Color(1,1,1))
	controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO1"),0.05)
	controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO2"),0.05)
	controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO3"),0.05)
	controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO4"),0.05)
	controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO5"),0.05)
	controlaTextbox.comecarEscrever()
	#controlaTextbox.adicionaMenssagem("Seu nome é Ego.",0.05)
	#tie.buff_text("Numa estrada, como em muitas outras, caminha um Viajante.",0.05)
	#tie.buff_text("Seu nome é Ego.",0.05)
	tie.set_state(tie.STATE_OUTPUT)
	#tie.set_state(tie.STATE_WAITING)
	