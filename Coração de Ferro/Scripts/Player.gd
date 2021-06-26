extends KinematicBody2D

var velocidade = Vector2(0,0)
var speed = 350
var forcaPulo = -900
var gravidade = 30
export (String) var cont
var playerEntered = false
var pulou = false
var pulo = 0
var vivo = true
var acidocont = 0


var energia = 50

var is_attacking = false

const TIRO = preload("res://Cenas/Tiro.tscn")

func _ready():
	position = Globals.checkpointPosition


func setCount(var count):
	cont = count

func get_PlayerEntered():
	return playerEntered


func _input(event):
	event = Input.is_action_just_pressed("passar_fase")
	if (event):
		get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")

func _physics_process(delta):
	if Input.is_action_pressed("right") && vivo:
		if is_attacking == false || is_on_floor() == false:
			velocidade.x = speed
			if is_attacking == false:
				$AnimatedSprite.play("walk")
				$AnimatedSprite.flip_h = false
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
				if(!get_child((3)).is_playing() && is_on_floor()):
					get_child(3).play()
		
		
	elif Input.is_action_pressed("left") && vivo:
		if is_attacking == false || is_on_floor() == false:
			velocidade.x = -speed
			if is_attacking == false:
				$AnimatedSprite.play("walk")
				$AnimatedSprite.flip_h = true
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
				if(!get_child((3)).is_playing() && is_on_floor()):
					get_child(3).play()
		

	
	else:
		if is_attacking == false && vivo:
			$AnimatedSprite.play("idle")
			get_child(3).stop()
	
	if not is_on_floor() && vivo:
		if velocidade.y < 0:
			$AnimatedSprite.play("jump")
			get_child(3).stop()
		else:
			$AnimatedSprite.play("fall")
		
	
	if Input.is_action_just_pressed("ui_focus_next") && is_attacking == false && vivo:
		if energia >= 10:
			#energia -= 10
			if is_on_floor():
				velocidade.x = 0
			is_attacking = true
			if is_on_floor():
				$AnimatedSprite.play("tiro")
			
			
			var tiro = TIRO.instance()
			if sign($Position2D.position.x) == 1:
				tiro.set_tiro_direction(1)
			else:
				tiro.set_tiro_direction(-1)
			get_parent().add_child(tiro)
			tiro.position = $Position2D.global_position
	
	
	
	if vivo:
		velocidade.y = velocidade.y + gravidade
	elif acidocont < 50:
		acidocont = acidocont + 1
		velocidade.y = velocidade.y + 2
	else:
		velocidade.y = 0
		Morrer()
		#chamar game over
	
	if is_on_floor():
		pulou = false
	
	
	
	
	if Input.is_action_pressed("pular") and vivo and pulou == false:
		pulou = true
		print_debug("estou pulando")
		if is_attacking == false:
			pulo = randi() % 2 + 4 # Returns random integer between 1 and 100
			
		if(!get_child((pulo)).is_playing()):
			get_child(pulo).play()
		if vivo:
			velocidade.y = forcaPulo
	
	if (Input.is_action_pressed("selecionar") && get_PlayerEntered()):
		passarFase()
	
	
	
	velocidade = move_and_slide(velocidade, Vector2.UP, false)
	
	#if velocidade.x != 0:
		#energia -= 0.01
	
	$Control.get_child(0).text ="Energia: " + str(energia)
	
	velocidade.x = lerp(velocidade.x,0,1.0)
	


func adicionarEnergia(var num):
	if (energia+num) >100:
		energia = 100
	else:
		energia += num
	print_debug(energia)

func passarFase():
	get_tree().change_scene("res://Cenas/testeInteligencia-" + cont + ".tscn")

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		playerEntered = true


func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if(body.name == "Player"):
		playerEntered = false

func Checkpoint(pos):
	Globals.checkpointPosition = pos

func Morrer():
		get_tree().reload_current_scene()

func MorrerAcido():
	vivo = false
	$CollisionShape2D.queue_free()
	$AnimatedSprite.play("acido")



func _on_AnimatedSprite_animation_finished():
	is_attacking = false
