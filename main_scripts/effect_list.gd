extends Resource
class_name EffectList
##A dict mapping potion effect names to transforms
@export var effects: Dictionary[Global.PotionTypes,AttributeTransform]
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
