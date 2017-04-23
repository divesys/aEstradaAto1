extends AnimatedSprite

var totalDistracoesVisuais = 2 #representa o número total distracoes
var animacao = 0 #representa a animacao escolhida aleatoriamente
var posX = 0 #posicao x da distracao
var posY = 0 #posicao y da distracao
var angulo = 0 #angulo da distracao
var velocidade = 0 #velocidade da distracao, em unidades/s
var velocidadeMin = 15 #velocidade minima da distraca
var velocidadeMax = 1500 #velocidade maxima da distracao
var duracaoMax = 5 #duracao maxima da distracao
var duracaoMin = 0.5 #duracao minima da distracao
var duracao = 0 #duracao da distracao

var timerMovimento = Timer.new() #move a distracao a cada intervaloMovimento segundo
var timerDuracao = Timer.new() #destroi a distracao após n segundos
var intervaloMovimento = 0.01

func _ready():

	#decide variaveis
	randomize()
	animacao = round(rand_range(1,totalDistracoesVisuais)) #escolhe a animacao
	posX = rand_range(25,encontraResolucao.getLarguraPadrao()-25) #escolhe a posicao em x
	posY = rand_range(25,encontraResolucao.getAlturaUtilizada()-25) #escolhe a posicao em y
	angulo = rand_range(0,360) #escolhe o angulo
	velocidade = rand_range(velocidadeMin,velocidadeMax)/100 #escolhe a velocidade
	duracao = rand_range(duracaoMin,duracaoMax)
	
	if(angulo > 90 and angulo < 270):
		
		set_scale(Vector2(1,-1))
	
	#configura a distracao
	self.set_animation(str(animacao)) #seta a animação
	self.set_pos(Vector2(posX,posY)) #seta a posicao
	self.set_rotd(angulo) #seta o angulo
	
	#move a animacao
	add_child(timerMovimento)
	
	timerMovimento.connect("timeout", self, "moveDistracao")
	timerMovimento.set_wait_time(0.01)
	timerMovimento.set_one_shot(false) # Make sure it loops
	timerMovimento.start()
	
	#destroi a distracao após a duracao
	add_child(timerDuracao)
	
	timerDuracao.connect("timeout", self, "destroiDistracao")
	timerDuracao.set_wait_time(duracao)
	timerDuracao.set_one_shot(true) # Make sure it loops
	timerDuracao.start()
	
func moveDistracao():
	
	self.set_pos(Vector2(get_pos().x + (velocidade * cos(get_rot())),get_pos().y + (velocidade * (sin(get_rot()*-1)))))
	
func destroiDistracao():
	
	self.queue_free()