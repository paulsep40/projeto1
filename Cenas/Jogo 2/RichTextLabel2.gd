extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var mostrar
var dialogue= ["Ariel não adotou o cachorro e ele ficou muito triste."]
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	mostrar =0
	set_bbcode(dialogue[0])
	set_visible_characters(0)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	if mostrar==0:
		set_visible_characters(get_visible_characters()+1);
	if mostrar ==1:
		set_visible_characters(get_visible_characters()-1);
	pass # replace with function body

func apagar():
	mostrar=1;