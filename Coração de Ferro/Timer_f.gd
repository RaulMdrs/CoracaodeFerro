extends Timer

export var minTime = 2
export var maxTime = 3


func _ready():
	if autostart:
		random_start()
	

func random_start(time = rand_range(minTime, maxTime)):
	start(time)

func _on_Timer_timeout() -> void:
	if not one_shot:
		random_start()
