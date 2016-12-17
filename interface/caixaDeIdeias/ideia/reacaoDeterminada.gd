extends Control

onready var interacaoMouse = get_parent().get_node("interacao")
onready var clicando = false
onready var ideia = get_parent()
onready var alterouReacao = false

var atrasaFluxoHistoria = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false

func _ready():
	
	#inicializa o processo
	set_process(true)
	
	#cria um timer para atraso entre eventos
	atrasaFluxoHistoria.set_one_shot(true)
	atrasaFluxoHistoria.set_timer_process_mode(0)
	atrasaFluxoHistoria.set_wait_time(0.5)
	add_child(atrasaFluxoHistoria)
	atrasaFluxoHistoria.connect("timeout", self, "atrasaAcresentaIndice")
	
	
	#conecta o sinal
	ideia.get_node("anim").connect("finished",self,"_on_anim_finished")

func _process(delta):
	
	#eventos ao clicar na ideia
	
	clicando = interacaoMouse.getClicando()
		
	if(clicando == true):
		
		if(controleFluxoHistoria.getParte() == "prologo" and alterouReacao == false):
			
			if(controleFluxoHistoria.getIndiceParte() == 24):
				
				controleFluxoHistoria.pularIndiceParte(27)
			
			if(controleFluxoHistoria.getIndiceParte() == 27):
				
				ideia.decideReacao("recusa")
					
				controleFluxoHistoria.acrescentaIndiceParte()
				
			elif(controleFluxoHistoria.getIndiceParte() == 31):
				
				ideia.decideReacao("libera")
				
				controleFluxoHistoria.acrescentaIndiceParte()
				
			elif(controleFluxoHistoria.getIndiceParte() == 35):
				
				ideia.decideReacao("engana")
				
				controleFluxoHistoria.acrescentaIndiceParte()
				
			alterouReacao = true

func _on_anim_finished():
	
	if(controleFluxoHistoria.getIndiceParte() == 28 or controleFluxoHistoria.getIndiceParte() == 36):
		
		if(iniciouTimer == false):
			
			atrasaFluxoHistoria.set_wait_time(0.5)
			atrasaFluxoHistoria.start()
			iniciouTimer = true
			
	elif(controleFluxoHistoria.getIndiceParte() == 32):
		
		if(iniciouTimer == false):
			
			atrasaFluxoHistoria.set_wait_time(1)
			atrasaFluxoHistoria.start()
			iniciouTimer = true
		
func atrasaAcresentaIndice():
	
	controleFluxoHistoria.acrescentaIndiceParte()
	iniciouTimer = false