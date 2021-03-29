extends Node2D

var caixas = 0
var iniciadas = false


func _on_Fogo_body_entered(body):
	
	body.queue_free()
	caixas = caixas - 1
	
	if caixas == 0:
		
		
		get_tree().change_scene("res://Jogo.tscn")


func _on_caixa1_ready():
	caixas = caixas + 1


func _on_caixa2_ready():
	caixas = caixas + 1
