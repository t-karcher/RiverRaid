extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const FLIGHT_SPEED = 100
var vel = Vector2()
onready var timer = get_node("Timer")
var canShoot = true
var laser = preload("res://scenes/laser.tscn")
var laserCount = 0


func _ready():
	#create shot delay
	timer.connect("timeout",self,"on_timeout_complete")
	#set_process_input(true)
	set_process(true)
	# get_node("Camera2D").set_zoom(Vector2(0.2, 0.2))
	
func on_timeout_complete():
	canShoot = true
	
#func _input(event):
	
		
	
func _process(delta):
	var motion = vel * delta
	move(motion)
	
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
		timer.start()
		get_node("SamplePlayer").play("player_shooting")
		laserCount += 1
		var laserInstance = laser.instance()
		laserInstance.set_name("Laser"+str(laserCount))
		get_parent().add_child(laserInstance)
		laserInstance.set_owner(self)
		laserInstance.set_pos(get_pos()+Vector2(0,-12))
		#ignore collisions with plane itself
		laserInstance.get_node("KinematicBody2D").add_collision_exception_with(get_node("."))
		#get_node("Laser"+str(laserCount)+"/KinematicBody2D").add_collision_exception_with(get_node("."))
		canShoot = false
	
	