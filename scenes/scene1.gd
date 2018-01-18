extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var screensize
var rivers = randi()%11+1
var grid_map = []
var columns = 52
var rows = 1000
var fill_factor = 0.2
var rand_value = 0
var riverWidth = [0.5]
var tempWidth = 0.5
var riverCentre = [0.5]
var tempCentre = 0.5
var centreNoise = 0.1
var widthNoise = 0.05
var minWidth = 0.2

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
			if x == 0:
				tempCentre = riverCentre[y] + rand_range(-1,1)*centreNoise
				tempCentre = max(tempCentre,riverWidth[y]/2+0.1)
				tempCentre = min(tempCentre,1-riverWidth[y]/2-0.1)
				riverCentre.append(tempCentre)
				tempWidth = riverWidth[y] + rand_range(-1,1)*widthNoise
				tempWidth = max(minWidth, tempWidth)
				tempWidth = min(0.8, tempWidth)
				riverWidth.append(tempWidth)
				
			#if rand_range(0, 2) < fill_factor:
			#	rand_value = 1
			#else:
			#	rand_value = 0
			#grid_map[x].append(rand_value)
			print(x/columns)
			print(riverCentre[y]-riverWidth[y]/2)
			if (float(x)/columns > riverCentre[y]-riverWidth[y]/2) && (float(x)/columns < riverCentre[y]+riverWidth[y]/2):
				grid_map[x].append(0)
			else:
				grid_map[x].append(1)
			
func draw_tiles():
	for x in range(0, columns):
		for y in range(0, rows):
			var dot_1 = grid_map[x][y]
			var dot_2 = grid_map[x+1][y]
			var dot_3 = grid_map[x+1][y+1]
			var dot_4 = grid_map[x][y+1]
			var value = dot_1 + (dot_2*2) + (dot_3*4) + (dot_4*8)
			get_node("tile_map").set_cellv(Vector2(x,y-rows), value)

