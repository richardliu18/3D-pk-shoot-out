extends RigidBody3D


	
var spin_force = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var magnus_force = angular_velocity.cross(linear_velocity) * 0.05
	apply_central_force(magnus_force)
	
func interact(direction) -> void:
	pass
	#direction = direction.normalized()
	#apply_central_impulse(direction *15 + Vector3.UP * 8)

func kick(direction: Vector3, power: float, spin: float):

	direction = direction.normalized()

	# launch the ball
	apply_central_impulse(direction * power)

	# apply spin
	angular_velocity = Vector3.UP * spin
