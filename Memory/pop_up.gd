extends Control

var play_button

func _ready():
	play_button = get_node("CenterContainer/Panel/VBoxContainer/Button")
	play_button.connect("pressed", new_game)
	get_tree().paused = true

func new_game():
	get_tree().paused = false
	queue_free()
