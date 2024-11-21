extends Resource
class_name AttributeTransform
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
func transform(effect:PotionEffect)-> PotionEffect:
	match transform_type:
			effect_class.ADDITIVE: effect.attributes[affected_attribute]+=value
			effect_class.MULTIPLICATIVE: effect.attributes[affected_attribute]*=value
	return effect
