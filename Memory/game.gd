extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
#	var c = Card.new(1, 1)
#	$grid.add_child(c)
	for suit in range(1, 5):
		for value in range(1, 14):
			$grid.add_child(Card.new(suit, value))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
