 #controla os eventos principais do jogo, como por exemplo o fluxo da historia

extends Node2D

#variaveis de fluxo da historia
var parteAtual = ""
var indiceParteAtual = 0
var atrasaFluxoHistoria = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false
onready var caixaDeIdeias =get_node("interface/caixaDeIdeias")


func _ready():

	#cria eventos especiais
	controleFluxoHistoria.criaEventoEspecial("andarAutomatico" , true) #evento que determina se o ego devera se manter andando
	controleFluxoHistoria.criaEventoEspecial("andarHabilitado" , false) #evento que determina se o Ego pode andar ou não
	controleFluxoHistoria.criaEventoEspecial("ideiasSimultaneas", false) #evento que determina se o jogador podera clicar em duas ideias ao mesmo tempo
	
	#inicia a primeira parte
	controleFluxoHistoria.mudarParte("prologo")
	
	#cria uma semente aleatoria
	randomize()
	
	#gera o número inicial de passos e de ideias
	globais.setPassosPrologo(round(rand_range(10,50))) #inicializa um número aleatorio de passos
	caixaDeIdeias.get_node("areaDeIdeias").adicionaNIdeias(3) #adiciona 3 ideias, que não serão visiveis nesse momento
	contaCliquesIdeias.iniciaCliquesN(3) #força a ter exatamente 3 cliques
	
	#cria um timer para atraso entre eventos
	atrasaFluxoHistoria.set_one_shot(true)
	atrasaFluxoHistoria.set_timer_process_mode(0)
	atrasaFluxoHistoria.set_wait_time(1)
	add_child(atrasaFluxoHistoria)
	atrasaFluxoHistoria.connect("timeout", self, "atrasaAcresentaIndice")
	
	#inicializa o processo
	set_process(true)
	
func _process(delta):
	
	#verifica qual é a parte atual
	parteAtual = controleFluxoHistoria.getParte()
	indiceParteAtual = controleFluxoHistoria.getIndiceParte()
	
	if(indiceParteAtual == 11):
		
		#ativa a caixa de ideias
		controlaCaixaIdeias.vibraCaixaIdeias(true)
		
#		#impede qualquer outra interação além do texto
#		controleFluxoHistoria.setExclusivoTexto(true)
		
		#encerra o andar automatico
		controleFluxoHistoria.alteraEventoEspecial("andarAutomatico",false)
		
		#prossegue com o fluxo da historia
		controleFluxoHistoria.acrescentaIndiceParte()
		
	elif(indiceParteAtual == 12): #espera um tempo x e prossegue com o fluxo da historia
	
		#timer.connect("timeout", self, "_timer_callback")
		
		if(iniciouTimer == false):
			
			#print(iniciouTimer)
			atrasaFluxoHistoria.start()
			iniciouTimer = true
		
		#print(atrasaFluxoHistoria.get_time_left())

		
	elif(indiceParteAtual == 15):
		
#		controleFluxoHistoria.setExclusivoTexto(false)
		controleFluxoHistoria.acrescentaIndiceParte()
		
#		if(controlaCaixaIdeias.getEstado() == "aberta"):
#		
#			caixaDeIdeias.adicionaIdeiaDetalhada("recusa")
#			caixaDeIdeias.adicionaIdeiaDetalhada("engana")
#			caixaDeIdeias.adicionaIdeiaDetalhada("libera")
			
			
	elif(indiceParteAtual == 18):
		
#		controleFluxoHistoria.setExclusivoTexto(true)
		controleFluxoHistoria.acrescentaIndiceParte()
	
	elif(indiceParteAtual == 23):
		
		atrasaFluxoHistoria.set_wait_time(3)
		controleFluxoHistoria.acrescentaIndiceParte()
	
	
func atrasaAcresentaIndice():
	
	#print("oxe")
	controleFluxoHistoria.acrescentaIndiceParte()
	iniciouTimer = false