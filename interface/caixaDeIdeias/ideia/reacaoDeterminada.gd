extends Control

onready var interacaoMouse = get_parent().get_node("interacao")
onready var clicando = false
onready var ideia = get_parent()
onready var alterouReacao = false

#var atrasaFluxoHistoria = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
#var iniciouTimer = false

func _ready():
	
	pass
	#inicializa o processo
#	set_process(true)
	
	#cria um timer para atraso entre eventos
#	atrasaFluxoHistoria.set_one_shot(true)
#	atrasaFluxoHistoria.set_timer_process_mode(0)
#	atrasaFluxoHistoria.set_wait_time(0)
#	add_child(atrasaFluxoHistoria)
#	atrasaFluxoHistoria.connect("timeout", self, "atrasaAcresentaIndice")
	
	
	#conecta o sinal
#	ideia.get_node("anim").connect("finished",self,"_on_anim_finished")

#func _process(delta):
#	
#	pass
	
func decideReacaoDeterminada():
	
#	print("chamou")
#	print(controleFluxoHistoria.getIndiceParte())

	#50 ou 54
	
	if(controleFluxoHistoria.getParte() == "prologo" and alterouReacao == false):
			
			
			if(controleFluxoHistoria.getIndiceParte() == 25):
				
				controleFluxoHistoria.pularIndiceParte(28)
			
			if(controleFluxoHistoria.getIndiceParte() == 28):
				
#				print("funciona")
				
				ideia.decideReacao("recusa")
				alterouReacao = true
				
#				print(ideia.getReacao())
				
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
			elif(controleFluxoHistoria.getIndiceParte() == 31):
				
#				print("foi")
				
				ideia.decideReacao("libera")
				alterouReacao = true
				
#				print(ideia.getReacao())
				
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
			elif(controleFluxoHistoria.getIndiceParte() == 34):
				
#				print("foi")
				
				ideia.decideReacao("engana")
#				print(ideia.getReacao())
				alterouReacao = true
				
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
				
			

func _on_anim_finished():
	
	pass
	
#	if(controleFluxoHistoria.getIndiceParte() == 28 or controleFluxoHistoria.getIndiceParte() == 36):
#		
#		if(iniciouTimer == false):
#			
#			atrasaFluxoHistoria.set_wait_time(0)
#			atrasaFluxoHistoria.start()
#			iniciouTimer = true
#			
#	elif(controleFluxoHistoria.getIndiceParte() == 32):
#		
#		if(iniciouTimer == false):
#			
#			atrasaFluxoHistoria.set_wait_time(1)
#			atrasaFluxoHistoria.start()
#			iniciouTimer = true
		
#func atrasaAcresentaIndice():
#	
#	pass
#	print(controleFluxoHistoria.getIndiceParte())
#	controleFluxoHistoria.acrescentaIndiceParte(get_name())
#	iniciouTimer = false

func _on_interacao_button_down():

	pass
			
# #	print("apertou")
#	
#	if(controleFluxoHistoria.getParte() == "prologo" and alterouReacao == false):
#			
#			if(controleFluxoHistoria.getIndiceParte() == 24):
#				
#				controleFluxoHistoria.pularIndiceParte(27)
#			
#			if(controleFluxoHistoria.getIndiceParte() == 27):
#				
# #				print("funciona")
#				
#				ideia.decideReacao("recusa")
#				
# #				print(ideia.getReacao())
#				
#				controleFluxoHistoria.acrescentaIndiceParte(get_name())
#				
#			elif(controleFluxoHistoria.getIndiceParte() == 31):
#				
#				ideia.decideReacao("libera")
#				
#				controleFluxoHistoria.acrescentaIndiceParte(get_name())
#				
#			elif(controleFluxoHistoria.getIndiceParte() == 35):
#				
#				ideia.decideReacao("engana")
#				
#				controleFluxoHistoria.acrescentaIndiceParte(get_name())
#				
#			alterouReacao = true
