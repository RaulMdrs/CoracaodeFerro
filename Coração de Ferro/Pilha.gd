extends Area2D

export (int)var energia


func _ready():
	pass 
	

func _physics_process(delta):
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


func _on_Pilha_body_entered(body):
	if "Player" in body.name:
		body.adicionarEnergia(energia*10)
		queue_free()
