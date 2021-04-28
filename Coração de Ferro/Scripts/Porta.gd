extends StaticBody2D

export (NodePath) var animacao

onready var animacao2 = get_node(animacao)

func _on_botao_body_shape_entered(body_id, body, body_shape, area_shape):
	if (body.name == "Caixa"):
		animacao2.play("movimento")
