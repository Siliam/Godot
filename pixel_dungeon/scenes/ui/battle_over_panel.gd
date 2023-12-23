extends Panel
class_name BattleOverPanel

enum Type {WIN, LOSE}

@onready var label = %Label
@onready var continue_button = %ContinueButton
@onready var restart_button = %RestartButton

func _ready() -> void:
	continue_button.pressed.connect(get_tree().quit)
	restart_button.pressed.connect(get_tree().reload_current_scene)
	Events.battle_over_screen_requested.connect(show_screen)
	
func show_screen(text: String, type: Type) -> void:
	label.text = text
	continue_button.visible = type == Type.WIN
	restart_button.visible = type == Type.LOSE
	show()
	get_tree().paused = true
