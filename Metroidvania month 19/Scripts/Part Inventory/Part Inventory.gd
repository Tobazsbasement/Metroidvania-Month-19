extends Node2D

@export var Inventory: InventorySaver

@onready var HeadSlot = $"Head Slot"
@onready var TorsoSlot = $"Torso Slot"
@onready var LArmSlot = $"L Arm Slot"
@onready var RArmSlot = $"R Arm Slot"
@onready var LLegSlot = $"L Leg Slot"
@onready var RLegSlot = $"R Leg Slot"

var save_path: String = "user://Inventory.tres"

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("LeftClick"):
		save_slot()

func load_slot():
	Inventory.HeadSlot = "Placeholder Head"
	HeadSlot.CurrentPart = Inventory.HeadSlot
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


func save_inventory():
	var save = ResourceSaver.save(Inventory, save_path)
	assert(save == OK)

func load_inventory():
	if ResourceLoader.exists(save_path):
		Inventory = ResourceLoader.load(save_path)
	load_slot()


