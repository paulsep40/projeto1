extends Control

var SelecaoIsOn=false

func _ready():
	get_node("Efeitos").set_value(global.volumefx)
	get_node("Musica").set_value(global.volumemusica)
	get_node("Ambientacao").set_value(global.volumeAmbiete)
	attButton()
	attLabel()
	if OS.window_fullscreen==true:
		get_node("Full_Screen").set_pressed(true)
		get_node("janela").set_pressed(false);
		get_node("Control tamanho da tela").hide()
		get_node("Control tamanho da tela/Selecoes").hide()
		SelecaoIsOn=false;
		pass
	else:
		get_node("Full_Screen").set_pressed(false)
		get_node("janela").set_pressed(true)
		
		get_node("Control tamanho da tela").show()
		#get_node("Control tamanho da tela/Labelnumero").set_text("1280 X 720");
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Efeitos_value_changed(value):
	Sound_arrastar.set_volume_db(value)
	Sound_passar.set_volume_db(value)
	Sound_arrastar.play()
	global.volumefx=value;
	pass # replace with function body


func _on_Musica_value_changed(value):
	Musica.set_volume_db(value)
	global.volumemusica=value;
	pass # replace with function body

func _on_Ambientacao_value_changed(value):
	soundAmbience.set_volume_db(value)
	global.volumeAmbiete=value;
	pass # replace with function body




func _on_janela_pressed():
	get_node("Control tamanho da tela/Labelnumero").set_text("1280 X 720")
	OS.set_window_fullscreen(false)
	get_node("janela").set_pressed(true)
	get_node("Full_Screen").set_pressed(false)
	OS.set_window_size(Vector2(1280,720))
	get_node("Control tamanho da tela").show()
	attButton()
	attLabel()
	pass # replace with function body


func _on_Full_Screen_pressed():
	get_node("janela").set_pressed(false)
	get_node("Full_Screen").set_pressed(true)
	OS.set_window_fullscreen(true)
	get_node("Control tamanho da tela").hide()
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body





func attLabel():
	if global.tamanhotela==0:
		OS.set_window_size(Vector2(853.33,480))
		get_node("Control tamanho da tela/Labelnumero").set_text("853 X 480");
		pass
	if global.tamanhotela==1:
		OS.set_window_size(Vector2(1000,562.50))
		get_node("Control tamanho da tela/Labelnumero").set_text("1000 X 562");
		pass
	if global.tamanhotela==2:
		OS.set_window_size(Vector2(1155,650))
		get_node("Control tamanho da tela/Labelnumero").set_text("1155 X 650");
		pass
	if global.tamanhotela==3:
		OS.set_window_size(Vector2(1280,720))
		get_node("Control tamanho da tela/Labelnumero").set_text("1280 X 720");
		pass
	if global.tamanhotela==4:
		OS.set_window_size(Vector2(1920,1080))
		get_node("Control tamanho da tela/Labelnumero").set_text("1920 X 1080");
		pass



func _on_Tamanho_pressed():
	if SelecaoIsOn==false:
		get_node("Control tamanho da tela/Selecoes").show();
		get_node("TimerSelecao").start();
	if SelecaoIsOn==true:
		get_node("Control tamanho da tela/Selecoes").hide()
		SelecaoIsOn=false;
	pass # replace with function body


func _on_853_X_480_pressed():
	global.tamanhotela=0
	get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(true)
	get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
	attLabel()
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body


func _on_1000_X_562_pressed():
	global.tamanhotela=1
	get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(true)
	get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
	attLabel()
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body


func _on_1155_X_650_pressed():
	global.tamanhotela=2
	get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(true)
	get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
	attLabel()
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body


func _on_1280_X_720_pressed():
	global.tamanhotela=3
	get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(true)
	get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
	attLabel()
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body


func _on_1920_X_1080_pressed():
	global.tamanhotela=4
	get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
	get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(true)
	attLabel()
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body

func attButton():
	if global.tamanhotela==0:
		get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(true)
		get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
		pass
	if global.tamanhotela==1:
		get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(true)
		get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
		pass
	if global.tamanhotela==2:
		get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(true)
		get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
		pass
	if global.tamanhotela==3:
		get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(true)
		get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(false)
		pass
	if global.tamanhotela==4:
		get_node("Control tamanho da tela/Selecoes/853 X 480").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1000 X 562").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1155 X 650").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1280 X 720").set_pressed(false)
		get_node("Control tamanho da tela/Selecoes/1920 X 1080").set_pressed(true)
		pass

func _on_FechaSelecao_pressed():
	get_node("Control tamanho da tela/Selecoes").hide()
	SelecaoIsOn=false;
	pass # replace with function body


func _on_TimerSelecao_timeout():
	SelecaoIsOn=true;
	pass # replace with function body
