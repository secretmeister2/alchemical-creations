class_name Item
extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var label: Label = $Label
@onready var name_label: Label = %NameLabel
@onready var state_machine: ItemStateMachine = $ItemStateMachine
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var home_field
@export var in_supply = false
@export var type: String = "none"
@export var item_name: String = "none"
var index: int = 0

#func _ready():
	#print(get_children())
	

func _input(event):
	state_machine.on_input(event)


func _on_gui_input(event):
	state_machine.on_gui_input(event)


func _on_mouse_entered():
	state_machine.on_mouse_entered()


func _on_mouse_exited():
	state_machine.on_mouse_exited()
