extends RigidBody2D

export (NodePath) var ponto1
export (NodePath) var ponto2

onready var ponto1Node = get_node(ponto1)
onready var ponto2Node = get_node(ponto2)

func _physics_process(delta):
	
	
	
