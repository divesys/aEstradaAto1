 #move o sonho

extends Sprite

#movimento
var posicaoInicial = 0 #posicao inicial do sonho
var posicaoFinal = 0 #posicao final do sonho
var tamanhoInicial = Vector2(0.05,0.05) #tamanho inicial do sonho
var tamanhoFinal = Vector2(1,1) #tamanho final do sonho
var taxaCrescimento = 0 #taxa de crescimento do sonho, em scale
var tempoMovimento = 10 #tempo que demora para o movimento encerrar
var velocidadeMovimento = 0.1 #auto descritivo

#posicionamento
onready var alturaPadrao = encontraResolucao.getAlturaPadrao()
onready var alturaUtilizada = encontraResolucao.getAlturaUtilizada()
onready var larguraUtilizada = encontraResolucao.getLarguraPadrao()
onready var diferencaAltura = alturaPadrao - alturaUtilizada #calcula a diferença
onready var posicaoAreaUtil = Vector2(0,(diferencaAltura/2))
var posYEgo = 0
var posXEgo = 0
var ajusteX = -80 #ajuste da posição final
var ajusteY = -50 #ajuste da posicao final
var deslocamentoX = 20 #deslocamento da posição inicial
var deslocamentoY = -20 #deslocamento da posição inciial

func _ready():
	
	set_opacity(0) #esconde o sonho
	configuraAnimacao()

func moveSonho():
	
	#print("entrou em moveSonho()")
	
	var anim = get_node("anim") #captura a animação
	
	set_opacity(1) #exibe o sonho
	
	anim.play("moveSonho") #move o sonho
	
	#print(anim.is_playing())
	
	

func determinaPosicaoInicialSonho():
	
	#captura posicao do ego
	posYEgo = globais.getPosicaoEgo().y
	posXEgo = globais.getPosicaoEgo().x
	
	#determina a posição do sonho baseada na posicao do ego
	return Vector2(posXEgo + deslocamentoX,posYEgo - deslocamentoY)
	
func determinaPosicaoFinalSonho():
	
	#captura posicao do ego
	posYEgo = globais.getPosicaoEgo().y
	posXEgo = globais.getPosicaoEgo().x
	
	#determina a posição do sonho baseada na posicao do ego
	return Vector2(posXEgo + larguraUtilizada + ajusteX,posYEgo + ajusteY)
	
func configuraAnimacao():
	
	#determina posições
	var posicaoInicial = determinaPosicaoInicialSonho()
	var posicaoFinal = determinaPosicaoFinalSonho()
	
	#posiciona o sonho
	set_pos(posicaoInicial)
	
	#captura o nó da animação
	var anim = get_node("anim")
	#captura a animação
	var moveSonho = anim.get_animation("moveSonho")
	
	#determina o tempo de animação
	moveSonho.set_length(tempoMovimento)
	moveSonho.set_step(velocidadeMovimento)
	
	#adiciona trilhas
	moveSonho.add_track(0)
	var trackPos =  moveSonho.get_track_count() - 1 #determina a id do pos
	moveSonho.track_set_path(trackPos,".:transform/pos") #determina o path da track pos
	moveSonho.add_track(0)
	var trackScale =  moveSonho.get_track_count() - 1 #determina o id do scale
	moveSonho.track_set_path(trackScale,".:transform/scale") #determina o path da track scale
	
	#adiciona keys
	moveSonho.track_insert_key(trackPos,0,posicaoInicial) #posicao inicial
	moveSonho.track_insert_key(trackPos,moveSonho.get_length(),posicaoFinal) #posicao final
	moveSonho.track_insert_key(trackScale,0,tamanhoInicial) #posicao inicial
	moveSonho.track_insert_key(trackScale,moveSonho.get_length(),tamanhoFinal) #posicao final
	
func movimentaSonho():
	
	#determina as posições
	determinaPosicaoInicialSonho()
	determinaPosicaoFinalSonho()
	
	pass