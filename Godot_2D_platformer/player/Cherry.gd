extends Area2D

func _ready():
	get_node('AnimatedSprite2D').play("Idle")
	
func _on_body_entered(body):
	if body.name == "Player":
		Game.Gold += 5
		fade_up()
		
func fade_up():
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	tween1.tween_property(self, "position", position - Vector2(0, 25), 0.3)
	tween2.tween_property(self, "modulate:a", 0, 0.3)
	
	tween1.tween_callback(queue_free)
