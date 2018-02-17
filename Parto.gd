extends RigidBody2D

onready var Aspekto = get_node("Aspekto")

func _ready():
	set_process(true)

func _process(delta):
	if get_colliding_bodies() != []:
		set_layer_mask_bit(10,false)
		set_layer_mask_bit(0,true)
		T.Radiko.alto = abs(get_global_pos().y-Aspekto.get_scale().y/2)
		if T.Radiko.oktavo == 3:
			T.Radiko.C5_pizzicato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
		elif T.Radiko.oktavo == 5:
			T.Radiko.C3_pizzicato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
		set_process(false)