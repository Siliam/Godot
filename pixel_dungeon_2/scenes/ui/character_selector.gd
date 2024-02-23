extends Control

const RUN_SCENE = preload("res://scenes/run/run.tscn")
const ASSASSIN_STATS := preload("res://characters/Assasin/assassin.tres")
const WARRIOR_STATS := preload("res://characters/warrior/warrior.tres")
const WIZARD_STATS := preload("res://characters/Wizard/wizard.tres")

@export var run_startup: RunStartup

@onready var title = %Title
@onready var description = %Description
@onready var character_portrait = %CharacterPortrait

var current_character: CharacterStats: set = set_current_character

func _ready():
	set_current_character(WARRIOR_STATS)

func set_current_character(new_character: CharacterStats) -> void:
	current_character = new_character
	title.text = current_character.character_name
	description.text = current_character.description
	character_portrait.texture = current_character.portrait

func _on_start_button_pressed():
	run_startup.type = RunStartup.Type.NEW_RUN
	run_startup.picked_character = current_character
	get_tree().change_scene_to_packed(RUN_SCENE)

func _on_warrior_button_pressed():
	current_character = WARRIOR_STATS

func _on_wizard_button_pressed():
	current_character = WIZARD_STATS


func _on_assassin_button_pressed():
	current_character = ASSASSIN_STATS

