extends Node2D

var game_end = false
var moves = 50
var level = 0
var movments = [5,30,50]
var spots
export (String) var cont

<<<<<<< HEAD

=======
>>>>>>> 9579b132d6c209a1f4e8b6fc4dfd431b810cc225
func _process(_delta): #escrita dos movimentos e contagem dos spots
	#$Level_Counter.text = 'Level 1'
	spots = $Spots.get_child_count()
	$Ui/Remaining_Moves.text = 'MOVIMENTOS RESTANTES: ' + str(moves)
	
<<<<<<< HEAD


func _input(event): #usar isso para fazer menu de pause
	event = Input.is_action_just_pressed("passar_fase")
	if(event):
		$Ui/WinDialog.popup_centered() #ativa a box de vitoria
		game_end = true

=======
>>>>>>> 9579b132d6c209a1f4e8b6fc4dfd431b810cc225
	
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
<<<<<<< HEAD
	if (int(cont) > 3):
		get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")
	else:
		get_tree().change_scene("res://Cenas/Fase_" + cont + ".tscn")
=======
	get_tree().change_scene("res://Cenas/Fase_" + cont + ".tscn")
>>>>>>> 9579b132d6c209a1f4e8b6fc4dfd431b810cc225

func _on_LoseDialog_confirmed(): #acontece quanto da ok na caixa de derrota
	get_tree().reload_current_scene()
