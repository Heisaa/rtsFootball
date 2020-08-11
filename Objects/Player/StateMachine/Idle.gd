extends State

class_name IdleState


func _ready():
	pass # Replace with function body.


func set_target(pos: Vector3):
	persistent_state.target = Vector3(pos.x, target.y, pos.z)
	
	if target.distance_to(global_transform.origin) < 0.2:
		change_state.call_func("run")
