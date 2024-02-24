extends CenterContainer
class_name CardMenuUI

signal tooltip_requested(card: Card)

const BASE_STYLEBOX := preload("res://scenes/card_ui/card_base_stylebox.tres")
const HOVER_STYLEBOX := preload("res://scenes/card_ui/card_hover_stylebox.tres")

@export var card: Card : set = set_card

@onready var panel = $Visuals/Panel
@onready var cost = $Visuals/Cost
@onready var icon = $Visuals/Icon


func set_card(c: Card):
	pass
	

func _on_visuals_mouse_entered():
	pass # Replace with function body.


func _on_visuals_mouse_exited():
	pass # Replace with function body.


func _on_visuals_gui_input(event):
	pass # Replace with function body.
