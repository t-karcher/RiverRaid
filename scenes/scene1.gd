extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screensize

onready var plane = get_node("plane")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	screensize = get_viewport().get_rect().size
