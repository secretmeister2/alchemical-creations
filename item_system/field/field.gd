class_name Field
extends MarginContainer


@onready var card_drop_area_right: Area2D = $CardDropAreaRight
@onready var card_drop_area_left: Area2D = $CardDropAreaLeft
@onready var cards_holder: HBoxContainer = $CardsHolder


func _ready():
	$Label.text = name
	
	for child in cards_holder.get_children():
		var item := child as Item
		item.home_field = self


func return_item_starting_position(item: Item):
	item.reparent(cards_holder)
	cards_holder.move_child(item, item.index)


func set_new_card(item: Item):
	item_reposition(item)
	item.home_field = self


func item_reposition(item:Item):
	var field_areas = item.drop_point_detector.get_overlapping_areas()
	var cards_areas = item.item_detector.get_overlapping_areas()
	var index: int = 0
	
	if cards_areas.is_empty():
		print(field_areas.has(card_drop_area_left))
		if field_areas.has(card_drop_area_right):
			index = cards_holder.get_children().size()
	elif cards_areas.size() == 1:
		if field_areas.has(card_drop_area_left):
			index = cards_areas[0].get_parent().get_index()
		else:
			index = cards_areas[0].get_parent().get_index() + 1
	else:
		index = cards_areas[0].get_parent().get_index()
		if index > cards_areas[1].get_parent().get_index():
			index = cards_areas[1].get_parent().get_index()
		
		index += 1

	item.reparent(cards_holder)
	cards_holder.move_child(item, index)
