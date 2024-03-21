extends Control

@onready var crosshair = $Crosshair

func _ready():
	# Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass


func _on_crosshair_area_entered(area):
	print(area.name)

func _on_crosshair_body_entered(body):
	if body.get_class() == "CharacterBody2D":
		body.within_range = true
		crosshair.targets.append(body)

func _on_crosshair_body_exited(body):
	if body.get_class() == "CharacterBody2D":
		body.within_range = false
		if body in crosshair.targets:
			crosshair.targets.erase(body)


func _on_bird_input_event(viewport, event, shape_idx):
	print("Bird pressed!")


func _on_crosshair_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		print("Crosshair pressed!")
		for bird in crosshair.targets:
			bird.kill()
