extends Control



onready var TextTweenSumir=get_node("Text_Tween_Sumir")
onready var TextTweenAparecer=get_node("Text_Tween_Aparecer")
	
func aparecer(tempo):
	TextTweenAparecer.interpolate_property(self, "rect_scale",Vector2(0,0), Vector2(2,2), tempo, Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT )
	TextTweenAparecer.start();
	
func sumir(tempo):
	TextTweenSumir.interpolate_property(self, "rect_scale",Vector2(2,2), Vector2(0,0), tempo, Tween.TRANS_ELASTIC,Tween.EASE_IN_OUT )
	TextTweenSumir.start();