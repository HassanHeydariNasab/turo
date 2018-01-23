extends Area2D

onready var Kasxi = get_node("Kasxi")

func _ready():
	randomize()
	if int(rand_range(0,2)) == 0:
		set_rotd(15)
	else:
		set_rotd(-15)

func _on_Rektangulo_body_enter( korpo ):
	clear_shapes()
	T.Radiko.Crash_14.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
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
		T.Radiko.rektangulo = true
	else:
		queue_free()

func _on_Rektangulo_area_enter( areo ):
	if T.get_layer_bit(areo, 1) == true:
		queue_free()
