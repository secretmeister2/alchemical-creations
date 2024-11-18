class_name Fluid
extends Script
var color: Color
var viscosity: float
var effects: Array  # Effects like "heat", "freeze", etc.
var flow_speed: float  # The speed of the fluid flowing through the pipes

func _init(color: Color, viscosity: float):
	self.color = color
	self.viscosity = viscosity
	self.effects = []
	self.flow_speed = 1.0  # Default flow speed

func add_effect(effect: String, intensity: float, duration: float):
	effects.append({
		"effect": effect,
		"intensity": intensity,
		"duration": duration
	})
