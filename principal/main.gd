 #controla os eventos principais do jogo, como por exemplo o fluxo da historia

extends Node2D

#variaveis de fluxo da historia
var parteAtual = ""
var indiceParteAtual = 0
var atrasaFluxoHistoria = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false

#variaveis de nó
onready var caixaDeIdeias =get_node("interface/caixaDeIdeias")
onready var enxurradaIdeia  = caixaDeIdeias.get_node("areaDeIdeias")

#variaveis de passos

#prologo
var passosPrologoAnterior = 0 #o número de passos capturado num dado instante que é usado para ser comparado com um instante posterior
var determinouPassosPrologoAnterior = false #verifica se foi detertminado o passosPrologoAnterior
var passosPrologoAtual = 0 #o número atual de passos 

func _ready():

	#cria eventos especiais
	controleFluxoHistoria.criaEventoEspecial("andarAutomatico" , true) #evento que determina se o ego devera se manter andando
	controleFluxoHistoria.criaEventoEspecial("andarHabilitado" , false) #evento que determina se o Ego pode andar ou não
	controleFluxoHistoria.criaEventoEspecial("ideiasSimultaneas", false) #evento que determina se o jogador podera clicar em duas ideias ao mesmo tempo
	controleFluxoHistoria.criaEventoEspecial("travaCaixaDeIdeias", false) #evento que impede a caixa de ideias de ser aberta
	
	#inicia a primeira parte
	controleFluxoHistoria.mudarParte("prologo")
	
	#cria uma semente aleatoria
	randomize()
	
	#gera o número inicial de passos e de ideias
	globais.setPassosPrologo(round(rand_range(10,50))) #inicializa um número aleatorio de passos
	enxurradaIdeia.adicionaNIdeias(3) #adiciona 3 ideias, que não serão visiveis nesse momento
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
	
#	print(controleFluxoHistoria.getExclusivoTexto())
	
	passosPrologoAtual = globais.getPassosPrologo()
	
	#verifica qual é a parte atual
	parteAtual = controleFluxoHistoria.getParte()
	indiceParteAtual = controleFluxoHistoria.getIndiceParte()
	
	if(indiceParteAtual == 11):
		
#		#impede qualquer outra interação além do texto
#		controleFluxoHistoria.setExclusivoTexto(true)
		
		#impede a caixa de ideias de abrir
		controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias",true)
		
		#ativa a caixa de ideias
		controlaCaixaIdeias.vibraCaixaIdeias(true)
	
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
		controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias", false) #libera a caixa de ideias
		controleFluxoHistoria.acrescentaIndiceParte()
		
#		if(controlaCaixaIdeias.getEstado() == "aberta"):
#		
#			caixaDeIdeias.adicionaIdeiaDetalhada("recusa")
#			caixaDeIdeias.adicionaIdeiaDetalhada("engana")
#			caixaDeIdeias.adicionaIdeiaDetalhada("libera")
			
			
	elif(indiceParteAtual == 18):
		
#		controleFluxoHistoria.setExclusivoTexto(true)
		controleFluxoHistoria.acrescentaIndiceParte()
	
	elif(indiceParteAtual == 24):
		
		atrasaFluxoHistoria.set_wait_time(5)
		
		if(iniciouTimer == false):
		
			atrasaFluxoHistoria.start()
			iniciouTimer = true
			
		controleFluxoHistoria.acrescentaIndiceParte()
		
	elif(indiceParteAtual == 39):
		
		controleFluxoHistoria.alteraEventoEspecial("andarHabilitado" , true)
		controleFluxoHistoria.acrescentaIndiceParte()
		
	elif(indiceParteAtual == 42):
		
		if(determinouPassosPrologoAnterior == false):
			
			passosPrologoAnterior = globais.getPassosPrologo() #captura o número de passos nesse exato instante
			determinouPassosPrologoAnterior = true
			
		if(passosPrologoAtual == (passosPrologoAnterior + 8)): #verifica se ego andou 8 passos apos o jogador ler a menssagem anterior
			
			#impede a caixa de ideias de abrir
			controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias",true)
		
			#ativa a caixa de ideias
			controlaCaixaIdeias.vibraCaixaIdeias(true)
			
			determinouPassosPrologoAnterior = false
			
			controleFluxoHistoria.acrescentaIndiceParte()
			
	elif(indiceParteAtual == 45):
		
		controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias", false) #libera a caixa de ideias
		controleFluxoHistoria.acrescentaIndiceParte()
		
	elif(indiceParteAtual == 51):
		
		enxurradaIdeia.adicionaNIdeias(5)
		controleFluxoHistoria.acrescentaIndiceParte()
	
func atrasaAcresentaIndice():
	
	#print("oxe")
	controleFluxoHistoria.acrescentaIndiceParte()
	iniciouTimer = false