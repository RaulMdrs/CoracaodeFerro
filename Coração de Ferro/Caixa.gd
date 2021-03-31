extends RigidBody2D

func _ready():
	global_position.x = rand_range(0, 1000)


func _physics_process(delta):
	if global_position.y > 480:
		queue_free()

