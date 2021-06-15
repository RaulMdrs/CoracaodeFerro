extends Button

export (NodePath) var animacao
export (NodePath) var botaoIniciar
export (NodePath) var botaoSair
export (NodePath) var botaoCredito

onready var animacao2 = get_node(animacao)
onready var botaoIniciar2 = get_node(botaoIniciar)
onready var botaoSair2 = get_node(botaoSair)
onready var botaoCredito2 = get_node(botaoCredito)

func _on_Voltar_pressed():
	animacao2.play("AnimacaoSubida")
	botaoIniciar2.disabled = false
	botaoSair2.disabled = false
	botaoCredito2.disabled = false
