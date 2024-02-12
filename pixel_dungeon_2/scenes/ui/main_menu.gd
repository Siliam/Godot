extends Control

@onready var continue_button = %Continue

func _ready() -> void:
	get_tree().paused = false

func _on_continue_pressed():
	print("Continue run")

func _on_new_run_pressed():
	print("New run")


func _on_exit_pressed():
	get_tree().quit()
