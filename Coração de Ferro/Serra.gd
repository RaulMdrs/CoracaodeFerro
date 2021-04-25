extends RigidBody2D

export (NodePath) var sprite
onready var sprite2 = get_node(sprite)

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	print("bati punheta")
	
	if body.name == "Player":
		get_tree().change_scene("res://Fase_1.tscn")
	
func _physics_process(delta):
	sprite2.set_rotation_degrees(50)
