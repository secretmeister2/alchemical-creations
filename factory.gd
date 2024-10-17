extends Node2D

var particle = preload("res://alchemy_particle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	add()
	add()
	add()


func _input(event: InputEvent) -> void:
	if not event is InputEventMouseMotion:
		var particles = particle.instantiate()
		add_child(particles)
		particles.reset_physics_interpolation()
		particles.set_global_position(Vector2(100, 000))
func add() -> void:
	var particles = particle.instantiate()
	add_child(particles)
	particles.reset_physics_interpolation()
	particles.set_global_position(Vector2(100, 000))
