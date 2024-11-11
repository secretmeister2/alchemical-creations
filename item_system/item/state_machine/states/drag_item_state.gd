extends ItemState


func _enter():
	item.color_rect.color = Color.BLUE
	item.label.text = "DRAG"
	
	item.index = item.get_index()
	
	var canvas_layer := get_tree().get_first_node_in_group("fields")
	if canvas_layer:
		item.reparent(canvas_layer)


func on_input(event: InputEvent):
	var mouse_motion := event is InputEventMouseMotion
	var confirm = event.is_action_released("mouse_left")
	
	if mouse_motion:
		item.global_position = item.get_global_mouse_position() - item.pivot_offset
	
	if confirm:
		get_viewport().set_input_as_handled()
		transitioned.emit("Release")
