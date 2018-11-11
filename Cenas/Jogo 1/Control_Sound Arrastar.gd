extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func tweenarrastar(x1,x2):
	get_node("Arrastar").play()
	get_node("Tween").interpolate_property(self,"rect_position",Vector2(x1,480),Vector2(x2,480),0.1,Tween.TRANS_BACK,Tween.EASE_IN)
	get_node("Tween").start();


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
