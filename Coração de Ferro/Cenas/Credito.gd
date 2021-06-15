extends Button

export (NodePath) var animacao
export (NodePath) var botaoIniciar
export (NodePath) var botaoSair
export (NodePath) var botaoCredito

onready var animacao2 = get_node(animacao)
onready var botaoIniciar2 = get_node(botaoIniciar)
onready var botaoSair2 = get_node(botaoSair)
onready var botaoCredito2 = get_node(botaoCredito)

func _on_Credito_pressed():
	animacao2.play("AnimacaoDescida")
	botaoIniciar2.disabled = true
	botaoSair2.disabled = true
	botaoCredito2.disabled = true
