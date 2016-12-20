 #exibe oue esconde a caixa de ideias

extends Control

onready var adicionouIdeia = false #determina se as ideias foram adicionadas
onready var areaDeIdeias = get_node("areaDeIdeias")

var atrasa = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false

func _ready():

	set_process(true)
	
	#cria um timer para atraso entre eventos
	atrasa.set_one_shot(true)
	atrasa.set_timer_process_mode(0)
	atrasa.set_wait_time(0.5)
	add_child(atrasa)
	atrasa.connect("timeout", self, "atrasaFechar")
	
func _process(delta):
	
	#print(controlaCaixaIdeias.getEstado())
	#print(atrasa.get_time_left())
	
	if(controlaCaixaIdeias.getEstado() == "abrindo" or controlaCaixaIdeias.getEstado() == "aberta"):
		
		show()
		
		if((adicionouIdeia == false) and controleFluxoHistoria.getParte() != "prologo"):
			
			areaDeIdeias.adicionaIdeias()
			adicionouIdeia = true
			
		elif((adicionouIdeia == false) and controleFluxoHistoria.getParte() == "prologo"): #remanescente apenas para não restruturar os indices.
			
			if(controleFluxoHistoria.getIndiceParte() == 17):
				
#				areaDeIdeias.adicionaNIdeias(3)
				controleFluxoHistoria.acrescentaIndiceParte()
		
	elif(controlaCaixaIdeias.getEstado() == "fechando"):
		
		#print(globais.getTotalIdeiaReagindo())
		
		if(globais.getTotalIdeiaReagindo() == 0): #se não tiver nenhuma ideia em processo de reação
			
			if(iniciouTimer == false): #atrasa um pouco para não fechar bruscamente
			
				#print("timer")
				atrasa.start()
				iniciouTimer = true

	elif(controlaCaixaIdeias.getEstado() == "fechada"):
		
		hide()
		adicionouIdeia = false
			
func atrasaFechar():

	controlaCaixaIdeias.setEstado("fechada")
	print(controlaCaixaIdeias.getEstado())
#	hide()
#	adicionouIdeia = false
	