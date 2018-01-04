extends Area2D

onready var Kasxi = get_node("Kasxi")

var materialo = 100

func _ready():
	pass

func _on_Materialo_body_enter( korpo ):
	clear_shapes()
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
		T.materialo += materialo
	else:
		queue_free()