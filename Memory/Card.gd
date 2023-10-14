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
	back = GameManager.cardBack
	
	texture_normal = face

func _ready():
	set_ignore_texture_size(true)
	size_flags_horizontal = Control.SIZE_EXPAND + Control.SIZE_FILL 
	size_flags_vertical = Control.SIZE_EXPAND + Control.SIZE_FILL
	stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	
