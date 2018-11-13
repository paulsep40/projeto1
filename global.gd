extends Node

const ARQUIVO = "user://save.data"

#####################Arquétipos##############
var heroi=false
var sombra=false
var mentor=false
var arauto=false
var guardiaoDoLimiar=false
var camaleao=false
var aliado=false
#####################################################

#################################Maldade##############
var maldade=0;

func somarMaldade(x):
	if x==true:
		maldade=maldade+1;
	pass
	
#############################################################

############################### Progresso ##################
var capituloAtual=-1

#############################################################

########################## Salvar Cena #####################
var cena="res://Cenas/Menu/Menu.tscn"

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
		
		print("Sucesso ao carregar dados!")
	else:
		print("Erro ao carregar dados")
		
	Save.close()
	
	pass