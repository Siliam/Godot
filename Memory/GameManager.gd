extends Node

var cardBack = preload("res://assets/cards/cardBack_blue2.png")

@onready var Game = get_node("/root/Game/")

var deck = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_deck()
	deal_deck()

func fill_deck():
	for suit in range(1, 5):
		for value in range(1, 14):
			deck.append(Card.new(suit, value))

func deal_deck():
	for card in deck:
		Game.get_node('grid').add_child(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
