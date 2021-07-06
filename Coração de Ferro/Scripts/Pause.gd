extends Control

func _ready():
	visible = false
	$Inicio.visible = true
	$Confirmacao.visible = false
	$Opcoes.visible = false
	
func _physics_process(delta):
	
	
	
	if $Confirmacao.visible == true:
		if $Confirmacao/Sair2.is_hovered():
			$Confirmacao/Sair2.grab_focus()
			#print_debug("Sair2")
			
		if $Confirmacao/Voltar.is_hovered():
			$Confirmacao/Voltar.grab_focus()
			#print_debug("Voltar")
			
			
	elif $Opcoes.visible == true:
		if Globals.telacheia:
			$Opcoes/TelaCheiaAtivado.visible = true
			$Opcoes/TelaCheiaDesativado.visible = false
			if $Opcoes/TelaCheiaAtivado.is_hovered():
				$Opcoes/TelaCheiaAtivado.grab_focus()
				#print_debug("Tela Cheia Atiado")
		else:
			$Opcoes/TelaCheiaAtivado.visible = false
			$Opcoes/TelaCheiaDesativado.visible = true
			if $Opcoes/TelaCheiaDesativado.is_hovered():
				$Opcoes/TelaCheiaDesativado.grab_focus()
				#print_debug("Tela Cheia Desativado")
		
		if Globals.som:
			$Opcoes/SomAtivado.visible = true
			$Opcoes/SomDesativado.visible = false
			if $Opcoes/SomAtivado.is_hovered():
				$Opcoes/SomAtivado.grab_focus()
				#print_debug("Som Ativado")
		else:
			$Opcoes/SomAtivado.visible = false
			$Opcoes/SomDesativado.visible = true
			if $Opcoes/SomDesativado.is_hovered():
				$Opcoes/SomDesativado.grab_focus()
				#print_debug("Som Desativado")
		
		if Globals.dificuldade == 1:
			$Opcoes/FacilAtivado.visible = false
			$Opcoes/FacilDesativado.visible = true
			print_debug("Padrao")
			
			if $Opcoes/FacilDesativado.is_hovered():
				$Opcoes/FacilDesativado.grab_focus()
				#print_debug("Facil Desativado")
			
			$Opcoes/PadraoAtivado.visible = true
			$Opcoes/PadraoDesativado.visible = false
			
			if $Opcoes/PadraoAtivado.is_hovered():
				$Opcoes/PadraoAtivado.grab_focus()
				#print_debug("Padrao Ativado")
		else:
			$Opcoes/FacilAtivado.visible = true
			$Opcoes/FacilDesativado.visible = false
			print_debug("Facil")
			
			if $Opcoes/FacilAtivado.is_hovered():
				$Opcoes/FacilAtivado.grab_focus()
				#print_debug("Facil Ativado")
			
			$Opcoes/PadraoAtivado.visible = false
			$Opcoes/PadraoDesativado.visible = true
			
			if $Opcoes/PadraoDesativado.is_hovered():
				$Opcoes/PadraoDesativado.grab_focus()
				#print_debug("Padrao Desativado")
	
	else:
		
		if $Inicio/VoltarAoJogo.is_hovered():
			$Inicio/VoltarAoJogo.grab_focus()
			#print_debug("VoltarAoJogo")
		
		if $Inicio/Sair.is_hovered():
			$Inicio/Sair.grab_focus()
			#print_debug("Sair")
	
		if $Inicio/BOpcoes.is_hovered():
			$Inicio/BOpcoes.grab_focus()
			#print_debug("BOpcoes")
			
		
		
		
		
		
	

func _input(event):
	if event.is_action_pressed("pause"):
		$Inicio/VoltarAoJogo.grab_focus()
		var new_pause_state = not get_tree().paused
		get_tree().paused = not get_tree().paused
		visible = new_pause_state
		if !new_pause_state:
			$Confirmacao.visible = false
			$Opcoes.visible = false
			$Inicio.visible = true

func _on_VoltarAoJogo_pressed():
	$Confirmacao.visible = false
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	visible = new_pause_state

func _on_SomDesativado_pressed():
	Globals.som = true
	$Opcoes/SomAtivado.grab_focus()


func _on_SomAtivado_pressed():
	Globals.som = false
	$Opcoes/SomDesativado.grab_focus()

func _on_TelaCheiaDesativado_pressed():
	Globals.telacheia = true
	$Opcoes/TelaCheiaAtivado.grab_focus()
	OS.window_fullscreen = !OS.window_fullscreen



func _on_TelaCheiaAtivado_pressed():
	Globals.telacheia = false
	$Opcoes/TelaCheiaDesativado.grab_focus()
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Sair_pressed():
	$Inicio.visible = false
	$Confirmacao.visible = true
	$Confirmacao/Voltar.grab_focus()


func _on_Sair2_pressed():
	get_tree().quit()


func _on_Voltar_pressed():
	$Inicio.visible = true
	$Confirmacao.visible = false
	$Inicio/VoltarAoJogo.grab_focus()


func _on_BOpcoes_pressed():
	$Inicio.visible = false
	$Opcoes.visible = true
	$Opcoes/Voltar2.grab_focus()


func _on_Voltar2_pressed():
	$Inicio.visible = true
	$Opcoes.visible = false
	$Inicio/VoltarAoJogo.grab_focus()


func _on_FacilDesativado_pressed():
	Globals.dificuldade = 2
	$Opcoes/FacilAtivado.visible = true
	$Opcoes/FacilAtivado.grab_focus()


func _on_FacilAtivado_pressed():
	Globals.dificuldade = 1
	$Opcoes/PadraoAtivado.visible = true
	$Opcoes/PadraoAtivado.grab_focus()


func _on_PadraoDesativado_pressed():
	Globals.dificuldade = 1
	$Opcoes/PadraoAtivado.visible = true
	$Opcoes/PadraoAtivado.grab_focus()


func _on_PadraoAtivado_pressed():
	Globals.dificuldade = 2
	$Opcoes/FacilAtivado.visible = true
	$Opcoes/FacilAtivado.grab_focus()
