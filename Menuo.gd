extends Control

func _init():
	var lingvo = T.Agordejo.get_value("Lingvo", "lingvo")
	if TranslationServer.get_locale() != lingvo:
		TranslationServer.set_locale(lingvo)

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_Nivela_pressed():
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
