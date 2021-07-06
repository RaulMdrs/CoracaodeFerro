extends Area2D

enum TIPO{
	acido,
	espinho,
	abismo
}

export (TIPO)var tipo

func _on_AreaDeMorteImediata_body_entered(body):
	if(body.name == "Player"):
		print_debug("vai morrer")
		match tipo:
			0:
				print_debug("morreu no acido")
				body.MorrerAcido()
			1:
				body.MorrerAcido()
			2:
				body.MorrerAcido()

	
