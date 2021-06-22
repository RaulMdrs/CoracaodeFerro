extends Node2D



func _on_TutorialPulo_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		get_child(0).set_visible_characters(23)


func _on_TutorialPulo_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		get_child(0).set_visible_characters(0)
		


func _on_TutorialAndar_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		get_child(1).set_visible_characters(29)


func _on_TutorialAndar_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		get_child(1).set_visible_characters(0)
