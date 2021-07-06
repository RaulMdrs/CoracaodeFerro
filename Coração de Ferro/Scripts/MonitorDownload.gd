extends AnimatedSprite

var playerEntered = false

func _ready():
	pass # Replace with function body.


func _input(event):
	if (event.is_action_pressed("selecionar") && playerEntered):
		$Pc_SemNada.visible = false
		playing = true




func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		$Label.set_percent_visible(1);
		playerEntered = true


func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		$Label.set_percent_visible(0);
		playerEntered = false


func _on_MonitorDownload_animation_finished():
	Globals.podeAtirar = true
	$Label2.set_percent_visible(1);
	$Area2D.queue_free()
