extends Node2D

var Wisp2 = preload("res://wisp_2.tscn")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	$Wisp.position = get_viewport().get_mouse_position()


func _on_particle_spawn_timer_timeout():
	print("Generate new wisp")
	spawn_randow_mini_wisp()

func spawn_randow_mini_wisp():
	var screen_size = get_viewport_rect().size
	var new_wisp = Wisp2.instantiate()
	new_wisp.position.x = randi_range(0, screen_size.x)
	new_wisp.position.y = randi_range(0, screen_size.y)
	print("Generate new wisp at " + str(new_wisp.position))
	
	add_child(new_wisp)
