extends Node

class_name State

var change_state
var persistent_state
var velocity = 0

func _physics_process(_delta):
	persistent_state.move_and_slide(persistent_state.velocity, Vector3.UP)

func setup(change_state, persistent_state):
	self.change_state = change_state
	self.persistent_state = persistent_state

func set_target(pos: Vector3):
	pass
