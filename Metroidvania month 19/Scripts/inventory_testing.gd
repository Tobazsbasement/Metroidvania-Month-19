extends Node2D

@onready var HeadSlot_1 = $"Inventory/Head Slot"
@onready var LArmSlot_2 = $"Inventory2/L Arm Slot"
@onready var Inventory = $Inventory

func _ready():
	HeadSlot_1.CurrentPart = "Basic Head"
	HeadSlot_1.initializie_part(HeadSlot_1.CurrentPart)
func _process(_delta):
	pass
