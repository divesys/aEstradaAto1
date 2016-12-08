#cria o texto do ego

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
			
		#escreve o texto
		
		if(indiceAtual == 9):
			
			#determina a textbox
			origemTextbox.mudaOrigemTexto("ego")
			origemTextbox.mudaTipoTexto("pensamento")
			origemTextbox.mudaEmocaoTexto("pensativo")
			origemTextbox.mudaVariacaoTexto("")
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO1"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte()
			
		elif(controleFluxoHistoria.getIndiceParte() == 13):
			
			#muda a emoção
			origemTextbox.mudaEmocaoTexto("confiante")
			
			#impede qualquer outra interação além do texto
			#controleFluxoHistoria.setExclusivoTexto(true)
			
			#escreve o texto
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO2"),velocidadePadrao)
			controlaTextbox.adicionaMenssagem(tr("EGO_PROLOGO3"),velocidadePadrao)
			controlaTextbox.comecarEscrever()
			controleFluxoHistoria.acrescentaIndiceParte()