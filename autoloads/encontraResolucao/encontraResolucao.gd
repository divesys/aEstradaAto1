#determina qual é a resolução do úsuario e decide os dados padrões

extends Node2D

 # determina a valor unico que representa as proporções da tela
var proporcaoBase16_9 = floor((16/9)*100)
var proporcaoBase16_10 = floor((16/9)*100)

 # determina a medidas padrões para cada resolução, para fins de posicionamento

	#16_9
var larguraBase16_9 = 1920
var alturaBase16_9 = 1080


	#16_10
var larguraBase16_10 = 1920
var alturaBase16_10 = 1200

 # captura as medidas da tela do úsuario
var larguraReal = OS.get_window_size().x
var alturaReal = OS.get_window_size().y

 # determina qual é o valor único que representa a proporção de tela do úsuario (arredondado)
var proporcaoReal = floor((larguraReal/alturaReal)*100)

 # uma string usada para representar a proporcao
var stringProporcao = "" setget ,getStringProporcao

 # medidas padrões usadas para fins de posicionamento
var larguraPadrao = 0 setget ,getLarguraPadrao
var alturaPadrao = 0 setget ,getAlturaPadrao

func _ready():
	
	if(proporcaoReal == proporcaoBase16_9):
		
		stringProporcao = "16_9"
		larguraPadrao = larguraBase16_9
		alturaPadrao = alturaBase16_9
		
	elif(proporcaoReal == proporcaoBase16_10):
		
		stringProporcao = "16_10"
		larguraPadrao = larguraBase16_10
		alturaPadrao = alturaBase16_10
	
	else:
		
		stringProporcao = "16_10"
		larguraPadrao = larguraBase16_10
		alturaPadrao = alturaBase16_10
	
	Globals.set("display/width", larguraPadrao)
	Globals.set("display/height", alturaPadrao)

func getStringProporcao():
	
	return stringProporcao

func getLarguraPadrao():
	
	return larguraPadrao
	
func getAlturaPadrao():
	
	return alturaPadrao