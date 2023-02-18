extends Area2D
class_name PartSlot

@export var Part: whatpart
@onready var LOADPART: PackedScene = preload("res://Scenes/Bodypart/BodyPart.tscn")

enum whatpart {HEAD, TORSO, LARM, RARM, LLEG, RLEG}

var CurrentPart: String
var IsEmpty: bool = true
var IsMoveable: bool = true

func _ready():
	if !CurrentPart.is_empty():
		IsEmpty = false
	else:
		IsEmpty = true
	
	if !IsEmpty:
		initializie_part(CurrentPart)

func initializie_part(WhatPart):
	if !CurrentPart.is_empty():
		IsEmpty = false
	else:
		IsEmpty = true
	
	if !IsEmpty:
		CurrentPart = WhatPart
		var loadedpart = LOADPART.instantiate()
		loadedpart.PartName = CurrentPart
		add_child(loadedpart)
		loadedpart.global_position = global_position
		loadedpart.set_part_stats()

func _process(_delta):
	pass
