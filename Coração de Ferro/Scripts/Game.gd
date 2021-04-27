extends Node2D

var game_end = false
var moves = 50
var level = 0
var movments = [5,30,50]
var spots
export (String) var cont

func _process(_delta): #escrita dos movimentos e contagem dos spots
	#$Level_Counter.text = 'Level 1'
	spots = $Spots.get_child_count()
	$Ui/Remaining_Moves.text = 'MOVIMENTOS RESTANTES: ' + str(moves)
	
func _input(event):
	event = Input.is_action_just_pressed("passar_fase")
		
	if(event):
		if(int(cont) > 3):
			get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")
		else:
			get_tree().change_scene("res://Cenas/Fase_" + cont + ".tscn")
	

func check_end(): #verifica quando o player termina de se movimentar
	if game_end == false:
		for i in $Spots.get_children(): 
			if i.occupied:
				spots -= 1
		if moves < 0:
			$Ui/LoseDialog.popup_centered() #ativa a box de derrota
			game_end = true
		elif spots < 1:
			$Ui/WinDialog.popup_centered() #ativa a box de vitoria
			game_end = true
		elif moves == 0:
			$Ui/LoseDialog.popup_centered() #ativa a box de derrota
			game_end = true



func _on_WinDialog_confirmed():  #acontece quanto da ok na caixa de vitoria
	#get_tree().change_scene("res://Cenas/Fase_" + cont + ".tscn")
	if(int(cont) > 3):
		get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")
	else:
		get_tree().change_scene("res://Cenas/Fase_" + cont + ".tscn")

func _on_LoseDialog_confirmed(): #acontece quanto da ok na caixa de derrota
	get_tree().reload_current_scene()
