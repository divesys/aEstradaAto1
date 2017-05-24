 #controla o fluxo da textbox: guardando as menssagens num vetor, limpando e passando a próxima menssagem ao apertar enter e acelerando caso seja segurada a teclada de skip

extends Control

onready var tie = get_parent().get_node("text_interface_engine") #recebe o script TIE
onready var origemTextBox = get_parent().get_parent() #recebe o script origemtextBox
onready var iconeTexto = get_parent().get_node("areaIconeMenssagem/Sprite")
onready var interacaoMouse = origemTextBox.get_node("interacao")

#variaveis relacionadas a aceleração
var velocidadeNormal = 0
var velocidadeAcelerada = 0 #0.01
var acelerou = false #determina se o úsuario está acelerando o texto na menssagem atual, serve para impedir que ele mude de menssagem enquanto acelera

#variaveis de texto
onready var arrayMenssagens = [] #guarda as menssagens em sequencia
onready var arrayVelocidades = [] #guarda a velocidade de cada menssagem
onready var arrayOrigens = [] #guardas as origens de cada menssagem
onready var arrayTipos = [] #guarda os tipos de cada menssagem
onready var arrayEmocoes = [] #guarda as emoções de cada menssagem
onready var arrayVariacoes = [] #guarda as variações da menssagem
#onready var arrayStack = [] #guarda um outros blocos de menssagem em fila
onready var indiceAtualMenssagem = 0 #o indice atual da menssagem, usado para o looping de remoção e para imprimir
export var escrevendo = false setget ,getEscrevendo #indica se a textBox está ativamente escrevendo algum texto

#variavel de controle de indice da historia
onready var adicionouIndiceHistoria = false
onready var adicionarIndice = true #determina se deve adicionar o indice

#variavel de callers
var caller = ""

#variavel de interação
var clicando = false

func getEscrevendo():
	
	return escrevendo

func comecarEscrever(): #comeca a escrever
	
	adicionarIndice = true #adiciona indice
	escrevendo = true
	adicionouIndiceHistoria = false
	#print("comecei")
	imprimeMenssagem(indiceAtualMenssagem)
	indiceAtualMenssagem += 1
	
func comecarEscreverSemIndice(strCaller): #comeca a escrever mas não adiciona indice

	caller = strCaller
	adicionarIndice = false #nãoa adiciona indice
	escrevendo = true
	adicionouIndiceHistoria = false
	#print("comecei")
	imprimeMenssagem(indiceAtualMenssagem)
	indiceAtualMenssagem += 1
	
func pararEscrever(): #para de escrever

	tie.reset()
	arrayMenssagens.clear()
	arrayVelocidades.clear()
	arrayVariacoes.clear()
	arrayTipos.clear()
	arrayOrigens.clear()
	arrayEmocoes.clear()
	escrevendo = false
	indiceAtualMenssagem = 0
	controleFluxoHistoria.setExclusivoTexto(false) #libera novamente a interação

	if(caller == "naoSonho"):
		
		globais.setExibiuTextoNaoSonho(false) #libera o texto não sonho
		
	elif(caller == "primeiraDistracao"):
		
		globais.setExibiuTextoPrimeiraDistracao(true)
	
	if(adicionouIndiceHistoria == false and adicionarIndice == true):
	
#		#print("parou de escrever")
#		#print(controleFluxoHistoria.getIndiceParte())
		adicionouIndiceHistoria = true
		controleFluxoHistoria.acrescentaIndiceParte(get_name()) #adiciona um ao indice da parte ao encerrar a exibição das menssagens

func adicionaMenssagem(menssagem,vel): #adiciona uma menssagem ao array de menssagens na posição i, somente especificando a menssagem e sua velocidade
	
	#print(arrayMenssagens.size())
	arrayOrigens.append(origemTextBox.getOrigemTexto())
	arrayTipos.append(origemTextBox.getTipoTexto())
	arrayEmocoes.append(origemTextBox.getEmocaoTexto())
	arrayVariacoes.append(origemTextBox.getVariacaoTexto())
	arrayMenssagens.append(str(menssagem))
	arrayVelocidades.append(vel)
	#print(arrayMenssagens.size())
	
func adicionaMenssagemIntervalo(stringMenssagemSemNumero,intNumeroInicial,intNumeroFinal,vel): #adiciona uma serie de menssagem simplificadas
	
	for i in range(intNumeroInicial,intNumeroFinal+1):
		
		adicionaMenssagem(tr(stringMenssagemSemNumero + str(i)),vel)
	
