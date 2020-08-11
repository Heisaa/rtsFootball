extends State

class_name RunStaterun

const MOVE_SPEED = 3

func set_target(pos: Vector3):
	persistent_state.target = Vector3(pos.x, target.y, pos.z) 

func _physics_process(_delta):
# Move player
if persistent_state.target.distance_to(global_transform.origin) > 0.2:
	# Rotate
	var angle = atan2(velocity.x, velocity.z)
	var char_rot = get_rotation()
	char_rot.y = angle
	persistent_state.set_rotation(char_rot)
	# Move
	var move_vec = target - global_transform.origin
	persistent_state.velocity = move_vec.normalized() * MOVE_SPEED
else:
	change_state.call_func("idle")
