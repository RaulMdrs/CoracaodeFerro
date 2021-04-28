extends Node

export (int) var child

func _ready():
	get_child(child).play("movimento") 
