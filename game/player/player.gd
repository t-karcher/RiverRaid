extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const FLIGHT_SPEED = 100
var vel = Vector2()
onready var timer = get_node("Timer")
var canShoot = true


func _ready():
	#create shot delay
	timer.connect("timeout",self,"on_timeout_complete")
	set_process_input(true)
	set_process(true)
	# get_node("Camera2D").set_zoom(Vector2(0.2, 0.2))
	
func on_timeout_complete():
	canShoot = true
	
func _input(event):
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
	elif (Input.is_action_pressed("ui_down")):
		vel.y =  FLIGHT_SPEED
	else:
		vel.y = 0
	
	if (Input.is_key_pressed(KEY_SPACE) && canShoot):
		get_node("SamplePlayer").play("player_shooting")
		canShoot = false
		timer.start()
	
func _process(delta):
	var motion = vel * delta
	move(motion)
	
	