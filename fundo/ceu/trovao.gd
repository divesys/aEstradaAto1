extends Sprite

onready var anim = get_node("anim")

func _ready():
	
	print(get_name() + " " + str(get_pos()))
	get_node("SamplePlayer").set_default_volume(0.4)
	anim.play("trovao")
	
	set_process(true)
	
func _process(delta):
	
	if(anim.is_playing() != true):
		
		self.queue_free()