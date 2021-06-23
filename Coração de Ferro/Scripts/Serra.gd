extends RigidBody2D

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	
	if body.name == "Player":
		body.Morrer()
		#get_tree().reload_current_scene()
	

func _on_AnimationRotao_ready():
	get_node(get_child(3).get_path()).play("Rotation")
	
