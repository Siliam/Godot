extends TextureButton

func _on_pressed():
	if get_tree().paused:
		get_tree().paused = false
		texture_normal = load("res://assets/ui/pause.png")
	else:
		get_tree().paused = true
		texture_normal = load("res://assets/ui/play.png")


func _on_button_reset_pressed():
	pass # Replace with function body.
