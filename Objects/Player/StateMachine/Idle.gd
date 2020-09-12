extends State

class_name IdleState

func _ready():
	pass # Replace with function body.


func set_target(pos: Vector3):
	persistent_state.target = Vector3(pos.x, persistent_state.target.y, pos.z)
	
	if persistent_state.target.distance_to(persistent_state.global_transform.origin) < 0.2:
		change_state.call_func("run")
