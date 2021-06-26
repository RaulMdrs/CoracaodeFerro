extends Node


var checkpointPosition = Vector2(0,0)

var dificuldade = 2 # 1 = normal, 2 = fácil


func _ready():
	pass 

func _input(event):
	event = Input.is_action_just_pressed("passar_fase")
	if Input.is_action_just_pressed("passar_fase"):
		match(dificuldade):
			1: 
				dificuldade = 2
				print_debug("A dificuldade agora é fácil")
			2: 
				dificuldade = 1
				print_debug("A dificuldade agora é normal")
