extends Node2D

var Piece = preload("res://piece.tscn")
var my_pieces = []
var TM = null


func instantiate_pieces(tiles, coords):
	for i in len(tiles):
		var tile = tiles[i]
		var coor = coords[i]
		var piece = Piece.instantiate()
		piece.position = coor
		get_node("../TileMap").Dic[str(tile)]["Piece"] = piece
		print("Adding a piece at " + str(tile))
		add_child(piece)
		
