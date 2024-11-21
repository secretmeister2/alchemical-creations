extends Resource
class_name EffectList
##The transforms to apply to the poison potion effect
@export var poison: Array[AttributeTransform]
##The transforms to apply to the health potion effect
@export var health: Array[AttributeTransform]
##The transforms to apply to the flammable potion effect
@export var flammable: Array[AttributeTransform]
##The transforms to apply to the vision potion effect
@export var vision: Array[AttributeTransform]
##The color to blend with
@export var color:Color
##The number to multiply viscosity by
@export var viscosity_mult:float
##The effects to add to the fluid
##Added PRIOR to transforms
@export var add_effects:Array[PotionEffect]
##The names of effects to remove from the fluid
##Removed PRIOR to transforms
@export var remove_effects:Array[String]
