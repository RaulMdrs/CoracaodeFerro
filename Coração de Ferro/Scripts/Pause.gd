extends Control

func _ready():
	$VoltarAoJogo.grab_focus()
	
func _physics_process(delta):
	
	
	if $VoltarAoJogo.is_hovered():
		$VoltarAoJogo.grab_focus()
	if $Sair.is_hovered():
		$Sair.grab_focus()
	if $SomDesativado.is_hovered():
		$SomDesativado.grab_focus()
	if $SomAtivado.is_hovered():
		$SomAtivado.grab_focus()
	if $TelaCheiaDesativado.is_hovered():
		$TelaCheiaDesativado.grab_focus()
	if $TelaCheiaAtivado.is_hovered():
		$TelaCheiaAtivado.grab_focus()
	
	if $Confirmacao.visible == true:
		if $Confirmacao/Sair2.is_hovered():
			$Confirmacao/Sair2.grab_focus()
		if $Confirmacao/Voltar.is_hovered():
			$Confirmacao/Voltar.grab_focus()
	
	if Globals.telacheia:
		$TelaCheiaAtivado.visible = true
		$TelaCheiaDesativado.visible = false
	else:
		$TelaCheiaAtivado.visible = false
		$TelaCheiaDesativado.visible = true
	
	if Globals.som:
		$SomAtivado.visible = true
		$SomDesativado.visible = false
	else:
		$SomAtivado.visible = false
		$SomDesativado.visible = true
	

func _input(event):
	if event.is_action_pressed("pause"):
		$VoltarAoJogo.grab_focus()
		var new_pause_state = not get_tree().paused
		get_tree().paused = not get_tree().paused
		visible = new_pause_state
		if !new_pause_state:
			$Confirmacao.visible = false

func _on_VoltarAoJogo_pressed():
	$Confirmacao.visible = false
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	visible = new_pause_state

func _on_SomDesativado_pressed():
	Globals.som = true
	$SomAtivado.grab_focus()


func _on_SomAtivado_pressed():
	Globals.som = false
	$SomDesativado.grab_focus()

func _on_TelaCheiaDesativado_pressed():
	Globals.telacheia = true
	$TelaCheiaAtivado.grab_focus()
	OS.window_fullscreen = !OS.window_fullscreen



func _on_TelaCheiaAtivado_pressed():
	Globals.telacheia = false
	$TelaCheiaDesativado.grab_focus()
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Sair_pressed():
	$Confirmacao.visible = true
	$Confirmacao/Voltar.grab_focus()


func _on_Sair2_pressed():
	get_tree().quit()


func _on_Voltar_pressed():
	$Confirmacao.visible = false
	$VoltarAoJogo.grab_focus()
