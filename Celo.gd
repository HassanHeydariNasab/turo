extends Area2D

func _ready():
	pass

func _on_Celo_body_enter( korpo ):
	T.nivelo += 1
	get_tree().reload_current_scene()
