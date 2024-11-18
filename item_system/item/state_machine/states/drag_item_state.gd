extends ItemState


func _enter():
	item.color_rect.color = Color.BLUE
	item.label.text = "DRAG"
	
	item.index = item.get_index()

func on_input(event: InputEvent):
	var mouse_motion := event is InputEventMouseMotion
	var confirm = event.is_action_released("mouse_left")
	
	if mouse_motion:
		item.global_position = item.get_global_mouse_position() - item.pivot_offset
	
	if confirm:
		get_viewport().set_input_as_handled()
		transitioned.emit("Release")
