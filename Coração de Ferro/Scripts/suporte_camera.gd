extends Sprite

export (NodePath) var luz_camera
export (NodePath) var Area2d
export (NodePath) var timerPath
export var animar = false 
onready var luz_camera_2 = get_node(luz_camera)
onready var area2d_2 = get_node(Area2d)
onready var timerNode = get_node(timerPath)

var ligada = true

func _ready():
	timerNode.set_wait_time(2)
	timerNode.start()
	
func _on_Timer_timeout():
	
	if ligada == true:
		luz_camera_2.set_enabled(false)
		area2d_2.set_monitoring(false)
		ligada = false
	else:
		if(animar):
			get_child(3).play("MooveCamera") 
		get_child(2).play()
		luz_camera_2.set_enabled(true)
		area2d_2.set_monitoring(true)
		ligada = true
	
	
	timerNode.set_wait_time(2.5)
	timerNode.start()


func _on_area_luz_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		get_tree().reload_current_scene()
