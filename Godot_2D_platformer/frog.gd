extends CharacterBody2D

var SPEED = 100 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false 


func _physics_process(delta):
	# Gravity for frog
	velocity.y += gravity * delta
	move_and_slide()

	# Chasing the player
	if chase == true:
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
		get_node("AnimatedSprite2D").play("Jump")
	
	else:
		velocity.x = 0
		get_node("AnimatedSprite2D").play("Idle")

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
