extends State

class_name RunState

const MOVE_SPEED = 300
func set_target(pos: Vector3):
	persistent_state.target = Vector3(pos.x, persistent_state.target.y, pos.z) 

func _physics_process(_delta):
	# Move player
	if persistent_state.target.distance_to(persistent_state.global_transform.origin) > persistent_state.STOP_DISTANCE:
		# Rotate
		var angle = atan2(persistent_state.velocity.x, persistent_state.velocity.z)
		var char_rot = persistent_state.get_rotation()
		char_rot.y = angle
		persistent_state.set_rotation(char_rot)
		# Move
		var move_vec = persistent_state.target - persistent_state.global_transform.origin
		persistent_state.velocity = move_vec.normalized() * MOVE_SPEED * _delta
	else:
		change_state.call_func("idle")
