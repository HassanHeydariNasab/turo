extends Control

onready var Rugxa = get_node("Rugxa")
onready var Ambra = get_node("Ambra")
onready var Verda = get_node("Verda")
onready var Blua = get_node("Blua")
onready var Viola = get_node("Viola")
onready var Nigra = get_node("Nigra")

func _init():
	var lingvo = T.Agordejo.get_value("Lingvo", "lingvo")
	if TranslationServer.get_locale() != lingvo:
		TranslationServer.set_locale(lingvo)

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	get_node(T.Agordejo.get_value("Koloro", "koloro", "Nigra")).set_pressed(true)

func _on_Ludu_pressed():
	get_tree().change_scene("res://Radiko.tscn")

func _on_Lingvo_pressed():
	get_tree().change_scene("res://Lingvo.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")

func _on_Pri_pressed():
	get_tree().change_scene("res://Pri.tscn")

func _on_Eliri_pressed():
	get_tree().quit()

func _on_Rugxa_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Rugxa")
	T.Agordejo.save(T.agordejo)
	Rugxa.set_pressed(true)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Nigra.set_pressed(false)

func _on_Ambra_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Ambra")
	T.Agordejo.save(T.agordejo)
	Rugxa.set_pressed(false)
	Ambra.set_pressed(true)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Nigra.set_pressed(false)

func _on_Verda_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Verda")
	T.Agordejo.save(T.agordejo)
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(true)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Nigra.set_pressed(false)

func _on_Blua_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Blua")
	T.Agordejo.save(T.agordejo)
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(true)
	Viola.set_pressed(false)
	Nigra.set_pressed(false)

func _on_Viola_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Viola")
	T.Agordejo.save(T.agordejo)
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(true)
	Nigra.set_pressed(false)

func _on_Nigra_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Nigra")
	T.Agordejo.save(T.agordejo)
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Nigra.set_pressed(true)
