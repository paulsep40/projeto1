extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("AnimationPlayer").play("splashUFCan")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Cenas/Splash Screen/Splash Armadillo.tscn")
	pass # replace with function body


func _on_Splashufcbutton_pressed():
	get_tree().change_scene("res://Cenas/Splash Screen/Splash Armadillo.tscn")
	pass # replace with function body
