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
onready var sonho = get_node("sonho")
onready var sistemaDistracao = get_node("interface/sistemaDistracao")
onready var textoEgo = get_node("interface/textBox/Conteudo/egoTexto")

#prologo
var passosPrologoAnterior = 0 #o número de passos capturado num dado instante que é usado para ser comparado com um instante posterior
var determinouPassosPrologoAnterior = false #verifica se foi detertminado o passosPrologoAnterior
var passosPrologoAtual = 0 #o número atual de passos 

#alavancas
var chamouNaoSonho = false
var chamouPrimeiraDistracao = false
var chamouTextoDistracao = false

func _ready():

	
	
	#cria eventos especiais
	controleFluxoHistoria.criaEventoEspecial("andarAutomatico" , true) #evento que determina se o ego devera se manter andando
	controleFluxoHistoria.criaEventoEspecial("andarHabilitado" , false) #evento que determina se o Ego pode andar ou não
	controleFluxoHistoria.criaEventoEspecial("ideiasSimultaneas", false) #evento que determina se o jogador podera clicar em duas ideias ao mesmo tempo
	controleFluxoHistoria.criaEventoEspecial("travaCaixaDeIdeias", false) #evento que impede a caixa de ideias de ser aberta
	controleFluxoHistoria.criaEventoEspecial("exclusivoSonho", false) #evento que impede de interagir com as outras ideias na existencia de um sonho
	controleFluxoHistoria.criaEventoEspecial("exclusivoTexto",false) #evento que só permite interação com o texto
	
	#inicia a primeira parte
	controleFluxoHistoria.mudarParte("prologo")
	
	#cria uma semente aleatoria
	randomize()
	
	#gera o número inicial de passos e de ideias
	globais.setPassosPrologo(round(rand_range(10,50))) #inicializa um número aleatorio de passos
	enxurradaIdeia.adicionaNIdeias(3) #adiciona 1 ideia
	contaCliquesIdeias.iniciaCliquesN(3) #força a ter exatamente 3 cliques
	
	#cria um timer para atraso entre eventos
	atrasaFluxoHistoria.set_one_shot(true)
	atrasaFluxoHistoria.set_timer_process_mode(0)
	atrasaFluxoHistoria.set_wait_time(1)
	add_child(atrasaFluxoHistoria)
	atrasaFluxoHistoria.connect("timeout", self, "atrasaAcresentaIndice")
	
	#cria a posição do sonho
	#get_node("Fundo").estradaCorrompida()
	#inicializa o processo
	set_process(true)
	
func _process(delta):
	
