extends Sprite

export (NodePath) var luz_camera
export (NodePath) var Area2d
export (NodePath) var timerPath

onready var luz_camera_2 = get_node(luz_camera)
onready var area2d_2 = get_node(Area2d)
onready var timerNode = get_node(timerPath)

var ligada = true

func _ready():
	timerNode.set_wait_time(2)
	timerNode.start()
	
func _on_Timer_timeout():
	
	if ligada:
		luz_camera_2.set_indexed("Enabled", false)
		area2d_2.get_child(4).set_indexed("Monitoring", false)
		ligada = false
	else:
		luz_camera_2.set_indexed("Enabled", true)
		area2d_2.set_indexed("Monitoring", true)
		ligada = true
	
	
	timerNode.set_wait_time(2)
	timerNode.start()


