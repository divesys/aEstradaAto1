#executa o parallax do fundo ao pressionar moverDireita

extends Node2D

# variaveis

export var velocidadeMedia = 0 #velocidade do fundo
var velocidadeInstantanea = Vector2()
var tamanhoSprite = get_texture().get_size()
var larguraSprite = tamanhoSprite.x

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	#print(tamanhoSprite)
	
	if(Input.is_action_pressed("moveDireita")):
		
		velocidadeInstantanea = Vector2(-velocidadeMedia,0)
		print(get_name())
		print(get_pos().x + larguraSprite)
		
	else:
		
		velocidadeInstantanea = Vector2(0,0)
	
	set_pos(get_pos() + velocidadeInstantanea * delta)