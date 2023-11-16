extends CharacterBody2D

signal health_changed

@export var speed = 50
@onready var animations = $AnimationPlayer
@onready var effects = $Effects
@onready var reset_timer = $Timer
@onready var hurt_box = $Hitbox
@export var knockback_force = 500

@export var inventory: Inventory

@export var max_health: int = 3
@onready var current_health: int = 3

var is_hurt = false


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
	if is_hurt == false:
		for area in hurt_box.get_overlapping_areas():
			if area.name == "Hitbox":
				hurt_by_enemy(area)

func _ready():
	effects.play("RESET")

func hurt_by_enemy(area):
	current_health -= 1
	is_hurt = true
	if current_health == 0:
		current_health = max_health
	
	health_changed.emit(current_health)
	print(current_health)
	knockback(area.get_parent().velocity)
	effects.play("blink_hurt")
	reset_timer.start()
	await reset_timer.timeout
	effects.play("RESET")
	is_hurt = false

func _on_hitbox_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)

func _on_hitbox_area_exited(area):
	pass
	
func knockback(enemy_velocity):
	var knockback_direction = -( velocity - enemy_velocity ).normalized() * knockback_force
	velocity = knockback_direction
	move_and_slide()

