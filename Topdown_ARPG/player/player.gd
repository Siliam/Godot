extends CharacterBody2D

signal health_changed

@export var speed = 50
@onready var animations = $AnimationPlayer
@onready var effects = $Effects
@onready var reset_timer = $Timer

@export var knockback_force = 500

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

func _ready():
	effects.play("RESET")
func _on_hitbox_area_entered(area):
	if area.name == "Hitbox":
		current_health -= 1
	
		if current_health == 0:
			current_health = max_health
		
		health_changed.emit(current_health)
		print(current_health)
		knockback(area.get_parent().velocity)
		effects.play("blink_hurt")
		reset_timer.start()
		await reset_timer.timout
		
func knockback(enemy_velocity):
	var knockback_direction = -( velocity - enemy_velocity ).normalized() * knockback_force
	velocity = knockback_direction
	move_and_slide()
