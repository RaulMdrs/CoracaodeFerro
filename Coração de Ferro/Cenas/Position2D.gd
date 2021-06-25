extends Position2D

export (PackedScene) var spawnScene

onready var spawnerReference = load (spawnScene.get_path())

export (String) var count

onready var count2 = count

var cont = 0

func _on_PortaAnimada_animation_finished():
	if(cont == 0):
		Globals.checkpointPosition = position
		var spawnInstance = spawnerReference.instance()
		spawnInstance.set_position(Globals.checkpointPosition) 
		spawnInstance.setCount(count2)
		get_parent().add_child(spawnInstance)
		cont = cont + 1
		
		
	
