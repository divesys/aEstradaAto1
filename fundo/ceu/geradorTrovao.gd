extends Node2D

var intervaloTeste = 3 #intervalo entre os testes
var intervaloTrovao = 6 #intervalo entre um trovao e outro
var probabilidadeTrovao = 30 #probabilidade de surgir um trovao
var testaTrovao = 0 #verifica se deve ser criado um trovao
var geraTrovao = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false

var node = ""
var cena = ""

func _ready():
	
	cena = load("res://fundo/ceu/trovao.tscn")
	
	geraTrovao.set_one_shot(true)
	geraTrovao.set_timer_process_mode(0)
	geraTrovao.set_wait_time(0)
	add_child(geraTrovao)
	geraTrovao.connect("timeout", self, "testaGeraTrovao")
	
	set_process(true)
	
func _process(delta):
	
	if(iniciouTimer == false and get_parent().getGerarTrovao() == true):
		
		geraTrovao.start()
		iniciouTimer = true
		
func testaGeraTrovao():
	
	randomize()
	testaTrovao = rand_range(0,100)
	print(get_name() + " " + str(testaTrovao))
	
	if(testaTrovao <= probabilidadeTrovao):
		
		#print(get_name() + " " + str(get_pos()))
		geraTrovao.set_wait_time(intervaloTrovao)
		node = cena.instance() #instancia a cena
		get_parent().add_child(node) #adiciona o nó ao nó pai
		node.set_pos(get_pos())
		iniciouTimer = false
		
	else:
		
		geraTrovao.set_wait_time(intervaloTeste)
		iniciouTimer = false
		