func adicionaMenssagemDetalhada(strMenssagem,intVel,strOrigem,strTipo,strEmocao,strVariacao): #adiciona menssagem detalhada:
	
	#print(arrayMenssagens.size())
	
	arrayOrigens.append(str(strOrigem))
	arrayTipos.append(str(strTipo))
	arrayEmocoes.append(str(strEmocao))
	print("adicionando emocao " + strEmocao)
	arrayVariacoes.append(str(strVariacao))
	arrayMenssagens.append(str(strMenssagem))
	arrayVelocidades.append(float(intVel))
	
func adicionaMenssagemIntervaloDetalhado(strMenssagemSemNumero,intNumeroInicial,intNumeroFinal,intVel,strOrigem,strTipo,strEmocao,strVariacao): #adiciona uma serie de menssagens detalhadas com o mesmo padrão
	
	for i in range(intNumeroInicial,intNumeroFinal+1):
		
		adicionaMenssagemDetalhada(tr(strMenssagemSemNumero + str(i)),intVel,strOrigem,strTipo,strEmocao,strVariacao)
	
func imprimeMenssagem(i): #imprime a menssagem da posição i no arrayMenssagem

	print("imprimindo")
	print(indiceAtualMenssagem)
	print(arrayMenssagens[i])
	print(arrayOrigens[i])
	print(arrayTipos[i])
	print(arrayEmocoes[i])
	
	#se qualquer parametro tiver o valor manter, então esse parametro não deve ser mudado
	if(arrayOrigens != "manter"):
		
		origemTextBox.mudaOrigemTexto(arrayOrigens[i])
		
	if(arrayTipos != "manter"):
		
		origemTextBox.mudaTipoTexto(arrayTipos[i])
		
	if(arrayEmocoes != "manter"):
		
		origemTextBox.mudaEmocaoTexto(arrayEmocoes[i])
		
	if(arrayVariacoes != "manter"):
		
		origemTextBox.mudaVariacaoTexto(arrayVariacoes[i])
		
	tie.buff_text(arrayMenssagens[i],arrayVelocidades[i])
	tie.set_state(tie.STATE_OUTPUT)
	
	#indiceAtualMenssagem += 1

func _ready():

	tie.reset()
	set_process(true)
	
func _process(delta):
	
	#print(tie.get_buffer())
	#mantem a velocidade normal atualizada
	#velocidadeNormal = tie.get_lastBufferSpeed()
	#print(tie.get_actualBufferSpeed())
	#print(indiceAtualMenssagem)
	#print(arrayMenssagens.size())
	
	clicando = interacaoMouse.getClicando()
	#print(clicando)
	
	if(escrevendo == false):
		
		get_parent().get_parent().hide()
		
	else:
		
		get_parent().get_parent().show()
	
	if(tie.get_buffer() != []):
		
		if(tie._max_lines_reached):
		
			#ajusta o icone do texto para esperando
			iconeTexto.set_animation("esperando")
		
		else:
			
			#ajusta o icone do texto para escrevendo
			iconeTexto.set_animation("escrevendo")
		
		#acelera e desacelera a menssagem
		if(Input.is_action_pressed("passarMenssagem") or clicando == true):
				
			tie.set_buff_speed(velocidadeAcelerada)
			acelerou = true
			
		elif(acelerou == true):
			
			#print(indiceAtualMenssagem - 1)
			tie.set_buff_speed(arrayVelocidades[indiceAtualMenssagem - 1])
			acelerou = false

		#print(tie.get_buffer())
	elif(tie.get_buffer() == []):
		
		#ajusta o icone do texto para esperando
		iconeTexto.set_animation("esperando")
		
		if(!Input.is_action_pressed("passarMenssagem") and clicando == false and acelerou == true and controleFluxoHistoria.getTravaTexto() == false):
			
			acelerou = false
		
		if((Input.is_action_pressed("passarMenssagem")  or clicando == true) and acelerou == false and controleFluxoHistoria.getTravaTexto() == false):
			
			#tie.reset()
			tie.clear_text()
			#tie.clear_buffer()
			#print(arrayMenssagens.size())
			#print(indiceAtualMenssagem + 1)
			if(arrayMenssagens.size() >= (indiceAtualMenssagem + 1)): #caso tenha mais menssagens
				
				#print("entrei")
				if(controleFluxoHistoria.getParte() != "prologo" and adicionarIndice == true):
			
					controleFluxoHistoria.acrescentaIndiceParte(get_name()) #adiciona um ao indice da parte ao encerrar a menssagen
				
				imprimeMenssagem(indiceAtualMenssagem)
				indiceAtualMenssagem += 1
				
			else: #não tem mais menssagens
				
				#print("fodasse")
				pararEscrever()
