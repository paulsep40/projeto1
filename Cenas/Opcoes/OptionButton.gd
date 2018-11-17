extends OptionButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.add_item("853 X 480",0)
	self.add_item("1000 X 562",1)
	self.add_item("1280 X 720", 2)
	self.add_item("1920 X 1080", 3)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
