extends KinematicBody

var selected = false
var velocity = Vector3(0,0,0)
var target = Vector3()

onready var outline = $MeshInstance/Outline
onready var player_manager = get_node("../PlayerManager")

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
	target = Vector3(pos.x, target.y, pos.z) 

#################
### Game loop ###
#################
func _ready():
	connect("was_selected", player_manager, "player_selected")
	connect("was_deselected", player_manager, "player_deselected")
	
	target = global_transform.origin


func _physics_process(_delta):
	# Move player
	if target.distance_to(global_transform.origin) > 0.2:
		# Rotate
		var angle = atan2(velocity.x, velocity.z)
		var char_rot = get_rotation()
		char_rot.y = angle
		set_rotation(char_rot)
		# Move
		var move_vec = target - global_transform.origin
		velocity = move_vec.normalized() * MOVE_SPEED
		move_and_slide(velocity, Vector3(0, 1, 0))
	else:
		target = global_transform.origin


###############
### Signals ###
###############
func _on_Player_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_LEFT:
				set_selected(not selected)
