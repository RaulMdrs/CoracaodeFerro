extends Node2D

var caixas = 0

func iniciar_caixas():
	if $caixa1._init():
		caixas = caixas + 1
	if $caixa2._init():
		caixas = caixas + 1

func _physics_process(delta):
	
	if $caixa1.is_queued_for_deletion():
		caixas = caixas - 1
	
	if caixas == 0:
		pass 
		
