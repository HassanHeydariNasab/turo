extends RigidBody2D

onready var Aspekto = get_node("Aspekto")

func _ready():
	set_process(true)

func _process(delta):
	if get_colliding_bodies() != []:
		set_layer_mask_bit(10,false)
		set_layer_mask_bit(0,true)
		var alto = abs(get_global_pos().y-1000)
		if alto > T.Radiko.alto:
			T.Radiko.alto = alto
		if T.Radiko.oktavo == 3:
			T.Radiko.C5_pizzicato.play()
		elif T.Radiko.oktavo == 5:
			T.Radiko.C3_pizzicato.play()
		set_process(false)