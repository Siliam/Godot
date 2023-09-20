extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node('AnimationPlayer') 

	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
		
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")
		
	if velocity.y > 0:
		anim.play("Fall")
	move_and_slide()

	if Game.playerHP > 0 and position.y > 675:
		get_node("FallSound").play()
		# await get_tree().create_timer(2).timeout
		self.position = Vector2(position.x-100, 300)

	if Game.playerHP <= 0:
		self.queue_free()
		Game.playerHP = 10
		Game.Gold = 0
		get_tree().change_scene_to_file("res://main.tscn")
		
		

func respawn():
	pass
	# blink
