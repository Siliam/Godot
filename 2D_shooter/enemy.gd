extends CharacterBody2D

var delay = 1000

func _physics_process(delta):
	var Player = get_parent().get_node('Player')
	
	position += (Player.position - position)/delay
	look_at(Player.position)


func _on_area_2d_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
	else:
		print(body.name)
