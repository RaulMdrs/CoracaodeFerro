extends Control


func _ready():
	pass 
	
func vitoria():
	$Vitoria/AudioVitoria.play()


func _on_AudioVitoria_finished():
	Globals.checkpointPosition = Vector2(0,0)
	get_tree().change_scene("res://Cenas/" + cont + ".tscn")
