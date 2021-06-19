extends KinematicBody2D

var velocidade = Vector2(0,0)
var speed = 350
var forcaPulo = -900
var gravidade = 30
var forca = 10
var inteligencia = 10
export (String) var cont
var playerEntered = false
var pulou = false
var pulo = 0

func get_PlayerEntered():
	return playerEntered

func addForca(var f):
	forca = forca + f

func _input(event):
	event = Input.is_action_just_pressed("passar_fase")
	if (event):
		get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocidade.x = speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		
		if(!get_child((3)).is_playing()):
			get_child(3).play()
		
		
	elif Input.is_action_pressed("left"):
		velocidade.x = -speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
		
		if(!get_child((3)).is_playing()):
			get_child(3).play()
		
	else:
		$AnimatedSprite.play("idle")
		get_child(3).stop()
		pulou = false
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		get_child(3).stop()
		
	
	velocidade.y = velocidade.y + gravidade
	
	
	if Input.is_action_pressed("pular") and is_on_floor():
		pulo = randi() % 2 + 4 # Returns random integer between 1 and 100

		if(!get_child((pulo)).is_playing()):
			get_child(pulo).play()
			pulou = true
		velocidade.y = forcaPulo
	
	if (Input.is_action_pressed("selecionar") && get_PlayerEntered()):
		get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")
		
	
	
	velocidade = move_and_slide(velocidade, Vector2.UP, false)
	
	velocidade.x = lerp(velocidade.x,0,1.0)


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		playerEntered = true


func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		playerEntered = false
