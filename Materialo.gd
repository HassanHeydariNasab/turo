extends Area2D

onready var Kasxi = get_node("Kasxi")

var materialo = 100

func _ready():
	if T.Radiko.koloro == "000000":
		get_node("Aspekto").set_color("000000")

func _on_Materialo_body_enter( korpo ):
	clear_shapes()
	if materialo > 60:
		T.Radiko.Materialo5_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	elif materialo > 50:
		T.Radiko.Materialo4_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	elif materialo > 40:
		T.Radiko.Materialo3_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	elif materialo > 30:
		T.Radiko.Materialo2_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	elif materialo <= 30:
		T.Radiko.Materialo1_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	var Aspekto = get_node("Aspekto")
	Kasxi.interpolate_property(Aspekto, "color",
		Color("ffffff"), Color("D500F9"), 0.25,
		Tween.TRANS_SINE, Tween.EASE_OUT
	)
	Kasxi.interpolate_property(Aspekto, "visibility/opacity",
		1, 0, 0.3,
		Tween.TRANS_SINE, Tween.EASE_IN, 0.25
	)
	Kasxi.start()

func _on_Kasxi_tween_complete( objekto, klavo ):
	if klavo == "color":
		T.Radiko.materialo += self.materialo
	else:
		queue_free()

func _on_Materialo_area_enter( areo ):
	if T.get_layer_bit(areo, 1) == true:
		queue_free()
