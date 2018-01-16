extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screensize
var rivers = randi()%11+1
var grid_map = []
var columns = 20
var rows = 100
var fill_factor = 0.2
var rand_value = 0

onready var plane = get_node("plane")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	generate_grid_map()
	draw_tiles()
	
func generate_grid_map():
	for x in range(0, columns + 1):
		grid_map.append([])
		for y in range(0, rows + 1):
			randomize()
			if rand_range(0, 2) < fill_factor:
				rand_value = 1
			else:
				rand_value = 0
			grid_map[x].append(rand_value)
			
func draw_tiles():
	for x in range(0, columns):
		for y in range(0, rows):
			var dot_1 = grid_map[x][y]
			var dot_2 = grid_map[x+1][y]
			var dot_3 = grid_map[x+1][y+1]
			var dot_4 = grid_map[x][y+1]
			var value = dot_1 + (dot_2*2) + (dot_3*4) + (dot_4*8)
			get_node("tile_map").set_cellv(Vector2(x,y), value)

