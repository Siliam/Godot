extends Node2D

@onready var hearts_container = $CanvasLayer/HeartsContainer
@onready var player = $Player

func _ready():
	hearts_container.set_max_hearts($Player.max_health)
	
	player.health_changed.connect(hearts_container.update_hearts)
