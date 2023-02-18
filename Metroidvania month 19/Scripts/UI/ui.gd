extends CanvasLayer

@onready var PlayerInventory: Node2D = $PlayerInventory

var is_showing: bool = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_showing:
		PlayerInventory.visible = true
		for i in PlayerInventory.get_children():
			if i is PartSlot:
				i.IsMoveable = true
	else:
		PlayerInventory.visible = false
		for i in PlayerInventory.get_children():
			if i is PartSlot:
				i.IsMoveable = false
	
	if Input.is_action_just_pressed("Interract"):
		is_showing = !is_showing
		PlayerInventory.save_inventory()
		PlayerInventory.load_inventory()

func initialize_player_inventory():
	PlayerInventory.load_slot()

func save_player_inventory():
	PlayerInventory.save_slot()
	
