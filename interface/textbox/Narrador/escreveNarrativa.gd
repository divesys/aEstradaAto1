 #cria o texto da narrativa, como é um texto único tudo pode ser iniciado com a função desse script

extends Control

onready var tie = get_parent().get_node("text_interface_engine")
onready var controlaTextbox = get_parent().get_node("controlaTextbox")
onready var origemTextbox = get_parent().get_parent() #pega o nó textbox
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
		
		#configuração inicial
		if(indiceAtual == 0):
			
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		#escreve o texto
		
		if(indiceAtual == 1):
			
#			#determina a textbox
#			origemTextbox.mudaOrigemTexto("narrador")
#			origemTextbox.mudaTipoTexto("fala")
#			origemTextbox.mudaEmocaoTexto("normal")
#			origemTextbox.mudaVariacaoTexto("")
			controlaTextbox.adicionaMenssagemIntervaloDetalhado("NARRADOR_PROLOGO",1,3,velocidadePadrao,"narrador","fala","normal","")
			
			#escreve o texto
#			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO1"),velocidadePadrao)
#			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO2"),velocidadePadrao)
#			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO3"),velocidadePadrao)

			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
			
		elif(indiceAtual == 4):
			
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO4"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceAtual == 7):
			
			controlaTextbox.adicionaMenssagem(tr("NARRADOR_PROLOGO5"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())