extends Node2D

@export var Inventory: InventorySaver

@onready var HeadSlot = $"Head Slot"
@onready var TorsoSlot = $"Torso Slot"
@onready var LArmSlot = $"L Arm Slot"
@onready var RArmSlot = $"R Arm Slot"
@onready var LLegSlot = $"L Leg Slot"
@onready var RLegSlot = $"R Leg Slot"
@onready var Mouse_follow = $"Mouse Follow"

var save_path: String = "user://Inventory.dat"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("LeftClick"):
		pass
	Mouse_follow.global_position = get_global_mouse_position()

func load_slot():
	Inventory.HeadSlot = "Bull Head"
	Inventory.TorsoSlot = "Bull Torso"
	Inventory.LArmSlot = "Bull Left Arm"
	Inventory.RArmSlot = "Bull Right Arm"
	Inventory.LLegSlot = "Bull Left Leg"
	Inventory.RLegSlot = "Bull Right Leg"
	
	HeadSlot.CurrentPart = Inventory.HeadSlot
	TorsoSlot.CurrentPart = Inventory.TorsoSlot
	LArmSlot.CurrentPart = Inventory.LArmSlot
	RArmSlot.CurrentPart = Inventory.RArmSlot
	LLegSlot.CurrentPart = Inventory.LLegSlot
	RLegSlot.CurrentPart = Inventory.RLegSlot
	HeadSlot.initializie_part(HeadSlot.CurrentPart)
	TorsoSlot.initializie_part(Inventory.TorsoSlot)
	LArmSlot.initializie_part(Inventory.LArmSlot)
	RArmSlot.initializie_part(Inventory.RArmSlot)
	LLegSlot.initializie_part(Inventory.LLegSlot)
	RLegSlot.initializie_part(Inventory.RLegSlot)

func save_slot():
	Inventory.HeadSlot = HeadSlot.CurrentPart
	Inventory.TorsoSlot = TorsoSlot.CurrentPart
	Inventory.LArmSlot = LArmSlot.CurrentPart
	Inventory.RArmSlot = RArmSlot.CurrentPart
	Inventory.LLegSlot = LLegSlot.CurrentPart
	Inventory.RLegSlot = RLegSlot.CurrentPart


