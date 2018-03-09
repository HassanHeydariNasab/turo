extends Control

onready var Rugxa = get_node("Rugxa")
onready var Ambra = get_node("Ambra")
onready var Verda = get_node("Verda")
onready var Blua = get_node("Blua")
onready var Viola = get_node("Viola")
onready var Griza = get_node("Griza")
onready var Multkolora = get_node("Multkolora")

onready var Blanka = get_node("Blanka")
onready var Nigra = get_node("Nigra")

onready var Fono = get_node("Fono")

func _init():
	var lingvo = T.Agordejo.get_value("Lingvo", "lingvo")
	if TranslationServer.get_locale() != lingvo:
		TranslationServer.set_locale(lingvo)

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	get_node(T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")).set_pressed(true)
	get_node(T.Agordejo.get_value("Koloro", "koloro", "Nigra")).set_pressed(true)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])

func _on_Ludu_pressed():
	get_tree().change_scene("res://Radiko.tscn")

func _on_Puzloj_pressed():
	get_tree().change_scene("res://Niveloj.tscn")

func _on_Lingvo_pressed():
	get_tree().change_scene("res://Lingvo.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")

func _on_Pri_pressed():
	get_tree().change_scene("res://Pri.tscn")

func _on_Eliri_pressed():
	get_tree().quit()

func _on_Rugxa_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Rugxa")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(true)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Griza.set_pressed(false)
	Multkolora.set_pressed(false)

func _on_Ambra_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Ambra")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(false)
	Ambra.set_pressed(true)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Griza.set_pressed(false)
	Multkolora.set_pressed(false)

func _on_Verda_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Verda")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(true)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Griza.set_pressed(false)
	Multkolora.set_pressed(false)

func _on_Blua_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Blua")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(true)
	Viola.set_pressed(false)
	Griza.set_pressed(false)
	Multkolora.set_pressed(false)

func _on_Viola_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Viola")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(true)
	Griza.set_pressed(false)
	Multkolora.set_pressed(false)

func _on_Griza_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Griza")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Griza.set_pressed(true)
	Multkolora.set_pressed(false)

func _on_Multkolora_pressed():
	T.Agordejo.set_value("Koloro", "fonkoloro", "Multkolora")
	T.Agordejo.save(T.agordejo)
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	Rugxa.set_pressed(false)
	Ambra.set_pressed(false)
	Verda.set_pressed(false)
	Blua.set_pressed(false)
	Viola.set_pressed(false)
	Griza.set_pressed(false)
	Multkolora.set_pressed(true)

func _on_Nigra_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Nigra")
	T.Agordejo.save(T.agordejo)
	Blanka.set_pressed(false)
	Nigra.set_pressed(true)

func _on_Blanka_pressed():
	T.Agordejo.set_value("Koloro", "koloro", "Blanka")
	T.Agordejo.save(T.agordejo)
	Blanka.set_pressed(true)
	Nigra.set_pressed(false)