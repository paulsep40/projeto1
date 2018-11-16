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
onready var Imagem=get_node("ImagemDentro")

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
"É onde conhecemos o herói e seu mundo. É aqui que observamos a interação dele com outros personagens, compreendemos sua rotina e seus problemas. ",
"É onde surge uma oportunidade, um objetivo ou uma missão que pode (ou não) ser trazida por um Arauto. Aqui é onde o herói percebe que algo em seu Mundo comum está diferente.",
"Quando o herói não embarca na jornada recém descoberta. Pode ser por medo, orgulho, ou por intervenção de outro personagem.",
"O herói então encontra alguém que vai ajudá-lo. O mentor deve guiar e preparar o herói, concedendo ou ensinando novas habilidades que o irão ajudar na jornada. ",
"A entrada Real na aventura. A primeira vez que o herói percebe não pode mais voltar atrás. Pode ser representado por um portal, um muro, ou um simples aviso.",
"É o capítulo mais longo da jornada. É onde ocorre a evolução do herói (para o bem ou para o mal!) E onde se encontram aliados e obstáculos.",
"O momento de tensão, sensação de ''medo de palco''. Chegada no local mais perigoso do mundo especial. É aqui que o herói se prepara e pega o que precisa para o confronto.",
"O momento que o herói joga com a sorte, onde Ele enfrentará seu maior medo. Momento crítico da história. O mundo e a motivação do herói estão em jogo.",
"Conquista, Celebração. É nesse ponto que o Herói atinge seu objetivo ou meta. Um momento de alívio ou de tensão que evidencia a importância de sua provação.",
"Aqui é onde o herói lida com as consequências da Provação. Geralmente pode vir seguida de uma Perseguição do inimigo ou uma Fuga para voltar ao mundo comum.",
"O que foi perdido ou danificado durante a provação é recuperado. Nem sempre a ressurreição diz respeito ao herói, mas, como todos os estágios desta jornada, o impacta profundamente.",
"Chegada ao Mundo Comum com Conhecimento e/ou um tesouro. Liberdade, objetivo alcançado. A paz e o equilíbrio são restaurados. O herói agora pode viver em paz com seus feitos"]

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

func preparar():
	liberar()
	ativarBotao()
	tituloPasso.set_text(capituloT[global.capituloAtual])
	tituloPasso.set_visible_characters(0)
	get_node("TimerTitulo").start();
	textoPasso.set_text(dialogue[global.capituloAtual])
	textoPasso.set_visible_characters(0)
	get_node("TimerText").start();
	get_node("SkipText").set_disabled(false)
	Imagem.set_texture(imagemJ[global.capituloAtual])
	if global.capituloAtual==7 || global.capituloAtual==5:
		titulopos.set_position(Vector2(110,133))
	else:
		titulopos.set_position(Vector2(110,151))
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
	Imagem.set_texture(imagemJ[1])
	titulopos.set_position(Vector2(110,151))
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
	pass #nction body


func _on_I2_pressed():
	Imagem.set_texture(imagemJ[2])
	capAtual=2
	titulopos.set_position(Vector2(110,151))
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
	titulopos.set_position(Vector2(110,151))
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
	titulopos.set_position(Vector2(110,151))
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
	titulopos.set_position(Vector2(110,133))
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
	titulopos.set_position(Vector2(110,151))
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
	tituloPasso.set_text(capituloT[7])
	titulopos.set_position(Vector2(110,133))
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
	titulopos.set_position(Vector2(110,151))
	tituloPasso.set_text(capituloT[8])
	textoPasso.set_text(dialogue[8])

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
	titulopos.set_position(Vector2(110,151))
	tituloPasso.set_text(capituloT[9])
	textoPasso.set_text(dialogue[9])
	
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
	titulopos.set_position(Vector2(110,151))
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
	titulopos.set_position(Vector2(110,151))
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
	titulopos.set_position(Vector2(110,151))
	tituloPasso.set_text(capituloT[12])	
	textoPasso.set_text(dialogue[12])
	
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
	
	pass
	
func ativarBotao():
	if global.capituloAtual==1:
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
		
	if global.capituloAtual==2:
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
		
	if global.capituloAtual==3:
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
		
	if global.capituloAtual==4:
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
		
	if global.capituloAtual==5:
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
		
	if global.capituloAtual==6:
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
		
	if global.capituloAtual==7:
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
		
	if global.capituloAtual==8:
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
	
	if global.capituloAtual==9:
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
	
	if global.capituloAtual==10:
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
		
	if global.capituloAtual==11:
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
	
	if global.capituloAtual==12:
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