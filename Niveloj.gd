extends Control

onready var Fono = get_node("Fono")

func _ready():
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_Reen_pressed():
	get_tree().change_scene("res://Menuo.tscn")
