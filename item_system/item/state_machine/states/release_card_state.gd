extends ItemState


func _enter():
	item.color_rect.color = Color.DARK_VIOLET
	item.label.text = "Release"

	#When a card is released, it checks where it is at the time of release.
	var field_areas = item.drop_point_detector.get_overlapping_areas()

	if field_areas.is_empty():
		item.home_field.return_item_starting_position(item)
	elif field_areas[0].get_parent() == item.home_field:
		item.home_field.item_reposition(item)
	else:
		var new_field: Field = field_areas[0].get_parent()
		new_field.set_new_item(item)

	transitioned.emit("idle")
