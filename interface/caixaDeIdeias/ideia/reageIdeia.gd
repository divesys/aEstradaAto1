 #determina as reações das ideias e se ela deve ser multiplicada ou não

extends Sprite

onready var interacaoMouse = get_node("interacao")
onready var chanceRecusa = 40
onready var chanceEngana = 30
onready var chanceLibera = 20
onready var decideReacao = 0
onready var reacao = ""
onready var resorteou = false
onready var reagindo = false
onready var animacao = get_node("anim")
onready var clicando = false

func _ready():
	
	sorteaReacao()
	set_process(true)
	
func _process(delta):
	
	#determina se a reação devera ser resorteada
	
	if(resorteou == false and controlaCaixaIdeias.getEstado() == "aberta"):
		
		sorteaReacao()
		resorteou = true
		
	elif(controlaCaixaIdeias.getEstado() == "fechada"):
		
		resorteou = false
		
	#executa a reacao
		
	clicando = interacaoMouse.getClicando()
	
		
	if(reagindo == false and clicando == true):
		
		if(reacao == "recusa"):
			
			animacao.play("recusa")
			
		elif(reacao == "engana"):
			
			animacao.play("engana")
			
		elif(reacao == "libera"):
			
			animacao.play("libera")
			
	if(animacao.is_playing() == false):
		
		reagindo = false
		
	elif(animacao.is_playing() == true):
		
		reagindo = true
		
func sorteaReacao():
	
	#escolhe um número de 0 a 100
	randomize()
	decideReacao = rand_range(0,100)
	
	#determina a reação
	if(decideReacao >= 0 and decideReacao <= chanceRecusa):
		
		reacao = "recusa"
		
	elif(decideReacao > chanceRecusa and decideReacao <= (chanceRecusa + chanceEngana)):
		
		reacao = "engana"
		
	elif(decideReacao > (chanceRecusa + chanceEngana) and decideReacao <= 100):
		
		reacao = "libera"