extends Resource
class_name Reagent
##Name of reagent
@export var name:String
##Sprite for reagent to use
@export var sprite:CompressedTexture2D
##Dict of effects to apply to specified potion effects when used in a mixer
@export var mixer_effects:Array[AttributeTransform]
##Dict of special modifications to apply
@export var mixer_fluid_mods:Array[EffectTransform]
##Multiplier of fluids viscosity
@export var viscos_mult:float
##Color to lerp with
@export var color:Color


func fluid_modify(machinetype: String, fluid:Fluid) -> Fluid:
	for transform in get(machinetype+"_effects")+get(machinetype+"_fluid_mods"):
		if transform.effect_on in fluid.effects:
				transform.transform(fluid)
	fluid.color =fluid.color.lerp(color, 0.3)
	fluid.viscoity=fluid.viscosity*viscos_mult
	return fluid
