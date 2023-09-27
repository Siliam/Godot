extends Node2D

var Piece = preload("res://piece.tscn")
var my_pieces = []
var TM = null


func instantiate_pieces(tiles):
	for tile in tiles:
		var piece = Piece.instantiate()
		piece.position = tile
		add_child(piece)
