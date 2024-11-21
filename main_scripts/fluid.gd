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
