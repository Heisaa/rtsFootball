extends Spatial

var selected_players =[]

const ray_length = 1000

onready var camera = get_node("../Camera")


#################
### Game loop ###
#################
func _ready():
	pass

func _process(_delta):
	var m_pos = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("move_command"):
		var ray_result = raycast_from_mouse(m_pos, 1)
		
		for player in selected_players:
			player.set_target(ray_result.position)

###############
### Utility ###
###############
func raycast_from_mouse(m_pos, collision_mask):
	var ray_start = camera.project_ray_origin(m_pos)
	var ray_end = ray_start + camera.project_ray_normal(m_pos) * ray_length
	var space_state = get_world().direct_space_state
	return space_state.intersect_ray(ray_start, ray_end, [], collision_mask)

###############
### Signals ###
###############
func player_selected(player):
	if not selected_players.has(player):
		selected_players.append(player)

func player_deselected(player):
	if selected_players.has(player):
		selected_players.erase(player)
