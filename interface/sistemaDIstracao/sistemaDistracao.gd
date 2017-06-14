 #escolhe e gera as distracoes

extends Control

var ativarDistracoes = false setget setAtivarDistracoes,getAtivarDistracoes #verdadeiro se deve gerar distrações
var primeiraDistracao = false setget , getPrimeiraDistracao #determina se já foi gerada a primeira distracao

var intervaloDistracao = 1.0 #de quanto em quanto tempos tentar gera uma distracao
var probabilidadeDistracao = 1 #probabilidade de gerar uma distracao a cada segundo
var testaDistracao = 0 #utilizado para testar se deve gerar uma distracao
var posInicialDistracao = Vector2(0,0)
var anguloDistracao = 0 #angulo em que a distracao ira surgir
var velocidadeDistraco = 0 #velocidade de movimento distracao
var duracaoDistracao = 0 #tempo que demora para destruir a distracao

onready var distracaoVisual = preload("res://interface/sistemaDIstracao/distracoesVisuais.tscn")
onready var noDistracaoVisual = ""
var timerTentativa = Timer.new()

func _ready():
	
    add_child(timerTentativa)

    timerTentativa.connect("timeout", self, "tentaDistracao")
    timerTentativa.set_wait_time(intervaloDistracao)
    timerTentativa.set_one_shot(false) # Make sure it loops
    timerTentativa.start()

func tentaDistracao():
	
	if(ativarDistracoes == true):
		
		randomize()
		testaDistracao = rand_range(0,100)
		
		#print(testaDistracao)
		
		if(testaDistracao <= probabilidadeDistracao):
			
			noDistracaoVisual = distracaoVisual.instance()
			add_child(noDistracaoVisual)
		
func limitaDistracao(): #limita a área em que a distração aparece
	
	#essa função destroi a distração ao atingir um borda invisivel nas regiões superiores e inferiores
	#impedindo assim que a distração apareça na tarja preta
	
	pass
	
func setAtivarDistracoes(boolEstado):
	
	ativarDistracoes = boolEstado
	
func getAtivarDistracoes():
	
	return ativarDistracoes
	
func getPrimeiraDistracao():
	
	return primeiraDistracao
	
func gerarPrimeiraDistracao():
	
	#gera uma distracao
	
	noDistracaoVisual = distracaoVisual.instance()
	add_child(noDistracaoVisual)
	primeiraDistracao = true
	
