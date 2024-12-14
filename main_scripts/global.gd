extends Node
enum PotionTypes{
	Health,
	Regen,
	Poison,
	NightVision,
	Blindness,
	Frost,
	FrostRes,
	Lightning,
	LightningRes,
	Fire,
	FireRes,
	Hellfire,
	Plasma,
	TrueCold
}
enum ItemTypes{
	Machine, ## A machine that applies some effect to the fluid
	Pipe, ## A pipe that controls the flow of fluid
	Logic ## A logic block that interacts with the logic system, allowing for complex control
}
