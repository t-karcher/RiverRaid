extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var vel = Vector2(100,50)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	set_pos(get_pos()+vel*delta)
