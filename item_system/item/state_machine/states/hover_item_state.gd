extends ItemState


func _enter():
	item.color_rect.color = Color.DARK_ORCHID
	item.label.text = "HOVER"


func on_gui_input(event: InputEvent):
	if event.is_action_pressed("mouse_left"):
		item.pivot_offset = item.get_global_mouse_position() - item.global_position
		transitioned.emit("Click")


func on_mouse_exited():
	transitioned.emit("Idle")
