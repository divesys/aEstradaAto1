#determina qual é a resolução do úsuario e decide os dados padrões

extends Node2D

 # determina a valor unico que representa as proporções da tela
var proporcaoBase16_9 = floor((16.0/9.0)*100)
var proporcaoBase16_10 = floor((16.0/10.0)*100)

 # determina a medidas padrões para cada resolução, para fins de posicionamento

	#16_9
var larguraBase16_9 = 1920.0
var alturaBase16_9 = 1080.0


	#16_10
var larguraBase16_10 = 1920.0
var alturaBase16_10 = 1200.0

 # captura as medidas da tela do úsuario
var larguraReal = OS.get_window_size().x
var alturaReal = OS.get_window_size().y

 # determina qual é o valor único que representa a proporção de tela do úsuario (arredondado)
var proporcaoReal = floor((larguraReal/alturaReal)*100)

 # uma string usada para representar a proporcao
var stringProporcao = "" setget ,getStringProporcao

 # medidas padrões usadas para fins de posicionamento
var larguraPadrao = 0.0 setget ,getLarguraPadrao
var alturaPadrao = 0.0 setget ,getAlturaPadrao

#determina a área utilizada da tela, em % na forma de 0.01, referente a altura
var porcentagemTela = 0.65 #o quanto a área visivel do jogo ocupa a tela, vai de 0 a 1
var alturaUtilizada = 0.0

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
		
		stringProporcao = "16_9"
		larguraPadrao = larguraBase16_9
		alturaPadrao = alturaBase16_9
	
	#verificar se precisa resolver posteriormente
	Globals.set("display/width", larguraPadrao)
	Globals.set("display/height", alturaPadrao)
	get_tree().get_root().set_size_override(1,Vector2(larguraPadrao,alturaPadrao),Vector2(0,0))
	
	alturaUtilizada = alturaPadrao * porcentagemTela

func getStringProporcao():
	
	return stringProporcao

func getLarguraPadrao():
	
	return larguraPadrao
	
func getAlturaPadrao():
	
	return alturaPadrao
	
func getAlturaUtilizada():
	
	return alturaUtilizada