extends Node
class_name CardState

enum State {BASE, CLICKED, DRAGGING, AIMING, RELEASED}

signal transition_requested(from: CardState, to: State)

@export var state: State

var card_ui: CardUI

func enter() -> void:
	pass

func exist() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass
	
func on_mouse_exited() -> void:
	pass
