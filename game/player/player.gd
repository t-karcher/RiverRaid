extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const WALK_SPEED = 200
var vel = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	# set_pos(get_pos()+vel*delta)
	vel.y = 0

	if (Input.is_action_pressed("ui_left")):
		vel.x = -WALK_SPEED
	elif (Input.is_action_pressed("ui_right")):
		vel.x =  WALK_SPEED
	else:
		vel.x = 0
	var motion = vel * delta
	move(motion)