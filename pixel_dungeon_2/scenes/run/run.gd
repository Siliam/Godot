class_name Run
extends Node

const BATTLE_SCENE := preload("res://scenes/battle/battle.tscn")
const BATTLE_REWARD_SCENE := preload("res://scenes/battle_rewards/battle_rewards.tscn")
const CAMPFIRE_SCENE := preload("res://scenes/campfire/campfire.tscn")
const MAP_SCENE := preload("res://scenes/map/map.tscn")
const SHOP_SCENE := preload("res://scenes/shop/shop.tscn")
const TREASURE_SCENE := preload("res://scenes/treasure/treasure.tscn")

@onready var current_view = %CurrentView
@onready var battle_button = %BattleButton
@onready var map_button = %MapButton
@onready var rewards_button = %RewardsButton
@onready var shop_button = %ShopButton
@onready var treasure_button = %TreasureButton
@onready var campfire_button = %CampfireButton

var character: CharacterStats


# Called when the node enters the scene tree for the first time.
func _ready():
	if not character:
		var warrior := load("res://characters/warrior/warrior.tres")
		character = warrior.create_instance()
		_start_run()


func _start_run() -> void:
	_setup_event_connections()
	# Generate map procedurally

func _change_view(scene: PackedScene):
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()
	
	get_tree().paused = false
	var new_view := scene.instantiate()
	current_view.add_child(new_view)

func _setup_event_connections():
	Events.shop_exited.connect(_change_view.bind(MAP_SCENE))
	Events.campfire_exited.connect(_change_view.bind(MAP_SCENE))
	Events.battle_won.connect(_change_view.bind(BATTLE_REWARD_SCENE))
	Events.treasure_room_exited.connect(_change_view.bind(MAP_SCENE))
	Events.battle_reward_exited.connect(_change_view.bind(MAP_SCENE))
	Events.map_exited.connect(_on_map_exited)
	
	battle_button.pressed.connect(_change_view.bind(BATTLE_SCENE))
	campfire_button.pressed.connect(_change_view.bind(CAMPFIRE_SCENE))
	map_button.pressed.connect(_change_view.bind(MAP_SCENE))
	rewards_button.pressed.connect(_change_view.bind(BATTLE_REWARD_SCENE))
	shop_button.pressed.connect(_change_view.bind(SHOP_SCENE))
	treasure_button.pressed.connect(_change_view.bind(TREASURE_SCENE))
	
func _on_map_exited():
	pass #change the view 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
