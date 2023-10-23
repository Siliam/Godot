extends Node

@onready var Game = get_node("/root/Game/")

var PopUp = preload("res://pop_up.tscn")

var deck = Array()
var cardBack = preload("res://assets/cards/cardBack_red2.png")

var card1 = null
var card2 = null

var match_timer = Timer.new()
var flip_timer = Timer.new()
var seconds_timer = Timer.new()

var score = 0
var seconds = 0 
var moves = 0

var score_label
var timer_label
var moves_label

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_deck()
	deal_deck()
	set_up_timers()
	setupHUD()
	
	var splash = PopUp.instantiate()
	Game.add_child(splash)

func reset_game():
	for c in deck:
		c.queue_free()
	deck.clear()
	
	score = 0
	seconds = 0
	moves = 0
	
	score_label.text = "0"
	timer_label.text = "0"
	moves_label.text = "0"
	
	seconds_timer.start()
	
	fill_deck()
	deal_deck()

func setupHUD():
	score_label = Game.get_node("HUD/Panel/Sections/Section_Score/Score")
	timer_label = Game.get_node("HUD/Panel/Sections/Section_Timer/Timer")
	moves_label = Game.get_node("HUD/Panel/Sections/Section_Moves/Moves")
	
	score_label.text = str(score)
	timer_label.text = str(seconds)
	moves_label.text = str(moves)
	
func set_up_timers():
	flip_timer.connect("timeout", turn_over_cards, 0)
	flip_timer.one_shot = true
	add_child(flip_timer)
	
	match_timer.connect("timeout", match_cards_and_score, 0)
	match_timer.one_shot = true
	add_child(match_timer)
	
	seconds_timer.connect("timeout", count_seconds, 0)
	add_child(seconds_timer)
	seconds_timer.start()

func count_seconds():
	seconds += 1
	timer_label.text = str(seconds)

func fill_deck():
	for suit in range(1, 5):
		for value in range(1, 14):
			deck.append(Card.new(suit, value))

func deal_deck():
	deck.shuffle()
	for card in deck:
		Game.get_node('grid').add_child(card)

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
	moves += 1
	moves_label.text = str(moves)
	
	if card1.value == card2.value:
		match_timer.start(0.3)
	else:
		flip_timer.start(0.7)

func turn_over_cards():
	card1.flip()
	card2.flip()
	card1.disabled = false
	card2.disabled = false
	card1 = null
	card2 = null

func match_cards_and_score():
	score += 1
	score_label.text = str(score)
	
	card1.modulate = Color(0.6, 0.6, 0.6, 0.5)
	card2.modulate = Color(0.6, 0.6, 0.6, 0.5)
	card1 = null
	card2 = null
	
	if score == 1:
		var win_screen = PopUp.instantiate()
		win_screen.win()
		Game.add_child(win_screen)
