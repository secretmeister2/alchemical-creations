extends Resource
class_name Reagent
##Name of reagent
@export var name:String
##Sprite for reagent to use
@export var sprite:CompressedTexture2D
##Dict of effects to apply to specified potion effects
@export var mixer_effects:Dictionary[String, Array[EffectTransform]]

func fluid_modify(machinetype: String, fluid:Fluid) -> Fluid:
	for effect in fluid.effects:
		if effect.name in mixer_effects.keys()
	return fluid
