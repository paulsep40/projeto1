extends Control
var place = 0
var irPara

var IsPaused=-1

var JornadaIsOn=-1

var cardTextE="Negar o cachorrinho"
var cardTextD="Ariel adota o cachorrinho"
var trocaCenaE="res://Cenas/Jogo 2/Jogo2.tscn"
var trocaCenaD="res://Cenas/Jogo 3/Jogo3.tscn"
var trocaCenaAlteradoE
var trocaCenaAlteradoD
var changebgE
var changebgD
var somarMaldadeE
var somarMaldadeD
var alterarCaminho
var trocarMusica
var audioMusica

var pode_mexer=false

onready var CardNode= get_node("Card_Control")
onready var TextNode= get_node("Card_Control/Text_Control")
onready var TextLabel= get_node("Card_Control/Text_Control/Card_Label")
onready var TimerNode= get_node("Card_Control/Timer")
onready var TimerNodeScene= get_node("TimerChangeScene")
onready var ApagarTexto=get_node("Narrativa_Control/RichTextLabel")
onready var ShowJornada= get_node("Jornada InGame")









func _ready():
	

###########################################################
	################### VARIÁVEIS PARA ALTERAR ##############

	global.cena = "res://Cenas/Historia/Jogo 57/Jogo57.tscn" #aqui se põe o caminho para essa cena no jogo
	global.capituloAtual=3 #Aqui coloque o ponto da jornada em que o jogador está
	
	trocarMusica=false #aqui você altera  para TRUE se quiser mudar a música da cena
	audioMusica=preload("res://sounds/musicaMenu.ogg") #aqui você põe o caminho da música que você quer
	
	changebgE=false #Mude para TRUE se quando o jogador escolher ESQUERDA o bg muda
	changebgD=false #Mude para TRUE se quando o jogador escolher ESQUERDA o bg muda
	
	cardTextE="Bater na porta" #Texto quando o jogador por o mouse no lado ESQUERDO (ponha entre aspas "")
	trocaCenaE="res://Cenas/Historia/Jogo 58/Jogo58.tscn" #Para que cena o jogador vai se escolher o lado ESQUERDO (ponha entre aspas "")
	cardTextD="Bater na porta" #Texto quando o jogador por o mouse no DIREITO (ponha entre aspas "")
	trocaCenaD="res://Cenas/Historia/Jogo 58/Jogo58.tscn" #Para que cena o jogador vai se escolher o lado DIREITO (ponha entre aspas "")
	
	somarMaldadeE=false #Mude para TRUE se essa escolha soma maldade para o personagem

	somarMaldadeD=false #Mude para TRUE se essa escolha soma maldade para o personagem
	alterarCaminho=false #altere para TRUE se essa for a cena que muda o caminho do personagem dependendo da maldade
	trocaCenaAlteradoE="res://Cenas/Menu/Menu.tscn"
	trocaCenaAlteradoD="res://Cenas/Menu/Menu.tscn"
	
	get_node("TrofeuArquetipo").subir_Trofeu(false); #mude para TRUE se ele encontrar algum arquétipo
	get_node("TrofeuArquetipo/LabelArquetipo").set_text("Arquétipo encontrado: Herói") #Mude para o nome do arquétipo que o usuário encontrou
	
	##############Aqui você vai descomentar o ARQUÉTIPO que o herói encontrou nessa cena#################
	#global.heroi=true
	#global.sombra=true
	#global.mentor=true
	#global.arauto=true
	#global.guardiaoDoLimiar=true
	#global.aliado=true
	#global.camaleao=true
	#global.picaro=true
	##############################################################
	####################### Aqui são as Bençãos ####################
	#global.Fogo=true
	#global.Terra=true
	#global.Agua=true
	#global.Ar=true

	#global.escudo=true
	
	
	###########################################################################################
	####################################### FIM das Variáveis para Alterar######################









#	soundAmbience.set_stream(global.somAmbiente)
#	soundAmbience.play()
	
	Sound_passar.play();
	CardNode.mover(-200,-200,620,661,-90,0)
	mudaMusica(trocarMusica,global.musicaTocando)
	global.salvar_dados();
	soundAmbience.play()
	pass
	
	


func _on_ButtonL_mouse_entered():
	if pode_mexer==true:
		Sound_arrastar.play();
		if place==0:
			CardNode.rotacao(620,580,0,-8,0.25)
			TextLabel.set_text(cardTextE)
			TextNode.aparecer(0.25);
			
		if place==2:
			CardNode.rotacao(660,580,8,-8,0.5)
			TextNode.sumir(0.25);
		
	pass # replace with function body


func _on_ButtonL_mouse_exited():
	if pode_mexer==true:
		place=1;
	pass # replace with function body


func _on_ButtonC_mouse_entered():
	if pode_mexer==true:
		TimerNode.start();
	
	pass # replace with function body
	
func _on_ButtonC_mouse_exited():
	TimerNode.stop();
	
	pass # replace with function body
	
func _on_RichTextLabel_mouse_entered():
	if pode_mexer==true:
		TimerNode.start();
	pass # replace with function body


func _on_RichTextLabel_mouse_exited():
	TimerNode.stop();
	pass # replace with function body
	


