extends TileMap

var GridSize = 10
var Dic = {}
var prev_tile = null

#0, 0
#4, -9
#9, 0
#4, 9

func _ready():
	for x in range(-5, 7):
		for y in range(-17, 7):
			var floor_cell = get_cell_tile_data(0, Vector2i(x, y))
			if floor_cell != null:
				Dic[str(Vector2(x, y))] = {"Type": "Empty",}
	

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
	
#	for x in GridSize:
#		for y in GridSize:
#			erase_cell(1, Vector2(x, y))
#
#	if Dic.has(str(tile)):
#		set_cell(1, tile, 1, Vector2i(0,0), 0)
