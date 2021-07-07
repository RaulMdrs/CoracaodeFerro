extends KinematicBody2D

onready var ray = $RayCast2D
var grid_size = 64
var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT,
	'up' : Vector2.UP,
	'down' : Vector2.DOWN,
	'left' : Vector2.LEFT,
	'right' : Vector2.RIGHT
}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			if $Tween.is_active() == false:
				move(dir)
		if event.is_action_pressed("reset"):
			get_tree().reload_current_scene()

func move(dir):
	var game = get_parent()
	var vector_pos = inputs[dir] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	$Tween.interpolate_property(
		self, "position", 
		position, position + vector_pos, 0.15, 
		Tween.TRANS_SINE, 
		Tween.EASE_IN_OUT
	)
	if !ray.is_colliding() and game.moves > 0:
		$Tween.start()
		game.moves -= 1
	elif game.moves > 0:
		var collider = ray.get_collider()
		if collider.is_in_group('box_type_1'):
			if collider.move(dir):
				$Tween.start()
				game.moves -= 1


func _on_Tween_tween_all_completed():
	get_parent().check_end()
