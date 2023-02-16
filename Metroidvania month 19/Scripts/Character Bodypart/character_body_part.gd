extends Node2D
class_name CharacterBodypart

@export var partslot: PARTSLOTS
@export var stats: Resource

enum PARTSLOTS {
	HEAD,
	TORSO,
	LARM,
	RARM,
	LLEG,
	RLEG
}

var part_name = ""

func _ready():
	set_part()

func _process(delta):
	pass

func set_part():
	match part_name:
		"Basic Head":
			partslot = PARTSLOTS.HEAD
		"Basic Torso":
			partslot = PARTSLOTS.TORSO
		"Basic Left Arm":
			partslot = PARTSLOTS.LARM
		"Basic Right Arm":
			partslot = PARTSLOTS.RARM
		"Basic Left Leg":
			partslot = PARTSLOTS.LLEG
		"Basic Right Leg":
			partslot = PARTSLOTS.RLEG
