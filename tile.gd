#class_name Tile
extends Control
var fluid: Fluid = null  # Store fluid if it's a pipe
var item: Item  # Type of tile ("pipe", "machine", etc.)
var adjacent: Dictionary

func _init():
	self.adjacent = {
		"top": null,
		"right": null,
		"bottom": null,
		"left": null
	}

func set_adjacent_direction(direction: String, tile: Control):
	adjacent[direction] = tile

func _ready():
	if get_parent().get_child_count() > 1:
		var lefttile = get_parent().get_children()[get_index()-1]
		adjacent["left"]= lefttile
		lefttile.adjacent["right"]=self
	if get_parent().get_parent().get_index() > 1:
		var uprow = get_parent().get_parent().get_children()[get_parent().get_index()-1]
		var uptile = uprow.get_children()[get_index()]
		adjacent["up"]= uptile
		uptile.adjacent["down"]=self

func flow(fluid: Fluid):
	# Handle fluid flow through the tile (this could depend on tile type, speed, etc.)
	if fluid:
		# Simulate fluid movement
		if item.type == "pipe":
			# Move fluid through the pipe, based on viscosity and other factors
			# For now, just pass the fluid to an adjacent tile
			for direction in adjacent.keys():
				var next_tile = adjacent[direction]
				if next_tile and next_tile.type == "pipe":
					# Pass fluid to adjacent pipe (this is a very simplified flow)
					next_tile.receive_fluid(fluid)

func receive_fluid(fluid: Fluid):
	if item.type == "pipe":
		self.fluid = fluid

func set_item_type(type: String, item: Item):
	var childsoftype=$ItemContainer.get_children().filter(func istype(titem: Node): if "type" in titem: return titem.type == type else: return false)
	if not childsoftype.is_empty():
		if not $ItemContainer.has_node(item.get_path()):
			childsoftype[0].queue_free()
		else:
			item.set_global_position(global_position)

		
	item.reparent($ItemContainer)
	item.home_field = self
