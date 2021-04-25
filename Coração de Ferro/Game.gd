extends Node2D

var game_end = false
var moves = 50
var level = 0
var movments = [5,30,50]
var spots

func _process(_delta):
	#$Level_Counter.text = 'Level 1'
	spots = $Spots.get_child_count()
	$Ui/Remaining_Moves.text = 'MOVIMENTOS RESTANTES: ' + str(moves)
	
	
func check_end():
	if game_end == false:
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
		if moves < 0:
			$Ui/LoseDialog.popup_centered()
			game_end = true
		elif spots < 1:
			$Ui/WinDialog.popup_centered()
			game_end = true
		elif moves == 0:
			$Ui/LoseDialog.popup_centered()
			game_end = true



func _on_WinDialog_confirmed():
	get_tree().reload_current_scene()


func _on_LoseDialog_confirmed():
	get_tree().reload_current_scene()
