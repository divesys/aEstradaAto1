 # variveis globais com getters e se for preciso, setters

extends Node2D

#conta o numero de passos
var passosPrologo = 0 setget getPassosPrologo, setPassosPrologo #numero de passos no prologo
var passosSupostos = 0 setget getPassosSupostos, setPassosSupostos#numero de passos apos o prologo
var passosReais = 0 setget getPassosReais, setPassosReais#valor guardado para o ato 3 que representa o numero de passos antes de zerar os passos
var intervaloPassosEstradaPrincipal = 8.0 #determina o valor do intervalo de passos
var indiceTextoEstradaPrincipal = 0 #o indice utilizado na estrada principal baseado no número de passos

#conta a energia de realizacao
var energiaRealizacaoSuposta = 0 setget getEnergiaRealizacaoSuposta, setEnergiaRealizacaoSuposta#quantidade de energia de realizacao no ato 1
var energiaRealizacaoReal = 0 setget getEnergiaRealizacaoReal, setEnergiaRealizacaoReal#valor guardado para o ato 3 que representa a energia de realizacao antes de zerar

#conta o total de ideias
var totalIdeias = 0 setget ,getTotalIdeias #conta o numero total de ideias na caixa, não têm set pois calcula o número de instancias do tipo ideia

#verifica o número de ideias reagindo ao mesmo tempo
var totalIdeiasReagindo = 0 setget  ,getTotalIdeiaReagindo

#posições e medidas importantes
var posCaixaIdeias = Vector2(0,0) setget setPosCaixaIdeias, getPosCaixaIdeias
var tamanhoCaixaIdeias = Vector2(0,0) setget setTamanhoCaixaIdeias, getTamanhoCaixaIdeias

#alavanca de textos de loop (fazer o que =/)
var exibiuTextoNaoSonho = false setget setExibiuTextoNaoSonho, getExibiuTextoNaoSonho
var exibiuTextoPrimeiraDistracao = false setget setExibiuTextoPrimeiraDistracao, getExibiuTextoPrimeiraDistracao

# outra global não elegante, mas estou preferindo a praticidade nesse momento, quem sabe no ato 2
var posicaoEgo = Vector2(0,0) setget setPosicaoEgo, getPosicaoEgo

func _ready():
	
	set_process(true)
	
func _process(delta):
	
	totalIdeias = get_tree().get_nodes_in_group("ideias").size()
	indiceTextoEstradaPrincipal = passosSupostos/intervaloPassosEstradaPrincipal #determina o indice atual de passos
#funções get e set e afins>

#passosPrologo
func getPassosPrologo():
	
	return passosPrologo
	
func setPassosPrologo(intPassos):
	
	passosPrologo = intPassos
	
func acresentaPassoPrologo(): #acresenta um passo ao total atual

	passosPrologo += 1
	
func adicionaPassosPrologo(intPassos): #acresenta x passos ao total atual

	passosPrologo += intPassos
	
	
#passosSupostos
func getPassosSupostos():
	
	return passosSupostos
	
func setPassosSupostos(intPassos):
	
	passosSupostos = intPassos
	
func acresentaPassoSuposto(): #acresenta um passo ao total atual

	passosSupostos += 1
	
func adicionaPassosSupostos(intPassos): #acresenta x passos ao total atual

	passosSupostos += intPassos
	
#passosReais
func getPassosReais():
	
	return passosReais
	
func setPassosReais(intPassos):
	
	passosReais = intPassos
	
func acresentaPassoReal(): #acresenta um passo ao total atual

	passosReais += 1
	
func adicionaPassosReais(intPassos): #acresenta x passos ao total atual

	passosReais += intPassos
	
#energiaRealizacaoSuposta
func getEnergiaRealizacaoSuposta():
	
	return energiaRealizacaoSuposta
	
func setEnergiaRealizacaoSuposta(intEnergia):
	
	energiaRealizacaoSuposta = intEnergia
	
func adicionaEnergiaRealizacaoSuposta(intEnergia):
	
	energiaRealizacaoSuposta += intEnergia

#energiaRealizacao
func getEnergiaRealizacaoReal():
	
	return energiaRealizacaoSuposta
	
func setEnergiaRealizacaoReal(intEnergia):
	
	energiaRealizacaoSuposta = intEnergia

func adicionaEnergiaRealizacaoReal(intEnergia):
	
	energiaRealizacaoReal += intEnergia

#totalIdeias
func getTotalIdeias():
	
	return totalIdeias
	
#ideias reagindo

func adicionaIdeiaReagindo():
	
	totalIdeiasReagindo += 1
	#print(totalIdeiasReagindo)
	
func reduzIdeiaReagindo():
	
	totalIdeiasReagindo -= 1
	#print(totalIdeiasReagindo)
	
func getTotalIdeiaReagindo():
	
	return totalIdeiasReagindo
	
func setPosCaixaIdeias(vector2Pos):
	
	posCaixaIdeias = vector2Pos
	
func getPosCaixaIdeias():
	
	return posCaixaIdeias
	
func setTamanhoCaixaIdeias(vector2tamanho):
	
	tamanhoCaixaIdeias = vector2tamanho
	
func getTamanhoCaixaIdeias():
	
	return tamanhoCaixaIdeias
	
func setExibiuTextoNaoSonho(boolEstado):
	
	exibiuTextoNaoSonho = boolEstado
	
func getExibiuTextoNaoSonho():
	
	return exibiuTextoNaoSonho
	
func setExibiuTextoPrimeiraDistracao(boolEstado):
	
	exibiuTextoPrimeiraDistracao = boolEstado
	
func getExibiuTextoPrimeiraDistracao():
	
	return exibiuTextoPrimeiraDistracao
	
func setPosicaoEgo(vector2Posicao):
	
	posicaoEgo = vector2Posicao
	
func getPosicaoEgo():
	
	return posicaoEgo
	
func getIndiceTextoEstradaPrincipal():
	
	return indiceTextoEstradaPrincipal
	
func getIntervaloPassosEstradaPrincipal():
	
	return intervaloPassosEstradaPrincipal