extends Node2D

export (NodePath) var animacao

onready var animacao2 = get_node(animacao)

export (String) var cont2

onready var cont = cont2

var playerEntered = false

func _input(event):
	if (event.is_action_pressed("selecionar") && playerEntered):
		get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		animacao2.play("letras")
		
		playerEntered = true
		

func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		animacao2.play("sumir")
		
		playerEntered = false
