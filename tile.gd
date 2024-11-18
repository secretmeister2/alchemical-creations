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

func set_item(item: Item):
	for child in $ItemContainer.get_children(): if is_instance_of(child, Item) && child != item: child.queue_free()
	item.reparent($ItemContainer)
	item.home_field = self
	item.set_adjacent_direction()
