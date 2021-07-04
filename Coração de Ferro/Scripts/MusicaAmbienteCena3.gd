extends AudioStreamPlayer


func _ready():
	if Globals.som == false:
		stop()
	else:
		play()


func _process(delta):
	if Globals.som == false:
		stop()
	else:
		play()
