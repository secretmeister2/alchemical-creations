extends RigidBody2D
@export var viscosity =1
@export var density = 1
@export var effects = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in $NearDetector.get_overlapping_bodies():
		var vect = body.get_global_position()- self.get_global_position()
		self.apply_central_force(vect*20)
		body.apply_central_force(vect*20)
	if self.global_position.y < 0:
		self.queue_free()
