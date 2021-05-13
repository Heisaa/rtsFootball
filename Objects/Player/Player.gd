extends KinematicBody

class_name Player

const STOP_DISTANCE = 0.05

var selected = false
var velocity = Vector3(0,0,0)
var target = Vector3()

var state
var state_factory

onready var outline = $MeshInstance/Outline
onready var player_manager = get_parent()

signal was_selected
signal was_deselected

func set_selected(value: bool):
	if selected != value:
		selected = value
		outline.visible = value
		if selected:
			emit_signal("was_selected", self)
		else:
			emit_signal("was_deselected", self)

func set_target(pos: Vector3):
	state.set_target(pos)

#################
### Game loop ###
#################
func _ready():
	connect("was_selected", player_manager, "player_selected")
	connect("was_deselected", player_manager, "player_deselected")
	
	target = global_transform.origin
	
	state_factory = StateFactory.new()
	change_state("idle")


###############
### Utility ###
###############
func change_state(new_state_name):
	if is_instance_valid(state):
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), self)
	state.name = "current_state"
	add_child(state)

###############
### Signals ###
###############
func _on_Player_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_LEFT:
				set_selected(not selected)
