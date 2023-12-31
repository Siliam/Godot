extends CharacterBody2D

@export var speed = 30
@export var limit = 0.5
@export var end_point: Marker2D

@onready var animations = $AnimationPlayer

var start_position
var end_position
var is_dead = false

func _ready():
	start_position = position
	end_position = end_point.global_position

func change_direction():
	var temp_end = end_position
	end_position = start_position
	start_position = temp_end

func update_velocity():
	var move_direction = end_position - position
	if move_direction.length() < limit:
		position = end_position
		change_direction()
	velocity = move_direction.normalized() * speed


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
	if is_dead: return
	update_velocity()
	move_and_slide()
	update_animation()


func _on_hurtbox_area_entered(area):
	if area == $Hitbox:
		return
	$Hitbox.set_deferred("monitorable", false)
	print('play death animation')
	is_dead = true
	animations.play("Death_2")
	await animations.animation_finished
	print('animation played')

	queue_free()
