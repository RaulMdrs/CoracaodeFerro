extends Sprite

export (NodePath) var animacao

onready var animacao2 = get_node(animacao)

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		animacao2.play("animacao texto")

func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		animacao2.play("sumir texto")
