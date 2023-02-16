extends Entity
class_name Player

var input_vector:Vector2 = Vector2.ZERO

func handle_input():
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")

func _physics_process(delta):
	apply_acceleration(input_vector.x)
	move_and_slide()
