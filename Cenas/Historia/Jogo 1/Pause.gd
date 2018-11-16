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

func showit(x1,y1,x2,y2):
#	if valor==0:
#		self.hide();
#		pass
#	if valor==1:
#		self.show();
#		pass
	get_node("Tween").interpolate_property(self,"rect_scale",Vector2(x1,y1),Vector2(x2,y2),0.01,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	get_node("Tween").start();
	pass




