extends Control

var play_button

func _ready():
	play_button = get_node("CenterContainer/Panel/VBoxContainer/Button")
	play_button.connect("pressed", new_game)
	get_tree().paused = true

func new_game():
	get_tree().paused = false
	GameManager.reset_game()
	queue_free()

func win():
	var new_texture = load("res://assets/ui/complete.png")
	get_node("CenterContainer/Panel/VBoxContainer/TextureRect").texture = new_texture
	var label = get_node("CenterContainer/Panel/VBoxContainer/Label")
	label.text = "You have found all pairs in " + str(GameManager.seconds) + " seconds, and flipped " + str(GameManager.moves) + " pairs!."
	$CenterContainer/Panel/VBoxContainer/Button.text = "Play again!"
