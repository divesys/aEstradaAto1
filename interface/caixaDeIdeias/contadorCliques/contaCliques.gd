 #conta o número de cliques nas ideias e fecha a caixa caso os cliques acabem

extends Control

onready var maxCliques = 0
onready var minCliques = 0
onready var taxaMinCliques = 0.2
onready var totalCliques = 0
onready var cliquesRestantes = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)


func _process(delta):
	
	#garante que não ocorre cliques negativos
	if(cliquesRestantes < 0):
		
		cliquesRestantes = 0
	
func iniciaCliques():
	
	#determina o total de cliques
	maxCliques = globais.getTotalIdeias()
	minCliques = totalCliques * taxaMinCliques
	totalCliques = round(rand_range(minCliques,maxCliques))
	
	#garante que não exista mais cliques que ideias disponiveis
	while(totalCliques > maxCliques):
		
		totalCliques = round(rand_range(minCliques,maxCliques))
		
	cliquesRestantes = totalCliques
		
func reduzClique():
	
	#verifica se a caixa está aberta e ainda existem cliques restantes
	if(controlaCaixaIdeias.getEstado() == "aberta" and cliquesRestantes > 0):
		
		cliquesRestantes -= 1
		
func getCliquesCliquesRestantes():
	
	return cliquesRestantes