extends CharacterBody2D

var SPEED = 200
var direction : Vector2 = Vector2()

func _ready():
	$AnimatedSprite2D.play("idle_down")
	
func read_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		direction = Vector2(0, -1)
		$AnimatedSprite2D.play("up")
	if Input.is_action_pressed('down'):
		velocity.y += 1
		direction = Vector2(0, 1)
		$AnimatedSprite2D.play("down")
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		$AnimatedSprite2D.play("left")
	if Input.is_action_pressed('right'):
		velocity.x += 1
		direction = Vector2(1, 0)
		$AnimatedSprite2D.play("right")
	velocity = velocity.normalized()
	
	if velocity == Vector2.ZERO:
		var current_animation = $AnimatedSprite2D.animation
		if current_animation in ["up", "down", "left", "right"]:
			$AnimatedSprite2D.play("idle_" + current_animation)
	
func _physics_process(delta):
	read_input()
	position += velocity * delta * SPEED
