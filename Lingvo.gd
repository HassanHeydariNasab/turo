extends Control

onready var Fono = get_node("Fono")

func _ready():
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	if not T.lingvo_elektita:
		get_tree().set_auto_accept_quit(false)

func _on_EO_pressed():
	T.Agordejo.set_value("Lingvo", "lingvo", "eo")
	T.Agordejo.save(T.agordejo)
	T.lingvo_elektita = true
	get_tree().change_scene("res://Menuo.tscn")

func _on_EN_pressed():
	T.Agordejo.set_value("Lingvo", "lingvo", "en")
	T.Agordejo.save(T.agordejo)
	T.lingvo_elektita = true
	get_tree().change_scene("res://Menuo.tscn")