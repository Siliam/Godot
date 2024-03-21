extends Node2D

const TIME = 0.2
const LAG_FACTOR = 0.5

var targets = []

# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_local_mouse_position()
	
	var timer := get_tree().create_timer(TIME)
	timer.timeout.connect(update_position_with_lag)
	
func update_position_with_lag():
	var mouse_position = get_local_mouse_position()

	position.x += mouse_position.x * LAG_FACTOR
	position.y += mouse_position.y * LAG_FACTOR

	var timer := get_tree().create_timer(TIME)
	timer.timeout.connect(update_position_with_lag)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
