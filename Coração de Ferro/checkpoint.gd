extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if position == Globals.checkpointPosition:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.Checkpoint(position)
		$CheckpointSom.play()
		$Sprite.queue_free()
		$CollisionShape2D.queue_free()


func _on_CheckpointSom_finished():
		queue_free()
