extends Node2D

@onready var name_label: Label = $"Name Label"
@onready var description_label: Label = $"Description label"

var is_visible: bool = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_visible:
		modulate.a = 1
	else:
		modulate.a = 0


func _on_button_mouse_entered():
	is_visible = true


func _on_button_mouse_exited():
	is_visible = false
