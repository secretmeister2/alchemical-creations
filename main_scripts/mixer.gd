extends Item
var reagent: Reagent

func input(fluid: Fluid):
	fluid.modify(reagent.effects[name])
