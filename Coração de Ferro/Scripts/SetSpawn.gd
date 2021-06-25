extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.checkpointPosition == Vector2(0,0):
		Globals.checkpointPosition = position
