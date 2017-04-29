 #esse script determina se deverá abrir a caixa de ideias. As chances de abrir aumentam exponencialmente com os passos

extends Control

onready var areaDeIdeias = get_parent().get_node("areaDeIdeias")

var fatorCrescimento = 500 #determina o quão rápido cresce a probabilidade de abrir a caixa
var valorInicial = 5 #porcentagem minima da probabilidade de abrir a caixa
var probabilidadeAbrir = 0 #probabilidade de abrir a caixa
var passosAtual = 0 #número de passos atual
var testaAbrir = 0 #numero utilizado para testar se a caixa vai abrir
var ideiasAnterior = 0 #numero de ideias antes de adicionar uma ideia
var escolheu = false #verifica se já escolheu o número
var passosAnterior = -1 #o número de passos antes de testar novamente 

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	passosAtual = globais.getPassosSupostos()
	
	if(passosAnterior < passosAtual):
	
		testaProbabilidade()
	
func determinaProbabilidade():
	
	#determina a probabilidade atual da caixa abrir
	
	if(controleFluxoHistoria.getParte() == "estradaPrincipal"):
		
		probabilidadeAbrir = (pow(passosAtual,2)/fatorCrescimento)+valorInicial
		
		if(probabilidadeAbrir > 100):
			
			probabilidadeAbrir = 100


func testaProbabilidade():
	
	passosAnterior = globais.getPassosSupostos()
	
	if(controleFluxoHistoria.getParte() == "estradaPrincipal"):
		
		determinaProbabilidade()
			
		randomize()
		testaAbrir = rand_range(0,100) #escolhe um número para testar se a caixa ira abrir
		escolheu = true
		print(str(testaAbrir) + "/" + str(probabilidadeAbrir))
		
		if(testaAbrir <= probabilidadeAbrir):
			#se o número selecionado for menor que as chances atuais
			
			ideiasAnterior = globais.getTotalIdeias()
			
			if(ideiasAnterior < globais.getTotalIdeias()):
				
				areaDeIdeias.adicionaIdeias() #adiciona novas ideias
			
			controlaCaixaIdeias.vibraCaixaIdeias(true) #abre a caixa de ideias
			escolheu = false