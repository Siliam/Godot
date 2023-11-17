extends Panel

@onready var background_sprite: Sprite2D = $background
@onready var item_sprite: Sprite2D = $CenterContainer/Panel/item
@onready var label: Label = $CenterContainer/Panel/Label

func update(slot: InventorySlot):
	if slot.item == null:
		background_sprite.frame = 0
		item_sprite.visible = false
		label.visible = false
	else:
		background_sprite.frame = 1
		item_sprite.visible = true
		item_sprite.texture = slot.item.texture
		label.visible = true
		label.text = 'x' + str(slot.amount)
