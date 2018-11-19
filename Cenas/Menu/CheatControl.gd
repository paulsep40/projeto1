extends Control



func SubirCheat():
	get_node("Tween").interpolate_property(self,"rect_position",Vector2(0,722),Vector2(0,573),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	get_node("Tween").start();
	pass

func DescerCheat():
	get_node("Tween").interpolate_property(self,"rect_position",Vector2(0,573),Vector2(0,722),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	get_node("Tween").start();
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_okButton_pressed():
	if get_node("CheatBar").text=="NeyMestreDoUniverso":
		global.capituloAtual=12
		
		global.heroi=true
		global.sombra=true
		global.mentor=true
		global.arauto=true
		global.guardiaoDoLimiar=true
		global.aliado=true
		global.camaleao=true
		global.picaro=true
		get_node("Panel/Info2").hide();
		get_node("Panel/Info").show()
		global.cheated=true
	else:
		get_node("CheatBar").set_text("")
		get_node("Panel/Info2").hide();
		get_node("Panel/Info2").show();
	pass # replace with function body




func _on_CheatBar_text_changed(new_text):
	get_node("Panel/Info2").hide();
	get_node("Panel/Info").hide()
	pass # replace with function body
