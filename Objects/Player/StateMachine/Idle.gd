extends State

class_name IdleState

func _ready():
	persistent_state.velocity = Vector3(0,0,0)


func set_target(pos: Vector3):
	print("target set in idle")
	persistent_state.target = Vector3(pos.x, persistent_state.target.y, pos.z)
	
	print(persistent_state.target.distance_to(persistent_state.global_transform.origin))
	if persistent_state.target.distance_to(persistent_state.global_transform.origin) > persistent_state.STOP_DISTANCE:
		print("changeing to run")
		change_state.call_func("run")
