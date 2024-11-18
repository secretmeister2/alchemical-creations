extends ItemState


func _enter():
	item.color_rect.color = Color.DARK_VIOLET
	item.label.text = "Release"
	if item.in_supply:
		var replaceitem = item.duplicate()
		item.get_parent().add_child(replaceitem)
		item.in_supply=false
	#When a card is released, it checks where it is at the time of release.
	var field_areas = item.drop_point_detector.get_overlapping_areas()

	if field_areas.is_empty():
		#item.home_field.return_item_starting_position(item)
		item.queue_free()
	elif field_areas[0].get_parent() == item.home_field:
		item.home_field.set_item_type(item.type, item)
	else:
		field_areas[0].get_parent().set_item_type(item.type, item)
	transitioned.emit("idle")
	
