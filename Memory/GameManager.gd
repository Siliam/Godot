extends Node

@onready var Game = get_node("/root/Game/")

var deck = Array()
var cardBack = preload("res://assets/cards/cardBack_red2.png")

var card1 = null
var card2 = null

var match_timer = Timer.new()
var flip_timer = Timer.new()

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_deck()
	deal_deck()
	set_up_timers()
	
func set_up_timers():
	flip_timer.connect("timeout", turn_over_cards, 0)
	flip_timer.one_shot = true
	add_child(flip_timer)
	
	match_timer.connect("timeout", match_cards_and_score, 0)
	match_timer.one_shot = true
	add_child(match_timer)


func fill_deck():
	for suit in range(1, 5):
		for value in range(1, 14):
			deck.append(Card.new(suit, value))

func deal_deck():
	deck.shuffle()
	for card in deck:
		Game.get_node('grid').add_child(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func choose_card(card):
	if card1 == null:
		card1 = card
		card1.flip()
		card1.disabled = true
		
	elif card2 == null:
		card2 = card
		card2.flip()
		card2.disabled = true
		check_cards()

func check_cards():
	if card1.value == card2.value:
		match_timer.start(0.3)
	else:
		flip_timer.start(0.7)

func match_cards_and_score():
	score += 1
	card1.modulate = Color(0.6, 0.6, 0.6, 0.5)
	card2.modulate = Color(0.6, 0.6, 0.6, 0.5)
	card1 = null
	card2 = null

func turn_over_cards():
	card1.flip()
	card2.flip()
	card1.disabled = false
	card2.disabled = false
	card1 = null
	card2 = null
