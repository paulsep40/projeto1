extends Node

var cheated=false
var played=false
var musicaTocando

const ARQUIVO = "user://save.data"

var MainBg=preload("res://Elementos_Jogo/Backgrounds/tutorial.jpeg")
var somAmbiente=preload("res://sounds/silence sound effect empty room.ogg")
#####################Arquétipos##############
var heroi=false
var sombra=false
var mentor=false
var arauto=false
var guardiaoDoLimiar=false
var camaleao=false
var aliado=false
var picaro=false
#####################################################

#################################Maldade##############
var maldade=0;

func somarMaldade(x):
	if x==true:
		maldade=maldade+1;
	pass
################################################################
########################## Bençãos e escudo ######################
var escudo = false

var Fogo= false
var Terra = false
var Agua = false
var Ar = false




#############################################################

############################### Progresso ##################
var capituloAtual=-1

#############################################################

########################## Salvar Cena #####################
var cena="res://Cenas/Menu/Menu.tscn"
######################################
var volumefx=0
var volumemusica=0
var volumeAmbiete=-8
var tamanhotela=3
######################################

func salvar_dados():
	
	var Save = File.new()
	var erro = Save.open(ARQUIVO, File.WRITE)
	var dados = {
		
	"capitulo" : global.capituloAtual,
	"Cena": global.cena,
	
	#####################Arquetipos###################
	"heroi": global.heroi,
	"sombra": global.sombra,
	"mentor": global.mentor,
	"arauto": global.arauto,
	"Guardiao": global.guardiaoDoLimiar,
	"camaleao": global.camaleao,
	"aliado": global.aliado,
	"picaro": global.picaro,
	#################### bencaos ####################
	
	"fogo": global.Fogo,
	"terra": global.Terra,
	"agua": global.Agua,
	"ar": global.Ar,
	
	"escudo": global.escudo,
	"somAmbiente": global.somAmbiente,
	"MusicaTocando": global.musicaTocando,
	"backgroundAtual": global.MainBg
	}
	if not erro:
		Save.store_var(dados)
		print("Sucesso ao salvar dados!")
	else:
		print("Erro ao salvar dados")
		
	Save.close()
	
	pass
	
func carregar_dados():
	
	var Save = File.new()
	var erro = Save.open(ARQUIVO, File.READ)
		
	if not erro:
		var dados_salvos = Save.get_var()
		
		global.cena=dados_salvos["Cena"]
		global.capituloAtual=dados_salvos["capitulo"]
		
		global.heroi=dados_salvos["heroi"]
		global.sombra=dados_salvos["sombra"]
		global.mentor=dados_salvos["mentor"]
		global.arauto=dados_salvos["arauto"]
		global.guardiaoDoLimiar=dados_salvos["Guardiao"]
		global.camaleao=dados_salvos["camaleao"]
		global.aliado=dados_salvos["aliado"]
		global.picaro=dados_salvos["picaro"]
		
		global.Fogo=dados_salvos["fogo"]
		global.Terra=dados_salvos["terra"]
		global.Agua=dados_salvos["agua"]
		global.Ar=dados_salvos["ar"]
		
		global.escudo=dados_salvos["escudo"]
		
		global.MainBg=dados_salvos["backgroundAtual"]
		global.somAmbiente=dados_salvos["somAmbiente"]
		global.musicaTocando=dados_salvos["MusicaTocando"]
		print("Sucesso ao carregar dados!")
	else:
		print("Erro ao carregar dados")
		
	Save.close()
	
	pass
	
	
	