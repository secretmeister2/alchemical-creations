extends Resource
class_name ReagentClass
## A dict mapping machine names to effects
@export var effects:Dictionary[String,EffectList]
## A dict mapping synergies with other classes to an effect list
@export var synergies:Dictionary[ReagentClass,EffectList]
