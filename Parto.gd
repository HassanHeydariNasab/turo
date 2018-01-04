extends RigidBody2D

onready var Aspekto = get_node("Aspekto")

func _ready():
	set_process(true)

func _process(delta):
	if get_colliding_bodies() != []:
		set_layer_mask_bit(10,false)
		set_layer_mask_bit(0,true)
		set_process(false)