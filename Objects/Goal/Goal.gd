extends StaticBody

var team
onready var stadium = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_GoalDetection_body_entered(body):
	if body == stadium.ball:
		print("goal on " + str(team))
		stadium.ball

func set_team(team_arg):
	team = team_arg
