extends Control
var cheaton=false


func _ready():
	soundAmbience.set_stream(global.somAmbiente)
	soundAmbience.play()
	get_node("AnimationPlayer").play("apareceMenu")
	if global.cheated==false:
		global.carregar_dados();
	
	if global.capituloAtual>0:
		get_node("Continuar").set_disabled(false)
		get_node("Jornada do Heroi").set_disabled(false)
		get_node("Arquétipos").set_disabled(false)
	else:
		get_node("Continuar").set_disabled(true)
		get_node("Jornada do Heroi").set_disabled(true)
		get_node("Arquétipos").set_disabled(true)
	pass


func _on_Nova_Jornada_pressed():
	if global.capituloAtual>0:
		get_node("PopupNovoJogo").show();
	else:
		reiniciar()
		get_tree().change_scene("res://Cenas/Historia/Tutorial/tutorial.tscn")
		Musica.set_stream(preload("res://sounds/musicaMenu.ogg"))
		Musica.play()
		
	pass 
	
func _on_Sim_pressed():
	reiniciar()
	get_tree().change_scene("res://Cenas/Historia/Tutorial/tutorial.tscn")
	Musica.set_stream(preload("res://sounds/musicaMenu.ogg"))
	Musica.play()
	pass # replace with function body

func _on_CancelarNovo_pressed():
	get_node("PopupNovoJogo").hide()
	pass # replace with function body


func _on_Continuar_pressed():
	
	global.carregar_dados()
	global.cheated==false
	get_tree().change_scene(global.cena)
	
	Musica.set_stream(preload("res://sounds/musicaMenu.ogg"))
	Musica.play()
	pass 


func _on_Jornada_do_Heroi_pressed():
	get_tree().change_scene("res://Cenas/Jornada OutGame/Jornada OutGame.tscn")
	pass 


func _on_Arqutipos_pressed():
	get_tree().change_scene("res://Cenas/Arquetipos/Arquetipos.tscn")
	pass # replace with function body


func _on_Exit_pressed():
	get_node("PopupExit").show();
	pass 
	
	





func _on_Sair_pressed():
	get_tree().quit();
	pass # replace with function body



func _on_Cancelar_pressed():
	get_node("PopupExit").hide();
	pass # replace with function body


func reiniciar():
	global.cheated==false
	global.heroi=false
	global.sombra=false
	global.mentor=false
	global.arauto=false
	global.guardiaoDoLimiar=false
	global.aliado=false
	global.camaleao=false
	global.picaro=false
	
	global.escudo = false

	global.Fogo= false
	global.Terra = false
	global.Agua = false
	global.Ar = false
	global.maldade=0
	
	pass





func _on_Creditos_pressed():
	get_tree().change_scene("res://Cenas/creditos/Creditos.tscn")
	pass # replace with function body


func _on_Settings_pressed():
	get_tree().change_scene("res://Cenas/Opcoes/opcao.tscn")
	pass # replace with function body


func _on_Help_pressed():
	get_tree().change_scene("res://Cenas/Ajuda/Ajuda.tscn")
	pass # replace with function body











func _on_CallCheat_pressed():
	
	if cheaton==false:
		get_node("CheatControl").show()
		get_node("CheatControl").SubirCheat();
		cheaton=true;
	else:
		get_node("CheatControl/TimerCheat").start();
		get_node("CheatControl").DescerCheat();
		cheaton=false;
	pass # replace with function body


func _on_TimerCheat_timeout():
	get_node("CheatControl").hide()
	get_node("CheatControl/Panel/Info2").hide();
	pass # replace with function body


