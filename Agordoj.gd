extends Control

func _ready():
	get_node("Sonoj").set_pressed(T.Agordejo.get_value("Agordoj", "Sonoj", true))
	get_node("Muzikoj").set_pressed(T.Agordejo.get_value("Agordoj", "Muzikoj", true))
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_Sonoj_toggled( b ):
	T.Agordejo.set_value("Agordoj", "Sonoj", b)
	T.Agordejo.save(T.agordejo)

func _on_Muzikoj_toggled( b ):
	T.Agordejo.set_value("Agordoj", "Muzikoj", b)
	T.Agordejo.save(T.agordejo)

func _on_Reen_pressed():
	get_tree().change_scene("res://Menuo.tscn")
