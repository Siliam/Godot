extends TextureButton

class_name Card

var suit
var value
var face
var back

func _init(s, v):
	suit = s
	value = v
	face = load("res://assets/cards/card-"+str(suit)+"-"+str(value)+".png")

func _ready():
	pass # Replace with function body.