func _on_ButtonR_mouse_entered():
	if pode_mexer==true:
		Sound_arrastar.play();
		if place==0:
			CardNode.rotacao(620,660,0,8,0.25)
			TextLabel.set_text(cardTextD)
			TextNode.aparecer(0.25);
		
		if place==1:
			CardNode.rotacao(580,660,-8,8,0.5)
			TextNode.sumir(0.25);
	
	pass # replace with function body


func _on_ButtonR_mouse_exited():
	if pode_mexer==true:
		place=2;
	
	pass # replace with function body





func _on_Timer_timeout():
	
	if place==2:
		CardNode.rotacao(660,620,8,0,0.25)
		TextNode.sumir(0.25);
		Sound_arrastar.play();
	if place==1:
		CardNode.rotacao(580,620,-8,0,0.25)
		TextNode.sumir(0.25);
		Sound_arrastar.play();
	place=0;
	TimerNode.stop();
	pass # replace with function body




#warning-ignore:unused_argument
#warning-ignore:unused_argument
func _on_Text_Tween_Sumir_tween_completed(object, key):
	if place==1:
		TextLabel.set_text(cardTextD)
		TextNode.aparecer(0.25)
	if place ==2:
		TextLabel.set_text(cardTextE)
		TextNode.aparecer(0.25)
	pass # replace with function body


func _on_ButtonL_pressed():
	if pode_mexer==true:
		global.somarMaldade(somarMaldadeE)
		irPara=0
		TimerNodeScene.start()
		ApagarTexto.apagar()
		CardNode.mover(580,661,200,900,-8,-90)
		get_node("Change_bg").chageBGAnimation(changebgE,0,1280)
		Sound_passar.play();
	pass # replace with function body


func _on_ButtonR_pressed():
	if pode_mexer==true:
		global.somarMaldade(somarMaldadeD)
		irPara=1
		ApagarTexto.apagar()
		TimerNodeScene.start()
		CardNode.mover(660,661,1040,900,8,90)
		get_node("Change_bg").chageBGAnimation(changebgD,0,-1280)
		Sound_passar.play();
	pass # replace with function body



func _on_TimerChanceScene_timeout():
	if irPara ==0:
		if alterarCaminho==true && global.maldade>=5:
#warning-ignore:return_value_discarded
			get_tree().change_scene(trocaCenaAlteradoE);
		else:
#warning-ignore:return_value_discarded
			get_tree().change_scene(trocaCenaE);
			
	if irPara ==1:
		if alterarCaminho==true && global.maldade>=5:
#warning-ignore:return_value_discarded
			get_tree().change_scene(trocaCenaAlteradoD);
		else:
#warning-ignore:return_value_discarded
			get_tree().change_scene(trocaCenaD);
	pass # replace with function body



func _on_Botao_Jornada_pressed():
	ShowJornada.moverJornada(-720,0)
	ShowJornada.preparar();
	IsPaused=2;
	JornadaIsOn=1;
	pass # replace with function body


func _on_Voltar_pressed():
	if JornadaIsOn==1:
		ShowJornada.moverJornada(0,-720)
		JornadaIsOn=-1
		get_node("Jornada InGame/Timer Atalho").start();
	
	pass # replace with function body


func _on_VoltarOpo2_pressed():
	ShowJornada.moverJornada(0,-720);
	IsPaused=-1;
	JornadaIsOn=-1
	pass # replace with function body



func _on_Continuar_pressed():
	get_node("Pause").showit(1,1,0,0);
	IsPaused=IsPaused*-1;
	pass # replace with function body


func _on_Pause_Button_pressed():
	
	if IsPaused==-1:
		get_node("Pause").showit(0,0,1,1);
		
		
	if IsPaused==+1:
		get_node("Pause").showit(1,1,0,0);
		
	IsPaused=IsPaused*-1;
	pass # replace with function body


func _on_Timer_Atalho_timeout():
	IsPaused=-1
	print (IsPaused);
	pass # replace with function body


func _on_Salvar_e_Sair_pressed():
	global.salvar_dados();
#warning-ignore:return_value_discarded
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")
	pass # replace with function body


func mudaMusica(tf,som):
	if tf==true:
		Musica.set_stream(som)
		Musica.play();
	pass


	
	
	
	
	
	
	
	

########################## OPÇÕES INGAME #####################

func _on_VoltarOp_pressed():
	get_node("Pause/opcao").hide()
	get_node("Pause/opcao/TimerOpcao").start()
	get_node("Pause/opcao/Control tamanho da tela/Selecoes").hide()
	get_node("Pause/opcao").SelecaoIsOn=false;
	pass # replace with function body


func _on_TimerOpcao_timeout():
	IsPaused=1
	pass # replace with function body
	
func _on_Settings_pressed():
	get_node("Pause/opcao").show()
	IsPaused=2
	pass # replace with function body




func _on_VoltarAj_pressed():
	get_node("Pause/Ajuda").hide()
	get_node("Pause/Ajuda/TimerAjuda").start()
	pass # replace with function body


func _on_TimerAjuda_timeout():
	IsPaused=1
	pass # replace with function body


func _on_Help_pressed():
	get_node("Pause/Ajuda").show()
	IsPaused=2
	pass # replace with function body




func _on_TimerMover_timeout():
	pode_mexer=true;
	pass # replace with function body




