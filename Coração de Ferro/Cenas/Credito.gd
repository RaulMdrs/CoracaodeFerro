extends Button

export (NodePath) var animacao

onready var animacao2 = get_node(animacao)

func _on_Credito_pressed():
	animacao2.play("AnimacaoDescida")
