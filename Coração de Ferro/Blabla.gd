extends KinematicBody2D

export (PackedScene) var spawnScene
onready var spawnerReference = load (spawnScene.get_path())
 
export (NodePath) var timerPath
onready var timerNode = get_node(timerPath)

export (float) var minTime
export (float) var maxTime

var velocidade = Vector2(0,0)
var speed = 800

func _physics_process(delta):
	if global_position.x >= 1000:
		velocidade.x = -speed
	elif global_position.x <= 0:
		velocidade.x = speed
		
	velocidade = move_and_slide(velocidade)


func _ready():
	randomize()
	timerNode.set_wait_time(rand_range(minTime, maxTime))
	timerNode.start()
	
	
func _on_Timer_timeout():
	var spawnInstance = spawnerReference.instance()
	
	get_parent().add_child(spawnInstance)
	spawnInstance.set_global_position(get_global_position())
	
	timerNode.set_wait_time(rand_range(minTime, maxTime))
	timerNode.start()
