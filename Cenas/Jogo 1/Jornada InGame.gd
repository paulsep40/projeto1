extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var capAnt
var capAtual

onready var TweenJornada= get_node("Tween")
onready var ButtonI= get_node("I")
onready var ButtonI2= get_node("I2")

onready var titulopos = get_node("titulopos")
onready var tituloPasso =get_node("titulopos/tituloCap")
onready var textoPasso = get_node("Texto")
onready var CapituloInicial=get_node("Control_Progress")

var capituloT=["",
"Mundo Comum",
"O Chamado da Aventura",
"Recusa do Chamado",
"Encontro com o Mentor",
"Travessia do Primeiro Limiar",
"Testes, Aliados e Inimigos",
"Aproximação da Caverna Oculta",
"Provação",
"Recompensa",
"O Caminho de Volta",
"Ressurreição",
"Retorno com o Elixir"]

var dialogue= ["",
"Como era sua vida antes de você entrar naquele negócio ou surgir aquela ideia. Aquela mundo onde o herói vive uma vida sem saber de nada que vai acontecer. É onde você mostra o estado natural daquele ambiente.",
"Explique porque você tentou começar aquele negócio ou o que o levou a ter aquela ideia. É um momento onde a aventura do herói começa, onde a velha vida começa a ficar para trás.",
"Acostumado com o seu antigo mundo, o herói deixa de lado o que virá e tenta (em vão) voltar a ser o que era.",
"Quem inspirou você? Quem te colocou naquele caminho? O que o levou a eles? O momento onde você ganha um guia que o prepara para a jornada e que te auxiliará no decorrer da trajetória.",
"O herói ultrapassa uma barreira física ou psicológica que não o permite mais voltar atrás. Talvez aquele momento onde sua ideia toma forma de um jeito que não pode mais ser abandonada, ou seu novo negócio ganha vida.",
"Sua aventura ganha obstáculos e dificuldades, mas também ganha parceiros. Que lições você tira de cada barreira que surge em sua frente?",
"Aquele momento em que é tudo ou nada se aproxima. O herói enxerga esse obstáculo maior e você percebe o quanto isso pode colocar em risco a vida do herói",
"O heróis é desafiado em termos de vida ou morte. Ou ele saí dali vivo e ainda mais forte, ou falha em sua jornada. Quase sempre a provação é um desafio que nasce aos poucos, o resultado de um trabalho narrativo que começa ou é apresentado em um momento anterior, assim seu tamanho ou periculosidade vai aumentando aos poucos. Todos têm pavor da provação desde o começo da história.",
"O herói sobrevive àquela provação, sua ideia não morre diante daquele desafio ou sua nova empresa continua à toda depois daquele momento de tensão. E disso o heróis trás com ele um ensinamento ou experiência específica que lhe ajudará para um desafio final.",
"O herói pega o caminho de volta para casa, para o mundo ordinário. Você sente que não terá mais problemas ou desafios e seu caminho está completo.",
"Pode ser em teoria ou na prática, sua ideia, empresa ou o herói voltam a sua jornada ao descobrirem que ela não terminou ainda. Um último desafio surge, um onde ele terá que usar todos conhecimentos e ensinamentos que ganhou na jornada para enfrentar esse inimigo.",
"E nesse caso pode ser algo figurado, um elixir, um conhecimento, uma ferramenta, uma força. Qualquer coisa que o herói tenha ganhado depois de enfrentar seu maior desafio. Com ela em mãos, o heróis volta a sua vida ordinária, mas agora com a possibilidade de ajudar os próximos com esse conhecimento ou melhorar a vida de todos ao seu redor."]

func preparar():
	liberar()
	ativarBotao()
	tituloPasso.set_bbcode(capituloT[CapituloInicial.capituloAtual])
	tituloPasso.set_visible_characters(0)
	get_node("TimerTitulo").start();
	textoPasso.set_bbcode(dialogue[CapituloInicial.capituloAtual])
	textoPasso.set_visible_characters(0)
	get_node("TimerText").start();
	get_node("SkipText").set_disabled(false)
	if CapituloInicial.capituloAtual==7:
		titulopos.set_position(Vector2(110,466))
	else:
		titulopos.set_position(Vector2(110,488))
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _on_TimerTitulo_timeout():
	tituloPasso.set_visible_characters(tituloPasso.get_visible_characters()+1);
	pass # replace with function body


func _on_TimerText_timeout():
	textoPasso.set_visible_characters(textoPasso.get_visible_characters()+1);
	pass # replace with function body

func moverJornada(y1,y2):
	
	TweenJornada.interpolate_property(self,"rect_position",Vector2(0,y1), Vector2(0,y2),0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT);
	TweenJornada.start();
	pass



#func _on_I_toggled(button_pressed):
#	get_node("I").set_pressed(true);
#	pass # replace with function body
#
#
#func _on_I2_toggled(button_pressed):
#	get_node("I2").set_pressed(true);
#	pass # replace with function body


func _on_I_pressed():
	capAtual=1
	#get_node("titulopos").set_position(Vector2(100,100))
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[1])
	textoPasso.set_bbcode(dialogue[1])
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(true);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass #nction body


