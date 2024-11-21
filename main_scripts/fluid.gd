class_name Fluid
extends Resource
##Color of the fluid
@export var color: Color = Color.WHITE
##How viscous the fluid is
@export var viscosity: float = 1
##An array of effects the fluid carries
@export var effects: Array[PotionEffect] = []
##The pressure acting on the fluid
var pressure: float = 0

func modify(effect_list:EffectList):
	##Adds effects
	for effect in effect_list.add_effects:
		if not effect in effects: effects.append(effect)
	##Removes effects
	for effect in effects:
		if effect.name in effect_list.remove_effects:
			effects.erase(effect)
	##Modifies effects
	for effect in effects:
		for transform:AttributeTransform in effect_list.get(effect.name):
			transform.transform(effect)
	##Modifies colors
	color=color.lerp(effect_list.color, 0.25)
	##Modifies viscosity
	viscosity*=effect_list.viscosity_mult
