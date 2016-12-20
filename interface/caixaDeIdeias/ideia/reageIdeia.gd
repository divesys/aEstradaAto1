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
onready var particulas = get_node("Particles2D")
onready var clicando = false
onready var reduziu = false

var atrasa = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia
var iniciouTimer = false

func _ready():
	
	if(controleFluxoHistoria.getParte() != "prologo"):
		
		sorteaReacao()
		
	set_process(true)
	
#	#cria um timer para atraso entre eventos
	atrasa.set_one_shot(true)
	atrasa.set_timer_process_mode(0)
	atrasa.set_wait_time(0.5)
	add_child(atrasa)
	atrasa.connect("timeout", self, "atrasaAutoDestroi")
	
func _process(delta):
	
	#print(reduziu)
	
	if(controlaCaixaIdeias.getEstado() != "aberta"):
		
		#print("estou aqui")
		reduziu == false
	
	if(controleFluxoHistoria.getParte() != "prologo"):
	
		#determina se a reação devera ser resorteada
		if(resorteou == false and controlaCaixaIdeias.getEstado() == "aberta"):
			
			sorteaReacao()
			resorteou = true
			
		elif(controlaCaixaIdeias.getEstado() == "fechada"):
			
			resorteou = false
		
	#executa a reacao
		
	clicando = interacaoMouse.getClicando()
	
	#print(clicando)
	
	if((reagindo == false and clicando == true) and self.is_visible()):
		
		
		if(reacao == "recusa"):
			
			animacao.play("recusa")
			
		elif(reacao == "engana"):
			
			animacao.play("engana")
			
		elif(reacao == "libera" and particulas.is_emitting() == false):
			
			animacao.play("libera")
			
		#reduz o número de cliques restantes
		if(reduziu == false):
			
			reduziu = true
			contaCliquesIdeias.resetaReduziu()
			contaCliquesIdeias.reduzClique()
			
		
			
			
	if(animacao.is_playing() == false):
		
		if(reacao != "libera"):
			
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
		
func decideReacao(stringReacao):
	
	reacao = stringReacao
	
func getReagindo():
	
	return reagindo

func _on_anim_finished():
	
	#reagindo = true
	
	if(reacao != "libera"):
		
		#reagindo = false
		globais.reduzIdeiaReagindo()
	
	elif(reacao == "libera" and particulas.get_emit_timeout() == false):
		
		if(iniciouTimer == false):
			
			atrasa.set_wait_time(particulas.get_lifetime())
			atrasa.start()
			iniciouTimer == true

func _on_anim_animation_started( name ):
	
	globais.adicionaIdeiaReagindo()

			
func atrasaAutoDestroi():
	
	if(reacao == "libera"):
		
		reagindo = false
		globais.reduzIdeiaReagindo()
		self.queue_free()
		iniciouTimer = false


