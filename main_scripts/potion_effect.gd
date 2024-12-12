extends Resource
class_name PotionEffect
##Name of effect
@export var type:Global.PotionTypes
##Duration and intensity of effect
@export var attributes={"duration":1.0, "intensity":1.0}
func _init(name, duration, intensity):
	self.name=name
	self.attributes[duration]=duration
	self.attributes[intensity]=intensity
