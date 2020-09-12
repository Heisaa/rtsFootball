extends Node

class_name State

var change_state
var persistent_state

func _physics_process(_delta):
	print(persistent_state)
	persistent_state.move_and_slide(persistent_state.velocity, Vector2.UP)

func setup(change_state, persistent_state):
	print("hej")
	self.change_state = change_state
	self.persistent_state = persistent_state

func set_target(pos: Vector3):
	pass
