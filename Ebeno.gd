extends Area2D


func _ready():
	if T.Radiko.koloro == "000000":
		get_node("Aspekto").set_color("000000")


func _on_Ebeno_body_enter( korpo ):
	clear_shapes()
	T.Radiko.Ebeno_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	var Partoj_ = T.Radiko.Partoj.get_children()
	for Parto_ in Partoj_:
		Parto_.queue_free()
	T.Radiko.Tero.set_global_pos(Vector2(300,get_global_pos().y-880))
	queue_free()
