#class_name Tile
extends Control
var fluid: Fluid = null  # Store fluid if it's a pipe
var item: Item  # Type of tile ("pipe", "machine", etc.)
var adjacent: Dictionary
var send_directions = []
@export var pipe_mod: AttributeTransform
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
		
func set_item_type(type: String, item: Item):
	if get_item_of_type(type) == null: pass
	elif get_item_of_type(type) == self:
		item.set_global_position(global_position)
	else:
		get_item_of_type(type).queue_free()
	item.reparent($ItemContainer)
	item.home_field = self

func get_item_of_type(type:String):
	var childsoftype = $ItemContainer.get_children().filter(func istype(titem: Node): if "type" in titem: return titem.type == type else: return false)
	if childsoftype.size()>1: print("Multiple items of same type in tile: Items "+childsoftype+" of type '"+type+"' found in "+self)
	if childsoftype.size()==0: return null
	return childsoftype[0]

func receive_fluid(fromdir:String, newfluid: Fluid):
	if not fluid:
		var pipe = get_item_of_type("pipe")
		for dir in pipe.dirs_pointed: if dir != fromdir: send_directions.append(dir)
		fluid=newfluid
		if get_item_of_type("machine"):
			var machine = get_item_of_type("machine")
			if machine.dirs_pointed[0] in send_directions:
				fluid = machine.input(fluid)
			else:
				get_parent().sim_fail("FluidInWrongEndOfMachine")
		for effect in fluid.effects:
			effect = pipe_mod.transform(effect)
