extends Node3D

@export var speed : float = 3.0
@export var distance : float = 4.0

var direction := 1

@export var max_distance : float = 4.0
@export var ball : Node3D

var start_pos : Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = global_position  # Replace with function body.


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):

	if ball == null:
		return

	# Only react if ball is near goal
	if ball.global_position.z > global_position.z + 8:
		return

	var target_x = ball.global_position.x

	target_x = clamp(
		target_x,
		start_pos.x - max_distance,
		start_pos.x + max_distance
	)

	global_position.x = move_toward(
		global_position.x,
		target_x,
		speed * delta
	)
