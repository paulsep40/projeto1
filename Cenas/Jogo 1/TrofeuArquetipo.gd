extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func subir_Trofeu():
	get_node("Tween").interpolate_property(self,"rect_position", Vector2(978,728),Vector2(978,643),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT,1)
	get_node("Tween").start()
	get_node("Timer").start();
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	get_node("Tween").interpolate_property(self,"rect_position",Vector2(978,643),Vector2(978,728),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	get_node("Tween").start()
	pass # replace with function body
