extends RigidBody2D

var vivo = true

func _on_Area2D_body_entered(body):
	
	queue_free()
	vivo = false
