extends Node2D

var game_end = false
var moves = 5


func _process(_delta):
	#$Level_Counter.text = 'Level 1'
	$Ui/Remaining_Moves.text = 'MOVIMENTOS RESTANTES: ' + str(moves)
	
func check_end():
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
		
		if moves < 0:
			$Ui/LoseDialog.popup_centered()
			game_end = true
		elif spots == 0:
			$Ui/WinDialog.popup_centered()
			game_end = true
		elif moves == 0:
			$Ui/LoseDialog.popup_centered()
			game_end = true



func _on_WinDialog_confirmed():
	get_tree().reload_current_scene()


func _on_LoseDialog_confirmed():
	get_tree().reload_current_scene()
