extends Resource
class_name AttributeTransform
##The potion effect name to operate on
@export var effect_on:String
enum effect_class{
	ADDITIVE, ##The effect will add a constant value to an attribute
	MULTIPLICATIVE, ##The effect will multiply the attribute by a value
	}
##The type of transform, whether it adds to or multiplies the effect
@export var transform_type:effect_class
##The value to be used by the transform
@export var value:float
##Which attribute to affect
##(Duration, intensity)
@export var affected_attribute:String

##Applies the definied transform to a fluid
func transform(fluid:Fluid)-> Fluid:
	for effect in fluid.effects:
		if effect.name == effect_on:
			var attribute = effect.get(affected_attribute)
			match transform_type:
				effect_class.ADDITIVE: attribute=attribute+value
				effect_class.MULTIPLICATIVE: attribute=attribute*value
	return fluid
