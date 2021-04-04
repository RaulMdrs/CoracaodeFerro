extends Node2D

var game_end = false
var level_total_moves = [12,8,5]
var actual_level = 1
var moves = level_total_moves[actual_level-1]


func _process(_delta):
	$Level_Counter.text = 'Level ' + str(actual_level)
	$Remaining_Moves.text = 'MOVIMENTOS RESTANTES: ' + str(moves)
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
		
		if spots == 0:
			$WinDialog.popup()
			game_end = true
	
		if moves < 1:
			$LoseDialog.popup()
			game_end = true


func _on_WinDialog_confirmed():
	get_tree().reload_current_scene() #será removido por "Próximo level"
	#moves => (SALVA NO ARQUIVO DE SAVE) => nível Inteligencia = actual_level | estatística = level_total_moves[actual_level] - moves => movimentos restantes para ranking, etc
	#acutal_level += 1
	#moves = level_total_moves[actual_level]

func _on_LoseDialog_confirmed():
	get_tree().reload_current_scene()
