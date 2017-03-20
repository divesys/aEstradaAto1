 #decide se uma ideia devera ser multiplicada e executa a multiplicação

extends Node2D

var probabilidadeMultiplicar = 10 #chances da ideia multiplicar, multiplicações podem ocorrer a cada clique
var tentaMultiplicar = 0 #variavel utilizada para verificar se ocorreu multiplicação
var quantidadeMultiplicar = 0 #quantidade utilizada para determinar a quantidade de ideias
var determinaQuantidade = 0 #variavel utilizada para determinar a quantidade de ideias
var probabilidade1Ideia = 20 #a probabilidade de ser uma ideia
var probabilidade2Ideia = 60 #a probabilidade de ser duas ideias
var probabilidade3Ideia = 20 #a probabilidade de ser tres ideias

#utilizado para randomizar a cor

var corR = 0
var corG = 0
var corB = 0

onready var particulaMultiplicar = get_node("particulaMultiplicar")

onready var enxurradaIdeia = get_parent().get_parent()

func _ready():
	
	pass

func determinaMultiplicar(): #determina se a ideia deverá ser multiplicada
	
	randomize()
	
	tentaMultiplicar = rand_range(0,100)
	
	if(controleFluxoHistoria.getIndiceParte() < 55): #ignora a multiplicação até esse ponto, podia fazer soluções mais elegantes mas ia ocupar tempo a toa
		
		pass
	
	elif(controleFluxoHistoria.getIndiceParte() == 55): #força a multiplicação
		
		randomize()
		
		determinaQuantidade = rand_range(0,100)
		
		while(determinaQuantidade < 0 or determinaQuantidade > 100): #impede que por qualquer razão a probabilidade resulte em número negativo ou acima de 100
			
			randomize()
			determinaQuantidade = rand_range(0,100)
		
		if(determinaQuantidade <= probabilidade1Ideia): # se resultar em uma ideia
			
			quantidadeMultiplicar = 1
			
		elif(determinaQuantidade > probabilidade1Ideia and determinaQuantidade <= (probabilidade1Ideia + probabilidade2Ideia)): # se resultar em duas ideias
			
			quantidadeMultiplicar = 2
			
		elif(determinaQuantidade > (probabilidade1Ideia + probabilidade2Ideia) and determinaQuantidade <= (probabilidade1Ideia + probabilidade2Ideia + probabilidade3Ideia)):
			
			quantidadeMultiplicar = 3
		
		
		#escolhe cores aleatorias
		randomize()
		corR = rand_range(0,1)
		corG = rand_range(0,1)
		corB = rand_range(0,1)

		enxurradaIdeia.multiplicaNIdeias(quantidadeMultiplicar,corR,corG,corB) #cria as ideias
		
		#aplica as cores na particula
		particulaMultiplicar.set_color(Color(corR,corG,corB))
		#particulaMultiplicar.set_color(Color(0,0,0))
		
		#print(particulaMultiplicar.get_color())
		
		#emite as particulas
		particulaMultiplicar.set_emitting(true)
		
		controleFluxoHistoria.acrescentaIndiceParte(get_name())
		
	elif(tentaMultiplicar <= probabilidadeMultiplicar):
		
		randomize()
		
		determinaQuantidade = rand_range(0,100)
		
		while(determinaQuantidade < 0 or determinaQuantidade > 100): #impede que por qualquer razão a probabilidade resulte em número negativo ou acima de 100
			
			randomize()
			determinaQuantidade = rand_range(0,100)
		
		if(determinaQuantidade <= probabilidade1Ideia): # se resultar em uma ideia
			
			quantidadeMultiplicar = 1
			
		elif(determinaQuantidade > probabilidade1Ideia and determinaQuantidade <= (probabilidade1Ideia + probabilidade2Ideia)): # se resultar em duas ideias
			
			quantidadeMultiplicar = 2
			
		elif(determinaQuantidade > (probabilidade1Ideia + probabilidade2Ideia) and determinaQuantidade <= (probabilidade1Ideia + probabilidade2Ideia + probabilidade3Ideia)):
			
			quantidadeMultiplicar = 3

		#escolhe cores aleatorias
		randomize()
		corR = rand_range(0,1)
		corG = rand_range(0,1)
		corB = rand_range(0,1)

		enxurradaIdeia.multiplicaNIdeias(quantidadeMultiplicar,corR,corG,corB) #cria as ideias
		
		#aplica as cores na particula
		particulaMultiplicar.set_color(Color(corR,corG,corB))
		#particulaMultiplicar.set_color(Color(0,0,0))
		
		#print(particulaMultiplicar.get_color())
		
		#emite as particulas
		particulaMultiplicar.set_emitting(true)
		
	pass