extends Spatial


onready var ball = get_node("../Ball")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Goal1.set_team(1)
	$Goal2.set_team(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
