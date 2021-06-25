extends AnimatedSprite

export (NodePath) var timerPath
export (int) var waitTime

export (String) var numero

onready var waitTime2 = waitTime
onready var timerNode = $contadorPorta
#onready var timerNode = get_node(timerPath)

var cont = 0

func _ready():
	if(waitTime2 > 0):
		timerNode.set_wait_time(waitTime2)
		timerNode.start()
	
	$Label.text = numero


func _on_contadorPorta_timeout():
	
	if(cont == 0):
		play("aberta")
		cont = cont + 1
		timerNode.set_wait_time(waitTime2)
		timerNode.start()
		$Label.text = " "
	elif(cont == 1):
		play("trancada")
		cont = cont + 1
		timerNode.set_wait_time(waitTime2)
		timerNode.start()
		$Label.text = numero
	
