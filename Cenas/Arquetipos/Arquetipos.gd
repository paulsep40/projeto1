extends Control

onready var Texto_Arquetipo= get_node("Texto_Arquetipo")
onready var timerText=get_node("Timer_text_a")
onready var Imagem_Arquetipo = get_node("Imagem_Arquetipo")

var capAnt
var capAtual

var imagemA=[
preload("res://Elementos_Jogo/cartas Arquetipos/heroi.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/mentor.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/arauto.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/guardiao.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/camaleao.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/aliados.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/sombra.png"),
preload("res://Elementos_Jogo/cartas Arquetipos/picaro.png"),



]

var descricaoA=[
"Na jornada do herói, é ele quem guia a história, sai do mundo comum, atravessa o limiar e se sacrifica de alguma forma pelo bem comum. O herói é geralmente o protagonista em filmes (geralmente, não sempre) justamente por ser o personagem que mais gera identificação com o público.",
"É aquele que guia o herói, que ensina algo de valioso para que o herói possa prosseguir em sua jornada. O mentor geralmente é mais velho e mais sábio, pode ser um herói de uma jornada anterior e por isso tem muito a ensinar",
"O arauto é o arquétipo que empurra o herói a avançar na história, é ele quem traz uma notícia ou um acontecimento que impulsiona o herói para se lançar na aventura. Da mesma forma que o guardião do limiar, o arauto não precisa ser necessariamente um personagem, podendo ser um acontecimento, por exemplo.",
"O guardião do limiar é um dos desafios que o herói deve enfrentar para alcançar seu objetivo. Ele nem sempre aparece como personagem nas histórias, podendo ser um lugar, como uma ponte perigosa ou um ninho de serpentes, por exemplo. Em muitos casos, o guardião do limiar, quando atravessado se torna aliado do herói, mas ele também pode ser um aliado do vilão, um “capanga” que serve para preparar o herói para a batalha final.",
"O camaleão é um dos arquétipos mais difíceis e mais interessantes de se usar em uma narrativa. Ele, aos olhos do herói, está sempre mudando de forma e deixa a dúvida se é aliado dele ou do vilão da história. Muitas vezes o camaleão é apresentado como personagem do sexo oposto do herói, podendo ser seu par romântico.",
"Os aliados são os personagens que ajudam o Herói a seguir sua jornada e superar os desafios. é possível que o aliado seja, também, um Camaleão, Pícaro e até mesmo a Sombra, pode, até mesmo, ser os 3 ao mesmo tempo ",
"É o arquétipo do vilão ou inimigo do herói. Seu objetivo normalmente bate de frente com o objetivo do herói, ou seja, ele pretende destruí-lo. Sua grande função é instigar o herói e fazê-lo  se mover ao longo da história. Muitas vezes a sombra aparece como um reflexo negativo da personalidade do herói.",
"Também conhecido como alívio cômico, o arquétipo do pícaro serve exatamente para dar aquele alívio quando a história está tensa demais, porém outra característica importante do arquétipo de pícaro é que ele faz as suas piadas com tom de crítica, ou seja, fala de modo descontraído aquilo que ninguém mais tem coragem de falar."
]

func _ready():
	liberarButton()
	capAtual=0
	Texto_Arquetipo.set_text(descricaoA[0])
	Texto_Arquetipo.set_visible_characters(0)
	Imagem_Arquetipo.set_texture(imagemA[0])
	get_node("Heroi").set_pressed(true);
	timerText.start();
	capAnt=0
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	pass


func _on_Timer_text_a_timeout():
	Texto_Arquetipo.set_visible_characters(Texto_Arquetipo.get_visible_characters()+1);
	pass # replace with function body

func liberarButton():
	if global.mentor==true:
		get_node("Mentor").set_disabled(false);
	if global.arauto==true:
		get_node("Arauto").set_disabled(false);
	if global.guardiaoDoLimiar==true:
		get_node("Guardiao").set_disabled(false);
	if global.camaleao==true:
		get_node("Camaleao").set_disabled(false);
	if global.aliado==true:
		get_node("Aliados").set_disabled(false);
	if global.sombra==true:
		get_node("Sombra").set_disabled(false);
	if global.picaro==true:
		get_node("Picaro").set_disabled(false);
	
	pass

func _on_Heroi_pressed():
	Imagem_Arquetipo.set_texture(imagemA[0])
	capAtual=0
	Texto_Arquetipo.set_text(descricaoA[0])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(true);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(false);
	
	pass # replace with function body


func _on_Mentor_pressed():
	Imagem_Arquetipo.set_texture(imagemA[1])
	capAtual=1
	Texto_Arquetipo.set_text(descricaoA[1])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(true);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(false);
	pass # replace with function body


func _on_Arauto_pressed():
	Imagem_Arquetipo.set_texture(imagemA[2])
	capAtual=2
	Texto_Arquetipo.set_text(descricaoA[2])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:
	
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(true);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(false);
	pass # replace with function body


func _on_Guardiao_pressed():
	Imagem_Arquetipo.set_texture(imagemA[3])
	capAtual=3
	Texto_Arquetipo.set_text(descricaoA[3])
	get_node("Texto_Arquetipo").set_scale(Vector2(0.9,0.9))
	if capAtual!=capAnt:
	
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(true);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(false);
	pass # replace with function body


func _on_Camaleao_pressed():
	Imagem_Arquetipo.set_texture(imagemA[4])
	capAtual=4
	Texto_Arquetipo.set_text(descricaoA[4])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:
		
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(true);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(false);
	pass # replace with function body

func _on_Aliados_pressed():
	Imagem_Arquetipo.set_texture(imagemA[5])
	capAtual=5
	Texto_Arquetipo.set_text(descricaoA[5])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:
		
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(true);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(false);
	pass # replace with function body

func _on_Sombra_pressed():
	Imagem_Arquetipo.set_texture(imagemA[6])
	capAtual=6
	Texto_Arquetipo.set_text(descricaoA[6])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:

		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(true);
	get_node("Picaro").set_pressed(false);
	pass # replace with function body


func _on_Picaro_pressed():
	Imagem_Arquetipo.set_texture(imagemA[7])
	capAtual=7
	Texto_Arquetipo.set_text(descricaoA[7])
	get_node("Texto_Arquetipo").set_scale(Vector2(1,1))
	if capAtual!=capAnt:
	
		Texto_Arquetipo.set_visible_characters(0)
		capAnt=capAtual;
	
	get_node("Heroi").set_pressed(false);
	get_node("Mentor").set_pressed(false);
	get_node("Arauto").set_pressed(false);
	get_node("Guardiao").set_pressed(false);
	get_node("Camaleao").set_pressed(false);
	get_node("Aliados").set_pressed(false);
	get_node("Sombra").set_pressed(false);
	get_node("Picaro").set_pressed(true);
	pass # replace with function body





func _on_skipText_pressed():
	Texto_Arquetipo.set_visible_characters(500)
	pass # replace with function body


func _on_Voltar_pressed():
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn");
	pass # replace with function body
