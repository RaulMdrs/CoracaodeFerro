	extends Control

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		get_tree().change_scene("res://Fase_1.tscn")
	
