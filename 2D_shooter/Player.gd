extends CharacterBody2D

var speed = 300
var bullet_speed = 2000
var direction
var shots_fired = 0

var Bullet = preload("res://bullet.tscn")

func _ready():
	pass
func read_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		direction = Vector2(0, -1)

	if Input.is_action_pressed('down'):
		velocity.y += 1
		direction = Vector2(0, 1)

	if Input.is_action_pressed('left'):
		velocity.x -= 1
		direction = Vector2(-1, 0)

	if Input.is_action_pressed('right'):
		velocity.x += 1
		direction = Vector2(1, 0)

	if Input.is_action_just_pressed("mouse_left_click"):
		fire()

	velocity = velocity.normalized() * speed

	move_and_slide()
	look_at(get_global_mouse_position())
	
func _physics_process(delta):
	read_input()

	position += velocity * delta

func fire():
	shots_fired += 1
	var bullet_instance = Bullet.instantiate()
	bullet_instance.name = "Bullet_"+str(shots_fired)
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = self.rotation_degrees
	
	bullet_instance.linear_velocity = Vector2(bullet_speed,0).rotated(rotation)

	get_tree().get_root().call_deferred("add_child", bullet_instance)


func kill():
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body):
	if 'Enemy' in body.name:
		kill()
