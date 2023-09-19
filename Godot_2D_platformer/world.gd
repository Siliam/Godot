extends Node2D

func _process(delta):
	if Input.is_action_pressed("back_to_main_menu"):
		get_tree().change_scene_to_file("res://main.tscn")
