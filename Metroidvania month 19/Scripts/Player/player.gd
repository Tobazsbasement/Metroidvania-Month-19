extends CharacterBody2D
class_name Player

@onready var Head = $Head
@onready var Torso = $Torso
@onready var LArm = $"Left Arm"
@onready var RArm = $"Right Arm"
@onready var LLeg = $"Left Leg"
@onready var RLeg = $"Right Leg"
@onready var HeadPos = $"Head Marker"
@onready var LArmPos = $"Left Arm Marker"
@onready var RArmPos = $"Right Arm Marker"
@onready var LLegPos = $"Left Leg Marker"
@onready var RLegPos = $"Right Leg Marker"

@export var max_speed: int = 300
@export var friction: int = 500
@export var acceleration: int = 500
@export var gravity: int = 2200
@export var jump_strength = 800

enum STATES {
	IDLE,
	MOVING,
	IN_AIR,
	JUMP
}

var current_state: STATES
var input_vector:Vector2 = Vector2.ZERO

func _ready():
	set_part_positions()

func handle_input():
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		jump()
		current_state = STATES.JUMP

func _physics_process(delta):
	handle_input()
	set_state(delta)
	move_and_slide()

func set_state(delta):
	if input_vector.x == 0 and is_on_floor():
		current_state = STATES.IDLE
	elif is_on_floor():
		current_state = STATES.MOVING
	else:
		current_state = STATES.IN_AIR
	
	match current_state:
		STATES.IDLE:
			apply_friction()
		STATES.MOVING:
			apply_acceleration()
		STATES.IN_AIR:
			apply_gravity(delta)
			apply_acceleration()
		STATES.JUMP:
			pass

func apply_acceleration():
	velocity.x = move_toward(velocity.x, max_speed * input_vector.x, acceleration)

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, friction)

func apply_gravity(delta):
	velocity.y += gravity * delta

func jump():
	velocity.y -= jump_strength

func set_part_positions():
	Head.global_position = HeadPos.global_position
	LArm.global_position = LArmPos.global_position
	RArm.global_position = RArmPos.global_position
	LLeg.global_position = LLegPos.global_position
	RLeg.global_position = RLegPos.global_position

func set_parts(PartArray: Array):
	Head.part_name = PartArray[0]
	Torso.part_name = PartArray[1]
	LArm.part_name = PartArray[2]
	RArm.part_name = PartArray[3]
	LLeg.part_name = PartArray[4]
	RLeg.part_name = PartArray[5]
