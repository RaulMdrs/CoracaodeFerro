extends Control

export (NodePath) var botao

onready var botao2 = get_node(botao)

func _on_Player_input_event(viewport, event, shape_idx):
	if(event == Input.is_action_pressed("selecionar") && botao2.get_playerEntered()):
		get_tree().change_scene("res://testeInteligencia-2.tscn")


func _on_Controlador_fase_gui_input(event):
	if(event == Input.is_action_pressed("selecionar") && botao2.get_playerEntered()):
		get_tree().change_scene("res://testeInteligencia-2.tscn")
