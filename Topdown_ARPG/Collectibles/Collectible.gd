extends Area2D

@export var item_resource: InventoryItem

func collect(inventory:Inventory):
	inventory.insert(item_resource)
	queue_free()
