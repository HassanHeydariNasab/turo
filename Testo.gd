extends Node2D

onready var K = get_node("K")
onready var Tempilo = get_node("Tempilo")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if K.get_colliding_bodies().size() != 0:
		print(10-Tempilo.get_time_left())
		set_fixed_process(false)
