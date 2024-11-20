extends Item
var timer = 0
var reagent: Reagent

func input(fluid: Fluid):
	reagent.fluid_modify("mixer", fluid)
