extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func chageBGAnimation(liga,x1,x2):
	if liga==true:
		get_node("Tween").interpolate_property(self,"rect_position",Vector2(x1,0),Vector2(x2,0),1,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		get_node("Tween").start();
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
