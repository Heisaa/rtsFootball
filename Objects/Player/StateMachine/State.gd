extends Node

class_name State

var change_state
var persistent_state
#var velocity = 0

func _physics_process(_delta):
	persistent_state.move_and_slide(persistent_state.velocity, Vector3.UP)

func setup(change_state_arg, persistent_state_arg):
	self.change_state = change_state_arg
	self.persistent_state = persistent_state_arg

func set_target(_pos: Vector3):
	pass
