extends Area2D


func _ready():
	if T.Radiko.koloro == "ffffff":
		get_node("Aspekto").set_color("ffffff")


func _on_Ebeno_body_enter( korpo ):
	clear_shapes()
	T.Radiko.Ebeno_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	var Partoj_ = T.Radiko.Partoj.get_children()
	for Parto_ in Partoj_:
		Parto_.queue_free()
	T.Radiko.Tero.set_global_pos(Vector2(300,get_global_pos().y-880))
	if T.Agordejo.get_value("Koloro", "fonkoloro", "Griza") == "Multkolora":
		T.Radiko.Fono_Sxangxi.interpolate_property(T.Radiko.Fono, "color",
			T.Radiko.Fono.get_color(),
			Color(T.koloroj[T.multkoloroj[T.Radiko.fonkoloro]]), 0.3,
			Tween.TRANS_QUAD, Tween.EASE_IN)
		T.Radiko.Fono_Sxangxi.start()
		T.Radiko.fonkoloro = (T.Radiko.fonkoloro+1) % T.multkoloroj.size()
	queue_free()
