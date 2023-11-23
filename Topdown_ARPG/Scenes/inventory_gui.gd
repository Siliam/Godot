extends Control

signal opened
signal closed
var is_open: bool = false

@onready var inventory: Inventory = preload("res://Inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@onready var ItemStackGuiClass = preload("res://Inventory/item_stack_gui.tscn")

func _ready():
	inventory.updated.connect(update)
	connectSlots()
	update()

func connectSlots():
	for slot in slots:
		var callable = Callable(on_slot_clicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		var inventory_slot: InventorySlot = inventory.slots[i]
		if !inventory_slot.item:
			continue
		var item_stack_gui: ItemStackGui = slots[i].item_stack_gui
		if !item_stack_gui:
			item_stack_gui = ItemStackGuiClass.instantiate()
			slots[i].insert(item_stack_gui)
			
		item_stack_gui.inventory_slot = inventory_slot
		item_stack_gui.update() 
func open():
	visible = true
	is_open = true
	opened.emit()

func close():
	visible = false
	is_open = false
	closed.emit()

func on_slot_clicked(slot):
	print("click")
