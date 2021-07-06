extends Node2D


#onready var animacao2 = get_node("MenuCredito/AnimaçãoCreditos")
#onready var botaoIniciar2 = get_node("MenuInicial/Iniciar")
#onready var botaoSair2 = get_node("MenuInicial/Sair")
#onready var botaoCredito2 = get_node("MenuCredito/Voltar")

func _ready():
	$MenuInicial/Iniciar.grab_focus()
	
func _physics_process(delta):
	
	
	if $MenuInicial/Iniciar.is_hovered():
		$MenuInicial/Iniciar.grab_focus()
	if $MenuInicial/Credito.is_hovered():
		$MenuInicial/Credito.grab_focus()
	if $MenuInicial/Sair.is_hovered():
		$MenuInicial/Sair.grab_focus()
	if $Voltar.is_hovered():
		$Voltar.grab_focus()


func _on_Iniciar_pressed():
	get_tree().change_scene("res://Cenas/FaseIntroducao1.tscn")


func _on_Credito_pressed():
	$MenuCredito/AnimacaoCreditos.play("AnimacaoDescida")
	$Voltar/AnimationPlayer.play("animVoltar")
	$MenuInicial/Iniciar.disabled = true
	$MenuInicial/Sair.disabled = true
	$MenuInicial/Credito.disabled = true
	$Voltar.grab_focus()


func _on_Sair_pressed():
	get_tree().quit()


func _on_Voltar_pressed():
	$MenuCredito/AnimacaoCreditos.play("AnimacaoSubida")
	$Voltar/AnimationPlayer.play("animVoltar2")
	$MenuInicial/Iniciar.disabled = false
	$MenuInicial/Sair.disabled = false
	$MenuInicial/Credito.disabled = false
	$MenuInicial/Iniciar.grab_focus()
	
