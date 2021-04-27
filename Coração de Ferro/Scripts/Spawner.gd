extends Position2D

var cont = 0
export (PackedScene) var spawnScene
onready var spawnerReference = load (spawnScene.get_path())
 
export (NodePath) var timerPath
onready var timerNode = get_node(timerPath)

export (float) var minTime
export (float) var maxTime

func _ready():
	randomize()
	timerNode.set_wait_time(rand_range(minTime, maxTime))
	timerNode.start()
	
	
func _on_Timer_timeout():
	var spawnInstance = spawnerReference.instance()
	
	get_parent().add_child(spawnInstance)
	
	timerNode.set_wait_time(rand_range(minTime, maxTime))
	timerNode.start()

