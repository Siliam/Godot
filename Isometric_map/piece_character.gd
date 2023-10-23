extends CharacterBody2D

func _ready():
	var pieces_names = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(pieces_names[randi() % pieces_names.size()])
