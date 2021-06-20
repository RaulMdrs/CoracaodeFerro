extends Position2D

export (PackedScene) var spawnScene

onready var spawnerReference = load (spawnScene.get_path())

var cont = 0

func _on_PortaAnimada_animation_finished():
	if(cont == 0):
		var spawnInstance = spawnerReference.instance()
		spawnInstance.set_position(get_position())
		get_parent().add_child(spawnInstance)
		cont = cont + 1
		
		
	
