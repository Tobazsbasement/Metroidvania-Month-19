extends Area2D
class_name BodyPart

@onready var Sprite: Sprite2D = $Sprite2D
@export var bodypart: Part

enum Part {HEAD, TORSO, LARM, RARM, LLEG, RLEG}

var PartName: String = ""
var PreviousSlot: Area2D
var TargetSlot: Area2D
var IsMouseOver:bool = false
var Stats: Array = [0, 0, 0, 0, "", Texture]

signal PartReleased

func _ready():
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	set_part_stats()
	PreviousSlot = get_parent()
	PartReleased.connect(drop)
	set_part()

func _process(_delta):
	if IsMouseOver and get_parent().IsMoveable:
		global_position = get_global_mouse_position()
	else:
		global_position = get_parent().global_position

func set_part_stats():
	Stats = BodyPartDatabase.parts[PartName]
	Sprite.texture = Stats[5]

func drop():
	if TargetSlot != null:
		if TargetSlot.Part == bodypart:
			PreviousSlot.remove_child(self)
			TargetSlot.add_child(self)
	else:
		PreviousSlot.remove_child(self)
		PreviousSlot.add_child(self)
	
	PreviousSlot = TargetSlot

func _on_area_entered(area):
	if area is PartSlot:
		TargetSlot = area

func set_part():
	match PartName:
		"Basic Head":
			bodypart = Part.HEAD
		"Basic Torso":
			bodypart = Part.TORSO
		"Basic Left Arm":
			bodypart = Part.LARM
		"Basic Right Arm":
			bodypart = Part.RARM
		"Basic Left Leg":
			bodypart = Part.LLEG
		"Basic Right Leg":
			bodypart = Part.RLEG

func _on_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("LeftClick"):
		IsMouseOver = true
		PreviousSlot = get_parent()
	elif Input.is_action_just_released("LeftClick"):
		IsMouseOver = false
		emit_signal("PartReleased")
