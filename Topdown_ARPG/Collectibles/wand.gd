extends "res://Collectibles/Collectible.gd"

@onready var animation_player = $AnimationPlayer

func collect():
	animation_player.play("shake")
	await animation_player.animation_finished
	super.collect()
