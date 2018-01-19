extends Node2D

var speed = -300

func _ready():
	set_fixed_process(true)
	get_node("KinematicBody2D").move_to(Vector2(400,300))

func _fixed_process(delta):
	get_node("KinematicBody2D").move(Vector2(0, speed*delta))
	if get_node("KinematicBody2D").get_global_pos().y < 6000:
		#get_node(".").queue_free()
		pass
		
func set_pos(newPos):
	get_node("KinematicBody2D").set_pos(newPos)