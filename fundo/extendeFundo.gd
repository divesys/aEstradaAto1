 #extende o fundo instanciando um novo nó de fundo e o destruindo depois

extends Node2D

 # garante que extenda uma unica vez
var instanciouCena = false
var extendeuFundo = false

 #variaveis gerais, apenas inicializando e instanciando vazias
var node = ""
var cenaAtual = ""
var cena = ""
var larguraPadrao = 0
var linhaCriacao = 0
var linhaDestruicao = 0
var larguraFundo = 0

func _ready():
	
	print(get_name())
	#determina as linhas limite
	larguraPadrao = encontraResolucao.getLarguraPadrao() #captura a largura padrao
	linhaCriacao = (larguraPadrao * 1.5) # linha que define quando se deve extender o fundo
	linhaDestruicao = (larguraPadrao*-1) - (larguraPadrao/2) # linha que determinha quando se deve destruir a extensão
	#print(linhaCriacao)
	
	 # captura a cena atual e a carrega para ser instanciada
	cenaAtual = get_filename()
	#print(cenaAtual)
	cena = load(cenaAtual)
	#print(cena)
	
	set_process(true)
	
func _process(delta):
	
	var posicaoAbsolutaX = get_parent().get_pos().x + get_pos().x 
	
	#print(str(get_name()) + " " + str(posicaoAbsolutaX))
	if(posicaoAbsolutaX < linhaCriacao and extendeuFundo == false): # caso passe da linha de criacao
		
		larguraFundo = self.get_texture().get_width()
		#print(larguraFundo)
		node = cena.instance() #instancia a cena
		get_parent().add_child(node) #adiciona o nó ao nó pai
		get_node(node.get_path()).set_pos(Vector2(0,0))
		get_node(node.get_path()).set_pos(Vector2((get_pos().x + larguraFundo),get_pos().y)) #move o novo no para direita usando a largura do fundo
		extendeuFundo = true
		#print(get_name())
		
	elif(posicaoAbsolutaX < linhaDestruicao and extendeuFundo == true):
		
		print(str(get_name()) + " morri")
		self.queue_free()