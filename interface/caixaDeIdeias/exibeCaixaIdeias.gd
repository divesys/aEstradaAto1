 #exibe oue esconde a caixa de ideias

extends Control

onready var adicionouIdeia = false #determina se as ideias foram adicionadas
onready var areaDeIdeias = get_node("areaDeIdeias")

onready var atrasa = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
onready var iniciouTimer = false

func _ready():

	set_process(true)
	
	iniciouTimer = false
	
	#cria um timer para atraso entre eventos
	atrasa.set_one_shot(true)
#	atrasa.set_timer_process_mode(0)
	atrasa.set_wait_time(0.5)
	add_child(atrasa)
	atrasa.connect("timeout", self, "atrasaFechar")
	
func _process(delta):
	
	#print(controlaCaixaIdeias.getEstado())
	#print(atrasa.get_time_left())
	
	globais.setPosCaixaIdeias(self.get_pos())
	globais.setTamanhoCaixaIdeias(get_node("fundo").get_texture().get_size())
	
	if(controlaCaixaIdeias.getEstado() == "abrindo" or controlaCaixaIdeias.getEstado() == "aberta"):
		
		show()
		controleFluxoHistoria.alteraEventoEspecial("andarHabilitado",false)
		
		if((adicionouIdeia == false) and controleFluxoHistoria.getParte() != "prologo"):
			
			areaDeIdeias.adicionaIdeias()
			adicionouIdeia = true
			
		elif((adicionouIdeia == false) and controleFluxoHistoria.getParte() == "prologo"): #remanescente apenas para não restruturar os indices.
			
			if(controleFluxoHistoria.getIndiceParte() == 17):
				
#				areaDeIdeias.adicionaNIdeias(3)
				controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
	elif(controlaCaixaIdeias.getEstado() == "fechando"):
		
		print(globais.getTotalIdeiaReagindo())
		
		if(globais.getTotalIdeiaReagindo() <= 0): #se não tiver nenhuma ideia em processo de reação
			
#			print(iniciouTimer)
			
			if(iniciouTimer == false): #atrasa um pouco para não fechar bruscamente
			
#				print("timer")
				atrasa.start()
				iniciouTimer = true

	elif(controlaCaixaIdeias.getEstado() == "fechada"):
		
		hide()
		adicionouIdeia = false
			
func atrasaFechar():

	controleFluxoHistoria.alteraEventoEspecial("andarHabilitado",true)
	controlaCaixaIdeias.setEstado("fechada")
	iniciouTimer = false
#	print(controlaCaixaIdeias.getEstado())
#	hide()
#	adicionouIdeia = false
	