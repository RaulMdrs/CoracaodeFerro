extends KinematicBody2D

onready var ray = $RayCast2D
var grid_size = 64
var inputs = {
	'up' : Vector2.UP,
	'down' : Vector2.DOWN,
	'left' : Vector2.LEFT,
	'right' : Vector2.RIGHT
}


func move(dir):
	var vector_pos = inputs[dir] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	$Tween.interpolate_property(
		self, "position", 
		position, position + vector_pos, 0.15, 
		Tween.TRANS_SINE, 
		Tween.EASE_IN_OUT
	)
	if !ray.is_colliding():
		$Tween.start()
		return true
	return false
