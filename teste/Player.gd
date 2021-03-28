extends KinematicBody2D

var velocidade = Vector2(0,0)
var speed = 200
var forcaPulo = -900
var gravidade = 30

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocidade.x = speed
	if Input.is_action_pressed("left"):
		velocidade.x = -speed
	
	velocidade.y = velocidade.y + gravidade
	
	
	if Input.is_action_pressed("pular") and is_on_floor():
		velocidade.y = forcaPulo
	
	velocidade = move_and_slide(velocidade, Vector2.UP)
	
	velocidade.x = lerp(velocidade.x,0,0.1)
