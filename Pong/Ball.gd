extends RigidBody2D

const BALL_START_POS = Vector2(576, 324)

var reset = false
var velocity = 0

func _integrate_forces(state):
	if reset:
		linear_velocity.x = velocity
		position = BALL_START_POS
		await get_tree().create_timer(2).timeout
		reset = false
