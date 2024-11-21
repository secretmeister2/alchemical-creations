@tool
extends Resource
class_name EffectTransform
enum transform_type{
	REPLACEEFFECT, ##The transform will copy the value of an effect, and change it to a different one
	ADDEFFECT,##The transform will add a new effect with default stats
	MODIFYFLUIDPROPERTIES##The transform will modify the properties of the fluid
}
##Effect this modifies (if none, adds a new effect)
@export var effect_on:String=""
##The effect it turns it into
@export var turn_into:String
##Any attribute modifications to apply when transforming
@export var transforms:Array[AttributeTransform]

func transform(fluid:Fluid)->Fluid:
	for effect in fluid.effects:
		if effect.name == effect_on:
			effect.name=turn_into
	if effect_on == "":
		fluid.effects.append(PotionEffect.new(turn_into, 1, 1))
	for transform in transforms:
		transform.transform(fluid)
	return fluid
	
func _get_property_list():
	if Engine.is_editor_hint():
		var ret =[]
		if is_moving_platform:
			# This is how you add a normal variable, like String (TYPE_STRING), int (TYPE_INT)...etc
			ret.append({
			"name": &"moving_speed",
			"type": TYPE_FLOAT,
			"usage": PROPERTY_USAGE_DEFAULT,
			})
			# This is how you add an Array, to define a type it seems that "24/34:Class_Name" is needed in the hint_string, or you will end up with null
			ret.append({
			"name": &"moving_points",
			"type": TYPE_ARRAY,
			"hint": PROPERTY_HINT_TYPE_STRING,
			"hint_string": "24/34:Node3D",
			"usage": PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_STORAGE | PROPERTY_USAGE_SCRIPT_VARIABLE
			})
		return ret
