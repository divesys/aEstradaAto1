 #conta o número de cliques nas ideias e fecha a caixa caso os cliques acabem

extends Control

onready var maxCliques = 0
onready var minCliques = 0
onready var taxaMinCliques = 0.2
onready var totalCliques = 0
onready var cliquesRestantes = 0
var reduziu = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)


func _process(delta):
	
	#garante que não ocorre cliques negativos
	if(cliquesRestantes < 0):
		
		cliquesRestantes = 0
		
	elif(cliquesRestantes == 0 and controlaCaixaIdeias.getEstado() == "aberta" and totalCliques > 0):
		
		controlaCaixaIdeias.fechaCaixaIdeias()
		totalCliques = 0
	
func iniciaCliques():
	
	#determina o total de cliques
	maxCliques = globais.getTotalIdeias()
	minCliques = totalCliques * taxaMinCliques
	randomize()
	totalCliques = round(rand_range(minCliques,maxCliques))
	cliquesRestantes = totalCliques
	
	#garante que não exista mais cliques que ideias disponiveis
	while(totalCliques > maxCliques):
		
		totalCliques = round(rand_range(minCliques,maxCliques))
		
	cliquesRestantes = totalCliques
	
	#reseta a alavanca reduziu
	#resetaReduziu()
	
func iniciaCliquesN(intCliques):
	
	totalCliques = intCliques
	cliquesRestantes = totalCliques
	
	#reseta a alavanca reduziu
	#resetaReduziu()
			
func reduzClique():
	
	#print(reduziu)
	#print("me chamou")
	
	#verifica se a caixa está aberta e ainda existem cliques restantes
	if(controlaCaixaIdeias.getEstado() == "aberta" and cliquesRestantes > 0 and reduziu == false):
		
		cliquesRestantes -= 1
		reduziu = true
		
func getCliquesRestantes():
	
	return cliquesRestantes
	
func resetaReduziu():
	
	reduziu = false