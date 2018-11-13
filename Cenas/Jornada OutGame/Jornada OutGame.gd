extends Control

var capAnt
var capAtual
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var tituloPasso =get_node("ControlTitulo/TItulo")
onready var textoPasso = get_node("Texto")

onready var controlTitulo=get_node("ControlTitulo")
onready var Imagem=get_node("Imagem")

var imagemJ=[preload("res://Elementos_Jogo/Imagens_Jornada/bordaimagem_Prancheta 1.png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (1).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (2).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (3).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (4).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (5).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (6).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (7).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (8).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (9).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (10).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (11).png"),
preload("res://Elementos_Jogo/Imagens_Jornada/imagem (12).png")


]

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

func _ready():
	liberar()
	ativarBotao()
	capAtual=global.capituloAtual;
	get_node("SkipText").set_disabled(false)
	tituloPasso.set_text(capituloT[global.capituloAtual])
	tituloPasso.set_visible_characters(0)
	get_node("TimerTitulo").start();
	textoPasso.set_text(dialogue[global.capituloAtual])
	textoPasso.set_visible_characters(0)
	get_node("TimerText").start();
	Imagem.set_texture(imagemJ[global.capituloAtual])
	capAnt=global.capituloAtual
	if global.capituloAtual==7 || global.capituloAtual==5:
		controlTitulo.set_position(Vector2(130,208));
	else:
		controlTitulo.set_position(Vector2(130,228));
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _on_TimerTitulo_timeout():
	tituloPasso.set_visible_characters(tituloPasso.get_visible_characters()+1);
	pass # replace with function body

func _on_TimerText_timeout():
	textoPasso.set_visible_characters(textoPasso.get_visible_characters()+1);
	pass # replace with function body


func _on_I_pressed():
	Imagem.set_texture(imagemJ[1])
	capAtual=1
	#get_node("titulopos").set_position(Vector2(100,100))
	controlTitulo.set_position(Vector2(130,228))
	tituloPasso.set_text(capituloT[1])
	textoPasso.set_text(dialogue[1])
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
	pass # replace with function body


func _on_I2_pressed():
	Imagem.set_texture(imagemJ[2])
	capAtual=2
	controlTitulo.set_position(Vector2(130,228))
	tituloPasso.set_text(capituloT[2])
	textoPasso.set_text(dialogue[2])
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
	Imagem.set_texture(imagemJ[3])
	capAtual=3
	controlTitulo.set_position(Vector2(130,228))
	tituloPasso.set_text(capituloT[3])
	textoPasso.set_text(dialogue[3])
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
	Imagem.set_texture(imagemJ[4])
	capAtual=4
	controlTitulo.set_position(Vector2(130,228))
	tituloPasso.set_text(capituloT[4])
	textoPasso.set_text(dialogue[4])
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
	Imagem.set_texture(imagemJ[5])
	capAtual=5
	tituloPasso.set_text(capituloT[5])
	controlTitulo.set_position(Vector2(130,208))
	textoPasso.set_text(dialogue[5])
	
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
	Imagem.set_texture(imagemJ[6])
	capAtual=6
	tituloPasso.set_text(capituloT[6])
	controlTitulo.set_position(Vector2(130,228))
	textoPasso.set_text(dialogue[6])
	
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
	Imagem.set_texture(imagemJ[7])
	capAtual=7
	controlTitulo.set_position(Vector2(130,208))
	tituloPasso.set_text(capituloT[7])
	
	textoPasso.set_text(dialogue[7])
	
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
	Imagem.set_texture(imagemJ[8])
	capAtual=8
	tituloPasso.set_text(capituloT[8])
	textoPasso.set_text(dialogue[8])
	controlTitulo.set_position(Vector2(130,228))
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
	Imagem.set_texture(imagemJ[9])
	capAtual=9
	tituloPasso.set_text(capituloT[9])
	textoPasso.set_text(dialogue[9])
	controlTitulo.set_position(Vector2(130,228))
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
	Imagem.set_texture(imagemJ[10])
	capAtual=10
	controlTitulo.set_position(Vector2(130,228))
	tituloPasso.set_text(capituloT[10])	
	textoPasso.set_text(dialogue[10])
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
	Imagem.set_texture(imagemJ[11])
	capAtual=11
	controlTitulo.set_position(Vector2(130,228))
	tituloPasso.set_text(capituloT[11])	
	textoPasso.set_text(dialogue[11])
	
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
	Imagem.set_texture(imagemJ[12])
	capAtual=12
	
	tituloPasso.set_text(capituloT[12])	
	textoPasso.set_text(dialogue[12])
	controlTitulo.set_position(Vector2(130,228))
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
	if global.capituloAtual==1:
		get_node("I").set_disabled(false);
		
	if global.capituloAtual==2:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		
	if global.capituloAtual==3:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		
	if global.capituloAtual==4:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		
	if global.capituloAtual==5:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		
	if global.capituloAtual==6:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		
	if global.capituloAtual==7:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		
	if global.capituloAtual==8:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		
	if global.capituloAtual==9:
		get_node("I").set_disabled(false);
		get_node("I2").set_disabled(false);
		get_node("I3").set_disabled(false);
		get_node("I4").set_disabled(false);
		get_node("I5").set_disabled(false);
		get_node("I6").set_disabled(false);
		get_node("I7").set_disabled(false);
		get_node("I8").set_disabled(false);
		get_node("I9").set_disabled(false);
		
	if global.capituloAtual==10:
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
	
	if global.capituloAtual==11:
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
		
	if global.capituloAtual==12:
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

func ativarBotao():
	if global.capituloAtual==1:
		get_node("I").set_pressed(true);
		
	if global.capituloAtual==2:
		get_node("I2").set_pressed(true);
		
	if global.capituloAtual==3:
		get_node("I3").set_pressed(true);
		
	if global.capituloAtual==4:
		get_node("I4").set_pressed(true);
		
	if global.capituloAtual==5:
		get_node("I5").set_pressed(true);
		
	if global.capituloAtual==6:
		get_node("I6").set_pressed(true);
		
	if global.capituloAtual==7:
		get_node("I7").set_pressed(true);
		
	if global.capituloAtual==8:
		get_node("I8").set_pressed(true);
	
	if global.capituloAtual==9:
		get_node("I9").set_pressed(true);
	
	if global.capituloAtual==10:
		get_node("I10").set_pressed(true);
		
	if global.capituloAtual==11:
		get_node("I11").set_pressed(true);
	
	if global.capituloAtual==12:
		get_node("I12").set_pressed(true);
	
	
	pass


func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn");
	pass # replace with function body


func _on_SkipText_pressed():
	
	tituloPasso.set_visible_characters(200)
	textoPasso.set_visible_characters(500)
	if tituloPasso.visible_characters>=200 || textoPasso.visible_characters>=500:
		get_node("SkipText").set_disabled(true);
	
	pass	
	
