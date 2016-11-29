 #cria o texto da narrativa, como é um texto único tudo pode ser iniciado com a função desse script

extends Control

onready var tie = get_node("fundo/text_interface_engine")
onready var controlaTextbox = get_node("fundo/controlaTextbox")
export var velocidadePadrao = 0.05 #velocidade padrão dessa fonte de texto
var parteAtual = ""
var indiceAtual = 0
#var parteAnterior = "" #garante que o evento não fique em loop
#var indiceAnterior = 0 #garante que o evento não fique em loop
#var configurou = false #garante que o evento não fique em loop

func _ready():
	
	#inicializa
	tie.reset()
	
	set_process(true)

func _process(delta): #ao ser chamado esse texto escreve automaticamente a narrativa
	
	#atualiza a parte e o indice da parte atual
	parteAtual = controleFluxoHistoria.getParte()
	indiceAtual = controleFluxoHistoria.getIndiceParte()
	
	if(parteAtual == "prologo"):
		
		#print("oi")
		
		#configuração inicial
		if(indiceAtual == 0):
			
			tie.set_color(Color(1,1,1))
			tie.set_font_bypath("res://interface/textbox/fonteNarrador.fnt")
			controleFluxoHistoria.acrescentaIndiceParte()
			
		#escreve o texto
		
		if(indiceAtual == 1):
			
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO1"),0.05)
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO2"),0.05)
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO3"),0.05)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte()
			
		elif(indiceAtual == 3):
			
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO4"),0.05)
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO5"),0.05)
			controlaTextbox.comecarEscrever()
		
	