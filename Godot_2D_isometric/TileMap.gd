extends TileMap

var GridSize = 10
var Dic = {}
var prev_tile = null

#0, 0
#4, -9
#9, 0
#4, 9

func _ready():
	for x in range(GridSize):
		var h = min(x, GridSize-x) + 1
		for y in range(-h, h):
			Dic[str(Vector2(x, y))] = {
				"Type": "Empty",
			}
			set_cell(0, Vector2(x, y), 0, Vector2i(0,0), 0)


func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	
	if tile != prev_tile:
		print(tile)
		prev_tile = tile
	
	for x in GridSize:
		for y in GridSize:
			erase_cell(1, Vector2(x, y))
	
	if Dic.has(str(tile)):
		set_cell(1, tile, 1, Vector2i(0,0), 0)
