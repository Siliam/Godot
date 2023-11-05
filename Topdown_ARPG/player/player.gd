extends CharacterBody2D

@export var speed = 50
@onready var animations = $AnimationPlayer

@export var max_health: int = 3
@onready var current_health: int = 3


func handle_input():
	var move_direction = Input.get_vector( "ui_left", "ui_right","ui_up", "ui_down")
	self.velocity = move_direction * speed

func update_animation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "down"
		if velocity.x < 0:
			direction = "left"
		elif velocity.x > 0:
			direction = "right"
		elif velocity.y < 0:
			direction = "up"
		animations.play("walk_"+direction)



func _physics_process(delta):
	handle_input()
	update_animation()
	move_and_slide()


func _on_hitbox_area_entered(area):
	if area.name == "Hitbox":
		current_health -= 1
	
		if current_health == 0:
			current_health = max_health
		
		print(current_health)
