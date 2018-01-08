extends Node

func _ready():
	if T.Agordejo.get_value("Lingvo", "lingvo", "") == "":
		T.lingvo_elektita = false
		get_tree().change_scene("res://Lingvo.tscn")
	else:
		T.lingvo_elektita = true
		get_tree().change_scene("res://Menuo.tscn")