extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Nova_Jornada_pressed():
	get_tree().change_scene("res://Cenas/Jogo 1/Jogo.tscn")
	Musica.set_stream(preload("res://sounds/musicaMenu.ogg"))
	Musica.play()
	pass # replace with function body

func _on_Continuar_pressed():
	carregar_dados();
	pass # replace with function body


func _on_Jornada_do_Heroi_pressed():
	get_tree().change_scene("res://Cenas/Jornada OutGame/Jornada OutGame.tscn")
	pass # replace with function body


func _on_Exit_pressed():
	get_node("PopupExit").show();
	pass # replace with function body




func _on_Sair_pressed():
	get_tree().quit();
	pass # replace with function body



func _on_Cancelar_pressed():
	get_node("PopupExit").hide();
	pass # replace with function body




func carregar_dados():
	
	var Save = File.new()
	var erro = Save.open(ARQUIVO, File.WRITE)
		
	if not erro:
		var dados_salvos = Save.get_var()
		
		global.cena=dados_salvos["Cena"]
		global.capituloAtual=dados_salvos["capitulo"]
		
		global.heroi = dados_salvos["heroi"]
		global.sombra=dados_salvos["sombra"]
		global.mentor=dados_salvos["mentor"]
		global.arauto=dados_salvos["arauto"]
		global.guardiaoDoLimiar=dados_salvos["Guardiao"]
		global.camaleao=dados_salvos["camaleao"]
		global.aliado=dados_salvos["aliado"]
		
		print("Sucesso ao carregar dados!")
	else:
		print("Erro ao carregar dados")
		
	Save.close()
	
	pass





