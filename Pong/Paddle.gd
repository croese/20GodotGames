extends StaticBody2D

@export var speed = 250
@export var player: Global.PLAYER

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == Global.PLAYER.LEFT:
		if Input.is_action_pressed("left_paddle_up"):
			position.y -= speed * delta
		if Input.is_action_pressed("left_paddle_down"):
			position.y += speed * delta
	else:
		if Input.is_action_pressed("right_paddle_up"):
			position.y -= speed * delta
		if Input.is_action_pressed("right_paddle_down"):
			position.y += speed * delta
	
	position.y = clamp(position.y, 168, 472)
