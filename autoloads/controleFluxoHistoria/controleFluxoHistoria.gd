 #controla o fluxo da historia, determinando o indice global, indice local, parte (da historia) assim como um array de tags que permite verificar condições especiais

extends Node2D

onready var indiceHistoria = 0 setget ,getIndiceHistoria #determina o indice global da historia, usada apenas para controle
onready var indiceParte = 0 setget pularIndiceParte , getIndiceParte#determina o indice da parte, é zerado em toda mudança de parte
onready var parte = "" setget mudarParte, getParte #string descrevendo o nome da parte em que o jogo se encontra
onready var eventosEspeciais = {} setget alteraEventoEspecial , getEventoEspecial#dicionarprintio para criar eventos especiais, a chave deverá ser uma string e o valor deverá ser booleano
onready var exclusivoTexto = false setget setExclusivoTexto, getExclusivoTexto # determina se as interações que não envolvam o texto devem ser travadas
onready var travaTexto = false setget travarTexto, getTravaTexto #determina se as interações com a textbox deverão ser travadas

func acrescentaIndiceHistoria(): #anda um passo com o indice da historia, raramente é usada de forma externa
	
	indiceHistoria += 1
	
func getIndiceHistoria():
	
	return indiceHistoria
	
func zerarIndiceHistoria(): #zera o indice da historia
	
	indiceHistoria = 0
	
func acrescentaIndiceParte(): #anda um passo com o indice da parte
	
	indiceParte += 1
	acrescentaIndiceHistoria()
	
func pularIndiceParte(intIndice): #pula diretamente para um determinado indice

	if(indiceParte > intIndice):
		
		print("você não pode retornar na sequencia dos indices")
		quit()
		
	else:
		
		indiceParte = intIndice
		acrescentaIndiceHistoria()
		
func zeraIndiceParte(): #zera o indice da parte

	indiceParte = 0
	
func getIndiceParte():
	
	return indiceParte
	
func mudarParte(stringParte): #muda a parte atual para uma nova parte
	
	parte = stringParte
	zeraIndiceParte()
	
func getParte():
	
	return parte
	
func criaEventoEspecial(stringNomeEvento, boolValor): #cria um novo evento especial e inicializa seu valor
	
	eventosEspeciais[stringNomeEvento] = boolValor
	
func alteraEventoEspecial(stringNomeEvento, boolValor): #altera o valor de um evento especial já existente

	if(eventosEspeciais.has(stringNomeEvento)): #verifica se o evento existe
		
		eventosEspeciais[stringNomeEvento] = boolValor
		
	else:
		
		print(" não existe o evento " + stringNomeEvento)
		
func getEventoEspecial(stringNomeEvento):
	
	if(eventosEspeciais.has(stringNomeEvento)): #verifica se o evento existe
		
		return eventosEspeciais[stringNomeEvento]
		
	else:
		
		print(" não existe o evento " + stringNomeEvento)
		
func setExclusivoTexto(boolValor):
	
	exclusivoTexto = boolValor
	#print(exclusivoTexto)
	
func getExclusivoTexto():
	
	return exclusivoTexto
	
func travarTexto(boolValor):
	
	travaTexto = boolValor
	
func getTravaTexto():
	
	return travaTexto