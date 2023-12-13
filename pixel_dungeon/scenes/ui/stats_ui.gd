extends HBoxContainer
class_name StatsUI

@onready var block_label = %BlockLabel
@onready var health_label = %HealthLabel
@onready var block = $Block
@onready var health = $Health


func update_stats(stats: Stats) -> void:
	block_label.text = str(stats.block)
	health_label.text = str(stats.health)
	
	block.visible = stats.block > 0
	health.visible = stats.health > 0
