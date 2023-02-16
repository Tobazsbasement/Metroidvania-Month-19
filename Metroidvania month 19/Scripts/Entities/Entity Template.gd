extends CharacterBody2D
class_name Entity

@export var max_speed: int = 300
@export var jump_velocity: int = -400
@export var gravity: int = 1000
@export var friction: int = 500
@export var acceleration: int = 500

func apply_acceleration(direction):
	velocity.x = move_toward(velocity.x, max_speed * direction, acceleration)

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, friction)

func apply_gravity(delta):
	velocity.y += gravity * delta

func _physics_process(delta):
	move_and_slide()
