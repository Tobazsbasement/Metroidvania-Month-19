extends Resource
class_name InventorySaver

const SAVE_PATH = "user://InventorySave.tres"

@export var HeadSlot: String = ""
@export var TorsoSlot: String = ""
@export var LArmSlot: String = ""
@export var RArmSlot: String = ""
@export var LLegSlot: String = ""
@export var RLegSlot: String = ""

func save_inventory():
	ResourceSaver.save(self, SAVE_PATH)

func load_inventory():
	ResourceLoader.load(SAVE_PATH)
