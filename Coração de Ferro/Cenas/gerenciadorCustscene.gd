extends Node2D

export (String) var fase

onready var fase2 = fase

func _ready():
	$AnimationPlayer.play("cutscene")



func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "cutscene"):
		get_tree().change_scene("res://Cenas/" + fase2 + ".tscn")
