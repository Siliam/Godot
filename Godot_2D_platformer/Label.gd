extends Label

func _process(delta):
	text = "HP: " + str(get_node("../../Player/Player").health)
