extends HBoxContainer

@onready var HeartGuiClass = preload("res://Scenes/heart.tscn")

func set_max_hearts(max:int):
	for i in range(max):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

func update_hearts(current_health):
	var hearts = get_children()
	
	for i in range(current_health):
		hearts[i].update(true)
	
	for i in range(current_health, hearts.size()):
		hearts[i].update(false)
