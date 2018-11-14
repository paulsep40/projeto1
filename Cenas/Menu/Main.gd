extends Control



func _ready():
	global.carregar_dados()
	
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
	reiniciar()
	get_tree().change_scene("res://Cenas/Jogo 1/Jogo.tscn")
	Musica.set_stream(preload("res://sounds/musicaMenu.ogg"))
	Musica.play()
	pass 

func _on_Continuar_pressed():
	global.carregar_dados()
	Musica.set_stream(preload("res://sounds/musicaMenu.ogg"))
	Musica.play()
	pass 


func _on_Jornada_do_Heroi_pressed():
	get_tree().change_scene("res://Cenas/Jornada OutGame/Jornada OutGame.tscn")
	pass 


func _on_Arqutipos_pressed():
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
	global.heroi=false
	global.sombra=false
	global.mentor=false
	global.arauto=false
	global.guardiaoDoLimiar=false
	global.aliado=false
	global.camaleao=false
	
	pass










func _on_Settings_pressed():
	get_tree().change_scene("res://Cenas/Opcoes/opcao.tscn")
	pass # replace with function body
