extends Area2D

const SPEED = 700
var velocity = Vector2()
var direction = 1

func _ready():
	pass

func set_tiro_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")


func _on_VisibilityNotifier2D_screen_exited():
	#print_debug("tiro desapareceu")
	queue_free()


func _on_Tiro_body_entered(body):
	if(body.get_name() != "Player" && body.is_in_group("inimigo")):
		print_debug("acertei um inimigo")
		body.queue_free()
		queue_free()
	elif(body.get_name() != "Player"):
		print_debug("acertei a parede")
		queue_free()
