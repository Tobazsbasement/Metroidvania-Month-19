extends Node2D
class_name CharacterBodypart

@onready var Sprite = $Sprite2D

@export var partslot: PARTSLOTS

var Stats:Array = [0, 0, 0, 0, "", Texture]

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

func _process(_delta):
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

func set_stats():
	if !part_name.is_empty():
		print(part_name)
		Stats = BodyPartDatabase.parts[part_name]
		Sprite.texture = Stats[5]
