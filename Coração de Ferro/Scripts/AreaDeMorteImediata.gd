extends Area2D

func _on_AreaDeMorteImediata_body_entered(body):
	if(body.name == "Player"):
		body.Morrer()
		#get_tree().reload_current_scene()
	
