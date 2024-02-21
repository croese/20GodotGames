extends Node2D

const INITIAL_VELOCITY = 500

@onready var left_score_label = $LeftScoreLabel
@onready var right_score_label = $RightScoreLabel
@onready var ball = $Ball

var receiving_player = Global.PLAYER.RIGHT

var left_score = 0:
	get:
		return left_score
	set(value):
		left_score = value
		left_score_label.text = "%03d" % value

var right_score = 0:
	get:
		return right_score
	set(value):
		right_score = value
		right_score_label.text = "%03d" % value

func reset_game():
	left_score = 0
	right_score = 0

func new_round():
	ball.velocity = INITIAL_VELOCITY if receiving_player == Global.PLAYER.RIGHT else -INITIAL_VELOCITY
	ball.reset = true

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_left_end_zone_body_entered(body):
	right_score += 1
	receiving_player = Global.PLAYER.RIGHT
	new_round()


func _on_right_end_zone_body_entered(body):
	left_score += 1
	receiving_player = Global.PLAYER.LEFT
	new_round()
