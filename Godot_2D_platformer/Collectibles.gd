extends Node2D

var Cherry = preload("res://Collectibles/Cherry.tscn")
var last_cherry = null

func _on_timer_timeout():
	if last_cherry != null:
		last_cherry.fade_up()
	
	var cherryTemp = Cherry.instantiate()
	var rand_x = randi_range(50, 500)
	
	cherryTemp.position = Vector2(rand_x, 500)
	add_child(cherryTemp)
	
	last_cherry = cherryTemp

