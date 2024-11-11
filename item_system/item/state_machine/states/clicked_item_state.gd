extends ItemState


func _enter():
	item.color_rect.color = Color.ORANGE
	item.label.text = "CLICKED"


func on_input(event):
	if event is InputEventMouseMotion:
		transitioned.emit("Drag")
