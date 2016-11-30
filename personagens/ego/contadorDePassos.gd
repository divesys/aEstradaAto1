 #conta os passos do ego

extends Node2D

var ego = "" #nó do ego
var frameAtual = 0 #determina qual frame de animação o ego está
var executandoPasso = false #alavanca que impede que se adicione mais de um passo

func _ready():
	
	ego = get_parent()
	set_process(true)
	
func _process(delta):
	
	frameAtual = ego.get_frame() #atualiza o frame atual do ego
	
	if((frameAtual == 1 or frameAtual == 3) and executandoPasso == false): #se ego está dando um passo 
	
		executandoPasso = true #trava a adição de passos até o proximo passo
	
		if(controleFluxoHistoria.getParte() == "prologo"):
			
			globais.acresentaPassoPrologo() #acresenta um passo aos passos do prologo
			
		else:
			
			globais.acresentaPassoSuposto() #acresenta um passo aos passos supostos
			
		#print(globais.getPassosPrologo())
		
	elif(frameAtual == 0 or frameAtual == 2):
		
		executandoPasso = false