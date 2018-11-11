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


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Jogo 1/Jogo.tscn")
	pass # replace with function body

func _on_Jornada_do_Heri_pressed():
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


