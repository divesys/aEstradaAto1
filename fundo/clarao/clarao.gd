 #ativa o clarao

extends Sprite

onready var sons = get_parent().get_node("sons")

var someClarao = Timer.new() #um timer para atrasar o prosseguimento do fluxo da historia

func _ready():
	
	someClarao.set_one_shot(true)
	someClarao.set_timer_process_mode(0)
	someClarao.set_wait_time(1)
	add_child(someClarao)
	someClarao.connect("timeout", self, "someClarao")
	
func ativaClarao():
	
	show()
	sons.play("clarao",true)
	someClarao.start()
	
func someClarao():
	
	hide()
	controleFluxoHistoria.acrescentaIndiceParte(get_name())