extends AudioStreamPlayer2D

var vol

func _ready():
	vol = volume_db

func _physics_process(delta):

	if Globals.som:
		volume_db = vol
	else:
		volume_db = -8000
