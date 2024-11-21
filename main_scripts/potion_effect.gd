extends Resource
class_name PotionEffect
##Name of effect
@export var name:String
##Duration of effect
@export var duration:float
##Intensity of effect
@export var intenisty:float
func _init(name, duration, intensity):
	self.name=name
	self.duration=duration
	self.intensity=intensity
