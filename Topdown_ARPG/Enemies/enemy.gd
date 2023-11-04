extends CharacterBody2D

@export var speed = 30
@export var limit = 0.5

@onready var animations = $AnimationPlayer

var start_position
var end_position

func _ready():
	start_position = position
	end_position = start_position - Vector2(0, 3*16)

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
	update_velocity()
	move_and_slide()
	update_animation()
