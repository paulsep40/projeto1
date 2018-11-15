extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("janela").set_pressed(true)
	get_node("Full_Screen").set_pressed(false)
	OS.set_window_size(Vector2(1280,720))
	get_node("Control tamanho da tela").show()
	get_node("Control tamanho da tela/Labelnumero").set_text("1280 X 720")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Efeitos_value_changed(value):
	Sound_arrastar.set_volume_db(value)
	Sound_passar.set_volume_db(value)
	Sound_arrastar.play()
	pass # replace with function body


func _on_Musica_value_changed(value):
	Musica.set_volume_db(value)
	pass # replace with function body


func _on_Tamanho_de_Tela_value_changed(value):
	if value==1:
		OS.set_window_size(Vector2(853.33,480))
		get_node("Control tamanho da tela/Labelnumero").set_text("853 X 480")
		pass
	if value==2:
		OS.set_window_size(Vector2(1000,562.50))
		get_node("Control tamanho da tela/Labelnumero").set_text("1000 X 562")
		pass
	if value==3:
		OS.set_window_size(Vector2(1280,720))
		get_node("Control tamanho da tela/Labelnumero").set_text("1280 X 720")
		pass
	if value==4:
		OS.set_window_size(Vector2(1920,1080))
		get_node("Control tamanho da tela/Labelnumero").set_text("1920 X 1080")
		pass
	pass # replace with function body


func _on_janela_pressed():
	get_node("Control tamanho da tela/Labelnumero").set_text("1280 X 720")
	OS.set_window_fullscreen(false)
	get_node("janela").set_pressed(true)
	get_node("Full_Screen").set_pressed(false)
	OS.set_window_size(Vector2(1280,720))
	get_node("Control tamanho da tela").show()
	pass # replace with function body


func _on_Full_Screen_pressed():
	get_node("janela").set_pressed(false)
	get_node("Full_Screen").set_pressed(true)
	OS.set_window_fullscreen(true)
	get_node("Control tamanho da tela").hide()
	pass # replace with function body


func _on_Voltar_pressed():
	self.hide()
	pass # replace with function body
