extends Resource
class_name Reagent
##Name of reagent
@export var name:String
##Sprite for reagent to use
@export var sprite:CompressedTexture2D
##A dictionary matching machine names to lists of effects to apply
@export var effects:Dictionary[String,EffectList]
