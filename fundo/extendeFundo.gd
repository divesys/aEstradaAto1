 #extende o fundo instanciando um novo nó de fundo e o destruindo depois

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

func _ready():
	
	#determina as linhas limite
	larguraPadrao = encontraResolucao.getLarguraPadrao() #captura a largura padrao
	linhaCriacao = (larguraPadrao/2) # linha que define quando se deve extender o fundo
	linhaDestruicao = (larguraPadrao*-1) - (larguraPadrao/2) # linha que determinha quando se deve destruir a extensão
	
	 # captura a cena atual e a carrega para ser instanciada
	cenaAtual = get_filename()
	#print(cenaAtual)
	cena = load(cenaAtual)
	#print(cena)
	
	set_process(true)
	
func _process(delta):
	
	var posicaoAbsolutaX = get_parent().get_pos().x + get_pos().x 
	
	#print(posicaoAbsolutaX)
	if(posicaoAbsolutaX < linhaCriacao and extendeuFundo == false): # caso passe da linha de criacao
		
		node = cena.instance() #instancia a cena
		get_parent().add_child(node) #adiciona o nó ao nó pai
		get_node(node.get_path()).set_pos(Vector2(0,0))
		get_node(node.get_path()).set_pos(Vector2((get_pos().x + larguraPadrao),get_pos().y)) #move o novo no para direita usando a larguraPadrao
		extendeuFundo = true
		#print(get_name())
		
	elif(posicaoAbsolutaX < linhaDestruicao and extendeuFundo == true):
		
		self.queue_free()