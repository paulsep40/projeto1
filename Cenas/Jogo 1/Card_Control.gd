extends Control



onready var TweenNode= get_node("Tween")
onready var TweenMover= get_node("TweenMover")

func rotacao(x1,x2, inicial, final, tempo):
	TweenNode.interpolate_property(self, "rect_rotation",inicial, final, tempo, Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT )
	TweenNode.interpolate_property(self, "rect_position",Vector2(x1,661), Vector2(x2,661), tempo, Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT )
	TweenNode.start();
	pass

func mover(x1,y1,x2,y2,inicial, final):
	
	TweenNode.interpolate_property(self, "rect_rotation",inicial, final, 1, Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT )
	TweenNode.interpolate_property(self, "rect_position",Vector2(x1,y1), Vector2(x2,y2), 1, Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT )
	TweenNode.start();
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
