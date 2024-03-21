extends CharacterBody2D
class_name Bird

const MAX_DISTANCE := 100 	# how far (in dx, xy) can the next destination be
const INTIIAL_SPEED := 100
const IMMUNITY_DURATION := 1

@export var target := Vector2i.ZERO
@export var speed := INTIIAL_SPEED

var within_range = false
var immune = true
var shot = false

@onready var sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pick_next_position()
	var timer := get_tree().create_timer(IMMUNITY_DURATION)
	timer.timeout.connect(func(): immune = false)


func pick_next_position():
	var S = get_viewport_rect().size
	self.target.x = clampi(self.position.x - MAX_DISTANCE + randi() % (2*MAX_DISTANCE), 0, S[0])
	self.target.y = clampi(self.position.y - MAX_DISTANCE + randi() % (2*MAX_DISTANCE), 0, S[1]*0.5)
	
	if target.x > self.position.x:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	move_and_slide()

func kill():
	print("SHOT!")
	if not immune:
		target = Vector2i(position.x, get_viewport_rect().size.y)
		speed = INTIIAL_SPEED
		sprite.play("fall")
		shot = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not shot and position.distance_to(target) <= 5:
		self.pick_next_position()
	if shot and position.distance_to(target) <= 10:
		self.queue_free()
