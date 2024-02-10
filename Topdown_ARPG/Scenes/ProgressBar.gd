extends ProgressBar

@export var player: Player

func _ready():
	update()
	player.health_changed.connect(update)
	
func update():
	if player:
		value = player.current_health * 100 / player.max_health
		print("New value", value)
