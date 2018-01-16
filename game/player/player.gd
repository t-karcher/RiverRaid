extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const FLIGHT_SPEED = 100
var vel = Vector2()


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	# get_node("Camera2D").set_zoom(Vector2(0.2, 0.2))
	
func _process(delta):
	# set_pos(get_pos()+vel*delta)
	vel.y = 0

	if (Input.is_action_pressed("ui_left")):
		vel.x = -FLIGHT_SPEED
		get_node("Sprite").set_frame(1)
	elif (Input.is_action_pressed("ui_right")):
		vel.x =  FLIGHT_SPEED
		get_node("Sprite").set_frame(2)
	else:
		vel.x = 0
		get_node("Sprite").set_frame(0)
	if (Input.is_action_pressed("ui_up")):
		vel.y = -FLIGHT_SPEED
		get_node("Sprite").set_frame(0)
	elif (Input.is_action_pressed("ui_down")):
		vel.y =  FLIGHT_SPEED
		get_node("Sprite").set_frame(0)
	else:
		vel.y = 0
		get_node("Sprite").set_frame(0)
	var motion = vel * delta
	move(motion)