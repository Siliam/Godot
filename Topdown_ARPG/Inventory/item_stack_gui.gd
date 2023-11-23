extends Panel

class_name ItemStackGui
@onready var item_sprite: Sprite2D = $item
@onready var label: Label = $Label
var inventory_slot: InventorySlot

func update():
	if !inventory_slot or !inventory_slot.item: return
	
	item_sprite.visible = true
	item_sprite.texture = inventory_slot.item.texture
	
	if inventory_slot.amount > 1:
		label.visible = true
		label.text = str(inventory_slot.amount)
	else:
		label.visible = false
