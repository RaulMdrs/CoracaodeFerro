extends KinematicBody2D


const GRAVITY = 10
export var speed = 30
const FLOOR = Vector2(0, -1)

export (bool)var quina = true
export (bool)var parede = true

var velocity = Vector2()

var direction = 1

var is_dead = false

func _ready():
	pass 

func dead():
	$Morrendo.play()
	is_dead = true
	velocity = Vector2(0, 0)
	$Area2D.queue_free()
	$AnimatedSprite.play("dying")
	$CollisionShape2D.queue_free()
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = speed * direction
		
		$AnimatedSprite.play("walk")
		
		if(direction == 1):
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
		
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, FLOOR)
		$Caminhando.play()
	
	
	if is_on_wall() && parede:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	if $RayCast2D.is_colliding() == false && quina:
		direction = direction * -1
		$RayCast2D.position.x *= -1


func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		body.MorrerAcido()
