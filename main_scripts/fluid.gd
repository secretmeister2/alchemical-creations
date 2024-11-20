class_name Fluid
extends Resource

var color: Color
var viscosity: float
var effects: Array[PotionEffect]
var flow_speed: float  # The speed of the fluid flowing through the pipes
var pressure: float
func _init(color: Color, viscosity: float):
	self.color = color
	self.viscosity = viscosity
	self.effects = []
	self.flow_speed = 0  # Default flow speed
	self.pressure=0

func get_pos_or_neg_effects(pos: bool) -> Array:
	var out_names = []
	for effect in effects:
		if effect["positive"] == pos:
			out_names.append(effect)
	return out_names

func modify_effects(attribute: String, amount:float, effects_to_apply: Array, additive: bool):
	for effect in effects:
		if effect in effects_to_apply:
			if additive:
				effect[attribute]+=amount
			else: effect[attribute]=effect[attribute]*amount
