extends RigidBody3D

@export var magnus_strength := 0.15
@export var air_drag := 0.02

func _physics_process(delta):

	# --- Magnus Effect (curve) ---
	var magnus_force = angular_velocity.cross(linear_velocity) * magnus_strength
	apply_central_force(magnus_force)

	# --- Air resistance (prevents infinite speed) ---
	apply_central_force(-linear_velocity * air_drag)


func kick(direction: Vector3, power: float, spin: float):

	direction = direction.normalized()

	# reset motion (important if reusing ball)
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO

	# --- Launch ---
	apply_central_impulse(direction * power)

	# --- Add spin ---
	# sidespin (curve left/right)
	var side_spin = Vector3.UP * spin
	
	# slight topspin (dip)
	var top_spin = direction.cross(Vector3.UP) * (spin * 0.2)

	angular_velocity = side_spin + top_spin
