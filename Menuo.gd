extends Control

onready var Senfina = get_node("Senfina")

func _init():
	var lingvo = T.Agordejo.get_value("Lingvo", "lingvo")
	if TranslationServer.get_locale() != lingvo:
		TranslationServer.set_locale(lingvo)

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	get_node("Senfina/"+T.Agordejo.get_value("Koloro", "koloro", "Nigra")).set_pressed(true)

func _on_Normala_pressed():
	T.modo = 1
	get_tree().change_scene("res://Radiko.tscn")

func _on_Senfina_pressed():
	T.modo = 0
	get_tree().change_scene("res://Radiko.tscn")

func _on_Lingvo_pressed():
	get_tree().change_scene("res://Lingvo.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")

func _on_Pri_pressed():
	get_tree().change_scene("res://Pri.tscn")

func _on_Eliri_pressed():
	get_tree().quit()

func _on_Rugxa_toggled( b ):
	T.Agordejo.set_value("Koloro", "koloro", "Rugxa")
	T.Agordejo.save(T.agordejo)
	for Koloro in Senfina.get_children():
		Koloro.set_pressed(false)
	get_node("Senfina/Rugxa").set_pressed(true)

func _on_Ambra_toggled( b ):
	T.Agordejo.set_value("Koloro", "koloro", "Ambra")
	T.Agordejo.save(T.agordejo)
	for Koloro in Senfina.get_children():
		Koloro.set_pressed(false)
	get_node("Senfina/Ambra").set_pressed(true)

func _on_Verda_toggled( b ):
	T.Agordejo.set_value("Koloro", "koloro", "Verda")
	T.Agordejo.save(T.agordejo)
	for Koloro in Senfina.get_children():
		Koloro.set_pressed(false)
	get_node("Senfina/Verda").set_pressed(true)

func _on_Blua_toggled( b ):
	T.Agordejo.set_value("Koloro", "koloro", "Blua")
	T.Agordejo.save(T.agordejo)
	for Koloro in Senfina.get_children():
		Koloro.set_pressed(false)
	get_node("Senfina/Blua").set_pressed(true)

func _on_Viola_toggled( b ):
	T.Agordejo.set_value("Koloro", "koloro", "Viola")
	T.Agordejo.save(T.agordejo)
	for Koloro in Senfina.get_children():
		Koloro.set_pressed(false)
	get_node("Senfina/Viola").set_pressed(true)

func _on_Nigra_toggled( b ):
	T.Agordejo.set_value("Koloro", "koloro", "Nigra")
	T.Agordejo.save(T.agordejo)
	for Koloro in Senfina.get_children():
		Koloro.set_pressed(false)
	get_node("Senfina/Nigra").set_pressed(true)
