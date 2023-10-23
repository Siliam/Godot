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
	
	texture_normal = back

func _ready():
	set_ignore_texture_size(true)
	size_flags_horizontal = Control.SIZE_EXPAND + Control.SIZE_FILL 
	size_flags_vertical = Control.SIZE_EXPAND + Control.SIZE_FILL
	stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
	
func _pressed():
	GameManager.choose_card(self)

func flip():
	if texture_normal == back:
		texture_normal = face
	else:
		texture_normal = back
