extends Area2D
class_name BodyPart

@onready var Sprite: Sprite2D = $Sprite2D
@onready var part_description = $"Part Description"
@export var bodypart: Part

enum Part {HEAD, TORSO, LARM, RARM, LLEG, RLEG}

var PartName: String = ""
var PreviousSlot: Area2D
var TargetSlot: Area2D
var IsMouseOver:bool = false
var Stats: Array = [0, 0, 0, ""]

signal PartReleased

func _ready():
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	set_part_stats()
	PreviousSlot = get_parent()
	PartReleased.connect(drop)
	set_part()

func _process(_delta):
	pass

func set_part_stats():
	Stats = BodyPartDatabase.parts[PartName]
	part_description.name_label.text = PartName
	part_description.description_label.text = Stats[3]


func drop():
	var Mouse_follow = get_parent()
	
	if TargetSlot != null:
		Mouse_follow.remove_child(self)
		if TargetSlot.Part == bodypart:
			TargetSlot.add_child(self)
		else:
			PreviousSlot.add_child(self)
	
	else:
		Mouse_follow.remove_child(self)
		PreviousSlot.add_child(self)
	
	PreviousSlot = TargetSlot

func _on_area_entered(area):
	if area is PartSlot:
		TargetSlot = area

func set_part():
	if PartName.contains("Head"):
		bodypart = Part.HEAD
	elif PartName.contains("Torso"):
		bodypart = Part.TORSO
	elif PartName.contains("Left Arm"):
		bodypart = Part.LARM
	elif PartName.contains("Right Arm"):
		bodypart = Part.RARM
	elif PartName.contains("Left Leg"):
		bodypart = Part.LLEG
	else:
		bodypart = Part.RLEG

func _on_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_pressed("LeftClick"):
		part_description.is_visible = false
		IsMouseOver = true
		if get_parent() != null:
			if get_parent() == PartSlot:
				PreviousSlot = get_parent()
			
			var Mousefollow = get_parent().get_parent().Mouse_follow
			
			if Mousefollow.get_child_count() == 0:
				PreviousSlot.remove_child(self)
				Mousefollow.add_child(self)
				
	
	elif Input.is_action_just_released("LeftClick"):
		IsMouseOver = false
		emit_signal("PartReleased")
		
