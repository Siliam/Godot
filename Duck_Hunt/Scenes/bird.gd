extends CharacterBody2D

@export var target := Vector2i.ZERO
@export var speed := 200
const MAX_DISTANCE = 100

@onready var sprite_2d = $AnimatedSprite2D


func pick_next_position():
	var S = get_viewport_rect().size
	self.target.x = clampi(self.position.x - MAX_DISTANCE + randi() % (2*MAX_DISTANCE), 0, S[0])
	self.target.y = clampi(self.position.y - MAX_DISTANCE + randi() % (2*MAX_DISTANCE), 0, S[1]*0.5)
	
	if target.x > self.position.x:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true
	
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pick_next_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	
	if position.distance_to(target) > 5:
		move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.distance_to(target) <= 5:
		self.pick_next_position()
