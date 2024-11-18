class_name Field
extends MarginContainer


@onready var item_drop_area: Area2D = $ItemDropArea
@onready var items_holder: HBoxContainer = $ItemsHolder


func return_item_starting_position(item: Item):
	item.reparent(items_holder)
	items_holder.move_child(item, item.index)


func set_new_item(item: Item):
	item_reposition(item)
	item.home_field = self


func item_reposition(item:Item):
	var field_areas = item.drop_point_detector.get_overlapping_areas()
	var items_areas = item.item_detector.get_overlapping_areas()
	var index: int = 0
	
#	if items_areas.is_empty():
#		print(field_areas.has(item_drop_area_left))
#		if field_areas.has(item_drop_area_right):
#			index = items_holder.get_children().size()
#	elif items_areas.size() == 1:
#		if field_areas.has(item_drop_area_left):
#			index = items_areas[0].get_parent().get_index()
#		else:
#			index = items_areas[0].get_parent().get_index() + 1
#	else:
#		index = items_areas[0].get_parent().get_index()
#		if index > items_areas[1].get_parent().get_index():
#			index = items_areas[1].get_parent().get_index()
#		
#		index += 1
	if items_holder.get_child_count() > 0:
		items_holder.get_child(0).queue_free()
	item.reparent(items_holder)
	#items_holder.move_child(item, index)
