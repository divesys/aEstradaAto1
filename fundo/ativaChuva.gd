extends Node2D


func _ready():

	pass
	
	
func comecaChuva():
	
	get_node("StreamPlayer").set_volume(0.25)
	get_node("StreamPlayer").play()
	get_node("chuva1").set_emitting(true)
	get_node("chuva2").set_emitting(true)
	get_node("chuva3").set_emitting(true)
	
func paraChuva():
	
	get_node("StreamPlayer").stop()
	get_node("chuva1").set_emitting(false)
	get_node("chuva2").set_emitting(false)
	get_node("chuva3").set_emitting(false)