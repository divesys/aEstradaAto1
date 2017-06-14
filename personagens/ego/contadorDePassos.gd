 #conta os passos do ego

extends Node2D

var ego = "" #nó do ego
var frameAtual = 0 #determina qual frame de animação o ego está
var executandoPasso = false #alavanca que impede que se adicione mais de um passo

var atrasa = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false

func _ready():
	
	ego = get_parent()
	set_process(true)
	
	#cria um timer para atraso entre eventos
	atrasa.set_one_shot(true)
	atrasa.set_timer_process_mode(0)
	atrasa.set_wait_time(2)
	add_child(atrasa)
	atrasa.connect("timeout", self, "atrasaZeraPassos")
	
func _process(delta):
	
	frameAtual = ego.get_frame() #atualiza o frame atual do ego
	
	if(controleFluxoHistoria.getParte() == "reflexao"):
			
			if(controleFluxoHistoria.getIndiceParte() == 2):
				
				globais.setPassosReais(globais.getPassosSupostos()) #grava o número de passo nesse momento e o define como real
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
				if(iniciouTimer == false):
					
					atrasa.start()
					iniciouTimer = true
	
	
	if((frameAtual == 1 or frameAtual == 3) and executandoPasso == false): #se ego está dando um passo 
	
		executandoPasso = true #trava a adição de passos até o proximo passo
	
		if(controleFluxoHistoria.getParte() == "prologo"):
			
			globais.acresentaPassoPrologo() #acresenta um passo aos passos do prologo
			
		elif(controleFluxoHistoria.getParte() == "estradaPrincipal"):
			
			globais.acresentaPassoSuposto() #acresenta um passo aos passos supostos
		
	elif(frameAtual == 0 or frameAtual == 2):
		
		executandoPasso = false
		
func atrasaZeraPassos():
	
	if(controleFluxoHistoria.getParte() == "reflexao"):
		
		if(controleFluxoHistoria.getIndiceParte() == 3):
			
			globais.setPassosSupostos(0)
			controleFluxoHistoria.acrescentaIndiceParte(get_name())