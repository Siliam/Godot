extends TileMap

var GridSize = 10
var Dic = {}
var prev_tile = null
var currently_selected_tile = null

func _ready():
	var Pieces = get_node("../Pieces")
	var non_empty = []
	for x in range(-5, 7):
		for y in range(-17, 7):
			var floor_cell = get_cell_tile_data(0, Vector2i(x, y))
			if floor_cell != null:
				Dic[str(Vector2(x, y))] = {"Type": "Empty",}
				if randf() < 0.1:
					non_empty.append(map_to_local(Vector2i(x, y)))
	
	Pieces.instantiate_pieces(non_empty)

func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	
	if tile != prev_tile:
		if prev_tile != null:
			erase_cell(1, prev_tile)
		set_cell(1, tile, 0, Vector2i(0, 14), 0)
		prev_tile = tile
	
	if Dic.has(str(tile)) == false:
		if prev_tile != null:
			erase_cell(1, prev_tile)
			
	if Input.is_action_pressed("left_click"):
		if Dic.has(str(tile)):
			if currently_selected_tile != null:
				erase_cell(2, currently_selected_tile)
			currently_selected_tile = tile
			set_cell(2, tile, 0, Vector2i(2, 14), 0)
	
	if Input.is_action_pressed("right_click"):
		if Dic.has(str(tile)) and currently_selected_tile != null:
			erase_cell(2, currently_selected_tile)
	
#	for x in GridSize:
#		for y in GridSize:
#			erase_cell(1, Vector2(x, y))
#
#	if Dic.has(str(tile)):
#		set_cell(1, tile, 1, Vector2i(0,0), 0)
