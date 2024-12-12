extends Resource
class_name Reagent
##Name of reagent
@export var name:String
##Sprite for reagent to use
@export var sprite:CompressedTexture2D
##An array of classes that the reagent has
@export var classes:Array[ReagentClass]
