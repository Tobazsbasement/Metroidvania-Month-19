extends Node2D

@export var Save: Resource

@onready var HeadSlot = $"Head Slot"
@onready var TorsoSlot = $"Torso Slot"
@onready var LArmSlot = $"L Arm Slot"
@onready var RArmSlot = $"R Arm Slot"
@onready var LLegSlot = $"L Leg Slot"
@onready var RLegSlot = $"R Leg Slot"

@onready var SaveData: Dictionary = {
	"Head Slot": "Basic Head",
	"Torso Slot": "Basic Torso",
	"LArm": "Basic Left Arm",
	"RArm": "Basic Right Arm",
	"LLeg": " Basic Left Leg",
	"RLeg": " Basic Right Leg"
}

var save_path: String = "user://InventorySave.dat"

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("LeftClick"):
		save_slot()

func load_slot():
	HeadSlot.CurrentPart = SaveData["Head Slot"]
	HeadSlot.initializie_part(HeadSlot.CurrentPart)
	TorsoSlot.initializie_part(Save.TorsoSlot)
	LArmSlot.initializie_part(Save.LArmSlot)
	RArmSlot.initializie_part(Save.RArmSlot)
	LLegSlot.initializie_part(Save.LLegSlot)
	RLegSlot.initializie_part(Save.RLegSlot)

func save_slot():
	SaveData["HeadSlot"] = HeadSlot.CurrentPart


