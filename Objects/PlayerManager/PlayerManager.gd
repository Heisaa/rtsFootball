extends Spatial

const Player = preload("res://Objects/Player/Player.tscn")

const all_players:= []
const selected_players= []

const ray_length:= 1000

onready var camera = get_node("../Camera")
onready var ball = get_node("../Ball")

enum {TEAM_1, TEAM_2}


#################
### Game loop ###
#################
func _ready():
	for i in range(0,5):
		create_player(TEAM_1)
		create_player(TEAM_2)

func _process(_delta):
	for player in all_players:
		#player.set_target(ball.global_transform.origin)
		pass
	
	var m_pos = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("move_command"):
		var ray_result = raycast_from_mouse(m_pos, 1)
		if not ray_result.empty():
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

func create_player(team, pos):
	var player = Player.instance()
	player.team = team
	player.translation = Vector3(2, 0.95, i)
	add_child(player)
	all_players.append(player)

###############
### Signals ###
###############
func player_selected(player):
	if not selected_players.has(player):
		selected_players.append(player)

func player_deselected(player):
	if selected_players.has(player):
		selected_players.erase(player)
