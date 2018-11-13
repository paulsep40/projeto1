extends Control
var place = 0
var irPara

var IsPaused=-1

var JornadaIsOn=-1

const cardTextD="Ariel adota o cachorrinho"
const cardTextE="Negar o cachorrinho"

const trocaCenaE="res://Cenas/Jogo 2/Jogo2.tscn"
const trocaCenaD="res://Cenas/Jogo 3/Jogo3.tscn"

var changebg=true;

var somarMaldade=false;

onready var CardNode= get_node("Card_Control")
onready var TextNode= get_node("Card_Control/Text_Control")
onready var TextLabel= get_node("Card_Control/Text_Control/Card_Label")
onready var TimerNode= get_node("Card_Control/Timer")
onready var TimerNodeScene= get_node("TimerChangeScene")
onready var ApagarTexto=get_node("Narrativa_Control/RichTextLabel")
onready var ShowJornada= get_node("Jornada InGame")
onready var soundArrastar=get_node("Sound_arrastar")
onready var soundPassar=get_node("Sound_passar")
onready var Maldade=get_node("Maldade")
onready var AtivarArquetipo=get_node("ArquetiposControl");

const ARQUIVO = "user://save.data"

var cena = self.get_script().get_path()


func _ready():
	Maldade.somarMaldade(somarMaldade)
	soundPassar.play();
	CardNode.mover(-200,-200,620,661,-90,0)
	get_node("TrofeuArquetipo").subir_Trofeu();
	print(cena)
	
	#AtivarArquetipo.heroi=true
	
	
	
	pass
	
	


func _on_ButtonL_mouse_entered():
	soundArrastar.play();
	if place==0:
		CardNode.rotacao(620,580,0,-15,0.25)
		TextLabel.set_text(cardTextE)
		TextNode.aparecer(0.25);
		
	if place==2:
		CardNode.rotacao(660,580,15,-15,0.5)
		TextNode.sumir(0.25);
		
	pass # replace with function body


func _on_ButtonL_mouse_exited():
	
	place=1;
	pass # replace with function body


func _on_ButtonC_mouse_entered():
	TimerNode.start();
	
	pass # replace with function body
	
func _on_ButtonC_mouse_exited():
	TimerNode.stop();
	
	pass # replace with function body
	


func _on_ButtonR_mouse_entered():
	soundArrastar.play();
	if place==0:
		CardNode.rotacao(620,660,0,15,0.25)
		TextLabel.set_text(cardTextD)
		TextNode.aparecer(0.25);
	
	if place==1:
		CardNode.rotacao(580,660,-15,15,0.5)
		TextNode.sumir(0.25);		
	
	pass # replace with function body


func _on_ButtonR_mouse_exited():
	place=2;
	
	pass # replace with function body





func _on_Timer_timeout():
	
	if place==2:
		CardNode.rotacao(660,620,15,0,0.25)
		TextNode.sumir(0.25);
		soundArrastar.play();
	if place==1:
		CardNode.rotacao(580,620,-15,0,0.25)
		TextNode.sumir(0.25);
		soundArrastar.play();
	place=0;
	TimerNode.stop();
	pass # replace with function body




func _on_Text_Tween_Sumir_tween_completed(object, key):
	if place==1:
		TextLabel.set_text(cardTextD)
		TextNode.aparecer(0.25)
	if place ==2:
		TextLabel.set_text(cardTextE)
		TextNode.aparecer(0.25)
	pass # replace with function body


func _on_ButtonL_pressed():
	irPara=0
	TimerNodeScene.start()
	ApagarTexto.apagar()
	CardNode.mover(580,661,200,900,-15,-90)
	get_node("Change_bg").chageBGAnimation(changebg,0,1280)
	soundPassar.play();
	pass # replace with function body


func _on_ButtonR_pressed():
	irPara=1
	ApagarTexto.apagar()
	TimerNodeScene.start()
	CardNode.mover(660,661,1040,900,15,90)
	get_node("Change_bg").chageBGAnimation(changebg,0,-1280)
	soundPassar.play();
	pass # replace with function body



func _on_TimerChanceScene_timeout():
	if irPara ==0:
		get_tree().change_scene(trocaCenaE);
	if irPara ==1:
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
	salvar_dados();
	get_tree().change_scene("res://Cenas/Menu/Menu.tscn")
	pass # replace with function body


func salvar_dados():
	var ArquetiposNode=get_node("ArquetiposControl")
	var Save = File.new()
	var erro = Save.open(ARQUIVO, File.WRITE)
	var dados = {
		
	"capitulo" : get_node("Jornada InGame/Control_Progress").capituloAtual,
	"Cena": cena,
	
	#####################Arquetipos###################
	"heroi": ArquetiposNode.heroi,
	"sombra": ArquetiposNode.sombra,
	"mentor": ArquetiposNode.mentor,
	"arauto": ArquetiposNode.mentor,
	"Guardiao": ArquetiposNode.guardiaoDoLimiar,
	"metamorfo": ArquetiposNode.metamorfo,
	"aliado": ArquetiposNode.aliado,
	}
	
	if not erro:
		Save.store_var(dados)
		print("Sucesso ao salvar dados!")
	else:
		print("Erro ao salvar dados")
		
	Save.close()
	
	pass
	
	
	
	
	
	

