extends Node2D
class_name CharacterBodypart

@onready var Sprite = $Sprite2D

@export var partslot: PARTSLOTS

var Stats:Array = [0, 0, 0, ""]

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
	if part_name.contains("Head"):
		partslot = PARTSLOTS.HEAD
	elif part_name.contains("Torso"):
		partslot = PARTSLOTS.TORSO
	elif part_name.contains("Left Arm"):
		partslot = PARTSLOTS.LARM
	elif part_name.contains("Right Arm"):
		partslot = PARTSLOTS.RARM
	elif part_name.contains("Left Leg"):
		partslot = PARTSLOTS.LLEG
	else:
		partslot = PARTSLOTS.RLEG
	
	set_stats()

func set_stats():
	if !part_name.is_empty():
		print(part_name)
		Stats = BodyPartDatabase.parts[part_name]
