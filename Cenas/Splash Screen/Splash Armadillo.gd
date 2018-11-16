extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("player_Animation").play("armadilloSplash")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_armadilloLogo_pressed():
	
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")
	pass # replace with function body


func _on_player_Animation_animation_finished(anim_name):
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")
	
	pass # replace with function body