func _on_I2_pressed():
	capAtual=2
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[2])
	textoPasso.set_bbcode(dialogue[2])
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(true);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I3_pressed():
	capAtual=3
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[3])
	textoPasso.set_bbcode(dialogue[3])
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;

	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(true);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I4_pressed():
	capAtual=4
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[4])
	textoPasso.set_bbcode(dialogue[4])
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;

	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(true);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I5_pressed():
	capAtual=5
	tituloPasso.set_bbcode(capituloT[5])
	titulopos.set_position(Vector2(110,488))
	textoPasso.set_bbcode(dialogue[5])
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(true);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I6_pressed():
	capAtual=6
	tituloPasso.set_bbcode(capituloT[6])
	titulopos.set_position(Vector2(110,488))
	textoPasso.set_bbcode(dialogue[6])
	
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(true);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I7_pressed():
	capAtual=7
	tituloPasso.set_bbcode(capituloT[7])
	titulopos.set_position(Vector2(110,466))
	textoPasso.set_bbcode(dialogue[7])
	
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(true);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I8_pressed():
	capAtual=8
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[8])
	textoPasso.set_bbcode(dialogue[8])

	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(true);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I9_pressed():
	capAtual=9
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[9])
	textoPasso.set_bbcode(dialogue[9])
	
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(true);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I10_pressed():
	capAtual=10
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[10])	
	textoPasso.set_bbcode(dialogue[10])
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(true);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I11_pressed():
	capAtual=11
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[11])	
	textoPasso.set_bbcode(dialogue[11])
	
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(true);
	get_node("I12").set_pressed(false);
	pass # replace with function body


func _on_I12_pressed():
	capAtual=12
	titulopos.set_position(Vector2(110,488))
	tituloPasso.set_bbcode(capituloT[12])	
	textoPasso.set_bbcode(dialogue[12])
	
	if capAtual!=capAnt:
		tituloPasso.set_visible_characters(0)
		textoPasso.set_visible_characters(0)
		get_node("SkipText").set_disabled(false)
		capAnt=capAtual;
	
	get_node("I").set_pressed(false);
	get_node("I2").set_pressed(false);
	get_node("I3").set_pressed(false);
	get_node("I4").set_pressed(false);
	get_node("I5").set_pressed(false);
	get_node("I6").set_pressed(false);
	get_node("I7").set_pressed(false);
	get_node("I8").set_pressed(false);
	get_node("I9").set_pressed(false);
	get_node("I10").set_pressed(false);
	get_node("I11").set_pressed(false);
	get_node("I12").set_pressed(true);
	pass # replace with function body
	
	
	
func liberar():
	if CapituloInicial.capituloAtual==1:
		get_node("I").set_disabled(false);
		
	if CapituloInicial.capituloAtual==2:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		
	if CapituloInicial.capituloAtual==3:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		
	if CapituloInicial.capituloAtual==4:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		
	if CapituloInicial.capituloAtual==5:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		
	if CapituloInicial.capituloAtual==6:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		
	if CapituloInicial.capituloAtual==7:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		
	if CapituloInicial.capituloAtual==8:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		
	if CapituloInicial.capituloAtual==9:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		get_node("I9").set_disabled(false);
		
	if CapituloInicial.capituloAtual==10:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		get_node("I9").set_disabled(false);
		get_node("I10").set_disabled(false);
	
	if CapituloInicial.capituloAtual==11:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		get_node("I9").set_disabled(false);
		get_node("I10").set_disabled(false);
		get_node("I11").set_disabled(false);
		
	if CapituloInicial.capituloAtual==12:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		get_node("I9").set_disabled(false);
		get_node("I10").set_disabled(false);
		get_node("I11").set_disabled(false);
		get_node("I12").set_disabled(false);
	
	pass
	
func ativarBotao():
	if CapituloInicial.capituloAtual==1:
		get_node("I").set_pressed(true);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==2:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(true);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==3:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(true);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==4:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(true);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==5:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(true);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==6:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(true);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==7:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(true);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==8:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(true);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
	
	if CapituloInicial.capituloAtual==9:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(true);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
	
	if CapituloInicial.capituloAtual==10:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(true);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(false);
		
	if CapituloInicial.capituloAtual==11:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(true);
		get_node("I12").set_pressed(false);
	
	if CapituloInicial.capituloAtual==12:
		get_node("I").set_pressed(false);
		get_node("I2").set_pressed(false);
		get_node("I3").set_pressed(false);
		get_node("I4").set_pressed(false);
		get_node("I5").set_pressed(false);
		get_node("I6").set_pressed(false);
		get_node("I7").set_pressed(false);
		get_node("I8").set_pressed(false);
		get_node("I9").set_pressed(false);
		get_node("I10").set_pressed(false);
		get_node("I11").set_pressed(false);
		get_node("I12").set_pressed(true);
	
	
	pass





func _on_SkipText_pressed():
	
	tituloPasso.set_visible_characters(200)
	textoPasso.set_visible_characters(500)
	if tituloPasso.visible_characters>=200 || textoPasso.visible_characters>=500:
		get_node("SkipText").set_disabled(true);
	
	pass	