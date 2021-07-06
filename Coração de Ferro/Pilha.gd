extends Area2D

export (int)var energia


func _ready():
	if energia > 4:
		$AnimatedSprite.play('5')
	elif energia > 3:
		$AnimatedSprite.play('4')
	elif energia > 2:
		$AnimatedSprite.play('3')
	elif energia > 1:
		$AnimatedSprite.play('2')
	else:
		$AnimatedSprite.play('1') 
	

func _physics_process(delta):
	pass


func _on_Pilha_body_entered(body):
	if "Player" in body.name:
		$PilhaSom.play()
		body.adicionarEnergia(energia*10)
		$AnimatedSprite.queue_free()
		$CollisionShape2D.queue_free()


func _on_PilhaSom_finished():
	queue_free()
