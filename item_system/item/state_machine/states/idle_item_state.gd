extends ItemState


func _enter():
	item.color_rect.color = Color.WEB_GREEN
	item.label.text = "Idle"
	item.pivot_offset = Vector2.ZERO


func on_mouse_entered():
	transitioned.emit("hover")
