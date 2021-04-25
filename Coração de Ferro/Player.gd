extends KinematicBody2D

var velocidade = Vector2(0,0)
var speed = 350
var forcaPulo = -900
var gravidade = 30
var forca = 10
var inteligencia = 10

func addForca(var f):
	forca = forca + f

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocidade.x = speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocidade.x = -speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	
	velocidade.y = velocidade.y + gravidade
	
	
	if Input.is_action_pressed("pular") and is_on_floor():
		velocidade.y = forcaPulo
	
	velocidade = move_and_slide(velocidade, Vector2.UP)
	
	velocidade.x = lerp(velocidade.x,0,0.1)



