 #faz a enxurrada de ideias, tendo o cuidado de posicionar dentro da area de ideias

extends Container

onready var cenaIdeia = load("res://interface/caixaDeIdeias/ideia/ideia.tscn")
onready var noIdeia = ""
onready var maximoIdeias = 3 #numero maximo de ideias que podem ser geradas
onready var larguraIdeia = 0
onready var alturaIdeia = 0
onready var larguraArea = self.get_size().x
onready var alturaArea = self.get_size().y
onready var xIdeia = 0
onready var yIdeia = 0

func _ready():
	
	pass

func adicionaIdeiaDetalhada(stringReacao):
	
	#cria o nó da ideia
	noIdeia = cenaIdeia.instance()
	add_child(noIdeia)
	
	#pega o tamanho da ídeia
	larguraIdeia = noIdeia.get_texture().get_width()
	alturaIdeia = noIdeia.get_texture().get_height()
	
	#determina as coordenas
	randomize()
	xIdeia = rand_range(larguraIdeia/2,larguraArea - (larguraIdeia/2))
	yIdeia = rand_range(alturaIdeia/2,alturaArea - (alturaIdeia/2))
	
	#posiciona a ideia
	noIdeia.set_pos(Vector2(xIdeia,yIdeia))
	
	noIdeia.decideReacao(stringReacao)

func adicionaNIdeias(intNumeroIdeias):
	
	for i in range(1,intNumeroIdeias + 1):
		
		#cria o nó da ideia
		noIdeia = cenaIdeia.instance()
		add_child(noIdeia)
		
		#pega o tamanho da ídeia
		larguraIdeia = noIdeia.get_texture().get_width()
		alturaIdeia = noIdeia.get_texture().get_height()
		
		#determina as coordenas
		randomize()
		xIdeia = rand_range(larguraIdeia/2,larguraArea - (larguraIdeia/2))
		yIdeia = rand_range(alturaIdeia/2,alturaArea - (alturaIdeia/2))
		
		#posiciona a ideia
		noIdeia.set_pos(Vector2(xIdeia,yIdeia))

func adicionaIdeias():
	
	#print("adicionou")
	
	maximoIdeias = floor(rand_range(1,3))
	
	for i in range(1,maximoIdeias + 1):
		
		#cria o nó da ideia
		noIdeia = cenaIdeia.instance()
		add_child(noIdeia)
		
		#pega o tamanho da ídeia
		larguraIdeia = noIdeia.get_texture().get_width()
		alturaIdeia = noIdeia.get_texture().get_height()
		
		#determina as coordenas
		randomize()
		xIdeia = rand_range(larguraIdeia/2,larguraArea - (larguraIdeia/2))
		yIdeia = rand_range(alturaIdeia/2,alturaArea - (alturaIdeia/2))
		
		#posiciona a ideia
		noIdeia.set_pos(Vector2(xIdeia,yIdeia))