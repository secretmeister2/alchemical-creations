extends Item
var timer = 0
var reagent: Dictionary

func input(fluid: Fluid):
	var mix_dict = reagent["mixer"]
	var to_apply = []
	if reagent["way_effects"] == "list":
		for effect in fluid.effects: 
			if effect in reagent["effect_list"]:
				to_apply.append(effect)
	#elif reagent["way_effects"] == "":
	fluid.modify_effects(mix_dict["attribute"], mix_dict["amount"], to_apply)
