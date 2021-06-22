extends KinematicBody2D


const GRAVITY = 10
export var speed = 30
const FLOOR = Vector2(0, -1)

export (bool)var quina = true
export (bool)var parede = true

var velocity = Vector2()

var direction = 1


func _ready():
	pass 


func _physics_process(delta):
	velocity.x = speed * direction
	
	$AnimatedSprite.play("walk")
	
	if(direction == 1):
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
	
	if is_on_wall() && parede:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	if $RayCast2D.is_colliding() == false && quina:
		direction = direction * -1
		$RayCast2D.position.x *= -1
