 #gera o texto interno da ideia

extends Label

var fonteIdeia = "" #caso decida-se que deverá ter uma fonte especifica para a ideia, aqui ficara setado a fonte padrão
var textoIdeia = "" #o texto que fica dentro da ídeia
var indiceIdeia = 1 #indice representativo da ídeia
var totalIdeias = 64 # número de ideias existentes

func _ready():

	selecionaIdeia()
	set_text(textoIdeia)
	
func sorteaIdeia():
	
	randomize()
	indiceIdeia = floor(rand_range(1,totalIdeias))
	return indiceIdeia
	
func selecionaIdeia():
	
	sorteaIdeia()
	
	while(indiceIdeia == 0):
		
		sorteaIdeia()
		
	if(indiceIdeia == 1):
		
		textoIdeia = "absurda"
		
	elif(indiceIdeia == 2):
		
		textoIdeia = "alegre"
		
	elif(indiceIdeia == 3):
		
		textoIdeia = "antiquada"
		
	elif(indiceIdeia == 4):
		
		textoIdeia = "assustadora"
			
	elif(indiceIdeia == 5):
		
		textoIdeia = "boba"
	
	elif(indiceIdeia == 6):
		
		textoIdeia = "brilhante!"
			
	elif(indiceIdeia == 7):
		
		textoIdeia = "cansativa"
		
	elif(indiceIdeia == 8):
		
		textoIdeia = "chata"
	
	elif(indiceIdeia == 9):
		
		textoIdeia = "complicada"
	
	elif(indiceIdeia == 10):
		
		textoIdeia = "desagradável"
	
	elif(indiceIdeia == 11):
		
		textoIdeia = "divertida"
		
	elif(indiceIdeia == 12):
		
		textoIdeia = "engraçada"
		
	elif(indiceIdeia == 13):
		
		textoIdeia = "errada"
		
	elif(indiceIdeia == 14):
		
		textoIdeia = "estranha"
		
	elif(indiceIdeia == 15):
		
		textoIdeia = "estúpida"
		
	elif(indiceIdeia == 16):
		
		textoIdeia = "excelente"
		
	elif(indiceIdeia == 17):
		
		textoIdeia = "fantásica"
		
	elif(indiceIdeia == 18):
		
		textoIdeia = "feliz"
		
	elif(indiceIdeia == 19):
		
		textoIdeia = "fértil"
		
	elif(indiceIdeia == 20):
		
		textoIdeia = "fixa"
		
	elif(indiceIdeia == 21):
		
		textoIdeia = "forte"
		
	elif(indiceIdeia == 22):
		
		textoIdeia = "genial"
		
	elif(indiceIdeia == 23):
		
		textoIdeia = "grandiosa"
	
	elif(indiceIdeia == 24):
		
		textoIdeia = "horrível"
		
	elif(indiceIdeia == 25):
		
		textoIdeia = "incoerente"
		
	elif(indiceIdeia == 26):
		
		textoIdeia = "incomum"
	
	elif(indiceIdeia == 27):
		
		textoIdeia = "incrível"
	
	elif(indiceIdeia == 28):
		
		textoIdeia = "infeliz"
		
	elif(indiceIdeia == 29):
		
		textoIdeia = "inferior"
		
	elif(indiceIdeia == 30):
		
		textoIdeia = "inovadora"
	
	elif(indiceIdeia == 31):
		
		textoIdeia = "inspirada"
		
	elif(indiceIdeia == 32):
		
		textoIdeia = "interessante"
	
	elif(indiceIdeia == 33):
		
		textoIdeia = "legal"
		
	elif(indiceIdeia == 34):
		
		textoIdeia = "macabra"
		
	elif(indiceIdeia == 35):
		
		textoIdeia = "macabra"
		
	elif(indiceIdeia == 36):
		
		textoIdeia = "mágica"
		
	elif(indiceIdeia == 37):
		
		textoIdeia = "majestosa"
		
	elif(indiceIdeia == 38):
		
		textoIdeia = "maluca"
		
	elif(indiceIdeia == 39):
		
		textoIdeia = "massante"
		
	elif(indiceIdeia == 40):
		
		textoIdeia = "medíocre"
		
	elif(indiceIdeia == 40):
		
		textoIdeia = "mionária"
	
	elif(indiceIdeia == 41):
		
		textoIdeia = "misteriosa"
		
	elif(indiceIdeia == 42):
		
		textoIdeia = "moderna"
	
	elif(indiceIdeia == 43):
		
		textoIdeia = "nefasta"
	
	elif(indiceIdeia == 44):
		
		textoIdeia = "nova"
	
	elif(indiceIdeia == 45):
		
		textoIdeia = "objetiva"
		
	elif(indiceIdeia == 46):
		
		textoIdeia = "original"
	
	elif(indiceIdeia == 47):
		
		textoIdeia = "ousada"
	
	elif(indiceIdeia == 48):
		
		textoIdeia = "passageira"
	
	elif(indiceIdeia == 49):
		
		textoIdeia = "perigosa"
	
	elif(indiceIdeia == 50):
		
		textoIdeia = "prazerosa"
	
	elif(indiceIdeia == 51):
		
		textoIdeia = "progressista"
	
	elif(indiceIdeia == 52):
		
		textoIdeia = "quente"
	
	elif(indiceIdeia == 53):
		
		textoIdeia = "radical"
	
	elif(indiceIdeia == 54):
		
		textoIdeia = "rápida"
	
	elif(indiceIdeia == 55):
		
		textoIdeia = "repentina"
	
	elif(indiceIdeia == 56):
		
		textoIdeia = "revolucionaria"
	
	elif(indiceIdeia == 57):
		
		textoIdeia = "romantica"
	
	elif(indiceIdeia == 58):
		
		textoIdeia = "ruim"
	
	elif(indiceIdeia == 59):
		
		textoIdeia = "simples"
	
	elif(indiceIdeia == 60):
		
		textoIdeia = "tediosa"
	
	elif(indiceIdeia == 61):
		
		textoIdeia = "tediosa"
	
	elif(indiceIdeia == 62):
		
		textoIdeia = "transformadora"
	
	elif(indiceIdeia == 63):
		
		textoIdeia = "ultrapassada"
	
	elif(indiceIdeia == 64):
		
		textoIdeia = "única"
	