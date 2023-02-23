extends Node2D

@onready var player:Player = $Player
@onready var UI:CanvasLayer = $UI

func _ready():
	UI.initialize_player_inventory()
	player.set_parts([UI.PlayerInventory.Inventory.HeadSlot, UI.PlayerInventory.Inventory.TorsoSlot, UI.PlayerInventory.Inventory.LArmSlot, UI.PlayerInventory.Inventory.RArmSlot, UI.PlayerInventory.Inventory.LLegSlot, UI.PlayerInventory.Inventory.RLegSlot])

func _process(delta):
	pass