#	#print(controleFluxoHistoria.getExclusivoTexto())
#	#print(controleFluxoHistoria.getEventoEspecial("andarHabilitado"))
	#print(controlaCaixaIdeias.getEstado())
	
	passosPrologoAtual = globais.getPassosPrologo()
	
	#verifica qual é a parte atual
	parteAtual = controleFluxoHistoria.getParte()
	indiceParteAtual = controleFluxoHistoria.getIndiceParte()
	
	
	
	if(controleFluxoHistoria.getParte() == "prologo"):
	
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
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
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
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
	#		if(controlaCaixaIdeias.getEstado() == "aberta"):
	#		
	#			caixaDeIdeias.adicionaIdeiaDetalhada("recusa")
	#			caixaDeIdeias.adicionaIdeiaDetalhada("engana")
	#			caixaDeIdeias.adicionaIdeiaDetalhada("libera")
				
				
		elif(indiceParteAtual == 18):
			
	#		controleFluxoHistoria.setExclusivoTexto(true)
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
		elif(indiceParteAtual == 24):
			
			atrasaFluxoHistoria.set_wait_time(5)
			
			if(iniciouTimer == false):
			
				atrasaFluxoHistoria.start()
				iniciouTimer = true
				
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 37):
			
			controleFluxoHistoria.alteraEventoEspecial("andarHabilitado" , true)
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			#print("andar habilitado agora é " + str(controleFluxoHistoria.getEventoEspecial("andarHabilitado")))
			
		elif(indiceParteAtual == 40):
			
			if(determinouPassosPrologoAnterior == false):
				
				passosPrologoAnterior = globais.getPassosPrologo() #captura o número de passos nesse exato instante
				determinouPassosPrologoAnterior = true
				
			if(passosPrologoAtual == (passosPrologoAnterior + 8)): #verifica se ego andou 8 passos apos o jogador ler a menssagem anterior
				
				#impede a caixa de ideias de abrir
				controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias",true)
			
				#ativa a caixa de ideias
				controlaCaixaIdeias.vibraCaixaIdeias(true)
				
				#impede de andar
				controleFluxoHistoria.alteraEventoEspecial("andarHabilitado",false)
				
				determinouPassosPrologoAnterior = false
				
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
		elif(indiceParteAtual == 43):
			
			controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias", false) #libera a caixa de ideias
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 45):
			
			enxurradaIdeia.adicionaNIdeias(2) #adiciona 1 ideia
			contaCliquesIdeias.iniciaCliquesN(3) #força a ter exatamente 3 cliques
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 50):
			
			atrasaFluxoHistoria.set_wait_time(5)
			
			if(iniciouTimer == false):
			
				atrasaFluxoHistoria.start()
				iniciouTimer = true
				
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 59):
			
			if(determinouPassosPrologoAnterior == false):
				
				passosPrologoAnterior = globais.getPassosPrologo() #captura o número de passos nesse exato instante
				determinouPassosPrologoAnterior = true
				
			if(passosPrologoAtual == (passosPrologoAnterior + 8)): #verifica se ego andou 8 passos apos fechar a caixa de ideias
				
				determinouPassosPrologoAnterior = false
				
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
		elif(indiceParteAtual == 62):
			
			#gera a primeira distracao
			if(sistemaDistracao.getPrimeiraDistracao() == false):
				
				if(chamouPrimeiraDistracao == false):
					
					sistemaDistracao.gerarPrimeiraDistracao()
					chamouPrimeiraDistracao = true
				
			elif(sistemaDistracao.getPrimeiraDistracao() == true):
				
				if(chamouTextoDistracao == false):
					
					textoEgo.primeiraDistracao()
					chamouTextoDistracao  = true
			
			if(globais.getExibiuTextoPrimeiraDistracao() == true):
				
				if(determinouPassosPrologoAnterior == false):
					
					passosPrologoAnterior = globais.getPassosPrologo() #captura o número de passos nesse exato instante
					determinouPassosPrologoAnterior = true
					
				if(passosPrologoAtual == (passosPrologoAnterior + 8)): #verifica se ego andou 8 passos apos o jogador ler a menssagem anterior
					
					#impede a caixa de ideias de abrir
					controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias",true)
				
					#ativa a caixa de ideias
					controlaCaixaIdeias.vibraCaixaIdeias(true)
					
					#impede de andar
					controleFluxoHistoria.alteraEventoEspecial("andarHabilitado",false)
					
					determinouPassosPrologoAnterior = false
					
					controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
		elif(indiceParteAtual == 65):
			
			#libera a caixa de ideias para abrir
			controleFluxoHistoria.alteraEventoEspecial("travaCaixaDeIdeias",false)
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
		elif(indiceParteAtual == 69):
			
			sistemaDistracao.setAtivarDistracoes(true) #ativa as distracoes
			
			controleFluxoHistoria.alteraEventoEspecial("exclusivoSonho",true) #ativa o modo exlusivo sonho
			
			atrasaFluxoHistoria.set_wait_time(2) #ajusta o tempo de espera
			
			if(iniciouTimer == false):
			
				atrasaFluxoHistoria.start() #espera o tempo determinado
				iniciouTimer = true
				
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 71):
			
			enxurradaIdeia.adicionaSonho() #adiciona o sonho
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 77): #força o fechamento da caixa de ideias
			
			controlaCaixaIdeias.fechaCaixaIdeias()
			enxurradaIdeia.destroiSonho()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			controleFluxoHistoria.alteraEventoEspecial("exclusivoSonho",false)
			
		elif(indiceParteAtual == 79): #determina o destino do objeto sonho
		
			sonho.moveSonho()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(indiceParteAtual == 84):
			
			controleFluxoHistoria.mudarParte("estradaPrincipal") #o indice retorna pra zero aqui, a parte muda
			globais.setPassosSupostos(globais.getPassosPrologo()) #muda o contador de passos do prologo para passos supostos
	
	elif(controleFluxoHistoria.getParte() == "exaustao"):
		
		if(controleFluxoHistoria.getIndiceParte() == 0):
			
			controleFluxoHistoria.alteraEventoEspecial("andarHabilitado",false) #trava a movimentação
			controleFluxoHistoria.alteraEventoEspecial("exclusivoTexto",true) #garante que a partir de agora só passe o texto
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
		elif(controleFluxoHistoria.getIndiceParte() == 3):
			
			controleFluxoHistoria.mudarParte("reflexao")
			
	elif(controleFluxoHistoria.getParte() == "reflexao"):
		
		if(controleFluxoHistoria.getIndiceParte() == 8):
			
			self.get_node("clarao").ativaClarao() #ativa um clarão
			get_node("Fundo").estradaCorrompida()
			controleFluxoHistoria.acrescentaIndiceParte(get_name())
			
		elif(controleFluxoHistoria.getIndiceParte() == 10):
			
			controleFluxoHistoria.mudarParte("queda")
			
	
func atrasaAcresentaIndice():
	
	#print("oxe")
	if(indiceParteAtual == 12 or indiceParteAtual == 25 or indiceParteAtual == 51 or indiceParteAtual == 70):
		
		controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
	iniciouTimer = false